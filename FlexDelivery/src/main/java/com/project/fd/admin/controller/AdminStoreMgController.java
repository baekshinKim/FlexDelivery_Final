package com.project.fd.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fd.admin.storeMg.model.AdminStoreMgService;
import com.project.fd.owner.store.model.OwnerStoresVO;

@Controller
@RequestMapping("/admin")
public class AdminStoreMgController {
	public static final Logger logger
	= LoggerFactory.getLogger(AdminStoreAdController.class);
	@Autowired
	AdminStoreMgService storeMgService;
	
	@RequestMapping("/menu2/storeMgList.do")
	public String adminStroreMg(Model model) {
		logger.info("가맹점 리스트  화면");
		//1
		//2
		List<OwnerStoresVO> list= storeMgService.storeMgList();
		logger.info("가맹점 리스트 결과, list={}", list);
		//3
		model.addAttribute("list", list);
		
		return "admin/menu2/storeMgList";
	}
}
