package com.project.fd.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.project.fd.admin.largecategory.model.AdminLargeCategoryVO;
import com.project.fd.member.cart.model.MemberCartService;
import com.project.fd.member.coupon.model.MemberCouponService;
import com.project.fd.member.menu.model.MemberMenuAllVO;
import com.project.fd.member.menu.model.MemberMenuService;
import com.project.fd.member.stores.model.MemberLikeStoreVO;
import com.project.fd.member.stores.model.MemberStoresService;
import com.project.fd.member.stores.model.MemberStoresVO;

@Controller
@RequestMapping("/member/store")
public class MemberStoreController {
	private static final Logger logger
	=LoggerFactory.getLogger(MemberController.class);

	@Autowired private MemberStoresService memStoresServ;
	@Autowired private MemberMenuService menuServ;
	@Autowired private MemberCartService cartServ;
	@Autowired private MemberCouponService coupServ;
	
	@RequestMapping("/storeList.do")
	public void storeList(@RequestParam int lCategoryNo) {
		logger.info("점포 리스트 보여주기, 대분류카테고리번호={}",lCategoryNo);
	}
	
	@RequestMapping("/flexAdList.do")
	public void flexAdList(@RequestParam int lCategoryNo,HttpSession session,Model model) {
		logger.info("Flex광고 import, 대분류카테고리번호={},회원 지역번호={}",lCategoryNo,(Integer)session.getAttribute("locationNo"));
		int locationNo=(Integer)session.getAttribute("locationNo");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("locationNo",locationNo);
		map.put("lCategoryNo",lCategoryNo);
		List<MemberStoresVO> list=memStoresServ.selectFlexAdStores(map);
		logger.info("리스트 출력결과 list.size={}",list.size());
		int memberNo=(Integer)session.getAttribute("memberNo");
		List<MemberLikeStoreVO> likeList=memStoresServ.selectLikeStore(memberNo);
		int today=memStoresServ.today()-1;
		logger.info("11111111111111111111111111111111111111111today={}",today);
		model.addAttribute("today",today);
		model.addAttribute("likeList",likeList);
		model.addAttribute("list",list);
	}
	
	@RequestMapping("/openAdList.do")
	public void openAdList(@RequestParam int lCategoryNo,HttpSession session,Model model) {
		logger.info("오픈리스트광고 import, 대분류카테고리번호={},회원 지역번호={}",lCategoryNo,(Integer)session.getAttribute("locationNo"));
		int locationNo=(Integer)session.getAttribute("locationNo");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("locationNo",locationNo);
		map.put("lCategoryNo",lCategoryNo);
		List<MemberStoresVO> list=memStoresServ.selectOpenAdStores(map);
		logger.info("리스트 출력결과 list.size={}",list.size());
		int memberNo=(Integer)session.getAttribute("memberNo");
		List<MemberLikeStoreVO> likeList=memStoresServ.selectLikeStore(memberNo);
		int today=memStoresServ.today()-1;
		logger.info("11111111111111111111111111111111111111111today={}",today);
		model.addAttribute("today",today);
		model.addAttribute("likeList",likeList);
		model.addAttribute("list",list);
	}
	@RequestMapping("/categorySlider.do")
	public void categorySlider(Model model) {
		logger.info("카테고리 슬라이드 출력");
		List<AdminLargeCategoryVO> list=memStoresServ.categorySlider();
		model.addAttribute("list",list);
	}
	
	@RequestMapping(value="/storeAll.do",method = RequestMethod.GET)
	public void storeAll_get(HttpSession session,HttpServletRequest req,Model model) {
		logger.info("메뉴전체 출력");
		int locationNo=(Integer)session.getAttribute("locationNo");
		int startIndex=Integer.parseInt(req.getParameter("startIndex"));
		int lastIndex=Integer.parseInt(req.getParameter("lastIndex"));
		int lCategoryNo=Integer.parseInt(req.getParameter("lCategoryNo"));
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("locationNo",locationNo);
		map.put("lCategoryNo",lCategoryNo);
		map.put("startIndex", startIndex);
		map.put("lastIndex", lastIndex);
		logger.info("locationNo={},lCategoryNo={}",locationNo,lCategoryNo);
		logger.info("startIndex={},lastIndex={}",startIndex,lastIndex);
		
		List<MemberStoresVO> list=memStoresServ.selectAllStores(map);
		int totalRecords=memStoresServ.selectAllStoresCount(map);
		map.put("totalRecords",totalRecords);
		
		int memberNo=(Integer)session.getAttribute("memberNo");
		List<MemberLikeStoreVO> likeList=memStoresServ.selectLikeStore(memberNo);
		logger.info("관심등록 리스트 출력결과 likeList.size={}",likeList.size());
		int today=memStoresServ.today()-1;
		logger.info("11111111111111111111111111111111111111111today={}",today);
		model.addAttribute("today",today);
		model.addAttribute("likeList",likeList);
		model.addAttribute("list",list);
		model.addAttribute("map",map);
	}
	
