package com.project.fd.admin.ownerregister.model;

import java.sql.Timestamp;

public class AdminOwnerRegisterVo {
	private long		oRegisterNo;	//사업자등록증번호 Number
	private String		oRegisterFilename;	//변경후 파일이름 Varchar2(200 Byte)
	private String		oRegisterOriginalFilename;	//변경전 파일이름 Varchar2(200 Byte)
	private int			aAgreeNo;	//사업자등록증 승인플래그 Number
	private Timestamp	ownerregisterRegdate;	//사업자등록증 등록일 Date
	private	int			ownerNo;	//가맹점주 번호 Number
	private	String		ownerName;	//가맹점주 명 Varchar2(50 Byte)
	private	String		ownerHp1;	//Varchar2(3 Byte)
	private	String		ownerHp2;	//Varchar2(4 Byte)
	private	String		ownerHp3;	//Varchar2(4 Byte)
	private	Timestamp	ownerRegdate;	//가맹점주 등록일 Date
	private	int			authorityNo;	//가맹점주 권한플래그 Number
	public long getoRegisterNo() {
		return oRegisterNo;
	}
	public void setoRegisterNo(long oRegisterNo) {
		this.oRegisterNo = oRegisterNo;
	}
	public String getoRegisterFilename() {
		return oRegisterFilename;
	}
	public void setoRegisterFilename(String oRegisterFilename) {
		this.oRegisterFilename = oRegisterFilename;
	}
	public String getoRegisterOriginalFilename() {
		return oRegisterOriginalFilename;
	}
	public void setoRegisterOriginalFilename(String oRegisterOriginalFilename) {
		this.oRegisterOriginalFilename = oRegisterOriginalFilename;
	}
	public int getaAgreeNo() {
		return aAgreeNo;
	}
	public void setaAgreeNo(int aAgreeNo) {
		this.aAgreeNo = aAgreeNo;
	}
	public Timestamp getOwnerregisterRegdate() {
		return ownerregisterRegdate;
	}
	public void setOwnerregisterRegdate(Timestamp ownerregisterRegdate) {
		this.ownerregisterRegdate = ownerregisterRegdate;
	}
	public int getOwnerNo() {
		return ownerNo;
	}
	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getOwnerHp1() {
		return ownerHp1;
	}
	public void setOwnerHp1(String ownerHp1) {
		this.ownerHp1 = ownerHp1;
	}
	public String getOwnerHp2() {
		return ownerHp2;
	}
	public void setOwnerHp2(String ownerHp2) {
		this.ownerHp2 = ownerHp2;
	}
	public String getOwnerHp3() {
		return ownerHp3;
	}
	public void setOwnerHp3(String ownerHp3) {
		this.ownerHp3 = ownerHp3;
	}
	public Timestamp getOwnerRegdate() {
		return ownerRegdate;
	}
	public void setOwnerRegdate(Timestamp ownerRegdate) {
		this.ownerRegdate = ownerRegdate;
	}
	public int getAuthorityNo() {
		return authorityNo;
	}
	public void setAuthorityNo(int authorityNo) {
		this.authorityNo = authorityNo;
	}
	@Override
	public String toString() {
		return "AdminOwnerRegisterVo [oRegisterNo=" + oRegisterNo + ", oRegisterFilename=" + oRegisterFilename
				+ ", oRegisterOriginalFilename=" + oRegisterOriginalFilename + ", aAgreeNo=" + aAgreeNo
				+ ", ownerregisterRegdate=" + ownerregisterRegdate + ", ownerNo=" + ownerNo + ", ownerName=" + ownerName
				+ ", ownerHp1=" + ownerHp1 + ", ownerHp2=" + ownerHp2 + ", ownerHp3=" + ownerHp3 + ", ownerRegdate="
				+ ownerRegdate + ", authorityNo=" + authorityNo + "]";
	}
}
