package com.project.fd.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.admin.storeAd.model.AdminStoreAdService;
import com.project.fd.admin.storeAd.model.AdminStoreAdVO;

@Controller
@RequestMapping("/admin/menu2")
public class AdminStoreAdController {
	public static final Logger logger
	= LoggerFactory.getLogger(AdminStoreAdController.class);
	
	@Autowired
	AdminStoreAdService storeAdService;
	
	@RequestMapping("/storeAdList.do")
	public String adminStoreAdList(Model model) {
		
		logger.info("광고 승인/변경 리스트 화면");
		//1
		//2
		List<AdminStoreAdVO> list = storeAdService.approvalList();
		logger.info("광고승인 결과 list={}", list);
		//3
		model.addAttribute("list", list);
		
		return "admin/menu2/storeAdList";
	
	}
	
	@RequestMapping("/storeAdDetail.do")
	public String adminStroreAdDetail(@RequestParam(defaultValue = "0") int no, Model model) {
		
		logger.info("광고 승인 세부 화면, 파라미터 no={}", no);
		//1
		//2
		AdminStoreAdVO vo= storeAdService.storeAdDetail(no);
		logger.info("광고 승인 세부 화면 결과, vo={}", vo);
		
		//3
		model.addAttribute("vo", vo);
		
		return "admin/menu2/storeAdDetail";
	}
	
	@RequestMapping("/storeAdAgree.do")
	public String adminStoreAdAgree(@RequestParam(defaultValue = "0") int no) {
		logger.info("점포 등록 승인 화면, 파라미터 no={}", no);

		int cnt = storeAdService.storeAdAgree(no);
		logger.info("점포 등록 승인 처리, cnt={}", cnt);
		
		return "redirect:/admin/menu2/storeAdList.do";
		
	}
}
