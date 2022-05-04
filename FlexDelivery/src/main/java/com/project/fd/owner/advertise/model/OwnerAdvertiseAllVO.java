package com.project.fd.owner.advertise.model;

public class OwnerAdvertiseAllVO {
	//광고 vo
	private int advertiseNo;
	private String advertiseName;
	private int advertisePrice;

	//광고 함 vo 
	private int storeadNo;
	private int storeNo;
	/* private int advertiseNo; */
	private String adValidate;
	private String AdPayFlag;
	
	//점포
	/* private int storeNo; */
	private int sAgreeNo; //관리자 승인번호
	
	//rownum
	private int rnum;


	
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	
	public int getAdvertiseNo() {
		return advertiseNo;
	}

	public void setAdvertiseNo(int advertiseNo) {
		this.advertiseNo = advertiseNo;
	}

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

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getAdValidate() {
		return adValidate;
	}

	public void setAdValidate(String adValidate) {
		this.adValidate = adValidate;
	}

	public String getAdPayFlag() {
		return AdPayFlag;
	}

	public void setAdPayFlag(String adPayFlag) {
		AdPayFlag = adPayFlag;
	}

	public int getsAgreeNo() {
		return sAgreeNo;
	}

	public void setsAgreeNo(int sAgreeNo) {
		this.sAgreeNo = sAgreeNo;
	}

	@Override
	public String toString() {
		return "OwnerAdvertiseAllVO [advertiseNo=" + advertiseNo + ", advertiseName=" + advertiseName
				+ ", advertisePrice=" + advertisePrice + ", storeadNo=" + storeadNo + ", storeNo=" + storeNo
				+ ", adValidate=" + adValidate + ", AdPayFlag=" + AdPayFlag + ", sAgreeNo=" + sAgreeNo + ", rnum="
				+ rnum + "]";
	}

	
	
	
	
	
	
}
