package com.project.fd.admin.faq.model;

public class AdminFaqCategoryVO {
	private int fCategoryNo;
	private String fCategoryName;
	private int authorityNo;
	
	public int getfCategoryNo() {
		return fCategoryNo;
	}
	public void setfCategoryNo(int fCategoryNo) {
		this.fCategoryNo = fCategoryNo;
	}
	public String getfCategoryName() {
		return fCategoryName;
	}
	public void setfCategoryName(String fCategoryName) {
		this.fCategoryName = fCategoryName;
	}
	public int getAuthorityNo() {
		return authorityNo;
	}
	public void setAuthorityNo(int authorityNo) {
		this.authorityNo = authorityNo;
	}
	
	@Override
	public String toString() {
		return "FaqCategoryVO [fCategoryNo=" + fCategoryNo + ", fCategoryName=" + fCategoryName + ", authorityNo="
				+ authorityNo + "]";
	}
	
	
}
