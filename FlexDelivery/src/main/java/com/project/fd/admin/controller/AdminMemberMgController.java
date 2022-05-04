package com.project.fd.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fd.admin.memberMg.model.AdminMemberMgService;
import com.project.fd.member.model.MemberVO;

@Controller
@RequestMapping("/admin/menu1")
public class AdminMemberMgController {
	public static final Logger logger
	= LoggerFactory.getLogger(AdminStoresApprovalController.class);
	
	@Autowired
	AdminMemberMgService memberMgService;
	
	@RequestMapping("/memberGrade.do")
	public String adminMemberGrade(Model model) {
		//승인/변경 상태 목록 보여주기
		logger.info("회원 등급 조회/변경 화면");
		//1
		//2
 
		//3
		return "admin/menu1/memberGrade";
	}
	
	@RequestMapping("/memberMg.do")
	public String adminMemberMg(Model model) {
		//승인/변경 상태 목록 보여주기
		logger.info("회원 조회 화면");
		//1
		//2
		List<MemberVO> list = memberMgService.adminMemberList();
		
		model.addAttribute("list", list);
		//3
		return "admin/menu1/memberMg";
	}
	
	@RequestMapping("/reviewMg.do")
	public void adminReviewMg(Model model) {
		//승인/변경 상태 목록 보여주기
		logger.info("회원 등급 조회/변경 화면");
		//1
		//2
 
		//3
		
	}
}
