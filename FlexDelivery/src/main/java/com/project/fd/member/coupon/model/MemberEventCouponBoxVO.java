package com.project.fd.member.coupon.model;

import java.sql.Timestamp;

public class MemberEventCouponBoxVO {
	private int eCouponNo;
	private int memberNo;
	private String eCouponName;
	private Timestamp eCouponStartDate;
	private Timestamp eCouponEndDate;
	private int eCouponDc;
	private int eCouponMin;
	private String useFlag;
	
	
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}
	public int geteCouponNo() {
		return eCouponNo;
	}
	public void seteCouponNo(int eCouponNo) {
		this.eCouponNo = eCouponNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String geteCouponName() {
		return eCouponName;
	}
	public void seteCouponName(String eCouponName) {
		this.eCouponName = eCouponName;
	}
	public Timestamp geteCouponStartDate() {
		return eCouponStartDate;
	}
	public void seteCouponStartDate(Timestamp eCouponStartDate) {
		this.eCouponStartDate = eCouponStartDate;
	}
	public Timestamp geteCouponEndDate() {
		return eCouponEndDate;
	}
	public void seteCouponEndDate(Timestamp eCouponEndDate) {
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
		return "MemberEventCouponBoxVO [eCouponNo=" + eCouponNo + ", memberNo=" + memberNo + ", eCouponName="
				+ eCouponName + ", eCouponStartDate=" + eCouponStartDate + ", eCouponEndDate=" + eCouponEndDate
				+ ", eCouponDc=" + eCouponDc + ", eCouponMin=" + eCouponMin + "]";
	}
	
	
	
	
}
