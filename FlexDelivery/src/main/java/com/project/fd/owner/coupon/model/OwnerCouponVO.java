package com.project.fd.owner.coupon.model;

public class OwnerCouponVO {
	private int scBoxNo; /* 점포쿠폰번호 */
	private int storeNo;/* 점포번호 */
	private String scCervice; /* 제공여부 => Y,N  */
	private String scStartDate; /* 발급시작일 */
	private String scEndDate;/* 발급만료일 */
	
	private int rCouponNo;/* 정기쿠폰번호 */
	
	//정기 쿠폰 
	private int rCouponDC; /* 정기쿠폰할인가격 */
	private int rCouponMin; /* 정기쿠폰최소금액 */
	public int getScBoxNo() {
		return scBoxNo;
	}
	public void setScBoxNo(int scBoxNo) {
		this.scBoxNo = scBoxNo;
	}
	public int getrCouponNo() {
		return rCouponNo;
	}
	public void setrCouponNo(int rCouponNo) {
		this.rCouponNo = rCouponNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getScCervice() {
		return scCervice;
	}
	public void setScCervice(String scCervice) {
		this.scCervice = scCervice;
	}
	public String getScStartDate() {
		return scStartDate;
	}
	public void setScStartDate(String scStartDate) {
		this.scStartDate = scStartDate;
	}
	public String getScEndDate() {
		return scEndDate;
	}
	public void setScEndDate(String scEndDate) {
		this.scEndDate = scEndDate;
	}
	public int getrCouponDC() {
		return rCouponDC;
	}
	public void setrCouponDC(int rCouponDC) {
		this.rCouponDC = rCouponDC;
	}
	public int getrCouponMin() {
		return rCouponMin;
	}
	public void setrCouponMin(int rCouponMin) {
		this.rCouponMin = rCouponMin;
	}
	@Override
	public String toString() {
		return "OwnerCouponVO [scBoxNo=" + scBoxNo + ", rCouponNo=" + rCouponNo + ", storeNo=" + storeNo
				+ ", scCervice=" + scCervice + ", scStartDate=" + scStartDate + ", scEndDate=" + scEndDate
				+ ", rCouponDC=" + rCouponDC + ", rCouponMin=" + rCouponMin + "]";
	}
	
	
}
