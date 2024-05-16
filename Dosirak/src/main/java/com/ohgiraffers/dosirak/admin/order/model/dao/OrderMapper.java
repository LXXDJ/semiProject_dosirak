package com.ohgiraffers.dosirak.admin.order.model.dao;

import com.ohgiraffers.dosirak.admin.order.model.dto.*;
import com.ohgiraffers.dosirak.user.order.model.dto.CartDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderMapper {
    List<DeliveryDTO> allDeliveryList();

    OrderDTO allOrderView(String orderCode);

    RefundDTO allRefundView(String orderCode);

    DeliveryDTO allDeliveryView(String orderCode);

    void updateOrderStatus(List<String> detailCode);

    List<OrderDTO> searchOrderLists(String searchCondition, String searchValue);

    List<RefundDTO> searchRefundLists(String searchCondition, String searchValue);

    List<DeliveryDTO> searchDeliveryLists(String searchCondition, String searchValue);
}
