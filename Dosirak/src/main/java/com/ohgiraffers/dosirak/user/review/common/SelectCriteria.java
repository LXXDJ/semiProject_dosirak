package com.ohgiraffers.dosirak.user.review.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SelectCriteria {

    private int page;
    private int totalCount;
    private int limit;
    private int buttonAmount;
    private int maxPage;
    private int startPage;
    private int endPage;
    private int offset;
    private String searchCondition;
    private String searchValue;
    private String userId;

    public SelectCriteria () {}

    public SelectCriteria(int page,int limit, int buttonAmount, int totalCount, int maxPage, int startPage, int endPage, int offset, String searchCondition, String searchValue, String userId) {
        this.page = page;
        this.limit = limit;
        this.buttonAmount = buttonAmount;
        this.totalCount = totalCount;
        this.maxPage = maxPage;
        this.startPage = startPage;
        this.endPage = endPage;
        this.offset = offset;
        this.searchCondition = searchCondition;
        this.searchValue = searchValue;
        this.userId = userId;
    }
}
