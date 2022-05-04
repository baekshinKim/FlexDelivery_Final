package com.project.fd.admin.gift.model;

public class AdminGiftCategoryProductVO {
	//giftCategory
	private int gCategoryNo;
	private String gCategoryName;

	//giftProduct
	private int gProductNo;
	private String gProductName;
	private String gProductFilename;
	
	//count
	private int cCount;
	private int pCount;
	
	public int getgCategoryNo() {
		return gCategoryNo;
	}
	public String getgCategoryName() {
		return gCategoryName;
	}
	public int getgProductNo() {
		return gProductNo;
	}
	public String getgProductName() {
		return gProductName;
	}
	public String getgProductFilename() {
		return gProductFilename;
	}
	public void setgCategoryNo(int gCategoryNo) {
		this.gCategoryNo = gCategoryNo;
	}
	public void setgCategoryName(String gCategoryName) {
		this.gCategoryName = gCategoryName;
	}
	public void setgProductNo(int gProductNo) {
		this.gProductNo = gProductNo;
	}
	public void setgProductName(String gProductName) {
		this.gProductName = gProductName;
	}
	public void setgProductFilename(String gProductFilename) {
		this.gProductFilename = gProductFilename;
	}
	public int getcCount() {
		return cCount;
	}
	public int getpCount() {
		return pCount;
	}
	public void setcCount(int cCount) {
		this.cCount = cCount;
	}
	public void setpCount(int pCount) {
		this.pCount = pCount;
	}
	
	@Override
	public String toString() {
		return "AdminGiftCategoryProductVO [gCategoryNo=" + gCategoryNo + ", gCategoryName=" + gCategoryName
				+ ", gProductNo=" + gProductNo + ", gProductName=" + gProductName + ", gProductFilename=" + gProductFilename
				+ ", cCount=" + cCount + ", pCount=" + pCount + "]";
	}
	
	
	
}
