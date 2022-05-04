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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.member.gift.model.MemberGiftProductVO;
import com.project.fd.member.gift.model.MemberGiftService;
import com.project.fd.member.gift.model.MemberGiftVO;
import com.project.fd.member.model.MemberService;

@Controller
@RequestMapping("/member/gift")
public class MemberGiftController {

	@Autowired
	private static final Logger logger=LoggerFactory.getLogger(MemberGiftController.class);
	@Autowired private MemberGiftService giftServ;
	@Autowired private MemberService memServ;
	
	@RequestMapping("/giftProductList.do")
	public void giftProductList(@RequestParam(defaultValue = "0",required = false) int gCategoryNo,Model model) {
		logger.info("선물상품 출력");
		List<MemberGiftProductVO> list=giftServ.giftProductList(gCategoryNo);
		int count=giftServ.giftCount(gCategoryNo);
		model.addAttribute("list",list);
		model.addAttribute("count",count);
	}
	
	@RequestMapping("/giftCategorySlider.do")
	public void giftSlider(Model model) {
		logger.info("선물상품 카테고리 슬라이더");
		List<Map<String, Object>> list=giftServ.giftCategorySlider();
		model.addAttribute("list",list);
	}
	
	@ResponseBody
	@RequestMapping("/giftProductAjax.do")
	public Map<String, Object> giftProductAjax(@RequestParam int gCategoryNo) {
		logger.info("선물상품 출력,gCategoryNo={}",gCategoryNo);
		List<MemberGiftProductVO> list=giftServ.giftProductList(gCategoryNo);
		int count=giftServ.giftCount(gCategoryNo);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		logger.info("선물상품 출력결과 list.size={},count={}",list.size(),count);
		String name="";
		if(gCategoryNo==0) {
			name="전체";
		}else {
			if(list.size()!=0) {
				name=list.get(0).getgCategoryName();
			}
		}
		map.put("name", name);
		return map;
	}
	
	@RequestMapping("/giftSend.do")
	public String giftSend(@ModelAttribute MemberGiftVO vo,@RequestParam String memberName,@RequestParam String memberHp3,
			HttpSession session,Model model) {
		logger.info("선물하기 ,vo={}",vo);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("memberName", memberName);
		map.put("memberHp3", memberHp3);
		int memberNo=memServ.selectMemNo(map);
		vo.setGiftTakeMemberNo(memberNo);
		int giveMemberNo=(Integer)session.getAttribute("memberNo");
		vo.setGiftGiveMemberNo(giveMemberNo);
		int cnt=giftServ.giftSend(vo);
		logger.info("주문하기 결과 cnt={}",cnt);
		if(cnt>0) {
			return "member/gift/giftSendOk";
		}else{
			String msg="선물하기 실패",url="/member/addOn/addOn.do";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "common/message";
		}
		
	}
	
	@RequestMapping("/myGift.do")
	public String myGift(HttpSession session,Model model) {
		int memberNo=(Integer)session.getAttribute("memberNo");
		List<MemberGiftVO> giveList=giftServ.myGiveGiftList(memberNo);
		List<MemberGiftVO> takeList=giftServ.myTakeGiftList(memberNo);
		logger.info("보낸 선물함 갯수={},받은 선물함 갯수={}",giveList.size(),takeList.size());
		model.addAttribute("giveList",giveList);
		model.addAttribute("takeList",takeList);
		return "member/mypage/myGift";
	}
}
