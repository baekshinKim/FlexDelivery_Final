package com.project.fd.owner.chart.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OwnerChartDAOMybatis implements OwnerChartDAO{

	@Autowired
	private SqlSessionTemplate session;
	
	private String namespace="config.mybatis.mapper.oracle.ownerchart.";
	
	public List<Map<String, Object>> selectLastWeekOrderCount(int storeNo) {
		return session.selectList(namespace+"selectLastWeekOrderCount",storeNo);
	}
	
	public List<Map<String, Object>> selectThisWeekOrderCount(int storeNo) {
		return session.selectList(namespace+"selectThisWeekOrderCount",storeNo);
	}
	
	public List<Map<String, Object>> selectLastWeekOrderPrice(int storeNo) {
		return session.selectList(namespace+"selectLastWeekOrderPrice",storeNo);
	}
	
	public List<Map<String, Object>> selectThisWeekOrderPrice(int storeNo) {
		return session.selectList(namespace+"selectThisWeekOrderPrice",storeNo);
	}
	
	public List<Map<String, Object>> selectBestMenu(int storeNo) {
		return session.selectList(namespace+"selectBestMenu",storeNo);
	}
	
	public List<Map<String, Object>>  selectOrdersFiveStatusNo(Map<String, Object> map){
		return session.selectList(namespace+"selectOrdersFiveStatusNo",map);
	}
	
	public List<Map<String, Object>>  selectMainStoreFour(){
		return session.selectList(namespace+"selectMainStoreFour");
	}
	
	
}
