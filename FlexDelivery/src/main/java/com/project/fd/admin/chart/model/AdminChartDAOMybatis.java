package com.project.fd.admin.chart.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminChartDAOMybatis implements AdminChartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.adminchart.";

	@Override
	public List<Map<String, Object>> selectCurJoin() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectCurJoin");
		return result;
	}

	@Override
	public List<Map<String, Object>> selectCurLeave() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectCurLeave");
		return result;
	}

	@Override
	public List<Map<String, Object>> selectCurOwner() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectCurOwner");
		return result;
	}

	@Override
	public List<Map<String, Object>> selectCurAd() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectCurAd");
		return result;
	}

	@Override
	public List<Map<String, Object>> selectStoreCoupon() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectStoreCoupon");
		return result;
	}

	@Override
	public List<Map<String, Object>> selectRCoupon() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectRCoupon");
		return result;
	}

	@Override
	public List<Map<String, Object>> selectCurOrder() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectCurOrder");
		return result;
	}

	@Override
	public List<Map<String, Object>> selectCurLCategory() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectCurLCategory");
		return result;
	}

	@Override
	public List<Map<String, Object>> selectGCategory() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectGCategory");
		return result;
	}

	@Override
	public List<Map<String, Object>> selectGPrice() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectGPrice");
		return result;
	}

	@Override
	public List<Map<String, Object>> selectGProduct() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectGProduct");
		return result;
	}

	@Override
	public List<Map<String, Object>> selectGProduct5() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectGProduct5");
		return result;
	}

	@Override
	public List<Map<String, Object>> selectCurOrder2() {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectCurOrder2");
		return result;
	}
	
}
