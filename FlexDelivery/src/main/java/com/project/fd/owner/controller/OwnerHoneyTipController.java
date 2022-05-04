package com.project.fd.owner.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.admin.hoenytip.AdminHoneytipService;
import com.project.fd.admin.hoenytip.AdminHoneytipVO;
import com.project.fd.common.FileUploadUtil;
import com.project.fd.owner.model.OwnerService;



@Controller
@RequestMapping("/owner/menu3/honeyTip")
public class OwnerHoneyTipController {


	private static final Logger logger
	=LoggerFactory.getLogger(OwnerHoneyTipController.class);
	
	@Autowired
	OwnerService ownerService;
	@Autowired
	private AdminHoneytipService honeytipService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	//관리자, 점포 공통 뷰 보여주기(점포)
	@RequestMapping(value="/honeyTip.do", method = RequestMethod.GET)
	public String list_get(Model model) {
		logger.info("사장님꿀팁 list_get, 리스트 화면 보여주기");
		
		List<AdminHoneytipVO> list=honeytipService.selectAll();
		logger.info("list 출력, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "owner/menu3/honeyTip/honeyTip";
	}
	

	@RequestMapping("/detail.do")
	public String detail(@RequestParam(defaultValue = "0") int honeyTipNo, Model model) {
		//1
		logger.info("detail 상세보기 파라미터 no={}", honeyTipNo);
		if(honeyTipNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu3/honeytip.do");
			
			return "common/message";
		}
		
		//2
		AdminHoneytipVO honeytipVo=honeytipService.selectByNo(honeyTipNo);
		logger.info("상세보기 결과,vo={}", honeytipVo);
		
		//3
		model.addAttribute("vo", honeytipVo);
		
		//4
		return "owner/menu3/honeyTip/detail";
	}

}
