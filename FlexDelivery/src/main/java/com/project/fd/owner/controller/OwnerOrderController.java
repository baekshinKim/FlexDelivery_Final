package com.project.fd.owner.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.common.PaginationInfo;
import com.project.fd.common.Utility;
import com.project.fd.owner.advertise.model.OwnerAdvertiseSearchVO;
import com.project.fd.owner.order.model.OwnerOrderService;
import com.project.fd.owner.store.model.OwnerStoresService;


@Controller
@RequestMapping("/owner/menu2/order")
public class OwnerOrderController {
	private static final Logger logger
	=LoggerFactory.getLogger(OwnerOrderController.class);
	
	@Autowired
	private OwnerOrderService ownerOrderService;
	
	
	@Autowired
	private OwnerStoresService ownerStoreService;
	
	
	
	
	//필요한 매개변수값이 ownerAdvertiseSearchVO와 같아 굳이 searchVO를 추가적으로 만들진 않았습니다.
	
	
		
	
	
	
		@RequestMapping("/orderMain.do")
		public String orderMain(@ModelAttribute OwnerAdvertiseSearchVO searchVo, 
			HttpSession session, Model model) {
		//storeNo 구하기
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			
		//1
		logger.info("주문 접수중 내역 페이지, 파라미터 searchVo={},storeNo={}", searchVo,storeNo);
	
		searchVo.setStoreNo(storeNo);
		
		
		int type= OwnerOrderService.OSTATUSNO_REQUEST;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchVo", searchVo);
		map.put("oStatusNo", type );
		
		
		
		List<Map<String, Object>> list;
		list=ownerOrderService.selectOrderAllView(map);
		logger.info("글목록 결과, list.size={}", list.size());
		
		
		model.addAttribute("list",list);
	
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("type",type);
		
		


		
		//4. 뷰페이지 리턴) {
		
		return "owner/menu2/order/orderMain";
	}
	
		
		@RequestMapping("/orderIng.do")
		public String orderIng(@ModelAttribute OwnerAdvertiseSearchVO searchVo, 
			HttpSession session, Model model) {
		//storeNo 구하기
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			
			
		//1
		logger.info("조리중 내역 페이지, 파라미터 searchVo={},storeNo={}", searchVo,storeNo);
		

	
		
		
	
		searchVo.setStoreNo(storeNo);
		
		
		int type= OwnerOrderService.OSTATUSNO_ORDERING;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchVo", searchVo);
		map.put("oStatusNo", type );
		
		
		
		List<Map<String, Object>> list;
		list=ownerOrderService.selectOrderAllView(map);
		logger.info("글목록 결과, list.size={}", list.size());
		
		
		model.addAttribute("list",list);

		model.addAttribute("searchVo", searchVo);
		model.addAttribute("type",type);
		
		


		
		//4. 뷰페이지 리턴) {
		
		return "owner/menu2/order/orderIng";
	}
	
		
		
