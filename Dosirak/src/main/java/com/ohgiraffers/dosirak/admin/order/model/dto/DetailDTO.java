package com.ohgiraffers.dosirak.admin.order.model.dto;

import com.ohgiraffers.dosirak.admin.product.dto.productDTO;
import com.ohgiraffers.dosirak.user.suitBox.model.dto.SuitBoxDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DetailDTO {
    private String orderCode;
    private String detailCode;
    private String detailStatus;
    private int detailItemCount;
    private String ProductCode;
    private String SuitboxCode;
    private productDTO product;
    private SuitBoxDTO suitBox;

    public DetailDTO() {}

    public DetailDTO(String orderCode, String detailCode, String detailStatus, int detailItemCount, String productCode, String suitboxCode, productDTO product) {
        this.orderCode = orderCode;
        this.detailCode = detailCode;
        this.detailStatus = detailStatus;
        this.detailItemCount = detailItemCount;
        ProductCode = productCode;
        SuitboxCode = suitboxCode;
        this.product = product;
    }
}
