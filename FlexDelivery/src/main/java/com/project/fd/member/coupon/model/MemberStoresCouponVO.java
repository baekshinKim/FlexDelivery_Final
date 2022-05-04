package com.project.fd.member.coupon.model;

import java.sql.Timestamp;

public class MemberStoresCouponVO {
	private int sCBoxNo; //점포쿠폰보관함 번호 PK
	private int rCouponNo;//정기쿠폰번호
	private int storeNo;//점포번호
	private String sCService;//쿠폰제공여부 
	private Timestamp sCStartDate;//쿠폰 시작일
	private Timestamp sCEndDate;//쿠폰 만료일
	private int rCouponDc; //쿠폰 할인금액
	private int rCouponMin; //쿠폰 최소사용금액
	private int dupChk; //점포의 쿠폰이 현재회원이 이미 발급받았는지 확인, 0보다 크면 이미 발급받음
	private String rCBoxUse; //점포의 쿠폰을 사용한적 있는지 확인, Y면 이미 사용, N면 사용전
	
	
	public String getrCBoxUse() {
		return rCBoxUse;
	}
	public void setrCBoxUse(String rCBoxUse) {
		this.rCBoxUse = rCBoxUse;
	}
	public int getDupChk() {
		return dupChk;
	}
	public void setDupChk(int dupChk) {
		this.dupChk = dupChk;
	}
	public int getsCBoxNo() {
		return sCBoxNo;
	}
	public void setsCBoxNo(int sCBoxNo) {
		this.sCBoxNo = sCBoxNo;
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
	@Override
	public String toString() {
		return "MemberStoresCouponVO [sCBoxNo=" + sCBoxNo + ", rCouponNo=" + rCouponNo + ", storeNo=" + storeNo
				+ ", sCService=" + sCService + ", sCStartDate=" + sCStartDate + ", sCEndDate=" + sCEndDate
				+ ", rCouponDc=" + rCouponDc + ", rCouponMin=" + rCouponMin + ", dupChk=" + dupChk + "]";
	}
	
	
}
