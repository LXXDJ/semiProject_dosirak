package com.ohgiraffers.dosirak.user.suitBox.model.service;

import com.ohgiraffers.dosirak.admin.member.model.dto.MemberDTO;
import com.ohgiraffers.dosirak.admin.suitBox.model.dto.SuitBoxMenuDTO;
import com.ohgiraffers.dosirak.admin.survey.model.dto.SurveyResultDTO;
import com.ohgiraffers.dosirak.user.suitBox.model.dao.SuitBoxMapper;
import com.ohgiraffers.dosirak.user.suitBox.model.dto.MenuDTO;
import com.ohgiraffers.dosirak.user.suitBox.model.dto.SuitBoxDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SuitBoxService {
    private final SuitBoxMapper mapper;

    public SuitBoxService(SuitBoxMapper mapper) {
        this.mapper = mapper;
    }

    public Integer checkSuitBoxBySuitBox(SuitBoxDTO suitBox) {
        return mapper.checkSuitBoxBySuitBox(suitBox);
    }

    public List<SuitBoxMenuDTO> selectSaleMenu() {
        return mapper.selectSaleMenu();
    }

    public void insertSuitBoxBySuitBox(SuitBoxDTO suitBox) {
        mapper.insertSuitBoxBySuitBox(suitBox);
    }

    public int checkSuitBoxCode(SuitBoxDTO suitBox) {
        return mapper.checkSuitBoxCode(suitBox);
    }


    public Integer checkCartBySuitBox(SuitBoxDTO suitBox) {
        return mapper.checkCartBySuitBox(suitBox);
    }

    public void insertCartBySuitBox(SuitBoxDTO suitBox) {
        mapper.insertCartBySuitBox(suitBox);
    }

    public void updateCartBySuitBox(SuitBoxDTO suitBox) {
        mapper.updateCartBySuitBox(suitBox);
    }

    public MenuDTO getMenuByMenuCode(int menuCode) {
        return mapper.getMenuByMenuCode(menuCode);
    }

    public MemberDTO getPaymentByUserId(String userId) {
        return mapper.getPaymentByUserId(userId);
    }

    public SurveyResultDTO getSurveyResultByUserId(String userId) {
        return mapper.getSurveyResultByUserId(userId);
    }

    public String getUserGenderByUserId(String userId) {
        return mapper.getUserGenderByUserId(userId);
    }

    public int getSuitBoxCodeBySuitBox(SuitBoxDTO suitbox) {
        return mapper.getSuitBoxCodeBySuitBox(suitbox);
    }
}
