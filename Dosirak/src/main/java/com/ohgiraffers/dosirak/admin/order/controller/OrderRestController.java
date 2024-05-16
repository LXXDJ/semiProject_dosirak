package com.ohgiraffers.dosirak.admin.order.controller;
import com.ohgiraffers.dosirak.admin.order.model.service.OrderService;
import com.ohgiraffers.dosirak.user.order.model.dto.OrderDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/admin/*")
public class OrderRestController {

    private static final Logger log = LoggerFactory.getLogger(OrderRestController.class);
    public OrderService orderService;

    public OrderRestController (OrderService orderService) {
        this.orderService = orderService;
    }

//    @PostMapping("orderList/update-Status")
//    public ResponseEntity<List<OrderDTO>> updateOrderStatus(@RequestBody Map<String, String> requestBody) {
//        String orderStatus = requestBody.get("orderStatus");
//        List<OrderDTO> filteredOrders = orderService.getOrdersByStatus(orderStatus);
//        return ResponseEntity.ok(filteredOrders);
//    }
}
