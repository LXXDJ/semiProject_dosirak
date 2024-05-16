package com.ohgiraffers.dosirak.admin.order.controller;

import com.ohgiraffers.dosirak.admin.order.model.dto.*;
import com.ohgiraffers.dosirak.admin.order.model.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/*")
public class OrderController {

    private static final Logger log = LoggerFactory.getLogger(OrderController.class);
    private final OrderService orderService;

    @Autowired
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    /* 관리자 주문*/
    @GetMapping("orderList")
    public String orderList(Model model,  @RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchValue) {

        List<OrderDTO> orderLists = orderService.searchOrderLists(searchCondition, searchValue);

        model.addAttribute("orderLists", orderLists);

        return "admin/order/orderList";
    }

    @GetMapping("orderView")
    public String orderView(Model model, @RequestParam String orderCode) {
        OrderDTO orderView = orderService.allOrderView(orderCode);

        model.addAttribute("orderView", orderView);

        return "admin/order/orderView";
    }

    @PostMapping("orderCancel")
    public String orderViewDelete(Model model,
                                  @RequestParam("selected") List<String> detailCode,
                                  @RequestParam String orderCode) {

        orderService.updateOrderStatus(detailCode);

        return "redirect:/admin/orderView?orderCode=" + orderCode;
    }

    @GetMapping("refundList")
    public String refundList(Model model, @RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchValue) {

        List<RefundDTO> refundLists = orderService.searchRefundLists(searchCondition, searchValue);

        model.addAttribute("refundLists", refundLists);

        return "admin/order/refundList";
    }

    @GetMapping("refundView")
    public String refundView(Model model, @RequestParam String orderCode) {

        RefundDTO refundView = orderService.allRefundView(orderCode);

        model.addAttribute("refundView", refundView);

        return "admin/order/refundView";
    }

    @GetMapping("deliveryList")
    public ModelAndView deliveryList(ModelAndView mv, @RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchValue) {

        List<DeliveryDTO> deliveryList = orderService.searchDeliveryLists(searchCondition, searchValue);

        mv.addObject("deliveryList", deliveryList);

        mv.setViewName("admin/order/deliveryList");

        return mv;
    }

    @GetMapping("deliveryView")
    public ModelAndView shippingView(ModelAndView mv, @RequestParam String orderCode) {

        DeliveryDTO deliveryView = orderService.allDeliveryView(orderCode);

        mv.addObject("deliveryView", deliveryView);

        mv.setViewName("admin/order/deliveryView");

        return mv;
    }

//    @GetMapping("/memberList")
//    public String findMemberList(@RequestParam(required = false) String searchCondition,
//                                 @RequestParam(required = false) String searchValue,
//                                 Model model) {
//        List<OrderDTO> orderList;
//
//        if (searchValue != null && !searchValue.isEmpty()) {
//            orderList = orderService.searchOrderForm(searchCondition, searchValue);
//        } else {
//            orderList = orderService.findAllMember();
//        }
//
//        model.addAttribute("orderList", orderList);
//        model.addAttribute("searchCondition", searchCondition);
//        model.addAttribute("searchValue", searchValue);
//
//        return "/admin/member/memberList";
//    }
}
