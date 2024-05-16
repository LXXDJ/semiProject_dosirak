package com.ohgiraffers.dosirak.admin.controller;

import com.ohgiraffers.dosirak.admin.member.model.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private MemberService memberService;

    @GetMapping("main")
    public ModelAndView main(ModelAndView mv, @RequestParam(required = false) String message){
        try { // db가 없을 경우 예외처리 (메인페이지가 아예 오류나서 안 뜨는 경우를 방지)
            // 날짜별 회원가입자 수
            List<Map<String, String>> joinCount = memberService.joinCount();
            mv.addObject("joinCount", joinCount);

            // 총 회원수
            Integer joinNum = memberService.joinNum();
            mv.addObject("joinNum", joinNum);

            // 날짜별 수익
            List<Map<String, String>> perProfit = memberService.perProfit();
            mv.addObject("perProfit", perProfit);

            // 총 매출
            Integer profit = memberService.profit();
            mv.addObject("profit", profit);

            // 총 리뷰수
            Integer reviewNum = memberService.reviewNum();
            mv.addObject("reviewNum", reviewNum);

            // 총 문의수
            Integer askNum = memberService.askNum();
            mv.addObject("askNum", askNum);

            // 주문내역 최신순
            List<Map<String, String>> recentOrderList = memberService.recentOrderList();
            mv.addObject("recentOrderList", recentOrderList);

        } catch (DataAccessException e) {
            e.printStackTrace();
        }

        mv.addObject("message", message);
        mv.setViewName("/admin/main");
        return mv;
    }
}
