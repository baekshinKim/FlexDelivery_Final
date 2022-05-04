package com.project.fd.admin.weather.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryViewVO;

@Repository
public class AdminWeatherDAOMybatis implements AdminWeatherDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.adminweather.";

	@Override
	public List<AdminWeatherVO> selectAll() {
		List<AdminWeatherVO> list=sqlSession.selectList(namespace+"selectAll");
		return list;
	}

	@Override
	public int insertWeather(AdminWeatherVO weatherVo) {
		int cnt=sqlSession.insert(namespace+"insertWeather", weatherVo);
		return cnt;
	}
	
	@Override
	public int updateWeather(AdminWeatherVO weatherVo) {
		int cnt=sqlSession.update(namespace+"updateWeather", weatherVo);
		return cnt;
	}

	@Override
	public int deleteWeather(AdminWeatherVO weatherVo) {
		int cnt=sqlSession.delete(namespace+"deleteWeather", weatherVo);
		return cnt;
	}

	@Override
	public List<AdminMediumCategoryViewVO> selectAll2() {
		List<AdminMediumCategoryViewVO> list=sqlSession.selectList(namespace+"selectAll2");
		return list;
	}

	@Override
	public boolean checkDu(String weatherName) {
		boolean bool=false;
		int cnt=sqlSession.selectOne(namespace+"checkDu", weatherName);
		if (cnt==0) {
			bool=true;
		}
		return bool;
	}
	
	
}