	@ResponseBody
	@RequestMapping(value="/storeAll.do",method = RequestMethod.POST)
	public Map<String, Object> storeAll_post(HttpSession session,HttpServletRequest req) {
		logger.info("ajax반응");
		int locationNo=(Integer)session.getAttribute("locationNo");
		int startIndex=Integer.parseInt(req.getParameter("startIndex"));
		int lastIndex=Integer.parseInt(req.getParameter("lastIndex"));
		int lCategoryNo=Integer.parseInt(req.getParameter("lCategoryNo"));
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("locationNo",locationNo);
		map.put("lCategoryNo",lCategoryNo);
		map.put("startIndex", startIndex);
		map.put("lastIndex", lastIndex);
		logger.info("locationNo={},lCategoryNo={}",locationNo,lCategoryNo);
		logger.info("startIndex={},lastIndex={}",startIndex,lastIndex);
		
		List<MemberStoresVO> list=memStoresServ.selectAllStores(map);
		int totalRecords=memStoresServ.selectAllStoresCount(map);
		logger.info("list.size={},totalRecords={}",list.size(),totalRecords);
		
		int memberNo=(Integer)session.getAttribute("memberNo");
		List<MemberLikeStoreVO> likeList=memStoresServ.selectLikeStore(memberNo);
		logger.info("ajax관심등록 리스트 출력결과 likeList.size={}",likeList.size());
		int today=memStoresServ.today()-1;
		logger.info("11111111111111111111111111111111111111111today={}",today);
		map.put("today",today);
		map.put("likeList", likeList);
		map.put("list", list);
		map.put("totalRecords",totalRecords);
		return map;
	}
	
	@RequestMapping(value="/storeDetail.do",method = RequestMethod.GET)
	public String storeDetail_get(@ModelAttribute MemberLikeStoreVO likeVo,@RequestParam(defaultValue = "0") int storeNo,Model model,HttpSession session){
		logger.info("점포 상세보기");
		if(storeNo<1) {
			model.addAttribute("msg","잘못된 접근입니다.");
			model.addAttribute("url","/member/index.do");
			return "common/message"; 
		}
		MemberStoresVO vo=memStoresServ.selectStoresDetail(storeNo);
		MemberMenuAllVO menuAllvo=menuServ.selectMainMenu(storeNo);
		logger.info("메인메뉴 ,menuAllvo={}",menuAllvo);
		int memberNo=(Integer)session.getAttribute("memberNo");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("storeNo", storeNo);
		boolean cartChk=cartServ.CartChk(map);//장바구니에 다른점포의 상품이 있는지 확인, true면 다른점포 상품 있음, 유효성검사 통해 장바구니 삭제필요
		logger.info("cartChk={}",cartChk);
		likeVo.setMemberNo(memberNo);
		boolean likeChk=memStoresServ.chkLike(likeVo); //관심등록 체크, true면 관심등록한 점포임
		boolean couponChk=coupServ.chkCoupon(storeNo); //쿠폰함 체크, true면 쿠폰발급가능 점포
		int today=memStoresServ.today()-1;
		logger.info("11111111111111111111111111111111111111111today={}",today);
		model.addAttribute("today",today);
		model.addAttribute("vo",vo);
		model.addAttribute("cartChk",cartChk); 
		model.addAttribute("likeChk",likeChk);
		model.addAttribute("couponChk",couponChk);
		model.addAttribute("storeNo",storeNo);
		model.addAttribute("menuAllvo",menuAllvo);
		return "member/store/storeDetail";
	}
	
	@RequestMapping("/likeControll.do")
	public String likeControll(@RequestParam int storeNo,HttpSession session,Model model) {
		logger.info("점포 찜하기, 파라미터 storeNo={}",storeNo);
		int memberNo=(Integer)session.getAttribute("memberNo");
		MemberLikeStoreVO vo=new MemberLikeStoreVO();
		vo.setMemberNo(memberNo);
		vo.setStoreNo(storeNo);
		int cnt=memStoresServ.likeControll(vo);
		String msg="실패",url="/member/store/storeDetail.do?storeNo="+storeNo;
		if(cnt==1) {
			msg="관심등록 되었습니다.";
		}else if(cnt==2) {
			msg="관심해제 되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
}
