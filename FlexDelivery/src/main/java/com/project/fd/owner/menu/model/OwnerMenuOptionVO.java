package com.project.fd.owner.menu.model;

public class OwnerMenuOptionVO {
	private int mOptionNo;
	private String mOptionName;
	private int mOptionPrice;
	private int menuNo;
	private int oRankNo;
	
	
	public int getmOptionNo() {
		return mOptionNo;
	}
	public void setmOptionNo(int mOptionNo) {
		this.mOptionNo = mOptionNo;
	}
	public String getmOptionName() {
		return mOptionName;
	}
	public void setmOptionName(String mOptionName) {
		this.mOptionName = mOptionName;
	}
	public int getmOptionPrice() {
		return mOptionPrice;
	}
	public void setmOptionPrice(int mOptionPrice) {
		this.mOptionPrice = mOptionPrice;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public int getoRankNo() {
		return oRankNo;
	}
	public void setoRankNo(int oRankNo) {
		this.oRankNo = oRankNo;
	}
	@Override
	public String toString() {
		return "MenuOptionVO [mOptionNo=" + mOptionNo + ", mOptionName=" + mOptionName + ", mOptionPrice="
				+ mOptionPrice + ", menuNo=" + menuNo + ", oRankNo=" + oRankNo + "]";
	}
	
	
}
