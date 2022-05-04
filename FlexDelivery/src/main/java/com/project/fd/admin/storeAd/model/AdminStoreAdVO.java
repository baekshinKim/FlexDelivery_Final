package com.project.fd.admin.storeAd.model;

import java.sql.Timestamp;

public class AdminStoreAdVO {
	private String 		advertiseName; 	//광고명 varchar2(100 byte)
	private int 		advertisePrice;	//광고가격 number
	private int 		storeadNo;  //광고접수번호	number
	private Timestamp	adValidate;	//광고유효일 date
	private String 		adPayFlag;	//varchar2(10 byte)
	private Timestamp	storeadRegdate;	// 광고신청,등록일 date
	private String		storeName;	//점포명 varchar2(150 byte)
	private	String		storeAddress;	//점포주소 varchar2(300 byte)
	private	String		storeAddressDetail;	//점포상세주소 varchar2(200 byte)
	public String getAdvertiseName() {
		return advertiseName;
	}
	public void setAdvertiseName(String advertiseName) {
		this.advertiseName = advertiseName;
	}
	public int getAdvertisePrice() {
		return advertisePrice;
	}
	public void setAdvertisePrice(int advertisePrice) {
		this.advertisePrice = advertisePrice;
	}
	public int getStoreadNo() {
		return storeadNo;
	}
	public void setStoreadNo(int storeadNo) {
		this.storeadNo = storeadNo;
	}
	public Timestamp getAdValidate() {
		return adValidate;
	}
	public void setAdValidate(Timestamp adValidate) {
		this.adValidate = adValidate;
	}
	public String getAdPayFlag() {
		return adPayFlag;
	}
	public void setAdPayFlag(String adPayFlag) {
		this.adPayFlag = adPayFlag;
	}
	public Timestamp getStoreadRegdate() {
		return storeadRegdate;
	}
	public void setStoreadRegdate(Timestamp storeadRegdate) {
		this.storeadRegdate = storeadRegdate;
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
	@Override
	public String toString() {
		return "AdminStoreAdVO [advertiseName=" + advertiseName + ", advertisePrice=" + advertisePrice + ", storeadNo="
				+ storeadNo + ", adValidate=" + adValidate + ", adPayFlag=" + adPayFlag + ", storeadRegdate="
				+ storeadRegdate + ", storeName=" + storeName + ", storeAddress=" + storeAddress
				+ ", storeAddressDetail=" + storeAddressDetail + "]";
	}
}
