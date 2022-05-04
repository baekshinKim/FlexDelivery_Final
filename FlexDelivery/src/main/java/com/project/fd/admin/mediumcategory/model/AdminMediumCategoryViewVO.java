package com.project.fd.admin.mediumcategory.model;

public class AdminMediumCategoryViewVO {
	private int mCategoryNo;
	private String mCategoryName;
	private int lCategoryNo;
	private int weatherNo;
	
	//중분류 카테고리 출력에 필요한 멤버 변수
	private String lCategoryName;
	private String weatherName;
	
	//largeCategory 에서 사용할 떄 필요한 변수
	private String lCategoryFilename;
	
	//카운트 멤버 변수
	private int lCCount;
	private int wCount;
	
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
	public String getlCategoryName() {
		return lCategoryName;
	}
	public void setlCategoryName(String lCategoryName) {
		this.lCategoryName = lCategoryName;
	}
	public String getWeatherName() {
		return weatherName;
	}
	public void setWeatherName(String weatherName) {
		this.weatherName = weatherName;
	}
	public int getlCCount() {
		return lCCount;
	}
	public void setlCCount(int lCCount) {
		this.lCCount = lCCount;
	}
	public int getwCount() {
		return wCount;
	}
	public void setwCount(int wCount) {
		this.wCount = wCount;
	}
	public String getlCategoryFilename() {
		return lCategoryFilename;
	}
	public void setlCategoryFilename(String lCategoryFilename) {
		this.lCategoryFilename = lCategoryFilename;
	}
	
	
	@Override
	public String toString() {
		return "AdminMediumCategoryViewVO [mCategoryNo=" + mCategoryNo + ", mCategoryName=" + mCategoryName
				+ ", lCategoryNo=" + lCategoryNo + ", weatherNo=" + weatherNo + ", lCategoryName=" + lCategoryName
				+ ", weatherName=" + weatherName + ", lCategoryFilename=" + lCategoryFilename + ", lCCount=" + lCCount
				+ ", wCount=" + wCount + "]";
	}
	
	
	

}
