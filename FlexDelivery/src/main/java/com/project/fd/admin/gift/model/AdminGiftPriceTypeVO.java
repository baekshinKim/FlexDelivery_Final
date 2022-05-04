package com.project.fd.admin.gift.model;

public class AdminGiftPriceTypeVO {
	private int gPTypeNo;
	private int gPTypePrice;
	
	public int getgPTypeNo() {
		return gPTypeNo;
	}
	public void setgPTypeNo(int gPTypeNo) {
		this.gPTypeNo = gPTypeNo;
	}
	public int getgPTypePrice() {
		return gPTypePrice;
	}
	public void setgPTypePrice(int gPTypePrice) {
		this.gPTypePrice = gPTypePrice;
	}
	
	
	@Override
	public String toString() {
		return "GiftPriceTypeVO [gPTypeNo=" + gPTypeNo + ", gPTypePrice=" + gPTypePrice + "]";
	}
	
	
	
}
