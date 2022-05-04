package com.project.fd.admin.coupons.model;

import java.util.List;

public interface AdminEventCouponService {

	List<AdminEventCouponVO> selectAll();
	
	int insertEventCoupon(AdminEventCouponVO eventCouponVo);
	
	int updateEventCoupon(AdminEventCouponVO eventCouponVo);
	
	int deleteEventCoupon(AdminEventCouponVO eventCouponVo);

	boolean checkDu(String eCouponName);
	
	
}
