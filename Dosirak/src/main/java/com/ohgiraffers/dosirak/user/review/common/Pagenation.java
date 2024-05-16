package com.ohgiraffers.dosirak.user.review.common;


import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;

@Slf4j
public class Pagenation {

    public static com.ohgiraffers.dosirak.user.review.common.SelectCriteria
    getSelectCriteria(int page, int limit, int buttonAmount, int totalCount, Map<String, String> searchMap, String userId) {

        /* 총 페이지 수 계산 */
        int maxPage = (int) Math.ceil((double) totalCount / limit);

        /* 페이징바 시작 숫자 */
        int startPage = (int) (Math.ceil((double) page / buttonAmount) - 1) * buttonAmount + 1;

        /* 페이징바 끝 숫자 */
        int endPage = startPage + buttonAmount - 1;

        /* max 페이지가 end 페이지보다 더 작은 경우 end 페이지는 max 페이지다 */
        if(maxPage < endPage) endPage = maxPage;

        /* 마지막 페이지는 0이 될 수 없으므로 게시물이 아무것도 존재하지 않으면 max, end는 0이 된다. */
        if(maxPage == 0 && endPage == 0) {
            maxPage = startPage;
            endPage = startPage;
        }

        /* offset 계산 */
        int offset = (page - 1) * limit;

        return new SelectCriteria(page, limit, buttonAmount, totalCount, maxPage, startPage, endPage,
                offset, searchMap.get("searchCondition"), searchMap.get("searchValue"),userId);

    }

    public static SelectCriteria getSelectCriteria(int page, int limit, int buttonAmount, int totalCount, String userId) {

        return getSelectCriteria(page, limit, buttonAmount, totalCount, new HashMap<>(), userId);
    }
}
