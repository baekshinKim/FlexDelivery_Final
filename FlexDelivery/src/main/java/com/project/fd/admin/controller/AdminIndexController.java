package com.project.fd.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fd.admin.ask.model.AdminAskService;
import com.project.fd.admin.board.model.AdminBoardAllVO;
import com.project.fd.admin.board.model.AdminBoardService;
import com.project.fd.admin.hoenytip.AdminHoneytipService;
import com.project.fd.admin.hoenytip.AdminHoneytipVO;
import com.project.fd.admin.index.model.AdminIndexService;
import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryVO;

@Controller
public class AdminIndexController {

	private static final Logger logger=LoggerFactory.getLogger(AdminIndexController.class);
	
	@Autowired
	private AdminBoardService boardService;
	@Autowired
	private AdminHoneytipService honeytipService;
	
	@Autowired
	private AdminAskService askService;
	@Autowired
	private AdminIndexService indexService;
	

	@RequestMapping("/admin/index.do")
	public String adminIndex(Model model) {
		logger.info("관리자 - 메인 페이지 보여주기");
		
		//리뷰신고
		int newReview=indexService.selectNewReview();
		logger.info("신고 리뷰, newReview={}", newReview);
		model.addAttribute("newReview", newReview);
		
		//광고
		int newAd=indexService.selectNewAd();
		logger.info("유료광고 신규신청, newAd={}", newAd);
		model.addAttribute("newAd", newAd);
		
		//사업자등록
		int newRegister=indexService.selectNewRegister();
		logger.info("신규 사업자 등록 건, newRegister={}", newRegister);
		model.addAttribute("newRegister", newRegister);
		
		//점포 등록 승인
		int newStore=indexService.selectNewStore();
		logger.info("신규 점포 등록 건, newStore={}", newStore);
		model.addAttribute("newStore", newStore);
		
		//점포 변경 승인
		int changeStore=indexService.selectChangeStore();
		logger.info("점포 변경 건, changeStore={}", changeStore);
		model.addAttribute("changeStore", changeStore);
		
		//1:1 미답변 글
		List<Map<String, Object>> askList=askService.selectNewAsk();
		logger.info("답변 대기중인 1:1 문의글, askList={}", askList);
		
		model.addAttribute("askList", askList);
		
		int cnt=askService.selectNewAsk2();
		logger.info("cnt={}",cnt);
		
		model.addAttribute("cnt", cnt);
		
		//추천음식 랜덤 돌리기
		int maxVal=indexService.selectMNo();
		logger.info("중분류 카테고리 최대값, maxVal={}", maxVal);
		
		int randomNo=(int)(Math.random()*maxVal)+1;
		AdminMediumCategoryVO mVo=indexService.selectMCategory(randomNo);
		logger.info("음식 랜덤, randomNo={}, mVo={}", randomNo, mVo);
		model.addAttribute("mVo", mVo);
		
		List<Map<String, Object>> foodList=indexService.selectFood(randomNo);
		logger.info("추천가게와 추천 메뉴 정보, foodList={}", foodList);
		model.addAttribute("foodList", foodList);
		
		//공지, 이벤트, 꿀팁
		List<AdminBoardAllVO> nList=boardService.selectNotice();
		logger.info("공지사항 list 출력, nList.size={}", nList.size());
		
		List<AdminBoardAllVO> eList=boardService.selectEvent();
		logger.info("이벤트 list 출력, eLlist.size={}", eList.size());
		
		List<AdminHoneytipVO> hList=honeytipService.selectAll();
		logger.info("꿀팁 list 출력, hList.size={}", hList.size());
		
		model.addAttribute("eList", eList);
		model.addAttribute("nList", nList);
		model.addAttribute("hList", hList);
	
		return "admin/index";
	}

}
