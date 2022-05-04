package com.project.fd.owner.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.project.fd.admin.coupons.model.AdminRegularCouponVO;
import com.project.fd.common.PaginationInfo;
import com.project.fd.common.Utility;
import com.project.fd.owner.coupon.model.OwnerCouponSearchVO;
import com.project.fd.owner.coupon.model.OwnerCouponService;
import com.project.fd.owner.coupon.model.OwnerCouponVO;
import com.project.fd.owner.request.model.OwnerRequestService;
import com.project.fd.owner.store.model.OwnerStoresService;

@Controller
@RequestMapping("/owner/menu2/couponused")
public class OwnerCouponController {
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(OwnerCouponController.class);

	private static final AdminRegularCouponVO AdminRegularCouponVO = null;
	
	@Autowired OwnerCouponService couponService;
	@Autowired OwnerRequestService requestService;
	@Autowired OwnerStoresService ownerStoresService;
	
	@RequestMapping("/couponUsed.do")
	public String ownercouponused(HttpSession session,Model model) {
		int ownerNo=(Integer)session.getAttribute("ownerNo");
		int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
		logger.info("내점포 메인 뷰 보여주기 storeNo={},ownerNo={}",storeNo,ownerNo);
		logger.info("사용중인 쿠폰  보여주기 storeNo={}",storeNo);
		
		List<Map<String, Object>> list = couponService.useCoupons(storeNo);
		logger.info(" list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "owner/menu2/couponused/couponUsed";
	}
	
	//ajax로 처음 리스트 뿌려주기 도전 ! 
	/*
	 * 
		@ResponseBody
		@RequestMapping(value="/couponExpire.do", method=RequestMethod.GET)
		public List<Map<String, Object>> couponExpire_get(HttpSession session,
				Model model) {
			int storeNo= (Integer)session.getAttribute("storeNo");
			logger.info("만료된 쿠폰 전체 보여주기 storeNo={}",storeNo);
			
			List<Map<String, Object>> exList=couponService.expireAll(storeNo);
			logger.info(" 조회 결과 exList.size={}", exList.size());
			
			model.addAttribute("exList", exList);
			
			return exList;
		}
	
	 */
	@RequestMapping("/couponExpire.do")
	public String ownercouponExpire( HttpSession session,Model model) {
		String msg="점포가 없습니다.", url="/owner/index.do";
		int ownerNo=(Integer)session.getAttribute("ownerNo");
		int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
		logger.info("내점포 메인 뷰 보여주기 storeNo={},ownerNo={}",storeNo,ownerNo);
		logger.info("혜택 - 쿠폰관리 보여주기 storeNo={}",storeNo);
		
		List<Map<String, Object>> list=couponService.expireAll(storeNo);
		
		logger.info(" list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "owner/menu2/couponused/couponExpire";
	}
	
	@RequestMapping(value="/couponRegi.do",method=RequestMethod.GET)
	public String couponList_get( Model model, HttpSession session) {
		logger.info("coupon Register page !!");
		List<AdminRegularCouponVO> list=couponService.Allselect();
		
		int ownerNo=(Integer)session.getAttribute("ownerNo");
		int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
		logger.info("내점포 메인 뷰 보여주기 storeNo={},ownerNo={}",storeNo,ownerNo);
		//일치 여부를 위해 
		logger.info("사용중인 쿠폰  보여주기 storeNo={}",storeNo);
		List<Map<String, Object>> useList = couponService.useCoupons(storeNo);
		logger.info("useList.size={}",useList.size());
		
		// 비밀번호 일치처럼 스토어넘버로 쿠폰번호만 찾아서 일치하는지 확인 
		//boolean bool= couponService.dupck(list,  storeNo);
		
		model.addAttribute("list", list);
		model.addAttribute("useList", useList);
		
		return "owner/menu2/couponused/couponRegi";
	}
	
	// register coupon
	@RequestMapping(value="/couponRegi.do",method=RequestMethod.POST)
	public String couponList_post(@RequestParam(defaultValue = "0") int no, 
			@RequestParam String pwd, HttpSession session , Model model) {
		logger.info("coupon Register page !! parameter rCouponNo={}",no);

		int ownerNo=(Integer)session.getAttribute("ownerNo");
		int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
		logger.info("내점포 메인 뷰 보여주기 storeNo={},ownerNo={}",storeNo,ownerNo);
		OwnerCouponVO vo = new OwnerCouponVO();
		vo.setStoreNo(storeNo);
		vo.setrCouponNo(no);
		
		logger.info("pwdCK  처리  파라미터 ownerNo={},storeNo={}",ownerNo,storeNo);
		
		String msg="쿠폰 등록에 실패하였습다. ", url="/owner/menu2/couponused/couponRegi.do";
		if(requestService.pwdCk(pwd,ownerNo)) {
			int cnt =couponService.registerCoupon(vo);
			logger.info("쿠폰 등록  결과, cnt={}", cnt); //2
			
			if(cnt==OwnerCouponService.NON_EXIST_CP) {
				msg="정상적으로 등록되었습니다.";
			}else if(cnt==OwnerCouponService.EXIST_CP){
				msg="이미 만료되지 않은 쿠폰이 있습니다 ! ";
			}
		}else {
			msg="비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	
	@RequestMapping("/couponExpireSearch.do")
	public String ocouponExpireSearch(@ModelAttribute OwnerCouponSearchVO searchVo ,
			HttpSession session,Model model) {
		String msg="점포가 없습니다.", url="/owner/index.do";
		int ownerNo=(Integer)session.getAttribute("ownerNo");
		int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
		logger.info("내점포 메인 뷰 보여주기 storeNo={},ownerNo={}",storeNo,ownerNo);
		logger.info("혜택 - 쿠폰관리 보여주기 storeNo={}",storeNo);
		
		searchVo.setStoreNo(storeNo);
		logger.info("coupon 만료되거나 사용정지 쿠폰 조회 , 파라미터 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		//날짜가 넘어오지 않은 경우 현재일자를 셋팅
		String startDay=searchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today=sdf.format(d);
			searchVo.setStartDay(today);
			searchVo.setEndDay(today);			
		}
		
		logger.info("searchVo={}",searchVo);
		int totalRecord=couponService.getTotalRecord(searchVo);
		logger.info("coupon 전체 조회,  레코드 개수 조회 결과, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<Map<String, Object>> list = couponService.Allcoupons(searchVo);
		logger.info(" list.size={}",list.size());
		
		//만료된 쿠폰 전체 조회 날x 
		List<Map<String, Object>> exList=couponService.expireAll(storeNo);
		logger.info(" 조회 결과 exList.size={}", exList.size());
		
		model.addAttribute("exList", exList);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("searchVo", searchVo);
		
		return "owner/menu2/couponused/couponExpireSearch";
	}
	
	@RequestMapping("/updateCoupon.do")
	public String updateCoupon(@RequestParam(defaultValue = "0 ")int scBoxNo, Model model) {
		logger.info("update Y page scBoxNo={}",scBoxNo);
		
		String msg="쿠폰 사용 변경에 실패하였습니다. 다시 시도해주세요.", url="/owner/menu2/couponused/couponUsed.do";
		if(scBoxNo!=0) {
			int cnt=couponService.updateCoupon(scBoxNo);
			if(cnt>0) {
				msg="쿠폰을 다시 사용할 수 있게 되었습니다.";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/deleteMulti.do")
	public String deleteCoupon(@RequestParam(defaultValue = "0 ")int scBoxNo, Model model) {
		logger.info("update N page scBoxNo={}",scBoxNo);
		
		String msg="쿠폰 사용 중지에 실패하였습니다. 다시 시도해주세요.", url="/owner/menu2/couponused/couponUsed.do";
		if(scBoxNo!=0) {
			int cnt=couponService.deleteCoupon(scBoxNo);
			if(cnt>0) {
				msg="쿠폰 발급을 중지하였습니다. 만료일전까지 재발급 가능합니다.";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	/*
	 * 
	@RequestMapping(value="/couponRegi.do",method = RequestMethod.POST)
	public String couponRegi(@RequestParam(defaultValue = "0")int no) {
		logger.info(msg);
	}
	
	@RequestMapping("/deleteMulti.do")
	public String delMulti(@ModelAttribute OwnerCouponListVO Listvo,
			HttpServletRequest request, Model model) {
		logger.info("mutidelete page !! Listvo={}",Listvo);
		
		List<OwnerCouponVO> cpList=Listvo.getCouponItems();
		logger.info("선택한 쿠폰  삭제cpList, cpList={}",cpList);
		
		int cnt=couponService.deleteCoupon(cpList);
		logger.info("선택한 쿠폰  삭제 결과, cnt={}", cnt);
		
		String msg="선택한 쿠폰  삭제 실패!", url="/owner/menu2/couponused/couponUsed.do";
		if(cnt>0) {
			msg="선택한 쿠폰들을 삭제하였습니다.";
			
			for(int i=0; i<cpList.size(); i++) {
				OwnerCouponVO cVo=cpList.get(i);
				
				logger.info("[{}] : scBoxNo={}", i, cVo.getScBoxNo());
				
				int couponNo=cVo.getScBoxNo();
				logger.info("삭제 하는 couponNo={}",couponNo);
			}//for
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	
	}
	 * */
	
}