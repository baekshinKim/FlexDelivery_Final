package com.project.fd.admin.controller;

import java.util.List;
import java.util.Locale;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.fd.admin.ownerregister.model.AdminOwnerRegisterService;
import com.project.fd.admin.ownerregister.model.AdminOwnerRegisterVo;
import com.project.fd.admin.stores.model.AdminStoresService;
import com.project.fd.admin.stores.model.AdminStoresVO;
import com.project.fd.admin.temporary.model.AdminTemporaryService;
import com.project.fd.admin.temporary.model.AdminTemporaryVO;
import com.project.fd.common.ExcelService;

@Controller
@RequestMapping(value = "/admin/menu2")
public class AdminDownLoadExcel{
	private static final Logger logger
	= LoggerFactory.getLogger(AdminDownLoadExcel.class);
	
	@Autowired
	AdminStoresService storesService;
	@Autowired
	AdminTemporaryService temporaryService;
	@Autowired
	AdminOwnerRegisterService registerService;
	@Autowired
	ExcelService excelService;
	
	@RequestMapping(value = "/approvalDownloadExcel.do", method = RequestMethod.POST)
    public String approvalDownloadExcelFile(Model model) {
		
		logger.info("가맹점 승인 ExcelDownLoad 화면");
		//1
		//2
		List<AdminStoresVO> list= storesService.adminApprovalList();
		logger.info("승인 list, list.size={}",list.size());
        
        SXSSFWorkbook workbook = excelService.approvalExcelDownloadProcess(list);
        
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "가맹점 승인 목록");
        
        return "excelDownloadView";
    }
	
	@RequestMapping(value = "/editDownloadExcel.do", method = RequestMethod.POST)
    public String editDownloadExcelFile(Model model) {
		
		logger.info("가맹점 변경 ExcelDownLoad 화면");
		//1
		//2
		List<AdminTemporaryVO> list= temporaryService.editList();
		logger.info("가맹점 변경 list, list.size={}",list.size());
        
        SXSSFWorkbook workbook = excelService.editExcelDownloadProcess(list);
        
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "가맹점 변경 목록");
        
        return "excelDownloadView";
    }
	/*
	@RequestMapping(value = "/registDownloadExcel.do", method = RequestMethod.POST)
    public String registDownloadExcelFile(Model model) {
		
		logger.info("사업자등록증 승인 ExcelDownLoad 화면");
		//1
		//2
		List<AdminOwnerRegisterVo> list= registerService.adminOwnerRegistList();
		logger.info("사업자등록증 승인 list, list.size={}",list.size());
        
        SXSSFWorkbook workbook = excelService.registExcelDownloadProcess(list);
        
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "사업자등록증 승인 목록");
        
        return "excelDownloadView";
    }
	*/
}