package com.ohgiraffers.dosirak.admin.survey.controller;

import com.ohgiraffers.dosirak.admin.survey.model.dto.*;
import com.ohgiraffers.dosirak.admin.survey.model.service.SurveyAdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/survey")
public class SurveyAdminController {
    private final SurveyAdminService surveyAdminService;
    public SurveyAdminController(SurveyAdminService surveyAdminService) {
        this.surveyAdminService = surveyAdminService;
    }

    @GetMapping("result-list")
    public String resultList(Model model){
        model.addAttribute("surveyList", surveyAdminService.surveyList());
        return "admin/survey/surveyList";
    }
    @GetMapping("version-list")
    public String versionList(Model model){
        List<SurveyVersionDTO> versionList = surveyAdminService.getAllVersion();
        model.addAttribute("versionList", versionList);
        return "admin/survey/surveyVersionList";
    }
    @GetMapping("version-detail")
    public String versionList(Model model, @RequestParam int versionId){
        SurveyVersionDTO version = surveyAdminService.getVersionByVersionId(versionId);
        List<SurveyQuestionDTO> questionList = surveyAdminService.getQuestionListByVersionId(versionId);
        model.addAttribute("version", version);
        model.addAttribute("questionList", questionList);
        List<SurveyScoreRangeDTO> rangeLIst = surveyAdminService.getSurveyRangeByVersionId(versionId);
        model.addAttribute("rangeList", rangeLIst);
        int carboMaxValue = surveyAdminService.getMaxValueByQuestionAndCategory(questionList, "C");
        int proteinMaxValue = surveyAdminService.getMaxValueByQuestionAndCategory(questionList, "P");
        int fatMaxValue = surveyAdminService.getMaxValueByQuestionAndCategory(questionList, "F");
        int workoutMaxValue = surveyAdminService.getMaxValueByQuestionAndCategory(questionList, "W");
        model.addAttribute("carboMaxValue", carboMaxValue);
        model.addAttribute("proteinMaxValue", proteinMaxValue);
        model.addAttribute("fatMaxValue", fatMaxValue);
        model.addAttribute("workoutMaxValue", workoutMaxValue);
        return "admin/survey/surveyVersionView";
    }
    @GetMapping("version-insert")
    public String setNewVersion(Model model){
        int versionId = 0;
        int result = surveyAdminService.insertNetVersion();
        versionId = surveyAdminService.getVersionId();
        surveyAdminService.insertNewRangeByVersionId(versionId, "C");
        surveyAdminService.insertNewRangeByVersionId(versionId, "P");
        surveyAdminService.insertNewRangeByVersionId(versionId, "F");
        surveyAdminService.insertNewRangeByVersionId(versionId, "W");
        SurveyVersionDTO version = surveyAdminService.getVersionByVersionId(versionId);
        List<SurveyScoreRangeDTO> rangeLIst = surveyAdminService.getSurveyRangeByVersionId(versionId);
        model.addAttribute("version", version);
        model.addAttribute("rangeList", rangeLIst);
        return "admin/survey/surveyVersionSet";
    }
    @GetMapping("version-delete")
    public String versionDelete(Model model, @RequestParam int versionId){
        int result = surveyAdminService.deleteVersionByVersionId(versionId);
        model.addAttribute("deleteResult", result);
        return "redirect:/admin/survey/version-list";
    }

    @GetMapping("version-set")
    public String setNewSurvey(Model model, @RequestParam int versionId){
        SurveyVersionDTO version = surveyAdminService.getVersionByVersionId(versionId);
        List<SurveyQuestionDTO> questionList = surveyAdminService.getQuestionListByVersionId(versionId);
        List<SurveyScoreRangeDTO> rangeLIst = surveyAdminService.getSurveyRangeByVersionId(versionId);
        model.addAttribute("version", version);
        model.addAttribute("questionList", questionList);
        model.addAttribute("rangeList", rangeLIst);
        return "admin/survey/surveyVersionSet";
    }

    @PostMapping("fetch/version")
    public @ResponseBody int versionSet(@ModelAttribute SurveyVersionDTO version){
        int result = 0;
        result = surveyAdminService.updateVersionByVersionDTO(version);
        surveyAdminService.deleteAllAnswerByVersionId(version.getVersionId());
        surveyAdminService.deleteQuestionByVersionId(version.getVersionId());
        return 1;
    }
    @PostMapping("fetch/question")
    public @ResponseBody int questionSet(@ModelAttribute SurveyQuestionDTO question){
        int result = 0;
        if(question.getQuestionId() != 0){
            surveyAdminService.insertQuestionByQuestionId(question);
        } else {
            surveyAdminService.insertQuestionByQuestionByNonId(question);
            result = surveyAdminService.getQuestionId();
        }
        return result;
    }
    @PostMapping("fetch/answer")
    public @ResponseBody int answerSet(@ModelAttribute SurveyAnswerDTO answer){
        surveyAdminService.insertAnswerByAnswer(answer);
        return 1;
    }
    @PostMapping("fetch/range")
    public @ResponseBody int rangeSet(@ModelAttribute SurveyScoreRangeDTO range){
        surveyAdminService.setRangeByRange(range);
        return 1;
    }
    @GetMapping("use-version")
    public String userVersion(Model model, @RequestParam int versionId){
        surveyAdminService.removeStatus();
        surveyAdminService.useVersion(versionId);
        return "redirect:/admin/survey/version-list";
    }
}
