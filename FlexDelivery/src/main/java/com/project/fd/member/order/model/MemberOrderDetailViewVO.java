package com.project.fd.member.order.model;

public class MemberOrderDetailViewVO {
	private int ordersNo;
	private int menuNo;
	private int mOptionNo;
	private int oDetailQty;
	private String menuName;
	private int menuPrice;
	private String mOptionName;
	private int mOptionPrice;
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public int getmOptionNo() {
		return mOptionNo;
	}
	public void setmOptionNo(int mOptionNo) {
		this.mOptionNo = mOptionNo;
	}
	public int getoDetailQty() {
		return oDetailQty;
	}
	public void setoDetailQty(int oDetailQty) {
		this.oDetailQty = oDetailQty;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getmOptionName() {
		return mOptionName;
	}
	public void setmOptionName(String mOptionName) {
		this.mOptionName = mOptionName;
	}
	public int getmOptionPrice() {
		return mOptionPrice;
	}
	public void setmOptionPrice(int mOptionPrice) {
		this.mOptionPrice = mOptionPrice;
	}
	@Override
	public String toString() {
		return "MemberOrderDetailViewVO [ordersNo=" + ordersNo + ", menuNo=" + menuNo + ", mOptionNo=" + mOptionNo
				+ ", oDetailQty=" + oDetailQty + ", menuName=" + menuName + ", menuPrice=" + menuPrice
				+ ", mOptionName=" + mOptionName + ", mOptionPrice=" + mOptionPrice + "]";
	}
	
	
}
