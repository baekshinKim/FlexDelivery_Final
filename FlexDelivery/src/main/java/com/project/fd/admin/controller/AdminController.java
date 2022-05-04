
package com.project.fd.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger
	=LoggerFactory.getLogger(AdminController.class);

	@RequestMapping("/login/login.do")
	public void adminLogin() {
		logger.info("관리자 - 로그인 화면");
	}
	
	@RequestMapping("/menu4/introduce.do")
	public void adminIntroduce() {
		logger.info("관리자 플렉스 딜리버리 소개 화면 보여주기");
	}

	
	/*
	@RequestMapping("/menu1/memberGrade.do")
	public String adminMemberGrade() {
		logger.info("관리자 - 회원등급관리 화면 보여주기");
		
		return "menu1/memberGrade";
	}
	
	@RequestMapping("/menu2/storeMg.do")
	public void adminStoreManage() {
		logger.info("관리자 - 점포 현황 화면 보여주기");
	}
	
	@RequestMapping("/menu1/member.do")
	public void adminMember() {
		logger.info("관리자 - 회원조회 화면 보여주기");
	}
	
	@RequestMapping("/chart/index.do")
	public void adminChartMain() {
		logger.info("관리자 - 통계용 화면 보여주기");
	}
	
	@RequestMapping("/menu1/memberMg.do")
	public void adminMemberSummary() {
		logger.info("관리자 - 회원관리 요약화면 보여주기");
	}
	
	

	@RequestMapping("/menu1/review.do")
	public void adminReview() {
		logger.info("관리자 - 리뷰 화면 보여주기");
	}
	
	@RequestMapping("/menu2/approval.do")
	public void adminApproval() {
		logger.info("관리자 - 점포 승인관리 화면 보여주기");
	}
	
	@RequestMapping("/menu2/approvalDetail.do")
	public void adminApprovalDetail() {
		logger.info("관리자 - 점포 승인 디테일 화면 보여주기");
	}
	
	@RequestMapping("/menu2/approvalEdit.do")
	public void adminApprovalEdit() {
		logger.info("관리자 - 점포 승인 변경 화면 보여주기");
	}
	
	@RequestMapping("/menu2/storeAD.do")
	public void adminStore() {
		logger.info("관리자 - 광고승인 리스트 화면 보여주기");
	}
	
	@RequestMapping("/menu2/storeAdDetail.do")
	public void adminStoreDetail() {
		logger.info("관리자 - 광고승인 리스트 화면 보여주기");
	}
	*/

}
