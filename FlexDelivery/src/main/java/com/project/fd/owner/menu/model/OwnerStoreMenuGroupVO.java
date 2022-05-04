package com.project.fd.owner.menu.model;


//메뉴 그룹 테이블 
public class OwnerStoreMenuGroupVO {
	private int sMGroupNo;
	private String sMGroupName;
	private int storeNo;
	public int getsMGroupNo() {
		return sMGroupNo;
	}
	public void setsMGroupNo(int sMGroupNo) {
		this.sMGroupNo = sMGroupNo;
	}
	public String getsMGroupName() {
		return sMGroupName;
	}
	public void setsMGroupName(String sMGroupName) {
		this.sMGroupName = sMGroupName;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	@Override
	public String toString() {
		return "StoreMenuGroupVO [sMGroupNo=" + sMGroupNo + ", sMGroupName=" + sMGroupName + ", storeNo=" + storeNo
				+ "]";
	}
	
	
}
