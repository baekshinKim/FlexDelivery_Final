package com.project.fd.owner.common;

public class LocationVO {
	private int locationNo;/* 지역코드번호 */
	private String locationName;
	
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	@Override
	public String toString() {
		return "LocationVO [locationNo=" + locationNo + ", locationName=" + locationName + "]";
	}
	
	
}
