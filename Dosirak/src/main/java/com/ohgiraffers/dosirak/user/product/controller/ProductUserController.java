package com.ohgiraffers.dosirak.user.product.controller;


import com.ohgiraffers.dosirak.admin.login.model.AdminLoginDetails;
import com.ohgiraffers.dosirak.admin.member.model.dto.ManagerDTO;
import com.ohgiraffers.dosirak.admin.member.model.dto.MemberDTO;
import com.ohgiraffers.dosirak.admin.product.dto.ProductImageDTO;
import com.ohgiraffers.dosirak.admin.product.dto.productDTO;
import com.ohgiraffers.dosirak.user.login.model.dto.LoginDTO;
import com.ohgiraffers.dosirak.user.order.model.dto.CartDTO;
import com.ohgiraffers.dosirak.user.order.model.service.CartService;
import com.ohgiraffers.dosirak.user.product.dto.ProductUserDTO;
import com.ohgiraffers.dosirak.user.product.dto.ProductandImageDTO;
import com.ohgiraffers.dosirak.user.product.service.ProductUserService;
import com.ohgiraffers.dosirak.user.review.model.dto.ReviewDTO;
import com.ohgiraffers.dosirak.user.review.model.dto.UserDTO;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/user/product/*")

public class ProductUserController {

    private final ProductUserService productUserService;
    private final CartService cartService;


    @Autowired
    public ProductUserController(ProductUserService productUserService,CartService cartService) {
        this.productUserService = productUserService;
        this.cartService=cartService;
    }

    @GetMapping("/productList")
    public String productList(Model model) {
        List<productDTO> productList1 = productUserService.findAllProduct();
        List<ProductUserDTO> productList = productUserService.getProductsWithImages();

        model.addAttribute("productList", productList);



//        List<ProductandImageDTO> imageList=productUserService.comeImageList();
//        model.addAttribute("imageList", imageList);


        return "/user/product/productList";
    }

    @GetMapping("/productView")
    public String productView(@RequestParam int productCode, Model model) {
        System.out.println(productCode);

        ProductUserDTO productList = productUserService.viewProduct(productCode);
        if (productList != null && productList.getImageList() != null) {
            List<ProductImageDTO> imageList = productList.getImageList();

            // 첫 번째 이미지 처리
            if (!imageList.isEmpty()) {
                ProductImageDTO firstImage = imageList.get(0);
                String firstSavedName = firstImage.getSavedName();
                model.addAttribute("firstSavedName", firstSavedName);
                System.out.println("f" + firstSavedName);
            }

            // 나머지 이미지 처리
            List<ProductImageDTO> remainingImages = new ArrayList<>();
            if (imageList.size() > 1) {
                remainingImages.addAll(imageList.subList(1, imageList.size()));
                System.out.println("r" + remainingImages);

            }
            List<ReviewDTO> comeReview = productUserService.plzComeReview(productCode);

            model.addAttribute("remainingImages", remainingImages);
            model.addAttribute("productList", productList);
            model.addAttribute("comeReview", comeReview);


        }
        return "/user/product/productUserView";
    }

    //
    @GetMapping("/productListJungsung")
    public String productListJungsung(Model model) {
        List<ProductUserDTO> productList = productUserService.getProductListBySubCategoryCodejungsung();

        model.addAttribute("productList", productList);

        return "/user/product/productList";
    }

    //
    @GetMapping("/productListHel")
    public String productListHel(Model model) {
        List<ProductUserDTO> productList = productUserService.getProductListBySubCategoryCode(1);
        model.addAttribute("productList", productList);
        return "/user/product/productList";
    }

    @GetMapping("/productListComp")
    public String productListComp(Model model) {
        List<ProductUserDTO> productList = productUserService.getProductListBySubCategoryCode(3);
        model.addAttribute("productList", productList);
        return "/user/product/productList";
    }

    @PostMapping("/add-to-cart")
    public @ResponseBody String addToCart(@RequestBody Map<String, String> productInfo) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userId = "";
        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof AdminLoginDetails) {
                AdminLoginDetails adminLoginDetails = (AdminLoginDetails) principal;
                LoginDTO login = adminLoginDetails.getLoginDTO();
                userId = login.getId();
            }
        }

        productInfo.put("userId", userId);
        System.out.println(productInfo);

        // 장바구니에 해당 상품이 이미 있는지 확인
        CartDTO existingCartItem = productUserService.getCartItemByUserIdAndProductCode(userId, productInfo.get("productCode"));

        if (existingCartItem != null) {
            // 이미 장바구니에 있는 경우, 해당 상품의 구매 수량을 증가시킴
            int currentQuantity = existingCartItem.getCartitemCount();
            int additionalQuantity = Integer.parseInt(productInfo.get("cartitemCount"));
            existingCartItem.setCartitemCount(currentQuantity + additionalQuantity);
            productUserService.updateCartItem(existingCartItem);
        } else {
            // 장바구니에 없는 경우, 새로운 장바구니 아이템 생성
            productUserService.addCart(productInfo);
        }

        // 장바구니 페이지로 리다이렉트
        return "redirect:/user/order/cart";
    }

    @PostMapping("/nowPay")
    public String nowPay(@RequestBody Map<String, String> productInfo, Model model) {
        // 사용자 인증 정보 확인
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            // 사용자가 인증되지 않은 경우 처리
            // 예를 들어 로그인 페이지로 리다이렉트 또는 에러 메시지 표시 등
            return "redirect:/login"; // 로그인 페이지로 리다이렉트하는 예시
        }

        // 사용자 정보 조회
        String userId = ""; // 사용자 ID 초기화
        Object principal = authentication.getPrincipal();
        if (principal instanceof AdminLoginDetails) {
            AdminLoginDetails adminLoginDetails = (AdminLoginDetails) principal;
            userId = adminLoginDetails.getLoginDTO().getId();
        } else {
            // 사용자 정보가 없는 경우 처리
            // 예를 들어 에러 메시지 표시 등
            return "redirect:/error"; // 에러 페이지로 리다이렉트하는 예시
        }

        // 사용자 정보 및 상품 정보를 모델에 추가
        MemberDTO user = cartService.getPaymentByUserId(userId);
        model.addAttribute("user", user);
        model.addAttribute("cart", productInfo);

        // 결제 페이지로 이동
        return "/user/order/payment"; // 결제 페이지로 직접 이동
    }
    @GetMapping("/user/order/payment")
    public String showPaymentPage(Model model, HttpSession session) {
        // 세션에서 사용자 정보 및 상품 정보 가져오기
        String userId = (String) session.getAttribute("userId");
        Map<String, String> productInfo = (Map<String, String>) session.getAttribute("productInfo");

        // 세션에서 가져온 데이터를 모델에 추가
        model.addAttribute("userId", userId);
        model.addAttribute("productInfo", productInfo);

        return "user/order/payment";
    }


}
