package com.project.fd.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.member.model.MemberService;
import com.project.fd.member.model.MemberVO;
import com.project.fd.member.today.model.MemberTodayService;

@Controller
@RequestMapping("/member/today")
public class MemberTodayController {
	
	@Autowired
	private static final Logger logger
	=LoggerFactory.getLogger(MemberTodayController.class);
	
	@Autowired
	private MemberTodayService memberTodayService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/todayList.do")
	public void todayList(Model model, HttpSession session) {
		Map<String,Object> map = memberTodayService.selectMCategory();
		logger.info("map={}", map);
	
		String memberId = (String) session.getAttribute("memberId");
		logger.info("오늘 뭐먹지 뷰 띄우기 파라미터 memberId={}",memberId);
		
		MemberVO memberVo = memberService.selectMember(memberId);
		logger.info("멤버 아이디로 멤버 정보 불러오기 결과 memberVo={}", memberVo);
		
		int locationNo = memberVo.getLocationNo();
		
		Map<String, Object> map2 = new HashedMap<String, Object>();
		map2.put("locationNo", locationNo);
		map2.put("mCategoryNo",map.get("M_CATEGORY_NO"));
		logger.info("대표메뉴 6개 구할 함수에 넣을 map 구하기 map2={}", map2);
		
		
		List<Map<String, Object>> mList = memberTodayService.selectMenuRandomSix(map2);
		
		logger.info("중분류 카테고리에 따른 대표메뉴 6개 결과  mcList={},mcList.size()={}", mList, mList.size());
		
		
		int num = (int)(Math.random() * 13)+1;

		  String emoji ="";
	       if(num==1) {
	          emoji="😍";
	       }else if(num==2) {
	          emoji="😜";
	       }else if(num==3) {
	          emoji="😘";
	       }else if(num==4) {
	          emoji="💖";
	       }else if(num==5) {
	          emoji="🤔";
	       }else if(num==6) {
	          emoji="✨";
	       }else if(num==7) {
	          emoji="💜";
	       }else if(num==8) {
	          emoji="💛";
	       }else if(num==9) {
	          emoji="💚";
	       }else if(num==10) {
	          emoji="🧡";
	       }else if(num==11) {
	          emoji="🌈";
	       }else if(num==12) {
	          emoji="💃";
	       }else if(num==13) {
	          emoji="😉";
	       }
	       
	       logger.info("num = {}",num);
	       
	    model.addAttribute("map", map);
	    model.addAttribute("emoji" , emoji);
	    model.addAttribute("mList", mList);
	
	}
	
	@ResponseBody
	@RequestMapping("/todayListStores.do")
	public List<Map<String, Object>> todayListStores(HttpSession session,
				@RequestParam(defaultValue = "0") int mCategoryNo){
		
		String memberId = (String) session.getAttribute("memberId");
		logger.info("중분류에 해당하는 메뉴 이미지들 구하기 ajax memberId={}, mCategoryNo={}",memberId, mCategoryNo);
		
		MemberVO memberVo = memberService.selectMember(memberId);
		logger.info("멤버 아이디로 멤버 정보 불러오기 결과 memberVo={}", memberVo);
		
		int locationNo = memberVo.getLocationNo();
		
		String type="some";
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("locationNo", locationNo);
		map.put("type",type);
		map.put("mCategoryNo",mCategoryNo);
		logger.info("스토어 구할 함수에 넣을 매개변수 담은 map={}", map);
		
		
		List<Map<String, Object>> mcList = memberTodayService.selectMCategoryStores(map);
		logger.info("중분류 카테고리에 다른 가게 결과  mcList={},mcList.size()={}", mcList, mcList.size());
		
		return mcList;
	}
	
}
