package com.project.fd.member.gift.model;

public class MemberGiftProductVO {
	private int gProductNo;
	private String gProductName;
	private String gProductFilename;
	private int gCategoryNo;
	private String gCategoryName;
	public int getgProductNo() {
		return gProductNo;
	}
	public void setgProductNo(int gProductNo) {
		this.gProductNo = gProductNo;
	}
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
	public int getgCategoryNo() {
		return gCategoryNo;
	}
	public void setgCategoryNo(int gCategoryNo) {
		this.gCategoryNo = gCategoryNo;
	}
	public String getgCategoryName() {
		return gCategoryName;
	}
	public void setgCategoryName(String gCategoryName) {
		this.gCategoryName = gCategoryName;
	}
	@Override
	public String toString() {
		return "MemberGiftProductVO [gProductNo=" + gProductNo + ", gProductName=" + gProductName
				+ ", gProductFilename=" + gProductFilename + ", gCategoryNo=" + gCategoryNo + ", gCategoryName="
				+ gCategoryName + "]";
	}
	
	
}