		@RequestMapping("/orderDeliveryIng.do")
		public String orderDeliveryIng(@ModelAttribute OwnerAdvertiseSearchVO searchVo, 
			HttpSession session, Model model) {
		//storeNo 구하기
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			
			
		//1
		logger.info("배달중 내역 페이지, 파라미터 searchVo={},storeNo={}", searchVo,storeNo);
		
		//2
		//페이징 처리 관련 셋팅
		//[1] PaginationInfo 생성
		
		searchVo.setStoreNo(storeNo);
		
		
		int type= OwnerOrderService.OSTATUSNO_DELIVERYING;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchVo", searchVo);
		map.put("oStatusNo", type );
		
	
		List<Map<String, Object>> list;
		list=ownerOrderService.selectOrderAllView(map);
		logger.info("글목록 결과, list.size={}", list.size());
		
		
		model.addAttribute("list",list);
		
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("type",type);
		
		//4. 뷰페이지 리턴) {
		
		return "owner/menu2/order/orderDeliveryIng";
	}
	
	
		
		
		@RequestMapping("/orderSuccess.do")
		public String orderDeliverySuccess(@ModelAttribute OwnerAdvertiseSearchVO searchVo, 
			HttpSession session, Model model) {
		//storeNo 구하기
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			
			
		//1
		logger.info("주문완료 내역 페이지, 파라미터 searchVo={},storeNo={}", searchVo,storeNo);
		
	
		searchVo.setStoreNo(storeNo);
		
		
		int type= OwnerOrderService.OSTATUSNO_DELIVERYSUCCESS;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchVo", searchVo);
		map.put("oStatusNo", type );
		
	
	
		List<Map<String, Object>> list;
		list=ownerOrderService.selectOrderAllView(map);
		logger.info("글목록 결과, list.size={}", list.size());
		logger.info("글목록 결과, list={}", list);
		
		
		model.addAttribute("list",list);

		model.addAttribute("searchVo", searchVo);
		model.addAttribute("type",type);
		
		//4. 뷰페이지 리턴) {
		
		return "owner/menu2/order/orderSuccess";
	}
	
	
	
	
	

	  
	  @RequestMapping("/orderTd.do") 
	  public String findOrderMenu(@RequestParam(defaultValue = "0") int ordersNo,  
			  @RequestParam(defaultValue = "0") int ordersDiscount,  
			  @RequestParam(defaultValue = "0") String hurryImgTerm,
			  @RequestParam(defaultValue = "0") int type,
			  Model model) {
		  logger.info("각 주문 번호에 따른 메뉴 제목 찾기, ordersNo={}, ordersDiscount={}", ordersNo,ordersDiscount);
		  
		  double hurryImg = Double.parseDouble(hurryImgTerm);
		  
		  String title = ownerOrderService.getTitle(ordersNo);
		  model.addAttribute("title",title);
		  model.addAttribute("ordersNo",ordersNo);
		  model.addAttribute("ordersDiscount",ordersDiscount);
		  model.addAttribute("type",type);
		  model.addAttribute("hurryImg",hurryImg);
		
		  
		  return "owner/menu2/order/orderTd"; 
	  
	  }
	  
	  @ResponseBody
	  @RequestMapping("/orderRequestResult.do")
	  public Map<String, Object> orderRequestResult(@RequestParam(defaultValue = "0") int ordersNo){
		  logger.info("주문 번호에 따른 주문 내역 찾기, ordersNo={}", ordersNo);
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  
		  List<Map<String, Object>> dList;
		  dList = ownerOrderService.selectMenuDetailByOrdersNo(ordersNo);
		  
		  Map<String,Object> oMap = ownerOrderService.selectOrderAllByOrdersNo(ordersNo);
		  
		  map.put("dList", dList);
		  map.put("oMap", oMap);
		  
		  return map;
	  }
	  
	  
	  @ResponseBody
	  @RequestMapping("/goRequestOkModal.do")
	  public int goRequestOkModal(@RequestParam(defaultValue = "0") int ordersNo){
		  logger.info("주문번호 넘겨주기, ordersNo={}", ordersNo);
		  
		  int res = ordersNo;
		  return res;
	  }
	  
	  
	
	 
	  @ResponseBody
	  @RequestMapping("/orderRequestUpdate.do")
	  public boolean  orderRequestUpdate(@RequestParam(defaultValue = "0") int ordersNo){
		  logger.info("주문 번호에 따른 업데이트, ordersNo={}", ordersNo);
		  
		  
		  boolean bool= false;
		  int cnt = ownerOrderService.updateOrdersToRequestIng(ordersNo);
		  if(cnt>0) {
			  bool=true;
		  }else {
			  bool=false;
		  }
		  return bool;
	  }
	
	  
	  @ResponseBody
	  @RequestMapping("/goDeliveryOkModal.do")
	  public int goDeliveryOkModal(@RequestParam(defaultValue = "0") int ordersNo){
		  logger.info("주문번호 넘겨주기, ordersNo={}", ordersNo);
		  
		  int res = ordersNo;
		  return res;
	  }
	  
	  
	  @ResponseBody
	  @RequestMapping("/orderDeliveryUpdate.do")
	  public boolean  orderDeliveryUpdate(@RequestParam(defaultValue = "0") int ordersNo, 
			  @RequestParam(defaultValue = "0") int ordersDuration){
		  logger.info("주문 번호에 따른 업데이트, ordersNo={}, ordersDuration={}", ordersNo,ordersDuration);
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  map.put("ordersNo", ordersNo);
		  map.put("ordersDuration", ordersDuration);
		  
		  
		  boolean bool= false;
		  int cnt = ownerOrderService.updateOrdersToDeliveryIng(map);
		  if(cnt>0) {
			  bool=true;
		  }else {
			  bool=false;
		  }
		  return bool;
	  }
	  
	  
	  
	  
	  @RequestMapping("/cancelOrder.do")
		public String cancelOrder(@RequestParam(defaultValue = "0") int ordersNo,Model model) {
		  logger.info("주문 취소 업데이트, ordersNo={}", ordersNo);
		  
		  int cnt = ownerOrderService.updateOrdersCancel(ordersNo);
		  String msg="주문취소에 실패하셨습니다.", url="/owner/menu2/order/orderMain.do";
		  if(cnt>0) {
			  msg="주문취소에 성공하셨습니다.";
		  }
		  
		  	model.addAttribute("msg",msg);
		  	model.addAttribute("url",url);
		  	
		  return "common/message";
	  }
	 
	  
	  
