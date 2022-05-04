package com.project.fd.admin.largecategory.model;

public class AdminLargeCategoryVO {
	private int lCategoryNo;
	private String lCategoryName;
	private String lCategoryFilename;
	
	public int getlCategoryNo() {
		return lCategoryNo;
	}
	public void setlCategoryNo(int lCategoryNo) {
		this.lCategoryNo = lCategoryNo;
	}
	public String getlCategoryName() {
		return lCategoryName;
	}
	public void setlCategoryName(String lCategoryName) {
		this.lCategoryName = lCategoryName;
	}
	public String getlCategoryFilename() {
		return lCategoryFilename;
	}
	public void setlCategoryFilename(String lCategoryFilename) {
		this.lCategoryFilename = lCategoryFilename;
	}
	
	@Override
	public String toString() {
		return "LargecategoryVO [lCategoryNo=" + lCategoryNo + ", lCategoryName=" + lCategoryName
				+ ", lCategoryFilename=" + lCategoryFilename + "]";
	}
	
	
}


