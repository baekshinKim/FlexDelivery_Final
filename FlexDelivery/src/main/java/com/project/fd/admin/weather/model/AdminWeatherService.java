package com.project.fd.admin.weather.model;

import java.util.List;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryViewVO;

public interface AdminWeatherService {
	
	List<AdminWeatherVO> selectAll();
	
	List<AdminMediumCategoryViewVO> selectAll2();

	int insertWeather(AdminWeatherVO weatherVo);
	int updateWeather(AdminWeatherVO weatherVo);
	int deleteWeather(AdminWeatherVO weatherVo);

	boolean checkDu(String weatherName);
	
}
