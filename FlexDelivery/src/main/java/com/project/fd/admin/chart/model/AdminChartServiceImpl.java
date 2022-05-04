package com.project.fd.admin.chart.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminChartServiceImpl implements AdminChartService{

	@Autowired
	private AdminChartDAO chartDao;

	@Override
	public List<Map<String, Object>> selectCurJoin() {		
		return chartDao.selectCurJoin();
	}

	@Override
	public List<Map<String, Object>> selectCurLeave() {
		return chartDao.selectCurLeave();
	}

	@Override
	public List<Map<String, Object>> selectCurOwner() {
		return chartDao.selectCurOwner();
	}

	@Override
	public List<Map<String, Object>> selectCurAd() {
		return chartDao.selectCurAd();
	}

	@Override
	public List<Map<String, Object>> selectStoreCoupon() {
		return chartDao.selectStoreCoupon();
	}

	@Override
	public List<Map<String, Object>> selectRCoupon() {
		return chartDao.selectRCoupon();
	}

	@Override
	public List<Map<String, Object>> selectCurOrder() {
		return chartDao.selectCurOrder();
	}

	@Override
	public List<Map<String, Object>> selectCurLCategory() {
		return chartDao.selectCurLCategory();
	}

	@Override
	public List<Map<String, Object>> selectGCategory() {
		return chartDao.selectGCategory();
	}

	@Override
	public List<Map<String, Object>> selectGPrice() {
		return chartDao.selectGPrice();
	}

	@Override
	public List<Map<String, Object>> selectGProduct() {
		return chartDao.selectGProduct();
	}

	@Override
	public List<Map<String, Object>> selectGProduct5() {
		return chartDao.selectGProduct5();
	}

	@Override
	public List<Map<String, Object>> selectCurOrder2() {
		return chartDao.selectCurOrder2();
	}
	
}
