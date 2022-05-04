package com.project.fd.admin.gift.model;

public class AdminGiftCategoryVO {
	private int gCategoryNo;
	private String gCategoryName;
	
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
		return "GiftCategoryVO [gCategoryNo=" + gCategoryNo + ", gCategoryName=" + gCategoryName + "]";
	}
	
}
