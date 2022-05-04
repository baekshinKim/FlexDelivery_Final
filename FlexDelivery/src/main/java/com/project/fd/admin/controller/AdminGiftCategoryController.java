package com.project.fd.admin.controller;

import java.util.List;

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

import com.project.fd.admin.gift.model.AdminGiftCategoryProductVO;
import com.project.fd.admin.gift.model.AdminGiftCategoryService;
import com.project.fd.admin.gift.model.AdminGiftCategoryVO;

@Controller
@RequestMapping("/admin/menu6")
public class AdminGiftCategoryController {
	private Logger logger=LoggerFactory.getLogger(AdminGiftCategoryController.class);
	
	@Autowired
	private AdminGiftCategoryService giftCategoryService;
	
	@RequestMapping(value="/giftCategory.do", method = RequestMethod.GET)
	public String list_get(Model model) {
		logger.info("list_get 선물 카테고리 목록 화면 출력");
		
		//AllView
		List<AdminGiftCategoryProductVO> list=giftCategoryService.selectAll2();
		logger.info("글 목록 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
				
		return "/admin/menu6/giftCategory";
	}
	
	@RequestMapping("/gCategoryName/ajaxCheck.do")
	@ResponseBody
	public boolean ajax_check(@RequestParam String gCategoryName) {
		logger.info("이름 중복확인, gCategoryName={}", gCategoryName);
		
		boolean isExist=false;
		if(gCategoryName!=null && !gCategoryName.isEmpty()) {
			isExist=giftCategoryService.checkDu(gCategoryName);
			logger.debug("이름 중복확인 결과, isExist={}", isExist);
		}
		return isExist;
		
	}

	@RequestMapping(value="/giftCategory/write.do", method = RequestMethod.POST)
	public String write_post(@ModelAttribute AdminGiftCategoryVO giftCategoryVo,
			HttpServletRequest request) {
		logger.info("write_post 선물 카테고리 등록 처리, 파라미터 vo={}", giftCategoryVo);
		
		int cnt=giftCategoryService.insertGiftCategory(giftCategoryVo);
		logger.info("선물 카테고리 등록 처리 결과, cnt={}", cnt);
		
		return "redirect:/admin/menu6/giftCategory.do";
	}
	
	@RequestMapping(value="/giftCategory/edit.do", method = RequestMethod.POST)
	public String edit_post(@ModelAttribute AdminGiftCategoryVO giftCategoryVo,
			HttpServletRequest request, Model model) {
		logger.info("edit_post 선물 카테고리 수정 처리, 파라미터 vo={}", giftCategoryVo);
		
		String msg="선물 카테고리 수정 실패", url="/admin/menu6/giftCategory.do";
		int cnt=giftCategoryService.updateGiftCategory(giftCategoryVo);
		logger.info("선물 카테고리 수정 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="선물 카테고리를 수정하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";		
		//return "redirect:/admin/menu6/giftPrice.do";
	}
	
	@RequestMapping(value="/giftCategory/delete.do", method = RequestMethod.POST)
	public String delete_post(@ModelAttribute AdminGiftCategoryVO giftCategoryVo,
			HttpServletRequest request, Model model) {
		
		logger.info("delete_post 선물 카테고리  삭제처리, 파라미터 vo={}", giftCategoryVo);
		
		String msg="선물 카테고리 삭제 실패", url="/admin/menu6/giftCategory.do";
		int cnt=giftCategoryService.deleteGiftCategory(giftCategoryVo);
		logger.info("선물 카테고리 삭제 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="선물 카테고리를 삭제하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		//return "redirect:/admin/menu6/giftPrice.do";
	}
}
