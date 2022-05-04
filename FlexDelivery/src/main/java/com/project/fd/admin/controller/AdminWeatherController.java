package com.project.fd.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryViewVO;
import com.project.fd.admin.weather.model.AdminWeatherService;
import com.project.fd.admin.weather.model.AdminWeatherVO;

@Controller
@RequestMapping("/admin/menu6")
public class AdminWeatherController {
	private static final Logger logger
		=LoggerFactory.getLogger(AdminWeatherController.class);
	
	@Autowired
	private AdminWeatherService weatherService;
	
	/*
	@RequestMapping(value="/todayFoodsWeather.do", method = RequestMethod.GET)
	public String list_get(Model model) {
		logger.info("list_get 날씨 목록 페이지 출력");
		
		List<AdminWeatherVO> list=weatherService.selectAll();
		logger.info("list 출력, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "/admin/menu6/todayFoodsWeather";
	}
	*/
	
	@RequestMapping(value="/todayFoodsWeather.do", method = RequestMethod.GET)
	public String list_get(Model model) {
		logger.info("list_get 날씨 목록 페이지 출력");
		
		
		List<AdminMediumCategoryViewVO> list=weatherService.selectAll2();
		logger.info("list 출력, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "/admin/menu6/todayFoodsWeather";
	}

	@RequestMapping(value="/todayFoodsWeather.do", method = RequestMethod.POST)
	public String list_post(@ModelAttribute AdminWeatherVO weatherVo, 
			HttpServletRequest requset) {
		logger.info("list_post 날씨 목록 등록 처리, 파라미터 vo={}", weatherVo);
				
		int cnt=weatherService.insertWeather(weatherVo);
		logger.info("날씨 카테고리 등록 처리 결과, cnt={}", cnt);

		return "redirect:/admin/menu6/todayFoodsWeather.do";
	}
	
	@RequestMapping("/weatherName/ajaxCheck.do")
	@ResponseBody
	public boolean ajax_check(@RequestParam String weatherName) {
		logger.info("날씨 중복확인, weatherName={}", weatherName);
		
		boolean isExist=false;
		if(weatherName!=null && !weatherName.isEmpty()) {
			isExist=weatherService.checkDu(weatherName);
			logger.debug("날씨 중복확인 결과, isExist={}", isExist);
		}
		return isExist;
		
	}
	
	@RequestMapping(value="/todayFoodsWeather/write.do", method=RequestMethod.GET)
	public String write_get() {
		logger.info("write_get 날씨 등록 화면 띄우기");
		
		return "admin/menu6/todayFoodsWeather";
	}
	
	@RequestMapping(value="/todayFoodsWeather/write.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute AdminWeatherVO weatherVo,
			HttpServletRequest request) {
		logger.info("write_post 날씨 등록 처리, 파라미터 vo={}", weatherVo);
		
		int cnt=weatherService.insertWeather(weatherVo);
		logger.info("날씨 등록 처리 결과, cnt={}", cnt);
		
		return "redirect:/admin/menu6/todayFoodsWeather.do";
	}
	
	@RequestMapping(value="/todayFoodsWeather/edit.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute AdminWeatherVO weatherVo,
			HttpServletRequest request, Model model) {
		logger.info("edit_post 날씨 수정 처리, 파라미터 vo={}", weatherVo);
		
		String msg="날씨 카테고리 수정 실패", url="/admin/menu6/todayFoodsWeather.do";
		int cnt=weatherService.updateWeather(weatherVo);
		logger.info("날씨 수정 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="날씨 카테고리를 수정하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//return "redirect:/admin/menu6/todayFoodsWeather.do";
		return "common/message";
	}
	
	@RequestMapping(value="/todayFoodsWeather/delete.do", method=RequestMethod.POST)
	public String delete_post(@ModelAttribute AdminWeatherVO weatherVo,
			HttpServletRequest request, Model model) {
		logger.info("delete_post 날씨  삭제처리, 파라미터 vo={}", weatherVo);
		
		String msg="날씨 카테고리 삭제 실패", url="/admin/menu6/todayFoodsWeather.do";
		int cnt=weatherService.deleteWeather(weatherVo);
		logger.info("날씨 삭제 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="날씨 카테고리를 삭제하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//return "redirect:/admin/menu6/todayFoodsWeather.do";
		return "common/message";
	}
}
