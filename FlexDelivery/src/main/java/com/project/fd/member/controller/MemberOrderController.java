package com.project.fd.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.project.fd.member.cart.model.MemberCartService;
import com.project.fd.member.cart.model.MemberCartViewVO;
import com.project.fd.member.coupon.model.MemberCouponService;
import com.project.fd.member.coupon.model.MemberEventCouponBoxVO;
import com.project.fd.member.coupon.model.MemberRegularCouponBoxVO;
import com.project.fd.member.gift.model.MemberGiftService;
import com.project.fd.member.gift.model.MemberGiftVO;
import com.project.fd.member.model.MemberService;
import com.project.fd.member.model.MemberVO;
import com.project.fd.member.order.model.MemberOrderAllVO;
import com.project.fd.member.order.model.MemberOrderService;
import com.project.fd.member.order.model.MemberOrderVO;
import com.project.fd.member.stores.model.MemberStoresService;
import com.project.fd.member.stores.model.MemberStoresVO;

@Controller
@RequestMapping("/member/order")
public class MemberOrderController {
	@Autowired private static final Logger logger=LoggerFactory.getLogger(MemberOrderController.class);
	@Autowired private MemberService memServ;
	@Autowired private MemberCouponService coupServ;
	@Autowired private MemberCartService cartServ;
	@Autowired private MemberStoresService storeServ;
	@Autowired private MemberGiftService giftServ;
	@Autowired private MemberOrderService orderServ;
	
	@RequestMapping("/orderSheet.do")
	public void orderSheet(HttpSession session,Model model) {
		logger.info("주문서 작성페이지");
		String memberId=(String)session.getAttribute("memberId");
		MemberVO memVo=memServ.selectMember(memberId);
		List<MemberCartViewVO> cartList=cartServ.selectCartList(memVo.getMemberNo());
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("memberNo", memVo.getMemberNo());
		map.put("storeNo", cartList.get(0).getStoreNo());
		List<MemberRegularCouponBoxVO> coupList=coupServ.memberCouponList(map);
		List<MemberGiftVO> giftList=giftServ.selectTakeGiftList(memVo.getMemberNo());
		List<MemberEventCouponBoxVO> eCoupList=coupServ.eventCouponBoxList(memVo.getMemberNo());
				
		
		MemberStoresVO vo=storeServ.selectStoresDetail(cartList.get(0).getStoreNo());
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String today =sdf.format(d);
		
		model.addAttribute("today",today);
		model.addAttribute("memVo",memVo);
		model.addAttribute("coupList",coupList);
		model.addAttribute("eCoupList",eCoupList);
		model.addAttribute("giftList",giftList);
		model.addAttribute("cartList",cartList);
		model.addAttribute("storeMinPrice",vo.getStoreMinPrice());
	}
	
	@RequestMapping(value="/orderSuccess.do",method = RequestMethod.POST)
	public String orderSuccess(@ModelAttribute MemberOrderVO vo,@RequestParam(defaultValue = "0",required = false) int giftSelect
			,@RequestParam(defaultValue = "0",required = false) int couponSelect,@RequestParam(defaultValue = "0",required = false) int eCouponSelect,Model model) {
		logger.info("주문처리, MemberOrderVO={}",vo);
		logger.info("주문처리, giftSelect={}",giftSelect);
		logger.info("주문처리, couponSelect={}",couponSelect);
		logger.info("주문처리, eCouponSelect={}",eCouponSelect);
		List<MemberCartViewVO> cartList=cartServ.selectCartList(vo.getMemberNo());
		int cnt=0;
		int type=0;
		int dcNo=0;
		if(vo.getOrdersDiscount()!=0) {
			if(giftSelect!=0) {
				type=MemberOrderService.GIFT_USE; //상품권 사용한경우
				dcNo=giftSelect;
			}else if(couponSelect!=0) {
				type=MemberOrderService.COUPON_USE; //쿠폰 사용한경우
				dcNo=couponSelect;
			}else if(eCouponSelect!=0) {
				type=MemberOrderService.E_COUPON_USE;
				dcNo=eCouponSelect;
			}
		}
		cnt=orderServ.insertOrder(vo, cartList,type,dcNo);
		String msg="주문 실패하였습니다.";
		String url="/member/order/orderSheet.do";
		if(cnt>0) {
			msg="주문성공!";
			url="/member/order/orderSuccess.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping(value="/orderSuccess.do",method = RequestMethod.GET)
	public void successView() {
		logger.info("주문완료화면");
	}
	
	@RequestMapping("/orderList.do")
	public void orderListView(HttpSession session,Model model) {
		int memberNo=(Integer)session.getAttribute("memberNo");
		List<MemberOrderAllVO> okList=orderServ.selectOrderOkList(memberNo);
		List<MemberOrderAllVO> ingList=orderServ.selectOrderIngList(memberNo);
		List<MemberOrderAllVO> ccList=orderServ.selectOrderCancelList(memberNo);
		logger.info("oklISTSIZE={}",okList.size());
		logger.info("주문내역확인 페이지");
		model.addAttribute("oklist",okList);
		model.addAttribute("ingList",ingList);
		model.addAttribute("ccList",ccList);
	}
	
	@ResponseBody
	@RequestMapping("/orderDetailAjax.do")
	public MemberOrderAllVO detailAjax(@RequestParam int ordersNo){
		logger.info("주문상세보기 모달 ajax, ordersNo={}",ordersNo);
		MemberOrderAllVO vo=orderServ.selectOrderAllByOrdersNo(ordersNo);
		return vo;
	}
	
}
