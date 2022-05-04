package com.project.fd.owner.chart.model;

import java.util.List;
import java.util.Map;

public interface OwnerChartDAO {

	public List<Map<String, Object>> selectLastWeekOrderCount(int storeNo) ;
	
	public List<Map<String, Object>> selectThisWeekOrderCount(int storeNo) ;
	
	public List<Map<String, Object>> selectLastWeekOrderPrice(int storeNo) ;
	
	public List<Map<String, Object>> selectThisWeekOrderPrice(int storeNo) ;
	
	public List<Map<String, Object>> selectBestMenu(int storeNo) ;
	
	public List<Map<String, Object>>  selectOrdersFiveStatusNo(Map<String, Object> map);
	
	public List<Map<String, Object>>  selectMainStoreFour();
}
