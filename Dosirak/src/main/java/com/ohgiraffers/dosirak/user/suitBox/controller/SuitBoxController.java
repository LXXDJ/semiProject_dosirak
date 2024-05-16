package com.ohgiraffers.dosirak.user.suitBox.controller;

import com.ohgiraffers.dosirak.admin.login.model.AdminLoginDetails;
import com.ohgiraffers.dosirak.admin.member.model.dto.MemberDTO;
import com.ohgiraffers.dosirak.admin.suitBox.model.dto.SuitBoxMenuDTO;
import com.ohgiraffers.dosirak.admin.survey.model.dto.SurveyResultDTO;
import com.ohgiraffers.dosirak.user.login.model.dto.LoginDTO;
import com.ohgiraffers.dosirak.user.order.model.dto.CartDTO;
import com.ohgiraffers.dosirak.user.suitBox.model.dao.SuitBoxMapper;
import com.ohgiraffers.dosirak.user.suitBox.model.dto.SuitBoxDTO;
import com.ohgiraffers.dosirak.user.suitBox.model.service.SuitBoxService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/suit-box")
public class SuitBoxController {
    private final SuitBoxService suitBoxService;

    public SuitBoxController(SuitBoxService suitBoxService) {
        this.suitBoxService = suitBoxService;
    }

    @GetMapping("")
    public String suitBox(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userId = "";
        if(authentication != null && authentication.isAuthenticated()){
            Object principal = authentication.getPrincipal();

            if(principal instanceof AdminLoginDetails){
                AdminLoginDetails adminLoginDetails = (AdminLoginDetails) principal;
                LoginDTO login = adminLoginDetails.getLoginDTO();
                String managerAuthor = ((LoginDTO) login).getAuthority();
                userId = login.getId();
            }
        }
        List<SuitBoxMenuDTO> saleMenuList = suitBoxService.selectSaleMenu();

        SurveyResultDTO surveyResult = suitBoxService.getSurveyResultByUserId(userId);
        if (surveyResult != null) {
            String gender = suitBoxService.getUserGenderByUserId(userId);
            model.addAttribute("surveyResult", surveyResult);
            model.addAttribute("userGender", gender);
        }
        model.addAttribute("menuList", saleMenuList);

        return"user/suitBox/productView_suitBox";
    }
    @PostMapping("/cart")
    public @ResponseBody String cart(Model model, @ModelAttribute SuitBoxDTO suitBox) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userId = "";
        if(authentication != null && authentication.isAuthenticated()){
            Object principal = authentication.getPrincipal();

            if(principal instanceof AdminLoginDetails){
                AdminLoginDetails adminLoginDetails = (AdminLoginDetails) principal;
                LoginDTO login = adminLoginDetails.getLoginDTO();
                String managerAuthor = ((LoginDTO) login).getAuthority();
                userId = login.getId();
            }
        }
        suitBox.setUserId(userId);
        Integer checkSuitBoxResult = suitBoxService.checkSuitBoxBySuitBox(suitBox);
        if(checkSuitBoxResult == null){
            suitBoxService.insertSuitBoxBySuitBox(suitBox);
        }
        int suitBoxCode = suitBoxService.checkSuitBoxCode(suitBox);
        suitBox.setSuitboxCode(suitBoxCode);
        Integer checkCartQuantity = suitBoxService.checkCartBySuitBox(suitBox);
        if(checkCartQuantity == null){
            suitBoxService.insertCartBySuitBox(suitBox);
        } else {
            suitBox.setQuantity(suitBox.getQuantity() + checkCartQuantity);
            suitBoxService.updateCartBySuitBox(suitBox);
        }
        return "success";
    }
    @PostMapping("/buy")
    public String buy(Model model, @ModelAttribute SuitBoxDTO suitBox) {
        String userId = "";
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();

            if (principal instanceof AdminLoginDetails) {
                AdminLoginDetails adminLoginDetails = (AdminLoginDetails) principal;
                LoginDTO login = adminLoginDetails.getLoginDTO();
                userId = login.getId();

                MemberDTO user = suitBoxService.getPaymentByUserId(userId);
                model.addAttribute("user", user);
            }
            model.addAttribute("directPay", "true");
        }

        CartDTO item = new CartDTO();

        item.setSuitboxCode(suitBox.getSuitboxCode());  // 맞춤도시락, 메뉴 코드 저장
        com.ohgiraffers.dosirak.user.suitBox.model.dto.SuitBoxMenuDTO detailMenu = new com.ohgiraffers.dosirak.user.suitBox.model.dto.SuitBoxMenuDTO();
        int riceCode = suitBox.getRiceCode();
        int mainCode = suitBox.getMainCode();
        int sideCode = suitBox.getSideCode();
        int kimchiCode = suitBox.getKimchiCode();
        detailMenu.setRice(suitBoxService.getMenuByMenuCode(riceCode));
        detailMenu.setMain(suitBoxService.getMenuByMenuCode(mainCode));
        detailMenu.setSide(suitBoxService.getMenuByMenuCode(sideCode));
        detailMenu.setKimchi(suitBoxService.getMenuByMenuCode(kimchiCode));
        item.setDetailSuitBox(detailMenu);
        item.setProductPrice(detailMenu.getRice().getMenuExtracash() +
                detailMenu.getMain().getMenuExtracash() +
                detailMenu.getSide().getMenuExtracash() +
                detailMenu.getKimchi().getMenuExtracash() +
                7000);
        item.setSuitbox(suitBox);
        item.setCartitemCount(suitBox.getQuantity());
        Integer check = 0;
        check = suitBoxService.checkSuitBoxBySuitBox(item.getSuitbox());
        if(check == null){
            suitBoxService.insertSuitBoxBySuitBox(item.getSuitbox());
        }
        int suitBoxCode = suitBoxService.getSuitBoxCodeBySuitBox(item.getSuitbox());
        item.setSuitboxCode(suitBoxCode);
        item.getSuitbox().setSuitboxCode(suitBoxCode);
        item.getDetailSuitBox().setSuitboxCode(suitBoxCode);
        List<CartDTO> cartDTO = new ArrayList<>();
        cartDTO.add(item);
        System.out.println(cartDTO);

        model.addAttribute("cartDTO",cartDTO);

        return "/user/order/payment";
    }
}
