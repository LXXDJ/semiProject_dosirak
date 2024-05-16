package com.ohgiraffers.dosirak.user.order.model.service;

import com.ohgiraffers.dosirak.user.order.model.dao.OrderUserMapper;
import com.ohgiraffers.dosirak.user.order.model.dto.OrderHistoryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderUserService {
    @Autowired
    private OrderUserMapper orderUserMapper;


    public List<OrderHistoryDTO> findOrderHistoryByUserId(String userId) {
        return orderUserMapper.findOrderHistoryByUserId(userId);
    }

    public List<OrderHistoryDTO> findOrderHistoryByUserCode(String orderCode) {
        return orderUserMapper.findOrderHistoryByUserCode(orderCode);
    }
}
