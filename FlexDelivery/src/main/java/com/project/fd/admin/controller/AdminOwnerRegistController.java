package com.project.fd.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.fd.admin.ownerregister.model.AdminOwnerRegisterService;
import com.project.fd.admin.ownerregister.model.AdminOwnerRegisterVo;
import com.project.fd.common.FileUploadUtil;

@Controller
@RequestMapping("/admin/menu2")
public class AdminOwnerRegistController {
	public static final Logger logger
	=LoggerFactory.getLogger(AdminOwnerRegistController.class);
	
	@Autowired
	AdminOwnerRegisterService registerService;
	@Autowired
	private FileUploadUtil fileUtil;
	
	@RequestMapping(value="/registList.do", method = RequestMethod.GET)
	public String adminOwnerRegistList(Model model) {
		logger.info("사업자등록증 승인 목록 화면");
		
		List<AdminOwnerRegisterVo> list= registerService.adminOwnerRegistList();
		logger.info("사업증등록증 승인 목록  list={}", list);		
		model.addAttribute("list", list);		
	
		return "admin/menu2/registList";
	}
	
	@RequestMapping(value="/registDetail.do", method = RequestMethod.GET)
	public String adminOwnerRegistDetail(@RequestParam (defaultValue = "0") long no, Model model) {
		logger.info("사업자등록증 승인 세부 화면");
		
		AdminOwnerRegisterVo vo= registerService.adminOwnerRegistDetail(no);
		logger.info("사업증등록증 승인 세부  vo={}", vo);
		
		model.addAttribute("vo", vo);
	
		return "admin/menu2/registDetail";
	}
	
	@RequestMapping(value="/registApproval.do", method = RequestMethod.GET)
	public String adminOwnerRegistApproval(@RequestParam(defaultValue = "0") long registerNo,
			@RequestParam(defaultValue = "0") int ownerNo) {
		logger.info("사업자등록증 승인 화면, 파라미터 registerNo={} owner={}",registerNo, ownerNo);
		
		int cnt= registerService.adminOwnerRegistApproval(registerNo);
		logger.info("사업증등록증 승인 결과 cnt={}", cnt);
		
		cnt=registerService.adminOwnerApproval(ownerNo);
		logger.info("점포주 권한 변경 결과 cnt={}", cnt);

		
		return "redirect:/admin/menu2/registList.do";
	}
	
	@RequestMapping(value="/registDeny.do", method = RequestMethod.GET)
	public String adminOwnerRegistDeny(@RequestParam(defaultValue = "0") long registerNo) {
		logger.info("사업자등록증 반려 화면, 파라미터 registerNo={}",registerNo);
		
		int cnt= registerService.adminOwnerRegistDeny(registerNo);
		logger.info("사업증등록증 반려 결과 cnt={}", cnt);
	
		return "redirect:/admin/menu2/registList.do";
	}
	/*
	@RequestMapping("/downloadReg.do")
	public ModelAndView download(@RequestParam(defaultValue = "0") long no,
			@RequestParam String fileName,
			HttpServletRequest request) {
		//1
		logger.info("다운로드 처리 페이지, 파라미터 no={}, fileName={}", no, fileName);
		//2
		//3
		Map<String, Object> map = new HashMap<String, Object>();

		String upPath=fileUtil.getUploadPath(FileUploadUtil.OWNER_REGISTER_TYPE, request);		
		File file = new File(upPath, fileName);
		map.put("file", file);

		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("adminDownloadView", map);

		//4
		return mav;		
	}
	*/
}
