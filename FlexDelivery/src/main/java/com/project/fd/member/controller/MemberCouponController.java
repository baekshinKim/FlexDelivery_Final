package com.project.fd.member.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.project.fd.member.coupon.model.MemberCouponService;
import com.project.fd.member.coupon.model.MemberEventCouponBoxVO;
import com.project.fd.member.coupon.model.MemberRegularCouponBoxVO;
import com.project.fd.member.coupon.model.MemberStoresCouponVO;

@Controller
@RequestMapping("/member/coupon")
public class MemberCouponController {

	@Autowired private final static Logger logger=LoggerFactory.getLogger(MemberCouponController.class);
	@Autowired private MemberCouponService coupServ;
	
	
	@ResponseBody
	@RequestMapping(value="/addCoupon.do",method = RequestMethod.POST)
	public Boolean addCoupon(@ModelAttribute MemberRegularCouponBoxVO vo,Model model) {
		logger.info("쿠폰발급처리, MemberRegularCouponBoxVO={}",vo);
		int cnt=coupServ.addCoupon(vo);
		logger.info("쿠폰발급결과, cnt={}",cnt);
		if(cnt>0) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping("/storeCouponBox.do")
	public List<MemberStoresCouponVO> storeCouponList(@RequestParam int storeNo,@RequestParam int memberNo){
		logger.info("점포쿠폰함 호출!");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("storeNo", storeNo);
		map.put("memberNo", memberNo);
		List<MemberStoresCouponVO> list=coupServ.storeCouponList(map);
		return list;
	}
	
	@RequestMapping("/eventCouponList.do")
	public void eventCouponList(HttpSession session,Model model) {
		logger.info("이벤트 쿠폰발급 리스트 출력");
		int memberNo=(Integer)session.getAttribute("memberNo");
		List<MemberEventCouponBoxVO> list=coupServ.eventCouponAll(memberNo);
		
		model.addAttribute("list",list);
	}
	
	@RequestMapping("/getECoupon.do")
	public String getECoupon(@RequestParam int eCouponNo,Model model,HttpSession session) {
		logger.info("이벤트 쿠폰 발급 couponNo={}",eCouponNo);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("eCouponNo", eCouponNo);
		map.put("memberNo", (Integer)session.getAttribute("memberNo"));
		int cnt=coupServ.getEventCoupon(map);
		String msg="발급 실패",url="/member/addOn/addOn.do";
		if(cnt>0) {
			msg="발급성공!";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
}
