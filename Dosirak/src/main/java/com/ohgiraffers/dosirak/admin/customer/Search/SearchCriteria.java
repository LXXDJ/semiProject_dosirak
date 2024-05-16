package com.ohgiraffers.dosirak.admin.customer.Search;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchCriteria {

    private String searchStatus;
    private String searchCondition;
    private String searchValue;

    public SearchCriteria() {}

    public SearchCriteria(String searchStatus, String searchCondition, String searchValue) {
        this.searchStatus = searchStatus;
        this.searchCondition = searchCondition;
        this.searchValue = searchValue;
    }

}
