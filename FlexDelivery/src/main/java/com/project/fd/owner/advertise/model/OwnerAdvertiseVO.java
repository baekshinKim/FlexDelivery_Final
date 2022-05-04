package com.project.fd.owner.advertise.model;

public class OwnerAdvertiseVO {
	private int advertiseNo;
	private String advertiseName;
	private int advertisePrice;
	
	
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
	
	@Override
	public String toString() {
		return "AdvertiseVO [advertiseNo=" + advertiseNo + ", advertiseName=" + advertiseName + ", advertisePrice="
				+ advertisePrice + "]";
	}
	
	
}
