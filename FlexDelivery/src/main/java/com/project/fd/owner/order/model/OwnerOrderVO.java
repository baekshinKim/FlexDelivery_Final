package com.project.fd.owner.order.model;

public class OwnerOrderVO {
	private int ordersNo;
	private int ordersPrice;
	private int memberNo;
	private String memberName;
	private String ordersPayment;
	private String ordersPayEndDate;
	private String ordersAddress;
	private int ordersDiscount;
	private String ordersMessage;
	private String ordersDate;
	private int ordersDuration;
	private int storeNo;
	private int oStatusNo;
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	public int getOrdersPrice() {
		return ordersPrice;
	}
	public void setOrdersPrice(int ordersPrice) {
		this.ordersPrice = ordersPrice;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getOrdersPayment() {
		return ordersPayment;
	}
	public void setOrdersPayment(String ordersPayment) {
		this.ordersPayment = ordersPayment;
	}
	public String getOrdersPayEndDate() {
		return ordersPayEndDate;
	}
	public void setOrdersPayEndDate(String ordersPayEndDate) {
		this.ordersPayEndDate = ordersPayEndDate;
	}
	public String getOrdersAddress() {
		return ordersAddress;
	}
	public void setOrdersAddress(String ordersAddress) {
		this.ordersAddress = ordersAddress;
	}
	public int getOrdersDiscount() {
		return ordersDiscount;
	}
	public void setOrdersDiscount(int ordersDiscount) {
		this.ordersDiscount = ordersDiscount;
	}
	public String getOrdersMessage() {
		return ordersMessage;
	}
	public void setOrdersMessage(String ordersMessage) {
		this.ordersMessage = ordersMessage;
	}
	public String getOrdersDate() {
		return ordersDate;
	}
	public void setOrdersDate(String ordersDate) {
		this.ordersDate = ordersDate;
	}
	public int getOrdersDuration() {
		return ordersDuration;
	}
	public void setOrdersDuration(int ordersDuration) {
		this.ordersDuration = ordersDuration;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public int getoStatusNo() {
		return oStatusNo;
	}
	public void setoStatusNo(int oStatusNo) {
		this.oStatusNo = oStatusNo;
	}
	@Override
	public String toString() {
		return "OwnerOrderVO [ordersNo=" + ordersNo + ", ordersPrice=" + ordersPrice + ", memberNo=" + memberNo
				+ ", memberName=" + memberName + ", ordersPayment=" + ordersPayment + ", ordersPayEndDate="
				+ ordersPayEndDate + ", ordersAddress=" + ordersAddress + ", ordersDiscount=" + ordersDiscount
				+ ", ordersMessage=" + ordersMessage + ", ordersDate=" + ordersDate + ", ordersDuration="
				+ ordersDuration + ", storeNo=" + storeNo + ", oStatusNo=" + oStatusNo + "]";
	}
	
	
	
	

}
