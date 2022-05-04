package com.project.fd.admin.coupons.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminEventCouponDAOMybatis implements AdminEventCouponDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.admineventcoupon.";

	@Override
	public List<AdminEventCouponVO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
		
	}

	@Override
	public int insertEventCoupon(AdminEventCouponVO eventCouponVo) {
		int cnt=sqlSession.insert(namespace+"insertEventCoupon", eventCouponVo);
		return cnt;
	}

	@Override
	public int updateEventCoupon(AdminEventCouponVO eventCouponVo) {
		int cnt=sqlSession.update(namespace+"updateEventCoupon", eventCouponVo);
		return cnt;
	}

	@Override
	public int deleteEventCoupon(AdminEventCouponVO eventCouponVo) {
		int cnt=sqlSession.delete(namespace+"deleteEventCoupon", eventCouponVo);
		return cnt;
	}

	@Override
	public boolean checkDu(String eCouponName) {
		boolean bool=false;
		int cnt=sqlSession.selectOne(namespace+"checkDu", eCouponName);
		if (cnt==0) {
			bool=true;
		}
		return bool;
	}
}
