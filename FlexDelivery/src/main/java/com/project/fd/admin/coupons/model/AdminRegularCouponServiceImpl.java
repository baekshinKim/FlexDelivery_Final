package com.project.fd.admin.coupons.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminRegularCouponServiceImpl implements AdminRegularCouponService{

	@Autowired
	private AdminRegularCouponDAO regularCouponDao;
	
	@Override
	public List<AdminRegularCouponVO> selectAll() {
		return regularCouponDao.selectAll();
	}

	@Override
	public int insertRegularCoupon(AdminRegularCouponVO regularCouponVo) {
		return regularCouponDao.insertRegularCoupon(regularCouponVo);
	}

	@Override
	public int updateRegularCoupon(AdminRegularCouponVO regularCouponVo) {
		return regularCouponDao.updateRegularCoupon(regularCouponVo);
	}

	@Override
	public int deleteRegularCoupon(AdminRegularCouponVO regularCouponVo) {
		return regularCouponDao.deleteRegularCoupon(regularCouponVo);
	}

	@Override
	public boolean checkDu(Map<String, Object> map) {
		return regularCouponDao.checkDu(map);
	}

}
