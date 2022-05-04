package com.project.fd.owner.chart.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OwnerChartServiceImpl implements OwnerChartService{

	@Autowired
	private OwnerChartDAO ownerChartDao;
	
	public List<Map<String, Object>> selectLastWeekOrderCount(int storeNo) {
		return ownerChartDao.selectLastWeekOrderCount(storeNo);
	}
	
	public List<Map<String, Object>> selectThisWeekOrderCount(int storeNo) {
		return ownerChartDao.selectThisWeekOrderCount(storeNo);
	}
	
	public List<Map<String, Object>> selectLastWeekOrderPrice(int storeNo) {
		return ownerChartDao.selectLastWeekOrderPrice(storeNo);
	}
	
	public List<Map<String, Object>> selectThisWeekOrderPrice(int storeNo) {
		return ownerChartDao.selectThisWeekOrderPrice(storeNo);
	}

	public List<Map<String, Object>> selectBestMenu(int storeNo) {
		return ownerChartDao.selectBestMenu(storeNo);
	}
	
	public List<Map<String, Object>>  selectOrdersFiveStatusNo(Map<String, Object> map){
		return ownerChartDao.selectOrdersFiveStatusNo(map);
	}

	public List<Map<String, Object>>  selectMainStoreFour(){
		return ownerChartDao.selectMainStoreFour();
	}
}
