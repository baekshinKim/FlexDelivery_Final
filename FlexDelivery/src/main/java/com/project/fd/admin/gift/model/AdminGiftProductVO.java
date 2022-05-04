package com.project.fd.admin.gift.model;

public class AdminGiftProductVO {
	private int gProductNo;
	private String gProductName;
	private String gProductFilename;
	private int gCategoryNo;
	
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
	
	@Override
	public String toString() {
		return "GiftProductVO [gProductNo=" + gProductNo + ", gProductName=" + gProductName + ", gProductFilename="
				+ gProductFilename + ", gCategoryNo=" + gCategoryNo + "]";
	}
	
	
	
}
