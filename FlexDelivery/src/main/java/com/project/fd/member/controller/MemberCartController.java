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

import com.project.fd.member.cart.model.MemberCartService;
import com.project.fd.member.cart.model.MemberCartVO;
import com.project.fd.member.cart.model.MemberCartViewVO;
import com.project.fd.member.stores.model.MemberStoresService;
import com.project.fd.member.stores.model.MemberStoresVO;

@Controller
@RequestMapping("/member/cart")
public class MemberCartController {
	
	@Autowired MemberCartService cartServ;
	@Autowired MemberStoresService storeServ;
	private static Logger logger=LoggerFactory.getLogger(MemberCartController.class);
	
	@ResponseBody
	@RequestMapping("/deleteOtherStore.do")
	public boolean deleteOtherStore(@RequestParam int memberNo) {
		logger.info("멤버번호로 다른 점포 장바구니 비우기 memberNo={}",memberNo);
		int cnt=cartServ.deleteByMemberNo(memberNo);
		logger.info("장바구니 삭제결과 cnt={}",cnt);
		if(cnt>0) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping("/addCart.do")
	public boolean addCart(@ModelAttribute MemberCartVO cartVo,HttpSession session) {
		logger.info("cartVo={}",cartVo);
		cartVo.setMemberNo((Integer)session.getAttribute("memberNo"));
		int cnt=cartServ.addCart(cartVo);
		logger.info("cnt={}",cnt);
		if(cnt>0) {
			return true;
		}
		return false;
	}
	
	@RequestMapping("/cartView.do")
	public String cartView(HttpSession session,Model model) {
		logger.info("top.jsp 장바구니 버튼 클릭");
		int memberNo=(Integer)session.getAttribute("memberNo");
		List<MemberCartViewVO> list=cartServ.selectCartList(memberNo);
		if(list.isEmpty() || list.size()==0) {
			model.addAttribute("list",list);
			return "member/store/cart/cartList";
		}
		int storeNo=list.get(0).getStoreNo();
		MemberStoresVO vo=storeServ.selectStoresDetail(storeNo);
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
		return "member/store/cart/cartList";
	}
	
	@ResponseBody
	@RequestMapping("/cartList.do")
	public Map<String , Object> cartList(@RequestParam int memberNo) {
		logger.info("ajax로 cartList가 출력되면 당근을 흔들어주세요");
		List<MemberCartViewVO> list=cartServ.selectCartList(memberNo);
		Map<String, Object> map=new HashMap<String, Object>();
		if(list.isEmpty() || list.size()==0) {
			map.put("list", list);
			return map;
		}
		int storeNo=list.get(0).getStoreNo();
		MemberStoresVO vo=storeServ.selectStoresDetail(storeNo);
		int today=storeServ.today()-1;
		logger.info("11111111111111111111111111111111111111111today={}",today);
		map.put("today", today);
		map.put("vo", vo);
		map.put("list", list);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/plusCart.do")
	public boolean plusCart(@RequestParam int cartNo) {
		logger.info("장바구니 + 버튼 눌렀음, cartNo={}",cartNo);
		int cnt=cartServ.cartPlus(cartNo);
		logger.info("로직결과 cnt={}",cnt);
		if(cnt>0) {
			return true;
		}
		return false;
		
	}
	
	@ResponseBody
	@RequestMapping("/minusCart.do")
	public boolean minusCart(@RequestParam int cartNo) {
		logger.info("장바구니 - 버튼 눌렀음, cartNo={}",cartNo);
		int cnt=cartServ.cartMinus(cartNo);
		logger.info("로직결과 cnt={}",cnt);
		if(cnt>0) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping("/deleteCart.do")
	public boolean deleteCart(@RequestParam int cartNo) {
		logger.info("장바구니 삭제, cartNo={}",cartNo);
		int cnt=cartServ.deleteCart(cartNo);
		if(cnt>0) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping("/cartChk.do")
	public boolean cartChk(@RequestParam int storeNo,@RequestParam int memberNo) {
		logger.info("장바구니 유효성검사 storeNo={},memberNO={}",storeNo,memberNo);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("storeNo",storeNo );
		map.put("memberNo",memberNo);
		
		boolean bool=cartServ.CartChk(map);
		
		return bool;
	}
	/*
	기존거
	@RequestMapping("/addCart.do")
	public String addCart(@ModelAttribute MemberMenuOptionListVO optionList
			,@ModelAttribute MemberCartVO cartVo
			,HttpSession session
			,Model model) {
		List<MemberMenuOptionVO> optionlist=optionList.getOptionList();
		logger.info("장바구니 담기 메뉴옵션 가져오기, optionList.size={},cartVo={}",optionlist.size(),cartVo);
		List<MemberCartVO> cartList=new ArrayList<MemberCartVO>();
		for(int i=0;i<optionlist.size();i++) {
			logger.info("선택한 메뉴옵션 찍어주기 menuoption={}",optionlist.get(i));
			if(optionlist.get(i).getmOptionNo()>0) {
				//int idx=0;
				MemberCartVO tqVo=new MemberCartVO(cartVo.getStoreNo(),cartVo.getMenuNo(),cartVo.getCartQty(),cartVo.getStoreName());
				tqVo.setmOptionNo(optionlist.get(i).getmOptionNo());
				tqVo.setMemberNo((Integer)session.getAttribute("memberNo"));
				cartList.add(tqVo);
				
					// logger.info("선택한 옵션을 cartvo로 세팅해줘서 cartList에 담아주기,tqVo={}",tqVo);
					// logger.info("cartList 나와라={}",cartList.get(idx)); idx++;
				 
			}
		}
		logger.info("cartList.size={}",cartList.size());
		
		  //for(int i=0;i<cartList.size();i++) {
		  //logger.info("cartList 나와라2222={}",cartList.get(i)); }
		
		int cnt=cartServ.addCart(cartList);
		String msg="",url="";
		if(cnt>0) {
			msg="장바구니에 상품을 담았습니다";
			url="/member/store/storeDetail.do?storeNo="+cartVo.getStoreNo();
		}else {
			msg="장바구니 등록 실패";
			url="/member/store/storeDetail.do?storeNo="+cartVo.getStoreNo();
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	*/
	
}
