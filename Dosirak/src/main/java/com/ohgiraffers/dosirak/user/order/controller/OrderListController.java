package com.ohgiraffers.dosirak.user.order.controller;

import com.ohgiraffers.dosirak.admin.login.model.AdminLoginDetails;
import com.ohgiraffers.dosirak.user.login.model.dto.LoginDTO;
import com.ohgiraffers.dosirak.user.order.model.dao.OrderUserMapper;
import com.ohgiraffers.dosirak.user.order.model.dto.CartDTO;
import com.ohgiraffers.dosirak.user.order.model.dto.OrderHistoryDTO;
import com.ohgiraffers.dosirak.user.order.model.service.OrderUserService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user/order/*")
public class OrderListController {
    private final OrderUserService orderUserService;
    public  OrderListController(OrderUserService orderUserService){
        this.orderUserService = orderUserService;
    }

    @GetMapping("/OrderList")
    public String getOrderList(@RequestParam Map<String, String> productInfo, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String managerAuthor="";
        String userId="";
        if(authentication != null && authentication.isAuthenticated()){
            Object principal = authentication.getPrincipal();

            if(principal instanceof AdminLoginDetails){
                AdminLoginDetails adminLoginDetails = (AdminLoginDetails) principal;
                LoginDTO login = adminLoginDetails.getLoginDTO();
                managerAuthor = login.getAuthority();
                userId = login.getId();
                System.out.println(userId);
            }
        }
        productInfo.put("userId", userId);
        System.out.println(productInfo);

        List<OrderHistoryDTO> orderHistory = orderUserService.findOrderHistoryByUserId(userId);
        model.addAttribute("orderHistory", orderHistory);
        return "user/order/OrderList";

        }
//    @GetMapping("/OrderView")
//    public String getOrderView(@RequestParam Map<String, String> productInfo, Model model) {
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        String managerAuthor="";
//        String userId="";
//        if(authentication != null && authentication.isAuthenticated()){
//            Object principal = authentication.getPrincipal();
//
//            if(principal instanceof AdminLoginDetails){
//                AdminLoginDetails adminLoginDetails = (AdminLoginDetails) principal;
//                LoginDTO login = adminLoginDetails.getLoginDTO();
//                managerAuthor = login.getAuthority();
//                userId = login.getId();
//                System.out.println(userId);
//            }
//        }
//        productInfo.put("userId", userId);
//        System.out.println(productInfo);
//
//        List<OrderHistoryDTO> orderHistory = orderUserService.findOrderHistoryByUserId(userId);
//        model.addAttribute("orderHistory", orderHistory);
//        return "user/order/OrderView";
//        }
@GetMapping("/OrderView")
public String getOrderList(@RequestParam String orderCode, Model model) {
    List<OrderHistoryDTO> order = orderUserService.findOrderHistoryByUserCode(orderCode);
    model.addAttribute("order", order);
    return "/user/order/OrderView";
}

    }
