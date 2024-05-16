package com.ohgiraffers.dosirak.admin.survey.model.dao;

import com.ohgiraffers.dosirak.admin.survey.model.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SurveyAdminDAO {

    List<SurveyResultDTO> allList();

    SurveyVersionDTO getVersionByVersionId(int versionId);

    List<SurveyVersionDTO> getAllVersion();

    List<SurveyQuestionDTO> getQuestionListByVersionId(int versionId);


    int deleteVersionByVersionId(int versionId);

    void deleteQuestionByVersionId(int versionId);

    void getDeleteAnswerByVersionId(int versionId);

    void deleteRangeByVersionId(int versionId);

    List<SurveyScoreRangeDTO> getSurveyRangeByVersionId(Integer versionId);

    int updateVersionByVersionDTO(SurveyVersionDTO version);

    int insertNetVersion();

    int getVersionId();

    void deleteAllAnswerByVersionId(int versionId);

    void insertQuestionByQuestionId(SurveyQuestionDTO question);

    void insertQuestionByQuestionByNonId(SurveyQuestionDTO question);

    int getQuestionId();

    void insertAnswerByAnswer(SurveyAnswerDTO answer);

    void insertNewRangeByVersionId(int versionId, String category);

    void setRangeByRange(SurveyScoreRangeDTO range);

    int getMaxValueByQuestionId(int questionId);

    void removeStatus();

    void useVersion(int versionId);
}
