package com.project.fd.owner.ownerregister.model;

public class OwnerRegisterVO extends OwnerAgreeCategory {
	private long oRegisterNo; /* 사업자등록번호 */
	private String oRegisterFileName; /* 사업자등록증파일이름 */
	private String oRegisterOriginalFileName;/* 사업자등록증원본파일이름 */
	private int aAgreeNo;  /* 관리자승인번호 fk */
	private int ownerNo; /* 점주번호 fk*/
	
	// 데이트로 언제 승인 받았는지
	private String  ownerregisterRegdate;
	
	
	
	public String getOwnerregisterRegdate() {
		return ownerregisterRegdate;
	}
	public void setOwnerregisterRegdate(String ownerregisterRegdate) {
		this.ownerregisterRegdate = ownerregisterRegdate;
	}
	public long getoRegisterNo() {
		return oRegisterNo;
	}
	public void setoRegisterNo(long oRegisterNo) {
		this.oRegisterNo = oRegisterNo;
	}
	public String getoRegisterFileName() {
		return oRegisterFileName;
	}
	public void setoRegisterFileName(String oRegisterFileName) {
		this.oRegisterFileName = oRegisterFileName;
	}
	public String getoRegisterOriginalFileName() {
		return oRegisterOriginalFileName;
	}
	public void setoRegisterOriginalFileName(String oRegisterOriginalFileName) {
		this.oRegisterOriginalFileName = oRegisterOriginalFileName;
	}
	public int getaAgreeNo() {
		return aAgreeNo;
	}
	public void setaAgreeNo(int aAgreeNo) {
		this.aAgreeNo = aAgreeNo;
	}
	public int getOwnerNo() {
		return ownerNo;
	}
	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}
	@Override
	public String toString() {
		return "OwnerRegisterVO [oRegisterNo=" + oRegisterNo + ", oRegisterFileName=" + oRegisterFileName
				+ ", oRegisterOriginalFileName=" + oRegisterOriginalFileName + ", aAgreeNo=" + aAgreeNo + ", ownerNo="
				+ ownerNo + ", ownerregisterRegdate=" + ownerregisterRegdate + "]";
	}
	
	
}
