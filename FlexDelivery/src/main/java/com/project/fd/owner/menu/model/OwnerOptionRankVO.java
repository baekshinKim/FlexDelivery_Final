package com.project.fd.owner.menu.model;


//메뉴 옵션 그룹 테이블
public class OwnerOptionRankVO {
	private int oRankNo;
	private String oRankName;
	public int getoRankNo() {
		return oRankNo;
	}
	public void setoRankNo(int oRankNo) {
		this.oRankNo = oRankNo;
	}
	public String getoRankName() {
		return oRankName;
	}
	public void setoRankName(String oRankName) {
		this.oRankName = oRankName;
	}
	@Override
	public String toString() {
		return "OptionRankVO [oRankNo=" + oRankNo + ", oRankName=" + oRankName + "]";
	}
	
	
	
}