	  @RequestMapping("/orderList.do")
		public String orderList(@ModelAttribute OwnerAdvertiseSearchVO searchVo, @RequestParam(defaultValue = "0") int oStatusNo,
					HttpSession session, Model model) {
				//storeNo 구하기
		  		int ownerNo = (Integer) session.getAttribute("ownerNo");
		  		int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			
				//1
				logger.info("주문완료 내역 페이지, 파라미터 searchVo={},storeNo={}", searchVo,storeNo);
				
			
	
				
				PaginationInfo pagingInfo = new PaginationInfo();
				pagingInfo.setBlockSize(Utility.BLOCKSIZE);
				pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
				pagingInfo.setCurrentPage(searchVo.getCurrentPage());
				
				//[2] SearchVo 셋팅
				//날짜가 넘어오지 않은 경우 현재일자를 셋팅
				String startDay=searchVo.getStartDay();
				if(startDay==null || startDay.isEmpty()) {
					Date d = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String today=sdf.format(d);
					searchVo.setStartDay(today);
					searchVo.setEndDay(today);			
				}
				logger.info("searchVo ={}",searchVo);
				
				
				searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
				searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				searchVo.setStoreNo(storeNo);
				
				int type= OwnerOrderService.OSTATUSNO_DELIVERYSUCCESS;;
				if(oStatusNo==OwnerOrderService.OSTATUSNO_CANCLE) {
					type=OwnerOrderService.OSTATUSNO_CANCLE;
				}
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("searchVo", searchVo);
				map.put("oStatusNo", type );
				
				logger.info("type ={}",type);
				
				
				List<Map<String, Object>> list = null;
				list = ownerOrderService.selectOrderListView(map);
				logger.info("list ={}",list);
				
				
				
				int totalRecord = ownerOrderService.selectTotalRecordTWO(map);
				logger.info("글 개수, totalRecord={}", totalRecord);		
				pagingInfo.setTotalRecord(totalRecord);
				
				
				
				model.addAttribute("oStatusNo",oStatusNo);
				model.addAttribute("list",list);
				model.addAttribute("pagingInfo", pagingInfo);
				model.addAttribute("searchVo", searchVo);
				
				//4. 뷰페이지 리턴) {
		  return "owner/menu2/order/orderList";
	  }
		
	  @ResponseBody
	  @RequestMapping("/orderCount.do")
	  public int orderCount(HttpSession session) {
		  int ownerNo =  (Integer)session.getAttribute("ownerNo");
		  
		  int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
		  int count = ownerOrderService.selectCountByStoreNo(storeNo);
		  
		  return count;
	  }
}
