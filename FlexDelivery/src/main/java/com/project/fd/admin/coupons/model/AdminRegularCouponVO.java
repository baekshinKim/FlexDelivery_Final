package com.project.fd.admin.coupons.model;

public class AdminRegularCouponVO {
	private int rCouponNo;
	private int rCouponDc;
	private int rCouponMin;
	
	public int getrCouponNo() {
		return rCouponNo;
	}
	public void setrCouponNo(int rCouponNo) {
		this.rCouponNo = rCouponNo;
	}
	public int getrCouponDc() {
		return rCouponDc;
	}
	public void setrCouponDc(int rCouponDc) {
		this.rCouponDc = rCouponDc;
	}
	public int getrCouponMin() {
		return rCouponMin;
	}
	public void setrCouponMin(int rCouponMin) {
		this.rCouponMin = rCouponMin;
	}
	
	@Override
	public String toString() {
		return "AdminRegularCouponVO [rCouponNo=" + rCouponNo + ", rCouponDc=" + rCouponDc + ", rCouponMin="
				+ rCouponMin + "]";
	}
	

	
}
