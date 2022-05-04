package com.project.fd.admin.coupons.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminEventCouponServiceImpl implements AdminEventCouponService{

	@Autowired
	private AdminEventCouponDAO eventCouponDao;
	
	@Override
	public List<AdminEventCouponVO> selectAll() {
		return eventCouponDao.selectAll();
	}

	@Override
	public int insertEventCoupon(AdminEventCouponVO eventCouponVo) {
		return eventCouponDao.insertEventCoupon(eventCouponVo);
	}

	@Override
	public int updateEventCoupon(AdminEventCouponVO eventCouponVo) {
		return eventCouponDao.updateEventCoupon(eventCouponVo);
	}

	@Override
	public int deleteEventCoupon(AdminEventCouponVO eventCouponVo) {
		return eventCouponDao.deleteEventCoupon(eventCouponVo);
	}

	@Override
	public boolean checkDu(String eCouponName) {
		return eventCouponDao.checkDu(eCouponName);
	}

}
