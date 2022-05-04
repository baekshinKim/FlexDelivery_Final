package com.project.fd.owner.advertise.model;

import com.project.fd.common.SearchVO;

public class OwnerAdvertiseSearchVO extends SearchVO{
	private int storeNo;
	private String startDay;
	private String endDay;
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	
	@Override
	public String toString() {
		return "OwnerAdvertiseSearchVO [storeNo=" + storeNo + ", startDay=" + startDay + ", endDay=" + endDay + "]";
	}

	
}
