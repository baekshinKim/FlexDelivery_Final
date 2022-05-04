package com.project.fd.admin.temporary.model;

import java.sql.Timestamp;

public class AdminTemporaryVO {
	private int tNo;// number not null, /* 임시저장번호 */
	private int storeNo;// number not null, /* 점포번호 */
	private String tStoresName;// varchar2(150) not null, /* 변경점포명 */
	private String tStoresAddress;// varchar2(300) not null, /* 변경점포주소 */
	private String tStoresAddressDetail;// varchar2(200) not null, /* 변경점포상세주소 */
	private int locationNo;// number not null, /* 지역코드번호 */
	private long oRegisterNo;// number not null, /* 사업자등록번호 */
	private String tFilename;// varchar2(200) not null, /* 변경사업자등록증파일이름 */
	private String tOriginalFilename;// varchar2(200) not null, /* 변경사업자등록증원본파일이름 */
	private int ownerNo; //number not null, /* 점주번호 */
	private String tOwnerName;// varchar2(50) not null, /* 변경점주이름 */
	private String tOwnerHp1;// varchar2(3) not null, /* 변경점주연락처1 */
	private String tOwnerHp2;// varchar2(4) not null, /* 변경점주연락처2 */
	private String tOwnerHp3;// varchar2(4) not null, /* 변경점주연락처3 */
	private String tDetail;// varchar2(2000) not null, /* 변경내용상세 */
	private Timestamp tRegdate;// date default sysdate not null, /* 변경신청일 */
	private Timestamp tSubmitdate;// date, /* 변경승인일 */
	private int aAgreeNo;// number default 1 not null /* 관리자승인번호 */
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String gettStoresName() {
		return tStoresName;
	}
	public void settStoresName(String tStoresName) {
		this.tStoresName = tStoresName;
	}
	public String gettStoresAddress() {
		return tStoresAddress;
	}
	public void settStoresAddress(String tStoresAddress) {
		this.tStoresAddress = tStoresAddress;
	}
	public String gettStoresAddressDetail() {
		return tStoresAddressDetail;
	}
	public void settStoresAddressDetail(String tStoresAddressDetail) {
		this.tStoresAddressDetail = tStoresAddressDetail;
	}
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}
	public long getoRegisterNo() {
		return oRegisterNo;
	}
	public void setoRegisterNo(long oRegisterNo) {
		this.oRegisterNo = oRegisterNo;
	}
	public String gettFilename() {
		return tFilename;
	}
	public void settFilename(String tFilename) {
		this.tFilename = tFilename;
	}
	public String gettOriginalFilename() {
		return tOriginalFilename;
	}
	public void settOriginalFilename(String tOriginalFilename) {
		this.tOriginalFilename = tOriginalFilename;
	}
	public int getOwnerNo() {
		return ownerNo;
	}
	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}
	public String gettOwnerName() {
		return tOwnerName;
	}
	public void settOwnerName(String tOwnerName) {
		this.tOwnerName = tOwnerName;
	}
	public String gettOwnerHp1() {
		return tOwnerHp1;
	}
	public void settOwnerHp1(String tOwnerHp1) {
		this.tOwnerHp1 = tOwnerHp1;
	}
	public String gettOwnerHp2() {
		return tOwnerHp2;
	}
	public void settOwnerHp2(String tOwnerHp2) {
		this.tOwnerHp2 = tOwnerHp2;
	}
	public String gettOwnerHp3() {
		return tOwnerHp3;
	}
	public void settOwnerHp3(String tOwnerHp3) {
		this.tOwnerHp3 = tOwnerHp3;
	}
	public String gettDetail() {
		return tDetail;
	}
	public void settDetail(String tDetail) {
		this.tDetail = tDetail;
	}
	public Timestamp gettRegdate() {
		return tRegdate;
	}
	public void settRegdate(Timestamp tRegdate) {
		this.tRegdate = tRegdate;
	}
	public Timestamp gettSubmitdate() {
		return tSubmitdate;
	}
	public void settSubmitdate(Timestamp tSubmitdate) {
		this.tSubmitdate = tSubmitdate;
	}
	public int getaAgreeNo() {
		return aAgreeNo;
	}
	public void setaAgreeNo(int aAgreeNo) {
		this.aAgreeNo = aAgreeNo;
	}
	@Override
	public String toString() {
		return "AdminTemporaryVO [tNo=" + tNo + ", storeNo=" + storeNo + ", tStoresName=" + tStoresName
				+ ", tStoresAddress=" + tStoresAddress + ", tStoresAddressDetail=" + tStoresAddressDetail
				+ ", locationNo=" + locationNo + ", oRegisterNo=" + oRegisterNo + ", tFilename=" + tFilename
				+ ", tOriginalFilename=" + tOriginalFilename + ", ownerNo=" + ownerNo + ", tOwnerName=" + tOwnerName
				+ ", tOwnerHp1=" + tOwnerHp1 + ", tOwnerHp2=" + tOwnerHp2 + ", tOwnerHp3=" + tOwnerHp3 + ", tDetail="
				+ tDetail + ", tRegdate=" + tRegdate + ", tSubmitdate=" + tSubmitdate + ", aAgreeNo=" + aAgreeNo + "]";
	}
}
