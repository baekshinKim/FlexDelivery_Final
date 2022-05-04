package com.project.fd.owner.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.owner.store.model.OwnerStoresService;
import com.project.fd.owner.store.model.OwnerStoresVO;



@Controller
@RequestMapping("/owner/menu2/operation")
public class OwnerOperationController {

	@Autowired
	private static final Logger logger= 
		LoggerFactory.getLogger(OwnerOperationController.class);
	
	@Autowired
	private OwnerStoresService ownerStoreService;
	
	@RequestMapping("/operation.do")
	public void owneroperation(HttpSession session, Model model) {
		//storeNo 구하기
		int ownerNo = (Integer) session.getAttribute("ownerNo");
		logger.info("내 점포 - 운영정보 보여주기 매개변수 ownerNo = {}", ownerNo);
		
		Map<String,Object> map = ownerStoreService.selectOperationViewAll(ownerNo);
		logger.info("점주 번호로 조회한 가게 결과조회 map={}",map);
		
		List<Map<String, Object>> list = ownerStoreService.selectsStatusAll();
		logger.info("영업상태 가져오기 조회결과  list={}",list);
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/updateHoliday.do", produces = "application/text;charset=utf8")
	public String updateHoliday(  @RequestParam(defaultValue = "0") int hCategoryNo, 
			@RequestParam(defaultValue = "0") int storeNo,
			@RequestParam(defaultValue = "0") int ownerNo){
			logger.info("휴무일 업데이트 하기위한 ajax hCategoryNo={}, storeNO={}", hCategoryNo,storeNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("storeNo", storeNo);
			map.put("hCategoryNo", hCategoryNo);
			
			
			String res = "";
			int cnt = ownerStoreService.holidayUpdate(map);
			if(cnt>0) {
				Map<String,Object> map2 = ownerStoreService.selectOperationViewAll(ownerNo);
				res = (String) map2.get("H_CATEGORY_NAME");
				
			}else {
				res="fail";
			}	
			logger.info("업데이트 결과 res={}", res);
		return res;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateStatus.do" , produces = "application/text;charset=utf8")
	public String updateStatus(@RequestParam(defaultValue = "0") int storeNo,
			@RequestParam(defaultValue = "0") int ownerNo,
			@RequestParam(defaultValue = "0") int sStatusNo) {
		logger.info("상태 변경 파라미터 storeNO={}, sStatusNo={}", storeNo,sStatusNo);
		
		if(storeNo==0) {
			storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
		}
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("storeNo", storeNo);
		map.put("sStatusNo", sStatusNo);
		int cnt = ownerStoreService.updateStatus(map);
		String res = "";
	
		if(cnt>0) {
			Map<String,Object> map2 = ownerStoreService.selectOperationViewAll(ownerNo);
			res = (String) map2.get("S_STATUS_NAME");
			
		}else {
			res="fail";
		}	
		logger.info("업데이트 결과 res={}", res);
		return res;
	}

	@ResponseBody
	@RequestMapping("/updateTime.do")
	public Map<String, Object> updateTime(@RequestParam(defaultValue = "0") int storeNo,
			@RequestParam(defaultValue = "0") int ownerNo,
			@RequestParam(defaultValue = "0") String startTime,
			@RequestParam(defaultValue = "0") String closeTime) {
			logger.info("시간 업데이트  ajax , startTime={}, closeTime={}", startTime, closeTime);
		
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("startTime", startTime);
			map.put("closeTime", closeTime);
			map.put("storeNo", storeNo);
			
			int cnt = ownerStoreService.updateTime(map);
			Map<String,Object> map3 = ownerStoreService.selectOperationViewAll(ownerNo);
			if(cnt>0) {
				Map<String,Object> map2 = ownerStoreService.selectOperationViewAll(ownerNo);
				String start= (String) map2.get("STORE_OPEN_TIME");
				String close =(String) map2.get("STORE_CLOSE_TIME"); 
			
				map3.put("start", start);
				map3.put("close",close);
			}
			
			logger.info("업데이트 결과 res={}", map3);
			
			
			return map3;
		
	}
	
	
	
	@ResponseBody
	@RequestMapping("/selectMinPrice.do")
	public int selectMinPrice( HttpSession session, Model model) {
		//storeNo 구하기
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			logger.info("최소주문금액 셀렉 ajax , ownerno={}",ownerNo );
		
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			OwnerStoresVO vo = ownerStoreService.selectStoreByOwnerNo(ownerNo);
		
			logger.info("ownerNo으로 구한 vo = {}",vo);
			
			int minPrice = vo.getStoreMinPrice();
			
			return minPrice;
		
	}
	
	
	

	@ResponseBody
	@RequestMapping("/updateMinPrice.do")
	public int updateMinPrice(@RequestParam(defaultValue = "0") int storeNo,
			@RequestParam(defaultValue = "0") int ownerNo,
			@RequestParam(defaultValue = "0") int storeMinPrice) {
			logger.info("최소 주문 금액 업데이트  ajax ,storeMinPrice={}", storeMinPrice);
		
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("storeMinPrice", storeMinPrice);
			map.put("storeNo", storeNo);
			
			int cnt = ownerStoreService.updateMinPrice(map);
	
			
			logger.info("업데이트 결과 res={}",cnt);
			
			
			return cnt;
		
	}
	
}