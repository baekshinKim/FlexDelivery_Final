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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.fd.admin.stores.model.AdminStoresService;
import com.project.fd.admin.stores.model.AdminStoresVO;
import com.project.fd.admin.temporary.model.AdminTemporaryService;
import com.project.fd.admin.temporary.model.AdminTemporaryVO;
import com.project.fd.common.FileUploadUtil;

@Controller
@RequestMapping("/admin/menu2")
public class AdminStoresEditController {
	public static final Logger logger
	= LoggerFactory.getLogger(AdminStoresEditController.class);
	
	@Autowired
	AdminTemporaryService temporaryService;
	@Autowired
	AdminStoresService storesService;
	@Autowired
	private FileUploadUtil fileUtil;
	
	@RequestMapping("/editList.do")
	public String adminEditList(Model model) {
		//승인/변경 상태 목록 보여주기
		logger.info("점포 변경 목록 화면");
		//1
		//2
		List<AdminTemporaryVO> list= temporaryService.editList();
		logger.info("승인 list, list.size={}", list.size());
		
		//3
		model.addAttribute("list", list);
		
		return "admin/menu2/editList";
	}
	
	
	@RequestMapping("/editDetail.do")
	public String adminEditDetail(@RequestParam(defaultValue = "0")  int no ,
			@RequestParam(defaultValue = "0") int sNo, Model model) {
		//승인/변경 상태 목록 보여주기
		logger.info("점포 변경 세부 화면, 파라미터 no={}", no);
		logger.info("점포 변경 세부 화면, 파라미터 sNo={}", sNo);
		//1
		//2
		AdminTemporaryVO temporaryVo= temporaryService.editDetail(no);
		logger.info("점포 변경 세부 화면 결과 temporaryVo={} ",temporaryVo);
		
		AdminStoresVO storeVo= storesService.adminApprovalDetail(sNo);
		logger.info("점포변경 세부 화면 결과 storesVo={}", storeVo);
		//3
		model.addAttribute("temporaryVo", temporaryVo);
		model.addAttribute("storeVo", storeVo);
		
		return "admin/menu2/editDetail";
	}
	
	@RequestMapping("/editAgree.do")
	public String adminEditAgree(@RequestParam(defaultValue = "0") int no) {
		logger.info("점포 변경 승인 화면, 파라미터 vo={}", no);
		
		AdminTemporaryVO temporaryVo= temporaryService.editDetail(no);
		logger.info("점포변견 값 temporaryVo={}", temporaryVo);
		int cnt= temporaryService.editAgree(temporaryVo); 
		logger.info("점포 변경 승인 처리, cnt={}", cnt);
		
		
		return "redirect:/admin/menu2/editList.do";
		
	}
	
	@RequestMapping("/editDeny.do")
	public String adminEditDeny(@RequestParam(defaultValue = "0") int no) {
		logger.info("점포 변경 반려, 파라미터 no={}", no);
		
		int cnt= temporaryService.editDeny(no);
		logger.info("점포 변경 승인 처리, cnt={}", cnt);
		
		return "redirect:/admin/menu2/editList.do";
	}
	
	@RequestMapping("/downloadEdit.do")
	public ModelAndView download(@RequestParam(defaultValue = "0") long tNo,
			@RequestParam String fileName,
			HttpServletRequest request) {
		//1
		logger.info("다운로드 처리 페이지, 파라미터 no={}, fileName={}", tNo, fileName);
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

}
