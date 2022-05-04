package com.project.fd.member.order.model;

public class MemberOrderDetailVO {
	private int ordersNo;
	private int menuNo;
	private int mOptionNo;
	private int oDetailQty;
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
	@Override
	public String toString() {
		return "MemberOrderDetailVO [ordersNo=" + ordersNo + ", menuNo=" + menuNo + ", mOptionNo=" + mOptionNo
				+ ", oDetailQty=" + oDetailQty + "]";
	}
	
	
}
