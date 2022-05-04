package com.project.fd.owner.advertise.model;

public class OwnerStoreAdVO {
	private int storeadNo;
	private int storeNo;
	private int advertiseNo;
	private String adValidate;
	private String AdPayFlag;
	
	private String storeadRegdate; /* 광고 신청한 날짜  */
	
	public String getStoreadRegdate() {
		return storeadRegdate;
	}
	public void setStoreadRegdate(String storeadRegdate) {
		this.storeadRegdate = storeadRegdate;
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
	public int getAdvertiseNo() {
		return advertiseNo;
	}
	public void setAdvertiseNo(int advertiseNo) {
		this.advertiseNo = advertiseNo;
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
	@Override
	public String toString() {
		return "OwnerStoreAdVO [storeadNo=" + storeadNo + ", storeNo=" + storeNo + ", advertiseNo=" + advertiseNo
				+ ", adValidate=" + adValidate + ", AdPayFlag=" + AdPayFlag + ", storeadRegdate=" + storeadRegdate
				+ "]";
	}
	
	
	
	
	
}
