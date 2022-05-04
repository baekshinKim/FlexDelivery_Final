package com.project.fd.admin.coupons.model;

public class AdminEventCouponVO {
	private int eCouponNo;
	private String eCouponName;
	private String eCouponStartDate;
	private String eCouponEndDate;
	private int eCouponDc;
	private int eCouponMin;
	private int startDate; //희영 추가
	private int endDate; //희영 추가
	
	public int getStartDate() {
		return startDate;
	}
	public void setStartDate(int startDate) {
		this.startDate = startDate;
	}
	public int getEndDate() {
		return endDate;
	}
	public void setEndDate(int endDate) {
		this.endDate = endDate;
	}
	public int geteCouponNo() {
		return eCouponNo;
	}
	public void seteCouponNo(int eCouponNo) {
		this.eCouponNo = eCouponNo;
	}
	public String geteCouponName() {
		return eCouponName;
	}
	public void seteCouponName(String eCouponName) {
		this.eCouponName = eCouponName;
	}
	public String geteCouponStartDate() {
		return eCouponStartDate;
	}
	public void seteCouponStartDate(String eCouponStartDate) {
		this.eCouponStartDate = eCouponStartDate;
	}
	public String geteCouponEndDate() {
		return eCouponEndDate;
	}
	public void seteCouponEndDate(String eCouponEndDate) {
		this.eCouponEndDate = eCouponEndDate;
	}
	public int geteCouponDc() {
		return eCouponDc;
	}
	public void seteCouponDc(int eCouponDc) {
		this.eCouponDc = eCouponDc;
	}
	public int geteCouponMin() {
		return eCouponMin;
	}
	public void seteCouponMin(int eCouponMin) {
		this.eCouponMin = eCouponMin;
	}
	
	@Override
	public String toString() {
		return "AdminEventCouponVO [eCouponNo=" + eCouponNo + ", eCouponName=" + eCouponName + ", eCouponStartDate="
				+ eCouponStartDate + ", eCouponEndDate=" + eCouponEndDate + ", eCouponDc=" + eCouponDc + ", eCouponMin="
				+ eCouponMin + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
	
}
