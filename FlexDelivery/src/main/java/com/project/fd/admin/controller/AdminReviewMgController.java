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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.fd.admin.reviewMg.model.AdminReviewMgService;
import com.project.fd.admin.reviewMg.model.AdminReviewMgVO;
import com.project.fd.common.FileUploadUtil;


@Controller
@RequestMapping("/admin/menu1")
public class AdminReviewMgController {
	public static final Logger logger
	= LoggerFactory.getLogger(AdminReviewMgController.class);
	
	@Autowired
	AdminReviewMgService reviewMgService;
	@Autowired
	private FileUploadUtil fileUtil;
	
	@RequestMapping("/reviewMgList.do")
	public String adminReviewMgList(Model model) {
		
		logger.info("review 신고 리스트 화면");
		//1
		//2
		List<AdminReviewMgVO> list = reviewMgService.reviewMgList();
		logger.info("review신고 리스트 결과 list={}", list);
		//3
		model.addAttribute("list", list);
		
		return "admin/menu1/reviewMgList";	
	}
	
	@RequestMapping("/reviewMgDetail.do")
	public String adminReviewMgDetail(@RequestParam(defaultValue = "0") int no, Model model) {
		
		logger.info("리뷰 신고 승인 세부 화면, 파라미터 no={}", no);
		//1
		//2
		AdminReviewMgVO vo= reviewMgService.reviewMgDetail(no);
		logger.info("리뷰 신고 승인 세부 화면 결과, vo={}", vo);
		
		//3
		model.addAttribute("vo", vo);
		
		return "admin/menu1/reviewMgDetail";
	}
	
	@RequestMapping("/reviewMgAgree.do")
	public String adminReviewMgAgree(@RequestParam(defaultValue = "0") int no) {
		logger.info("리뷰신고 승인 화면, 파라미터 no={}", no);

		int cnt = reviewMgService.reviewMgAgree(no);
		logger.info("리뷰신고 승인 처리, cnt={}", cnt);
		
		return "redirect:/admin/menu1/reviewMgList.do";		
	}
	
	@RequestMapping("/reviewMgDeny.do")
	public String adminReviewMgDeny(@RequestParam(defaultValue = "0") int no) {
		logger.info("리뷰신고 반려 화면, 파라미터 no={}", no);

		int cnt = reviewMgService.reviewMgDeny(no);
		logger.info("리뷰신고 반려 처리, cnt={}", cnt);
		
		return "redirect:/admin/menu1/reviewMgList.do";		
	}
	
	@RequestMapping("/downloadReview.do")
	public ModelAndView download(@RequestParam(defaultValue = "0") int no,
			@RequestParam String fileName,
			HttpServletRequest request) {
		//1
		logger.info("다운로드 처리 페이지, 파라미터 no={}, fileName={}", no, fileName);
		//2
		//3
		Map<String, Object> map = new HashMap<String, Object>();

		String upPath=fileUtil.getUploadPath(FileUploadUtil.REVIEW_TYPE, request);		
		File file = new File(upPath, fileName);
		map.put("file", file);

		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("adminDownloadView", map);

		//4
		return mav;		
	}
}
