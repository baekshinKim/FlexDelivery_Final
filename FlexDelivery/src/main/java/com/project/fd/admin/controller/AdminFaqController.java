package com.project.fd.admin.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.admin.faq.model.AdminFaqAllViewVO;
import com.project.fd.admin.faq.model.AdminFaqCategoryService;
import com.project.fd.admin.faq.model.AdminFaqCategoryVO;
import com.project.fd.admin.faq.model.AdminFaqService;
import com.project.fd.admin.faq.model.AdminFaqVO;
import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryVO;

@Controller
@RequestMapping("/admin/menu5")
public class AdminFaqController {
	
	@Autowired
	private AdminFaqService faqService;
	
	@Autowired
	private AdminFaqCategoryService faqCategoryService;
	
	
	private Logger logger=LoggerFactory.getLogger(AdminFaqController.class);
	
	@RequestMapping(value="/faq.do", method = RequestMethod.GET)
	public String list_get(Model model) {
		logger.info("자주 하는 질문 list_get, 리스트 화면 보여주기");
		
		List<AdminFaqAllViewVO> list=faqService.selectAll2();
		logger.info("list 출력, list.size={}", list.size());
		
		List<AdminFaqCategoryVO> ctList=faqCategoryService.selectCategoryAll();
		logger.info("카테고리 list 출력, ctList.size={}", ctList.size());
		
		model.addAttribute("list", list);
		model.addAttribute("ctList", ctList);
		
		return "admin/menu5/faq";
	}
	
	@RequestMapping(value="/faq/listAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminFaqAllViewVO> list_for_all_get(Model model) {
		logger.info("ajax: 전체보기용 리스트 출력");
		
		List<AdminFaqAllViewVO> list=faqService.selectAll2();
		logger.info("list 출력, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return list;
	}
	
	@RequestMapping(value="/faq/category/list.do", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminFaqCategoryVO> category_list_get(Model model) {
		logger.info("자주 하는 질문: 카테고리 list_get, 리스트 화면 보여주기");
		
		List<AdminFaqCategoryVO> cList=faqCategoryService.selectCategoryAll();
		logger.info("카테고리 list 출력, cList.size={}", cList.size());
		
		model.addAttribute("cList", cList);
		
		return cList;
	}
	
	@RequestMapping(value="/faq/list.do", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminFaqAllViewVO> list_for_category_get(@RequestParam int categoryNo, Model model) {
		
		logger.info("자주 하는 질문: 선택 카테고리, categoryNo={}", categoryNo);
		
		List<AdminFaqAllViewVO> forList=faqService.selectFor2(categoryNo);
		logger.info("카테고리  따른 list 출력, forList.size={}", forList.size());
		
		model.addAttribute("forList", forList);
		
		return forList;
	}
	
	
	@RequestMapping("/faqCategory/ajaxCheck.do")
	@ResponseBody
	public boolean ajax_check(@RequestParam String fCategoryName) {
		logger.info("이름 중복확인, fCategoryName={}", fCategoryName);
		
		boolean isExist=false;
		if(fCategoryName!=null && !fCategoryName.isEmpty()) {
			isExist=faqCategoryService.checkDu(fCategoryName);
			logger.debug("이름 중복확인 결과, isExist={}", isExist);
		}
		return isExist;
		
	}
	
	@RequestMapping(value="/faq/category/write.do", method=RequestMethod.POST)
	public String category_write_post(@ModelAttribute AdminFaqCategoryVO faqCategoryVo,
			HttpServletRequest request) {
		logger.info("FAQ 카테고리 등록 처리");
		
		int cnt=faqCategoryService.insertFaqCategory(faqCategoryVo);
		
		if (cnt>0) {
			logger.info("FAQ 카테고리 등록 완료, cnt={}", cnt);
		}
		
		return "redirect:/admin/menu5/faq.do";
	}
	
	@RequestMapping(value="/faq/write.do", method = RequestMethod.POST)
	public String write_post(@ModelAttribute AdminFaqVO faqVo, HttpServletRequest request) {
		logger.info("FAQ 등록 처리");
		
		int cnt=faqService.insertFaq(faqVo);
		
		if (cnt>0) {
			logger.info("FAQ 등록 완료, cnt={}", cnt);
		}
		
		return "redirect:/admin/menu5/faq.do";
	}
	

	@RequestMapping(value="/faq/edit.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute AdminFaqVO faqVo,
			HttpServletRequest request, Model model) {
		logger.info("FAQ 수정 처리, 파라미터 vo={}", faqVo);
		
		String msg="FAQ 수정 실패", url="/admin/menu5/faq.do";
		
		int cnt=faqService.updateFaq(faqVo);
		logger.info("FAQ 수정 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="FAQ를 수정하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/faq/category/edit.do", method=RequestMethod.POST)
	public String category_edit_post(@ModelAttribute AdminFaqCategoryVO faqCategoryVo,
			HttpServletRequest request, Model model) {
		logger.info("FAQ 카테고리 수정 처리, 파라미터 vo={}", faqCategoryVo);
		
		String msg="FAQ 카테고리 수정 실패", url="/admin/menu5/faq.do";
		int cnt=faqCategoryService.updateFaqCategory(faqCategoryVo);
		logger.info("FAQ 카테고리 수정 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="FAQ 카테고리를 수정하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping(value="/faq/deleteFaq.do", method=RequestMethod.POST)
	public String delete_post(@RequestParam int no, HttpServletRequest request, Model model) {
		logger.info("delete_post FAQ 삭제처리, 파라미터 no={}", no);
		
		String msg="FAQ 삭제 실패", url="/admin/menu5/faq.do";
		int cnt=faqService.deleteFaq(no);
		logger.info("FAQ 삭제 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="FAQ를 삭제하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/faq/category/delete.do", method=RequestMethod.GET)
	public String category_delete_post(@RequestParam int no, HttpServletRequest request, Model model) {
		logger.info("delete_post FAQ 카테고리 삭제처리, 파라미터 no={}", no);
		
		String msg="FAQ 카테고리 삭제 실패", url="/admin/menu5/faq.do";
		
		List<Map<String, Object>>list=faqService.chkFCategory(no);
		logger.info("list.size={}", list.size());
		
		String fno=list.get(0).get("CNTFCATEGORY").toString();
		logger.info("하위 메뉴 개수, fno={}", fno);
		
		if (fno.equals("0")) {
			int cnt=faqCategoryService.deleteFaqCategory(no);
			logger.info("FAQ 카테고리 삭제 처리 결과, cnt={}", cnt);
			if (cnt>0) { msg="FAQ 카테고리를 삭제하였습니다."; }
		} else {
			msg="하위 질문답변이 있는 카테고리는 삭제할 수 없습니다!";
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
