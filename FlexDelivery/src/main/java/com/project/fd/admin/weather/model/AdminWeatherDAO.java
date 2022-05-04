package com.project.fd.admin.weather.model;

import java.util.List;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryViewVO;

public interface AdminWeatherDAO {
	List<AdminWeatherVO> selectAll();

	int insertWeather(AdminWeatherVO weatherVo);

	int updateWeather(AdminWeatherVO weatherVo);

	int deleteWeather(AdminWeatherVO weatherVo);

	List<AdminMediumCategoryViewVO> selectAll2();

	boolean checkDu(String weatherName);

}
