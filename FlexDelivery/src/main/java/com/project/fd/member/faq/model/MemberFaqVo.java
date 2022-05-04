package com.project.fd.member.faq.model;

public class MemberFaqVo {

	private int faqNo;
	private String faqQ;
	private String faqA;
	private int fCategoryNo;
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqQ() {
		return faqQ;
	}
	public void setFaqQ(String faqQ) {
		this.faqQ = faqQ;
	}
	public String getFaqA() {
		return faqA;
	}
	public void setFaqA(String faqA) {
		this.faqA = faqA;
	}
	public int getfCategoryNo() {
		return fCategoryNo;
	}
	public void setfCategoryNo(int fCategoryNo) {
		this.fCategoryNo = fCategoryNo;
	}
	@Override
	public String toString() {
		return "MemberFaqVo [faqNo=" + faqNo + ", faqQ=" + faqQ + ", faqA=" + faqA + ", fCategoryNo=" + fCategoryNo
				+ "]";
	}
	
	
}
