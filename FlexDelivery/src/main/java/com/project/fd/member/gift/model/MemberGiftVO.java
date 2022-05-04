package com.project.fd.member.gift.model;

public class MemberGiftVO {
	private int giftNo; //상품권번호
	private int gPTypeNo; //상품권가격번호
	private int gProductNo; //선물상품 종류번호
	private int giftTakeMemberNo; //받은회원번호
	private int giftGiveMemberNo; //보낸회원번호
	private String giftUse; //사용여부
	private int gPTypePrice; //상품권가격
	private String giftTakeMemberName; //받은회원 이름
	private String giftGiveMemberName; //보낸회원 이름
	private String gProductName; //상품권이름
	private String gProductFilename; //상품권파일네임
	
	
	
	public String getgProductName() {
		return gProductName;
	}
	public void setgProductName(String gProductName) {
		this.gProductName = gProductName;
	}
	public String getgProductFilename() {
		return gProductFilename;
	}
	public void setgProductFilename(String gProductFilename) {
		this.gProductFilename = gProductFilename;
	}
	public String getGiftTakeMemberName() {
		return giftTakeMemberName;
	}
	public void setGiftTakeMemberName(String giftTakeMemberName) {
		this.giftTakeMemberName = giftTakeMemberName;
	}
	public String getGiftGiveMemberName() {
		return giftGiveMemberName;
	}
	public void setGiftGiveMemberName(String giftGiveMemberName) {
		this.giftGiveMemberName = giftGiveMemberName;
	}
	public int getGiftNo() {
		return giftNo;
	}
	public void setGiftNo(int giftNo) {
		this.giftNo = giftNo;
	}
	public int getgPTypeNo() {
		return gPTypeNo;
	}
	public void setgPTypeNo(int gPTypeNo) {
		this.gPTypeNo = gPTypeNo;
	}
	public int getgProductNo() {
		return gProductNo;
	}
	public void setgProductNo(int gProductNo) {
		this.gProductNo = gProductNo;
	}
	public int getGiftTakeMemberNo() {
		return giftTakeMemberNo;
	}
	public void setGiftTakeMemberNo(int giftTakeMemberNo) {
		this.giftTakeMemberNo = giftTakeMemberNo;
	}
	public int getGiftGiveMemberNo() {
		return giftGiveMemberNo;
	}
	public void setGiftGiveMemberNo(int giftGiveMemberNo) {
		this.giftGiveMemberNo = giftGiveMemberNo;
	}
	public String getGiftUse() {
		return giftUse;
	}
	public void setGiftUse(String giftUse) {
		this.giftUse = giftUse;
	}
	public int getgPTypePrice() {
		return gPTypePrice;
	}
	public void setgPTypePrice(int gPTypePrice) {
		this.gPTypePrice = gPTypePrice;
	}
	@Override
	public String toString() {
		return "MemberGiftVO [giftNo=" + giftNo + ", gPTypeNo=" + gPTypeNo + ", gProductNo=" + gProductNo
				+ ", giftTakeMemberNo=" + giftTakeMemberNo + ", giftGiveMemberNo=" + giftGiveMemberNo + ", giftUse="
				+ giftUse + ", gPTypePrice=" + gPTypePrice + "]";
	}
	
	
}
