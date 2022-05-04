package com.project.fd.admin.adminagree.model;

public class AdminAgreeVO {
	private int aAgreeNo;
	private String aAgreeType;
	
	public int getaAgreeNo() {
		return aAgreeNo;
	}
	public void setaAgreeNo(int aAgreeNo) {
		this.aAgreeNo = aAgreeNo;
	}
	public String getaAgreeType() {
		return aAgreeType;
	}
	public void setaAgreeType(String aAgreeType) {
		this.aAgreeType = aAgreeType;
	}
	
	@Override
	public String toString() {
		return "AdminAgreeVO [aAgreeNo=" + aAgreeNo + ", aAgreeType=" + aAgreeType + "]";
	}
	
	
}
