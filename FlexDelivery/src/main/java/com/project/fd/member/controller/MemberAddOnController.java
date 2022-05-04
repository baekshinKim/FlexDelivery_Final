package com.project.fd.member.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fd.member.gift.model.MemberGiftService;

@Controller
@RequestMapping("/member/addOn")
public class MemberAddOnController {
	
	private static final Logger logger=LoggerFactory.getLogger(MemberAddOnController.class);
	@Autowired MemberGiftService giftServ;
	
	@RequestMapping("/addOn.do")
	public void addOnView(Model model) {
		logger.info("부가기능 화면");
		List<Map<String, Object>> plist=giftServ.giftPriceList();
		model.addAttribute("plist",plist);
	}
	
}
