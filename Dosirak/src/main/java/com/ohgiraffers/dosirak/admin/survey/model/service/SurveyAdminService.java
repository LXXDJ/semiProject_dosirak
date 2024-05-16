package com.ohgiraffers.dosirak.admin.survey.model.service;

import com.ohgiraffers.dosirak.admin.survey.model.dao.SurveyAdminDAO;
import com.ohgiraffers.dosirak.admin.survey.model.dto.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SurveyAdminService {
    private final SurveyAdminDAO surveyMapper;

    public SurveyAdminService(SurveyAdminDAO surveyMapper) {
        this.surveyMapper = surveyMapper;
    }

    public List<SurveyResultDTO> surveyList(){
        return surveyMapper.allList();
    }

    public SurveyVersionDTO getVersionByVersionId(int versionId) {
        return surveyMapper.getVersionByVersionId(versionId);
    }

    public List<SurveyVersionDTO> getAllVersion() {
        return surveyMapper.getAllVersion();
    }

    public List<SurveyQuestionDTO> getQuestionListByVersionId(int versionId) {
        return surveyMapper.getQuestionListByVersionId(versionId);
    }

    public int deleteVersionByVersionId(int versionId) {
        surveyMapper.getDeleteAnswerByVersionId(versionId);
        surveyMapper.deleteQuestionByVersionId(versionId);
        surveyMapper.deleteRangeByVersionId(versionId);
        int result = surveyMapper.deleteVersionByVersionId(versionId);
        return result;
    }

    public List<SurveyScoreRangeDTO> getSurveyRangeByVersionId(Integer versionId) {
        return surveyMapper.getSurveyRangeByVersionId(versionId);
    }

    public int updateVersionByVersionDTO(SurveyVersionDTO version) {
        return surveyMapper.updateVersionByVersionDTO(version);
    }



    public int insertNetVersion() {
        return surveyMapper.insertNetVersion();
    }

    public int getVersionId() {
        return surveyMapper.getVersionId();
    }

    public void deleteAllAnswerByVersionId(int versionId) {
        surveyMapper.deleteAllAnswerByVersionId(versionId);
    }

    public void deleteQuestionByVersionId(int versionId) {
        surveyMapper.deleteQuestionByVersionId(versionId);
    }

    public void insertQuestionByQuestionId(SurveyQuestionDTO question) {
        surveyMapper.insertQuestionByQuestionId(question);
    }

    public void insertQuestionByQuestionByNonId(SurveyQuestionDTO question) {
        surveyMapper.insertQuestionByQuestionByNonId(question);
    }


    public int getQuestionId() {
        return surveyMapper.getQuestionId();
    }

    public void insertAnswerByAnswer(SurveyAnswerDTO answer) {
        surveyMapper.insertAnswerByAnswer(answer);
    }

    public void insertNewRangeByVersionId(int versionId, String category) {
        surveyMapper.insertNewRangeByVersionId(versionId, category);
    }

    public void setRangeByRange(SurveyScoreRangeDTO range) {
        surveyMapper.setRangeByRange(range);
    }


    public int getMaxValueByQuestionAndCategory(List<SurveyQuestionDTO> questionList, String category) {
        int result = 0;
        for(SurveyQuestionDTO question : questionList){
            if((question.getQuestionCategory()+"").equals(category)){
                int highScore = surveyMapper.getMaxValueByQuestionId(question.getQuestionId());
                result += highScore;
            }
        }
        return result;
    }

    public void removeStatus() {
        surveyMapper.removeStatus();
    }

    public void useVersion(int versionId) {
        surveyMapper.useVersion(versionId);
    }
}
