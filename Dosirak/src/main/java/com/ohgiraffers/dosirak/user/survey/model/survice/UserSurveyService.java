package com.ohgiraffers.dosirak.user.survey.model.survice;

import com.ohgiraffers.dosirak.admin.survey.model.dto.SurveyQuestionDTO;
import com.ohgiraffers.dosirak.admin.survey.model.dto.SurveyResultDTO;
import com.ohgiraffers.dosirak.admin.survey.model.dto.SurveyScoreRangeDTO;
import com.ohgiraffers.dosirak.user.survey.model.dao.UserSurveyDAO;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserSurveyService {
    final private UserSurveyDAO mapper;
    public UserSurveyService(UserSurveyDAO mapper) {
        this.mapper = mapper;
    }


    public List<SurveyQuestionDTO> getCurrentSurvey() {
        return mapper.getCurrentSurvey();
    }


    public void setScore(SurveyResultDTO result, Map<String, String> resultMap) {
        int carboScore = 0;
        int proteinScore = 0;
        int fatScore = 0;
        int workoutScore = 0;
        int carboResultScore = 1;
        int proteinResultScore = 1;
        int fatResultScore = 1;
        int WorkoutResultScore = 1;
        for(String resultMapKey : resultMap.keySet()){
            if(resultMapKey.contains("score")){
//                key = 카테고리(C,P,F,W) = value = 점수
                if(resultMapKey.contains("C")) {
                    carboScore = carboScore + Integer.parseInt(resultMap.get(resultMapKey));
                }
                if(resultMapKey.contains("P")) {
                    proteinScore = proteinScore + Integer.parseInt(resultMap.get(resultMapKey));
                }
                if(resultMapKey.contains("F")) {
                    fatScore = fatScore + Integer.parseInt(resultMap.get(resultMapKey));
                }
                if(resultMapKey.contains("W")) {
                    workoutScore = workoutScore + Integer.parseInt(resultMap.get(resultMapKey));
                }
            }
        }
        List<SurveyScoreRangeDTO> rangeList = mapper.getCurrentRange();
        for(SurveyScoreRangeDTO range : rangeList){
            switch (range.getCategory()){
                case "C": if(carboScore > range.getRange1()){
                    carboResultScore = 2;} if(carboScore > range.getRange2()){
                    carboResultScore = 3;} if (carboScore > range.getRange3()){
                    carboResultScore = 4;} if(carboScore > range.getRange4()){
                    carboResultScore = 5;} break;
                case "P": if(proteinScore > range.getRange1()){
                    proteinResultScore = 2;} if(proteinScore > range.getRange2()){
                    proteinResultScore = 3;} if(proteinScore > range.getRange3()){
                    proteinResultScore = 4;} if(proteinScore > range.getRange4()){
                    proteinResultScore = 5;} break;
                case "F": if(fatScore > range.getRange1()){
                    fatResultScore = 2;} if (fatScore > range.getRange2()){
                    fatResultScore = 3;} if (fatScore > range.getRange3()){
                    fatResultScore = 4;} if (fatScore > range.getRange4()){
                    fatResultScore = 5;} break;
                case "W": if(workoutScore > range.getRange1()){
                    WorkoutResultScore = 2;} if (workoutScore > range.getRange2()){
                    WorkoutResultScore = 3;} if (workoutScore > range.getRange3()){
                    WorkoutResultScore = 4;} if (workoutScore > range.getRange4()){
                    WorkoutResultScore = 5;} break;
            }
        }
        result.setSurveyCarboScore(carboResultScore);
        result.setSurveyProteinScore(proteinResultScore);
        result.setSurveyFatScore(fatResultScore);
        result.setSurveyWorkoutScore(WorkoutResultScore);
    }

    public int setResult(SurveyResultDTO result) {
        return mapper.setResult(result);
    }

    public int checkSurveyResultByUserId(String userId) {
        return mapper.checkSurveyResultByUserId(userId);
    }

    public SurveyResultDTO getSurveyResultByUserId(String userId) {
        return mapper.getSurveyResultByUserId(userId);
    }

    public Map getUserInfoByUserId(String userId) {
        return mapper.getUserInfoByUserId(userId);
    }


    private void setNutritionComment(Map<String, String> comment, SurveyResultDTO surveyResult) {
        String result = "";
        int carboScore = surveyResult.getSurveyCarboScore();
        int proteinScore = surveyResult.getSurveyProteinScore();
        int fatScore = surveyResult.getSurveyFatScore();
        int totalNutritionScore = carboScore + proteinScore + fatScore;
        if(totalNutritionScore > 12){
            result += "섭취중인 3대 영양소가 많은 편이에요!";
        } else if(totalNutritionScore > 9){
            result += "3대 영양소의 섭취량이 적당해요.";
        } else if(totalNutritionScore > 5){
            result += "3대 영양소 섭취가 적은 편이에요.";
        } else if(totalNutritionScore > 4){
            result += "영양소 섭취가 매우 적은 편이에요.";
        }
        int absCP = Math.abs(carboScore - proteinScore);
        int absCF = Math.abs(carboScore - fatScore);
        int absPF = Math.abs(carboScore - fatScore);
        if(absCP >= 2 && absCF >= 2 && absPF >= 2){
            result += "영양소의 균형은 좋은 편입니다.";
        } else {
            result += "영양소의 균형은 좋지 않은 편입니다. 균형잡힌 식사에 신경써야 할 것 같아요.";
        }
        comment.put("nutritionComment", result);
    }

    public void modifySurveyInfo(SurveyResultDTO surveyResult) {
        mapper.modifySurveyInfo(surveyResult);
    }

    public void deleteSurvey(String userId) {
        mapper.deleteSurvey(userId);
    }
}

