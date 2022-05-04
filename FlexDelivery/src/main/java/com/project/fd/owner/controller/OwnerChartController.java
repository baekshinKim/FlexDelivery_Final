package com.project.fd.owner.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.owner.chart.model.OwnerChartService;
import com.project.fd.owner.store.model.OwnerStoresService;

@Controller
@RequestMapping("/owner/menu2/charts")
public class OwnerChartController {
	
	@Autowired
	private static final  Logger logger = 
		LoggerFactory.getLogger(OwnerChartController.class);
	
	@Autowired
	private OwnerChartService ownerChartService;
	
	@Autowired
	private OwnerStoresService ownerStoresService;
	
	@ResponseBody
	@RequestMapping("/ordersCount.do")
	public  Map<String, Object> ordersCount(HttpSession session){
		int ownerNo = (Integer) session.getAttribute("ownerNo");
		logger.info("count 구하기 ajax ownerNo={}",ownerNo);
		
		
		int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
		logger.info("storeNo 구하기 결과 storeNo={}", storeNo);
		
		List<Map<String, Object>> lList = ownerChartService.selectLastWeekOrderCount(storeNo);
		logger.info("지난 주 주문수  lList={} , lList.size={}", lList, lList.size());
		
		List<Map<String, Object>> tList = ownerChartService.selectThisWeekOrderCount(storeNo);
		logger.info("이번주 주문수  tList={} , tList.size={}", tList, tList.size());
		
		Map<String, Object> map = new HashedMap<String, Object>();
		
		map.put("lList",lList);
		map.put("tList",tList);
		
		logger.info("map={}" , map);
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping("/ordersBestMenu.do")
	public  List<Map<String, Object>> ordersBestMenu(HttpSession session){
		int ownerNo = (Integer) session.getAttribute("ownerNo");
		logger.info("best 메뉴 구하기 ajax ownerNo={}",ownerNo);
		
		
		int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
		logger.info("storeNo 구하기 결과 storeNo={}", storeNo);
		
		List<Map<String, Object>> mList = ownerChartService.selectBestMenu(storeNo);
		logger.info("베스트 메뉴 구하기  mList={} , lList.size={}", mList, mList.size());
		 
		return mList;
	}
	
	@ResponseBody
	@RequestMapping("/ordersPrice.do")
	public  Map<String, Object> ordersPrice(HttpSession session){
		int ownerNo = (Integer) session.getAttribute("ownerNo");
		logger.info("price 구하기 ajax ownerNo={}",ownerNo);
		
		
		int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
		logger.info("storeNo 구하기 결과 storeNo={}", storeNo);
		
		List<Map<String, Object>> lList = ownerChartService.selectLastWeekOrderPrice(storeNo);
		logger.info("지난 주 주문 가격  lList={} , lList.size={}", lList, lList.size());
		
		List<Map<String, Object>> tList = ownerChartService.selectThisWeekOrderPrice(storeNo);
		logger.info("이번주 주문 가격  tList={} , tList.size={}", tList, tList.size());
		
		Map<String, Object> map = new HashedMap<String, Object>();
		
		map.put("lList",lList);
		map.put("tList",tList);
		
		logger.info("map={}" , map);
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping("/ordersListChart.do")
	public  List<Map<String, Object>> ordersListChart(HttpSession session, @RequestParam(defaultValue = "0") String startDay,
			@RequestParam(defaultValue = "0") String endDay){
		int ownerNo = (Integer) session.getAttribute("ownerNo");
		logger.info("주문 비교 구하기 ajax ownerNo={}",ownerNo);
		
		
		int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
		logger.info("storeNo 구하기 결과 storeNo={}", storeNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("storeNo", storeNo);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		
		logger.info("map={}" , map);
		
		
		List<Map<String,Object>> oList =  ownerChartService.selectOrdersFiveStatusNo(map);
		logger.info("주문 건수 구하기 oList={}" , oList);
		
		return oList;
	}
	
	
	
	
	
}
