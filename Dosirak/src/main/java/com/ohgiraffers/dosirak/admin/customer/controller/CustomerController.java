package com.ohgiraffers.dosirak.admin.customer.controller;

import com.ohgiraffers.dosirak.admin.customer.Search.SearchCriteria;
import com.ohgiraffers.dosirak.admin.customer.model.dto.*;
import com.ohgiraffers.dosirak.admin.customer.model.service.CustomerService;
import com.ohgiraffers.dosirak.admin.login.model.AdminLoginDetails;
import com.ohgiraffers.dosirak.admin.member.model.dto.ManagerDTO;
import com.ohgiraffers.dosirak.admin.member.model.dto.MemberDTO;
import com.ohgiraffers.dosirak.user.customer.model.dto.UserCustomerImgDTO;
import com.ohgiraffers.dosirak.user.login.model.dto.LoginDTO;
import com.ohgiraffers.dosirak.user.myInfo.model.service.MyinfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/admin/customer")
public class CustomerController {

    private final CustomerService customerService;
    private final MyinfoService myinfoService;

    public CustomerController(CustomerService customerService, MyinfoService myinfoService) {
        this.customerService = customerService;
        this.myinfoService = myinfoService;
    }

    /* ----- 공지사항 관리페이지 ----- */

    @GetMapping("/noticeList")
    public String noticeList(@RequestParam(required = false) String searchValue,
                             Model model) {

        log.info("searchValue : {}", searchValue);

        List<NoticeDTO> noticeList = customerService.findNoticeList(searchValue);

        model.addAttribute("noticeList", noticeList);

        return "admin/customer/noticeList";
    }

    @GetMapping("/noticeDetail")
    public String getNoticeDetail(@RequestParam("noticeCode") int noticeCode,
                                  Model model) {

        NoticeDTO noticeDetail = customerService.selectNoticeDetail(noticeCode);

        model.addAttribute("notice", noticeDetail);

        return "admin/customer/noticeDetail";
    }
    // parameter 인식 오류, 어노테이션 옆에 파라미터 값의 이름을 정확히 입력해주어 해결

    @GetMapping("/noticeWrite")
    public String noticeWrite() {

        return "admin/customer/noticeWrite";
    }

