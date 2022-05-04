package com.project.fd.owner.coupon.model;

import java.util.List;

public class OwnerCouponListVO {
	List<OwnerCouponVO> couponItems;

	public List<OwnerCouponVO> getCouponItems() {
		return couponItems;
	}

	public void setCouponItems(List<OwnerCouponVO> couponItems) {
		this.couponItems = couponItems;
	}

	@Override
	public String toString() {
		return "OwnerCouponListVO [couponItems=" + couponItems + "]";
	}
	
}
