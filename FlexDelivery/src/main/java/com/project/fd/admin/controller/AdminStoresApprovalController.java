package com.project.fd.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.admin.stores.model.AdminStoresService;
import com.project.fd.admin.stores.model.AdminStoresVO;
import com.project.fd.admin.temporary.model.AdminTemporaryService;
import com.project.fd.admin.temporary.model.AdminTemporaryVO;
import com.project.fd.owner.store.model.OwnerTemporaryVO;

@RequestMapping("/admin/menu2")
@Controller
public class AdminStoresApprovalController {
	public static final Logger logger
	= LoggerFactory.getLogger(AdminStoresApprovalController.class);
	
	@Autowired
	AdminStoresService storesService;

	
	@RequestMapping("/approvalList.do")
	public String adminApprovalList(Model model) {
		//승인/변경 상태 목록 보여주기
		logger.info("점포 승인/변경 화면");
		//1
		//2
		List<AdminStoresVO> list= storesService.adminApprovalList();
		logger.info("승인 list, list.size={}",list.size());
		
		for (AdminStoresVO vo : list) {
			logger.info("vo={}",vo);
		}
		//3
		model.addAttribute("list", list);
		
		return "admin/menu2/approvalList";
	}
	
	
	@RequestMapping("/approvalDetail.do")
	public String adminApprovalDetail(@RequestParam(defaultValue = "0")  int no ,Model model) {
		//승인/변경 상태 목록 보여주기
		logger.info("점포 등록 세부 화면, 파라미터 no={}", no);
		//1
		//2
		AdminStoresVO vo= storesService.adminApprovalDetail(no);
		logger.info("점포 등록 세부 화면 결과 vo={} ",vo);
		//3
		model.addAttribute("vo", vo);
		
		return "admin/menu2/approvalDetail";
	}
	
	@RequestMapping("/approvalAgree.do")
	public String adminApprovalAgree(@RequestParam(defaultValue = "0") int no) {
		logger.info("점포 등록 승인 화면, 파라미터 no={}", no);
		
		int cnt= storesService.adminApprovalAgree(no);
		logger.info("점포 등록 승인 처리, cnt={}", cnt);
		
		return "redirect:/admin/menu2/approvalList.do";
		
	}
	
	@RequestMapping("/approvalDeny.do")
	public String adminApprovalDeny(@RequestParam(defaultValue = "0") int no) {
		logger.info("점포 등록 반려, 파라미터 no={}", no);
		
		int cnt= storesService.adminApprovalDeny(no);
		logger.info("점포 등록 승인 처리, cnt={}", cnt);
		
		return "redirect:/admin/menu2/approvalList.do";
	}
	
	@RequestMapping("/outAgree.do")
	public String adminoutAgree(@RequestParam(defaultValue = "0") int no) {
		logger.info("점포 탈퇴 승인 화면, 파라미터 no={}", no);
		
		int cnt= storesService.adminOutAgree(no);
		logger.info("점포 탈퇴 승인 처리, cnt={}", cnt);
		
		return "redirect:/admin/menu2/approvalList.do";
		
	}
	
	@RequestMapping("/outDeny.do")
	public String adminOutDeny(@RequestParam(defaultValue = "0") int no) {
		logger.info("점포 탈퇴 반려, 파라미터 no={}", no);
		
		int cnt= storesService.adminOutDeny(no);
		logger.info("점포 탈퇴 승인 처리, cnt={}", cnt);
		
		return "redirect:/admin/menu2/approvalList.do";
	}
}
