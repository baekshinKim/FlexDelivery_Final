package com.project.fd.admin.mediumcategory.model;

public class AdminMediumCategoryVO {
	private int mCategoryNo;
	private String mCategoryName;
	private int lCategoryNo;
	private int weatherNo;

	public int getmCategoryNo() {
		return mCategoryNo;
	}
	public void setmCategoryNo(int mCategoryNo) {
		this.mCategoryNo = mCategoryNo;
	}
	public String getmCategoryName() {
		return mCategoryName;
	}
	public void setmCategoryName(String mCategoryName) {
		this.mCategoryName = mCategoryName;
	}
	public int getlCategoryNo() {
		return lCategoryNo;
	}
	public void setlCategoryNo(int lCategoryNo) {
		this.lCategoryNo = lCategoryNo;
	}
	public int getWeatherNo() {
		return weatherNo;
	}
	public void setWeatherNo(int weatherNo) {
		this.weatherNo = weatherNo;
	}
	
	
	@Override
	public String toString() {
		return "MediumcategoryVO [mCategoryNo=" + mCategoryNo + ", mCategoryName=" + mCategoryName + ", lCategoryNo="
				+ lCategoryNo + ", weatherNo=" + weatherNo + "]";
	}
	
	
}
