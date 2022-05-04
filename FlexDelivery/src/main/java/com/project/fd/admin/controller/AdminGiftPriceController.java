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

import com.project.fd.admin.gift.model.AdminGiftPriceTypeService;
import com.project.fd.admin.gift.model.AdminGiftPriceTypeVO;

@Controller
@RequestMapping("/admin/menu6")
public class AdminGiftPriceController {

	private static final Logger logger
		=LoggerFactory.getLogger(AdminGiftPriceController.class);
	
	@Autowired
	private AdminGiftPriceTypeService giftPriceTypeService;
	
	@RequestMapping(value="/giftPrice.do", method = RequestMethod.GET)
	public String list_get(Model model) {
		logger.info("list_do, 선물 금액 목록 출력하기");
		
		List<AdminGiftPriceTypeVO> list=giftPriceTypeService.selectAll();
		logger.info("선물 금액 목록 출력 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		return "admin/menu6/giftPrice";
	}
	
	@RequestMapping("/gPrice/ajaxCheck.do")
	@ResponseBody
	public boolean ajax_check(@RequestParam int gPTypePrice) {
		logger.info("금액 중복확인, price={}", gPTypePrice);
		
		boolean isExist=false;
		if(gPTypePrice>=0) {
			isExist=giftPriceTypeService.checkDu(gPTypePrice);
			logger.debug("금액 중복확인 결과, isExist={}", isExist);
		}
		return isExist;
		
	}
	
	@RequestMapping(value="/giftPrice.do", method = RequestMethod.POST)
	public String list_post(@ModelAttribute AdminGiftPriceTypeVO giftPriceTypeVo , HttpServletRequest request) {
		logger.info("list_post, 작업 후 선물 금액 목록 출력하기, 파라미터 vo={}", giftPriceTypeVo);
		
		int cnt=giftPriceTypeService.insertGiftPriceType(giftPriceTypeVo);
		logger.info("선물 금액 목록, cnto={}", cnt);
		
		return "redirect:/admin/menu6/giftPrice.do";
	}
	
	@RequestMapping(value="/giftPrice/write.do", method = RequestMethod.GET)
	public String write_get(@ModelAttribute AdminGiftPriceTypeVO giftPriceTypeVo,
			HttpServletRequest request) {
		logger.info("write_get 등록 화면 띄우기");
		
		return "admin/menu6/giftPrice";
	}
	
	@RequestMapping(value="/giftPrice/write.do", method = RequestMethod.POST)
	public String write_post(@ModelAttribute AdminGiftPriceTypeVO giftPriceTypeVo,
			HttpServletRequest request) {
		logger.info("write_post 금액 등록 처리, 파라미터 vo={}", giftPriceTypeVo);
		
		int cnt=giftPriceTypeService.insertGiftPriceType(giftPriceTypeVo);
		logger.info("금액 등록 처리 결과, cnt={}", cnt);
		
		return "redirect:/admin/menu6/giftPrice.do";
	}
	
	@RequestMapping(value="/giftPrice/edit.do", method = RequestMethod.POST)
	public String edit_post(@ModelAttribute AdminGiftPriceTypeVO giftPriceTypeVo,
			HttpServletRequest request, Model model) {
		logger.info("edit_post 금액 수정 처리, 파라미터 vo={}", giftPriceTypeVo);
		
		String msg="금액 카테고리 수정 실패", url="/admin/menu6/giftPrice.do";
		int cnt=giftPriceTypeService.updateGiftPriceType(giftPriceTypeVo);
		logger.info("금액 수정 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="금액 카테고리를 수정하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";		
		//return "redirect:/admin/menu6/giftPrice.do";
	}
	
	@RequestMapping(value="/giftPrice/delete.do", method = RequestMethod.POST)
	public String delete_post(@ModelAttribute AdminGiftPriceTypeVO giftPriceTypeVo,
			HttpServletRequest request, Model model) {
		
		logger.info("delete_post 금액 카테고리  삭제처리, 파라미터 vo={}", giftPriceTypeVo);
		
		String msg="금액 카테고리 삭제 실패", url="/admin/menu6/giftPrice.do";
		int cnt=giftPriceTypeService.deleteGiftPriceType(giftPriceTypeVo);
		logger.info("금액 카테고리 삭제 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="금액 카테고리를 삭제하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		//return "redirect:/admin/menu6/giftPrice.do";
	}
	
}
