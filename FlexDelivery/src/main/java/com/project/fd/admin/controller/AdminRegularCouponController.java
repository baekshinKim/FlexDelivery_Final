package com.project.fd.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
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

import com.project.fd.admin.coupons.model.AdminRegularCouponService;
import com.project.fd.admin.coupons.model.AdminRegularCouponVO;

@Controller
@RequestMapping("/admin/menu6")
public class AdminRegularCouponController {
	private static final Logger logger=LoggerFactory.getLogger(AdminRegularCouponController.class);
	
	@Autowired
	private AdminRegularCouponService regularCouponService;
	
	@RequestMapping(value="/regularCoupon.do", method = RequestMethod.GET)
	public String list_get(Model model) {
		logger.info("list_get: 정기쿠폰 리스트 출력");
		
		List<AdminRegularCouponVO> list=regularCouponService.selectAll();
		logger.info("list 출력, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/menu6/regularCoupon";
		
	}
	
	@RequestMapping(value="/regularCoupon.do", method = RequestMethod.POST)
	public String list_post(@ModelAttribute AdminRegularCouponVO regularCouponVo,
			HttpServletRequest request) {
		logger.info("list_post: 정기쿠폰 리스트 출력, 파라미터 vo={}", regularCouponVo);
		
		//List<AdminRegularCouponVO> list=regularCouponService.selectAll();
		//logger.info("list 출력, list.size={}", list.size());
		
		//model.addAttribute("list", list);
		
		return "admin/menu6/regularCoupon";
		
	}
	
	@RequestMapping("/rCoupon/ajaxCheck.do")
	@ResponseBody
	public boolean ajax_check(@RequestParam int rCouponDc, @RequestParam int rCouponMin) {
		logger.info("쿠폰 중복확인, rCouponDc={}, rCouponMin={}", rCouponDc, rCouponMin);
		
		Map<String, Object> map=new HashedMap<String, Object>();
		
		map.put("rCouponDc", rCouponDc);
		map.put("rCouponMin", rCouponMin);
		
		boolean isExist=false;
		if(map!=null && !map.isEmpty()) {
			isExist=regularCouponService.checkDu(map);
			logger.debug("쿠폰 중복확인 결과, isExist={}", isExist);
		}
		return isExist;
		
	}

	@RequestMapping(value="/regularCoupon/write.do", method = RequestMethod.GET)
	public String write_get(@ModelAttribute AdminRegularCouponVO regularCouponVo,
			HttpServletRequest request) {
		logger.info("write_get 등록 화면 띄우기");
		
		return "admin/menu6/regularCoupon";
	}
	
	@RequestMapping(value="/regularCoupon/write.do", method = RequestMethod.POST)
	public String write_post(@ModelAttribute AdminRegularCouponVO regularCouponVo,
			HttpServletRequest request) {
		logger.info("write_post 정기쿠폰 등록 처리, 파라미터 vo={}", regularCouponVo);
		
		int cnt=regularCouponService.insertRegularCoupon(regularCouponVo);
		logger.info("정기쿠폰 등록 처리 결과, cnt={}", cnt);
		
		return "redirect:/admin/menu6/regularCoupon.do";
	}
	
	@RequestMapping(value="/regularCoupon/edit.do", method = RequestMethod.POST)
	public String edit_post(@ModelAttribute AdminRegularCouponVO regularCouponVo,
			HttpServletRequest request, Model model) {
		logger.info("edit_post 정기쿠폰 수정 처리, 파라미터 vo={}", regularCouponVo);
		
		String msg="정기쿠폰  수정 실패", url="/admin/menu6/regularCoupon.do";
		int cnt=regularCouponService.updateRegularCoupon(regularCouponVo);
		logger.info("정기쿠폰 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="정기쿠폰을 수정하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";		
		//return "redirect:/admin/menu6/giftPrice.do";
	}
	
	@RequestMapping(value="/regularCoupon/delete.do", method = RequestMethod.POST)
	public String delete_post(@ModelAttribute AdminRegularCouponVO regularCouponVo,
			HttpServletRequest request, Model model) {
		
		logger.info("delete_post 정기쿠폰  삭제처리, 파라미터 vo={}", regularCouponVo);
		
		String msg="정기쿠폰 삭제 실패", url="/admin/menu6/regularCoupon.do";
		int cnt=regularCouponService.deleteRegularCoupon(regularCouponVo);
		logger.info("정기쿠폰 삭제 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="정기쿠폰을 삭제하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		//return "redirect:/admin/menu6/giftPrice.do";
	}
	
}
