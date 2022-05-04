package com.project.fd.member.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.member.faq.model.MemberFaqService;
import com.project.fd.member.faq.model.MemberFaqVo;


@Controller
@RequestMapping("/member/faq")
public class MemberFaqController {
	@Autowired private static final Logger logger=LoggerFactory.getLogger(MemberFaqController.class);
	
	@Autowired MemberFaqService memberFaqService;
	
	@RequestMapping("/faqList.do")
	public void memberFaqList(Model model) {
		logger.info("FAQ보여주기");
		List<Map<String, Object>> list=memberFaqService.faqCategoryList();
		model.addAttribute("list",list);
		
	}
	
	@RequestMapping("/faqC.do")
	public String faqC(@RequestParam int fCategoryNo, Model model) {
		logger.info("faq 카테고리 보여주기, 파라미터 fCategoryNo={}", fCategoryNo);
		
		List<MemberFaqVo> list= memberFaqService.selectFaq(fCategoryNo);
		logger.info("faq카테고리 조회, 결과 list.size={}, 결과들 ={}", list.size(), list);
		
		model.addAttribute("faqCList", list);
		
		return "member/faq/faqC";
	}
	
	@RequestMapping("/faqA.do")
	public String faqA(@RequestParam int fCategoryNo, Model model) {
		logger.info("faq 카테고리 보여주기, 파라미터 fCategoryNo={}", fCategoryNo);
		
		List<MemberFaqVo> list= memberFaqService.selectFaq(fCategoryNo);
		logger.info("faq카테고리 조회, 결과 list.size={}, 결과들 ={}", list.size(), list);
		
		model.addAttribute("faqAList", list);
		
		return "member/faq/faqA";
	}
	

}


