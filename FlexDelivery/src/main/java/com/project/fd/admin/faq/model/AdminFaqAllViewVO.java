package com.project.fd.admin.faq.model;

public class AdminFaqAllViewVO {
	//FAQ VO
	private int faqNo;
	private String faqQ;
	private String faqA;

	//FAQ 카테고리 VO
	private int fCategoryNo;
	private String fCategoryName;
	private int authorityNo;
	public int getFaqNo() {
		return faqNo;
	}
	public String getFaqQ() {
		return faqQ;
	}
	public String getFaqA() {
		return faqA;
	}
	public int getfCategoryNo() {
		return fCategoryNo;
	}
	public String getfCategoryName() {
		return fCategoryName;
	}
	public int getAuthorityNo() {
		return authorityNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public void setFaqQ(String faqQ) {
		this.faqQ = faqQ;
	}
	public void setFaqA(String faqA) {
		this.faqA = faqA;
	}
	public void setfCategoryNo(int fCategoryNo) {
		this.fCategoryNo = fCategoryNo;
	}
	public void setfCategoryName(String fCategoryName) {
		this.fCategoryName = fCategoryName;
	}
	public void setAuthorityNo(int authorityNo) {
		this.authorityNo = authorityNo;
	}
	
	@Override
	public String toString() {
		return "AdminFaqAllViewVO [faqNo=" + faqNo + ", faqQ=" + faqQ + ", faqA=" + faqA + ", fCategoryNo="
				+ fCategoryNo + ", fCategoryName=" + fCategoryName + ", authorityNo=" + authorityNo + "]";
	}
	
	
}
