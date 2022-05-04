package com.project.fd.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fd.admin.chart.model.AdminChartService;

@Controller
@RequestMapping("/admin/menu7")
public class AdminChartController {
	private static final Logger logger=LoggerFactory.getLogger(AdminChartController.class);
	
	@Autowired
	private AdminChartService chartService;
	
	@RequestMapping("/chartIndex.do")
	public String list_get(Model model) {
		
		List<Map<String, Object>> list1=chartService.selectCurJoin();
		List<Map<String, Object>> list2=chartService.selectCurLeave();
		List<Map<String, Object>> list3=chartService.selectCurOwner();
		List<Map<String, Object>> list4=chartService.selectCurAd();
		List<Map<String, Object>> list5=chartService.selectStoreCoupon();
		List<Map<String, Object>> list6=chartService.selectRCoupon();
		List<Map<String, Object>> list7=chartService.selectCurOrder();
		List<Map<String, Object>> list72=chartService.selectCurOrder2();
		//List<Map<String, Object>> list8=chartService;
		List<Map<String, Object>> list9=chartService.selectCurLCategory();
		List<Map<String, Object>> list10=chartService.selectGCategory();
		List<Map<String, Object>> list11=chartService.selectGPrice();
		List<Map<String, Object>> list12=chartService.selectGProduct5();
		
		logger.info("list 사이즈, list1.size={}, list2.size={}",	list1.size(), list2.size());
		logger.info("list 사이즈, list3.size={}, list4.size={}",	list3.size(), list4.size());
		logger.info("list 사이즈, list5.size={}, list6.size={}",	list5.size(), list6.size());
		logger.info("list 사이즈, list7.size={}, list72.size={}",	list7.size(), list72.size());
		logger.info("list 사이즈, list9.size={}, list10.size={}",	list9.size(), list10.size());
		logger.info("list 사이즈, list11.size={}, list12.size={}", list11.size(), list12.size());
		
		logger.info("list1={}", list1);
		logger.info("list2={}", list2);
		logger.info("list3={}", list3);
		logger.info("list4={}", list4);
		logger.info("list5={}", list5);
		logger.info("list6={}", list6);

		logger.info("list7={}", list7);
		logger.info("list72={}", list72);
		logger.info("list12={}", list12);
		//logger.info("list8={}", list8);
		logger.info("list9={}", list9);
		logger.info("list10={}", list10);
		logger.info("list11={}", list11);
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list5", list5);
		model.addAttribute("list6", list6);
		model.addAttribute("list7", list7);
		model.addAttribute("list72", list72);
		//model.addAttribute("list8", list8);
		model.addAttribute("list9", list9);
		model.addAttribute("list10", list10);
		model.addAttribute("list11", list11);
		model.addAttribute("list12", list12);
		
		return "admin/menu7/chartIndex";

	}
	
}
