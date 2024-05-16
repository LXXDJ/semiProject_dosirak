package com.ohgiraffers.dosirak.user.order.model.dto;

import com.ohgiraffers.dosirak.admin.product.dto.ProductImageDTO;
import com.ohgiraffers.dosirak.user.suitBox.model.dto.SuitBoxDTO;
import com.ohgiraffers.dosirak.user.suitBox.model.dto.SuitBoxMenuDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartDTO {

    private String orderCode;
    private int cartitemCount;
    private int productCode;
    private int suitboxCode;
    private String productName;
    private int productPrice;
    private SuitBoxDTO suitbox;
    private SuitBoxMenuDTO detailSuitBox;
    private ProductImageDTO productImageDTO;

    public CartDTO() {
    }

    public CartDTO(String orderCode, int cartitemCount, int productCode, int suitboxCode, String productName, int productPrice, SuitBoxDTO suitbox, SuitBoxMenuDTO detailSuitBox, ProductImageDTO productImageDTO) {
        this.orderCode = orderCode;
        this.cartitemCount = cartitemCount;
        this.productCode = productCode;
        this.suitboxCode = suitboxCode;
        this.productName = productName;
        this.productPrice = productPrice;
        this.suitbox = suitbox;
        this.detailSuitBox = detailSuitBox;
        this.productImageDTO = productImageDTO;
    }
}
