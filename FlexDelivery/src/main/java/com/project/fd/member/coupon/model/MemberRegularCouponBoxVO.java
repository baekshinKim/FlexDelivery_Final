package com.project.fd.member.coupon.model;

import java.sql.Timestamp;

public class MemberRegularCouponBoxVO {
	private int memberNo;
	private int sCBoxNo;
	private Timestamp rCBoxEnd;
	private String rCBoxUse;
	private int rCouponNo;//정기쿠폰번호
	private int storeNo;//점포번호
	private String sCService;//쿠폰제공여부 
	private Timestamp sCStartDate;//쿠폰 시작일
	private Timestamp sCEndDate;//쿠폰 만료일
	private int rCouponDc; //쿠폰 할인금액
	private int rCouponMin; //쿠폰 최소사용금액
	private String storeLogo;//점포 로고이미지
	private String storeName;//점포 상호명
	
	
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreLogo() {
		return storeLogo;
	}
	public void setStoreLogo(String storeLogo) {
		this.storeLogo = storeLogo;
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
	public String getsCService() {
		return sCService;
	}
	public void setsCService(String sCService) {
		this.sCService = sCService;
	}
	public Timestamp getsCStartDate() {
		return sCStartDate;
	}
	public void setsCStartDate(Timestamp sCStartDate) {
		this.sCStartDate = sCStartDate;
	}
	public Timestamp getsCEndDate() {
		return sCEndDate;
	}
	public void setsCEndDate(Timestamp sCEndDate) {
		this.sCEndDate = sCEndDate;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getsCBoxNo() {
		return sCBoxNo;
	}
	public void setsCBoxNo(int sCBoxNo) {
		this.sCBoxNo = sCBoxNo;
	}
	public Timestamp getrCBoxEnd() {
		return rCBoxEnd;
	}
	public void setrCBoxEnd(Timestamp rCBoxEnd) {
		this.rCBoxEnd = rCBoxEnd;
	}
	public String getrCBoxUse() {
		return rCBoxUse;
	}
	public void setrCBoxUse(String rCBoxUse) {
		this.rCBoxUse = rCBoxUse;
	}
	@Override
	public String toString() {
		return "MemberRegularCouponBoxVO [memberNo=" + memberNo + ", sCBoxNo=" + sCBoxNo + ", rCBoxEnd=" + rCBoxEnd
				+ ", rCBoxUse=" + rCBoxUse + ", rCouponNo=" + rCouponNo + ", storeNo=" + storeNo + ", sCService="
				+ sCService + ", sCStartDate=" + sCStartDate + ", sCEndDate=" + sCEndDate + ", rCouponDc=" + rCouponDc
				+ ", rCouponMin=" + rCouponMin + "]";
	}
	
	
}
