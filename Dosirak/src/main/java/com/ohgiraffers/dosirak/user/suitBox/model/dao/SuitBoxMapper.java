package com.ohgiraffers.dosirak.user.suitBox.model.dao;

import com.ohgiraffers.dosirak.admin.member.model.dto.MemberDTO;
import com.ohgiraffers.dosirak.admin.suitBox.model.dto.SuitBoxMenuDTO;
import com.ohgiraffers.dosirak.admin.survey.model.dto.SurveyResultDTO;
import com.ohgiraffers.dosirak.user.suitBox.model.dto.MenuDTO;
import com.ohgiraffers.dosirak.user.suitBox.model.dto.SuitBoxDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper

public interface SuitBoxMapper {
    List<SuitBoxMenuDTO> selectSaleMenu();

    Integer checkSuitBoxBySuitBox(SuitBoxDTO suitBox);

    void insertSuitBoxBySuitBox(SuitBoxDTO suitBox);

    int checkSuitBoxCode(SuitBoxDTO suitBox);

    Integer checkCartBySuitBox(SuitBoxDTO suitBox);

    void insertCartBySuitBox(SuitBoxDTO suitBox);

    void updateCartBySuitBox(SuitBoxDTO suitBox);

    MenuDTO getMenuByMenuCode(int menuCode);

    MemberDTO getPaymentByUserId(String userId);

    SurveyResultDTO getSurveyResultByUserId(String userId);

    String getUserGenderByUserId(String userId);

    int getSuitBoxCodeBySuitBox(SuitBoxDTO suitbox);
}