    @PostMapping("/noticeWrite")
    public String noticeWritePro(NoticeDTO notice) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if(authentication != null && authentication.isAuthenticated()){
            Object principal = authentication.getPrincipal();

            if(principal instanceof AdminLoginDetails adminLoginDetails){
                LoginDTO login = adminLoginDetails.getLoginDTO();
                notice.setAdminId(login.getId());
                customerService.writeNotice(notice);
            }
        }
        return "redirect:noticeList";
    }

    @RequestMapping("/noticeDelete")
    public String noticeDelete(NoticeDTO notice) {

        customerService.deleteNotice(notice.getNoticeCode());

        return "redirect:noticeList";
    }


    @GetMapping("/noticeEdit/{noticeCode}")
    public String noticeEdit(@PathVariable("noticeCode") int noticeCode, Model model) {

        model.addAttribute("notice", customerService.selectNoticeDetail(noticeCode));

        return "admin/customer/noticeEdit";
    }

    @PostMapping("/noticeUpdate/{noticeCode}")
    public String noticeUpdate(@PathVariable("noticeCode") int noticeCode, NoticeDTO notice) {

        //noticeTemp에 현재 공지사항 정보 담아 반환
        NoticeDTO noticeTemp = customerService.selectNoticeDetail(noticeCode);

        // 덮어쓰기
        noticeTemp.setNoticeTitle(notice.getNoticeTitle());
        noticeTemp.setNoticeContent(notice.getNoticeContent());

        // 업데이트
        customerService.updateNotice(noticeTemp);

        return "redirect:/admin/customer/noticeList";
    }


    /* ----- 자주 묻는 질문 관리페이지 ----- */

    @GetMapping("/qnaList")
    public String getQnaList(Model model) {

        List<QnaDTO> qnaList = customerService.findQnaList();

        model.addAttribute("qnaList", qnaList);

        return "admin/customer/qnaList";
    }

    @GetMapping("/qnaDetail")
    public String getQnaDetail(@RequestParam("qnaCode") int qnaCode, Model model) {

        QnaDTO qnaDetail = customerService.selectQnaDetail(qnaCode);

        model.addAttribute("qna", qnaDetail);

        return "admin/customer/qnaDetail";
    }

    @GetMapping("/qnaWrite")
    public String qnaWrite(Model model) {

        List<AskCategoryDTO> categoryList = customerService.findCategoryList();
        model.addAttribute("askCategory", categoryList);

        return "admin/customer/qnaWrite";
    }

    @PostMapping("/qnaWrite")
    public String qnaWritePro(@RequestParam("askCategoryCode") int askCategoryCode,
                              String qnaTitle, String qnaAnswer) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if(authentication != null && authentication.isAuthenticated()){
            Object principal = authentication.getPrincipal();

            if(principal instanceof AdminLoginDetails adminLoginDetails){
                LoginDTO login = adminLoginDetails.getLoginDTO();

                // AskCategoryDTO 객체 생성 및 askCategoryCode 설정
                AskCategoryDTO askCategory = new AskCategoryDTO();
                askCategory.setAskCategoryCode(askCategoryCode);

                // QnaDTO 객체 생성 및 필드 설정
                QnaDTO newQna = new QnaDTO();
                newQna.setAskCategoryCode(askCategory.getAskCategoryCode());
                newQna.setQnaTitle(qnaTitle);
                newQna.setQnaAnswer(qnaAnswer);
                newQna.setAdminId(login.getId());

                // 서비스로 전달
                customerService.writeQna(newQna);
            }
        }
        return "redirect:qnaList";
    }

    @RequestMapping("/qnaDelete")
    public String qnaDelete(QnaDTO qna) {

        customerService.deleteQna(qna.getQnaCode());

        return "redirect:qnaList";
    }

    /* 분류 수정되지 않는 점 수정 예정 */
    @GetMapping("/qnaEdit/{qnaCode}")
    public String qnaEdit(@PathVariable("qnaCode") int qnaCode, Model model) {

        List<AskCategoryDTO> categoryList = customerService.findCategoryList();

        model.addAttribute("qna", customerService.selectQnaDetail(qnaCode));
        model.addAttribute("askCategory", categoryList);

        return "admin/customer/qnaEdit";
    }

    @PostMapping("/qnaUpdate/{qnaCode}")
    public String qnaUpdate(@PathVariable("qnaCode") int qnaCode, QnaDTO qna) {

        //noticeTemp에 현재 공지사항 정보 담아 반환
        QnaDTO qnaTemp = customerService.selectQnaDetail(qnaCode);

        // 덮어쓰기
        qnaTemp.setAskCategoryCode(qna.getAskCategoryCode());
        qnaTemp.setQnaTitle(qna.getQnaTitle());
        qnaTemp.setQnaAnswer(qna.getQnaAnswer());

        // 업데이트
        customerService.updateQna(qnaTemp);

        return "redirect:/admin/customer/qnaList";
    }


    /* ----- 1대1 관리페이지 ----- */

    @GetMapping("/askList")
    public String askList(@RequestParam(required = false) String searchStatus,
                          @RequestParam(required = false) String searchCondition,
                          @RequestParam(required = false) String searchValue,
                          Model model) {

        SearchCriteria searchCriteria = new SearchCriteria(searchStatus, searchCondition, searchValue);
        List<AskDTO> askList = customerService.findAllAskList(searchCriteria);
        log.info("searchStatus : {}", searchStatus);

        model.addAttribute("askList", askList);

        return "/admin/customer/askList";
    }

    @GetMapping("/askDetail")
    public String getAskDetail(@RequestParam("askCode") int askCode,
                               Model model) {

        AskDTO askDetail = customerService.selectAskDetail(askCode);
        int askCategory = askDetail.getAskCategoryDTO().getAskCategoryCode();
        String userId = askDetail.getUserId();

        model.addAttribute("ask", askDetail);
        model.addAttribute("askCategory", askCategory);
        model.addAttribute("userId", userId);

        /* 첨부파일 로드 */
        List<ImgDTO> imageList = customerService.searchImageList(askCode);
        model.addAttribute("imageList", imageList);
        log.info("imageList : {}", imageList);

        /* 알람 발송을 위한 이메일 세팅 */
        MemberDTO member = myinfoService.myinfoSelect(userId);
        log.info("member : {}", member);

        String userEmail = member.getEmail();
        model.addAttribute("userEmail", userEmail);

        return "admin/customer/askDetail";
    }

    @PostMapping("/answerWrite")
    public String answerWritePro(@RequestParam("askCode") int askCode,
                                 @RequestParam("askCategoryCode") int askCategoryCode,
                                 @RequestParam("answerContent") String answerContent,
                                 AskDTO ask, AnswerDTO answer, RedirectAttributes redirectAttributes) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if(authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();

            if (principal instanceof AdminLoginDetails adminLoginDetails) {
                LoginDTO login = adminLoginDetails.getLoginDTO();
                answer.setAdminId(login.getId());
                answer.setAnswerCode(askCode);
                answer.setAnswerContent(answerContent);
                log.info("answer : {}", answer);

                // 카테고리 분류 변경
                customerService.updateAskCategory(askCode, askCategoryCode);

                // 답변 등록
                customerService.writeAnswer(answer);

                // 리디렉션을 위해 FlashAttribute를 사용하여 success 메시지를 전달합니다.
                redirectAttributes.addFlashAttribute("successMessage", "답변이 등록되었습니다.");
            }
        }
        return "redirect:askList";
    }


}
