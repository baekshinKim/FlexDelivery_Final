package com.project.fd.owner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fd.owner.store.model.OwnerStoresService;

@Controller
@RequestMapping("/owner/mypage")
public class OwnerEditInfoController {
	private static final Logger logger =LoggerFactory.getLogger(OwnerStoresController.class);
	
	@Autowired OwnerStoresService ownerStoresService;
	 
	// info edit page 
	 @RequestMapping("/editInfo.do")
	 public void ownerlaunch() {
		 logger.info("사업자 정보 변경 보여주기 ");
	 }
}
