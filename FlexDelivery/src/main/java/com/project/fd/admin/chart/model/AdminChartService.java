package com.project.fd.admin.chart.model;

import java.util.List;
import java.util.Map;

public interface AdminChartService {
	List<Map<String, Object>> selectCurJoin();
	List<Map<String, Object>> selectCurLeave();
	List<Map<String, Object>> selectCurOwner();
	List<Map<String, Object>> selectCurAd();
	List<Map<String, Object>> selectStoreCoupon();
	List<Map<String, Object>> selectRCoupon();
	List<Map<String, Object>> selectCurOrder();
	List<Map<String, Object>> selectCurOrder2();

	List<Map<String, Object>> selectCurLCategory();
	List<Map<String, Object>> selectGCategory();
	List<Map<String, Object>> selectGPrice();
	List<Map<String, Object>> selectGProduct();
	List<Map<String, Object>> selectGProduct5();
 }
