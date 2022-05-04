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

import com.project.fd.admin.coupons.model.AdminEventCouponService;
import com.project.fd.admin.coupons.model.AdminEventCouponVO;

@Controller
@RequestMapping("/admin/menu6")
public class AdminEventCouponController {

	private static final Logger logger=LoggerFactory.getLogger(AdminEventCouponController.class);
	
	@Autowired
	private AdminEventCouponService eventCouponService;
	
	@RequestMapping(value="/eventCoupon.do", method = RequestMethod.GET)
	public String list_get(Model model) {
		logger.info("list_get: 이벤트쿠폰 리스트 출력");
		
		List<AdminEventCouponVO> list=eventCouponService.selectAll();
		logger.info("list 출력, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/menu6/eventCoupon";
		
	}
	
	@RequestMapping(value="/eventCoupon.do", method = RequestMethod.POST)
	public String list_post(@ModelAttribute AdminEventCouponVO eventCouponVo,
			HttpServletRequest request) {
		logger.info("list_post: 이벤트쿠폰 리스트 출력, 파라미터 vo={}", eventCouponVo);
		
		//List<AdminRegularCouponVO> list=regularCouponService.selectAll();
		//logger.info("list 출력, list.size={}", list.size());
		
		//model.addAttribute("list", list);
		
		return "admin/menu6/eventCoupon";
		
	}

	@RequestMapping("/eCoupon/ajaxCheck.do")
	@ResponseBody
	public boolean ajax_check(@RequestParam String eCouponName) {
		logger.info("이름 중복확인, eCouponName={}", eCouponName);
		
		boolean isExist=false;
		if(eCouponName!=null && !eCouponName.isEmpty()) {
			isExist=eventCouponService.checkDu(eCouponName);
					//faqCategoryService.checkDu(fCategoryName);
			logger.debug("이름 중복확인 결과, isExist={}", isExist);
		}
		return isExist;
		
	}
	
	@RequestMapping(value="/eventCoupon/write.do", method = RequestMethod.POST)
	public String write_post(@ModelAttribute AdminEventCouponVO eventCouponVo,
			HttpServletRequest request) {
		logger.info("write_post 이벤트쿠폰 등록 처리, 파라미터 vo={}", eventCouponVo);
		
		int cnt=eventCouponService.insertEventCoupon(eventCouponVo);
		logger.info("이벤트쿠폰 등록 처리 결과, cnt={}", cnt);
		
		return "redirect:/admin/menu6/eventCoupon.do";
	}
	
	@RequestMapping(value="/eventCoupon/edit.do", method = RequestMethod.POST)
	public String edit_post(@ModelAttribute AdminEventCouponVO eventCouponVo,
			HttpServletRequest request, Model model) {
		logger.info("edit_post 이벤트쿠폰 수정 처리, 파라미터 vo={}", eventCouponVo);
		
		String msg="이벤트쿠폰  수정 실패", url="/admin/menu6/eventCoupon.do";
		int cnt=eventCouponService.updateEventCoupon(eventCouponVo);
		logger.info("이벤트쿠폰 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="이벤트쿠폰을 수정하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";		
		//return "redirect:/admin/menu6/giftPrice.do";
	}
	
	@RequestMapping(value="/eventCoupon/delete.do", method = RequestMethod.POST)
	public String delete_post(@ModelAttribute AdminEventCouponVO eventCouponVo,
			HttpServletRequest request, Model model) {
		
		logger.info("delete_post 이벤트쿠폰  삭제처리, 파라미터 vo={}", eventCouponVo);
		
		String msg="이벤트쿠폰 삭제 실패", url="/admin/menu6/eventCoupon.do";
		int cnt=eventCouponService.deleteEventCoupon(eventCouponVo);
		logger.info("이벤트쿠폰 삭제 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="이벤트쿠폰을 삭제하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		//return "redirect:/admin/menu6/giftPrice.do";
	}	
	
}
