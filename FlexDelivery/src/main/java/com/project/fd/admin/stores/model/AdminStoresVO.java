package com.project.fd.admin.stores.model;

import java.sql.Timestamp;

public class AdminStoresVO {
	private int storeNo; //점포등록신청번호
	private Timestamp storeRegdate; //점포등록신청일
	private long oRegisterNo; //사업자등록증 번호
	private String ownerName; //점주명
	private String storeName; //점포명
	private String storeAddress; //점포주소
	private String storeAddressDetail; //점포상세주소
	private String ownerHp1; //점주전화번호1
	private String ownerHp2; //점주전화번호2
	private String ownerHp3; //점주전화번호3
	private String storeContent;//점포요청사항
	private int aAgreeNo; //승인관리번호
	private String oRegisterFilename;	// 변경후 파일이름varchar2(200 byte)
	private String oRegisterOriginalFilename;//변경전 파일이름	varchar2(200 byte)
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public Timestamp getStoreRegdate() {
		return storeRegdate;
	}
	public void setStoreRegdate(Timestamp storeRegdate) {
		this.storeRegdate = storeRegdate;
	}
	public long getoRegisterNo() {
		return oRegisterNo;
	}
	public void setoRegisterNo(long oRegisterNo) {
		this.oRegisterNo = oRegisterNo;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public String getStoreAddressDetail() {
		return storeAddressDetail;
	}
	public void setStoreAddressDetail(String storeAddressDetail) {
		this.storeAddressDetail = storeAddressDetail;
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
	public String getStoreContent() {
		return storeContent;
	}
	public void setStoreContent(String storeContent) {
		this.storeContent = storeContent;
	}
	public int getaAgreeNo() {
		return aAgreeNo;
	}
	public void setaAgreeNo(int aAgreeNo) {
		this.aAgreeNo = aAgreeNo;
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
	@Override
	public String toString() {
		return "AdminStoresVO [storeNo=" + storeNo + ", storeRegdate=" + storeRegdate + ", oRegisterNo=" + oRegisterNo
				+ ", ownerName=" + ownerName + ", storeName=" + storeName + ", storeAddress=" + storeAddress
				+ ", storeAddressDetail=" + storeAddressDetail + ", ownerHp1=" + ownerHp1 + ", ownerHp2=" + ownerHp2
				+ ", ownerHp3=" + ownerHp3 + ", storeContent=" + storeContent + ", aAgreeNo=" + aAgreeNo
				+ ", oRegisterFilename=" + oRegisterFilename + ", oRegisterOriginalFilename="
				+ oRegisterOriginalFilename + "]";
	}		
}
