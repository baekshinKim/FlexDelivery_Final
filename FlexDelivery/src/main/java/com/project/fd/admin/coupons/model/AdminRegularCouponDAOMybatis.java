package com.project.fd.admin.coupons.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminRegularCouponDAOMybatis implements AdminRegularCouponDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.adminregularcoupon.";

	@Override
	public List<AdminRegularCouponVO> selectAll() {
		List<AdminRegularCouponVO> list=sqlSession.selectList(namespace+"selectAll");
		return list;
	}

	@Override
	public int insertRegularCoupon(AdminRegularCouponVO regularCouponVo) {
		int cnt=sqlSession.insert(namespace+"insertRegularCoupon", regularCouponVo);
		return cnt;
	}

	@Override
	public int updateRegularCoupon(AdminRegularCouponVO regularCouponVo) {
		int cnt=sqlSession.update(namespace+"updateRegularCoupon", regularCouponVo);
		return cnt;
	}

	@Override
	public int deleteRegularCoupon(AdminRegularCouponVO regularCouponVo) {
		int cnt=sqlSession.delete(namespace+"deleteRegularCoupon", regularCouponVo);
		return cnt;
	}

	@Override
	public boolean checkDu(Map<String, Object> map) {
		boolean bool=false;
		int cnt=sqlSession.selectOne(namespace+"checkDu", map);
		if (cnt==0) {
			bool=true;
		}
		return bool;
	}
}
