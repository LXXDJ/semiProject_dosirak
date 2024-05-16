package com.ohgiraffers.dosirak.user.survey.model.dao;

import com.ohgiraffers.dosirak.admin.survey.model.dto.SurveyQuestionDTO;
import com.ohgiraffers.dosirak.admin.survey.model.dto.SurveyResultDTO;
import com.ohgiraffers.dosirak.admin.survey.model.dto.SurveyScoreRangeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserSurveyDAO {

    List<SurveyQuestionDTO> getCurrentSurvey();

    List<SurveyScoreRangeDTO> getCurrentRange();

    int setResult(SurveyResultDTO result);

    int checkSurveyResultByUserId(String userId);

    SurveyResultDTO getSurveyResultByUserId(String userId);

    Map getUserInfoByUserId(String userId);

    void modifySurveyInfo(SurveyResultDTO surveyResult);

    void deleteSurvey(String userId);
}
