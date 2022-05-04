package com.project.fd.member.order.model;

import java.sql.Timestamp;

public class MemberOrderVO {
	  private int ordersNo;
	  private int ordersPrice;
	  private int memberNo;
	  private String memberName;
	  private String ordersPayment;
	  private Timestamp ordersPayEndDate;
	  private String ordersAddress;
	  private int ordersDiscount;
	  private String ordersMessage;
	  private String ordersHp;
	  private Timestamp ordersDate;
	  private int ordersDuration;
	  private int storeNo;
	  private int oStatusNo;
	  private String storeName;//주문내역에서 필요하여 추가
	  private String storeAddress; //주문내역에서 필요하여 추가
	  private String storeAddressDetail; //주문내역에서 필요하여 추가
	  private String storeLogo;//주문내역에서 필요하여 추가
	  
	
	
	public String getStoreLogo() {
		return storeLogo;
	}
	public void setStoreLogo(String storeLogo) {
		this.storeLogo = storeLogo;
	}
	public String getStoreAddressDetail() {
		return storeAddressDetail;
	}
	public void setStoreAddressDetail(String storeAddressDetail) {
		this.storeAddressDetail = storeAddressDetail;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
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
	public Timestamp getOrdersPayEndDate() {
		return ordersPayEndDate;
	}
	public void setOrdersPayEndDate(Timestamp ordersPayEndDate) {
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
	public String getOrdersHp() {
		return ordersHp;
	}
	public void setOrdersHp(String ordersHp) {
		this.ordersHp = ordersHp;
	}
	public Timestamp getOrdersDate() {
		return ordersDate;
	}
	public void setOrdersDate(Timestamp ordersDate) {
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
		return "MemberOrderVO [ordersNo=" + ordersNo + ", ordersPrice=" + ordersPrice + ", memberNo=" + memberNo
				+ ", memberName=" + memberName + ", ordersPayment=" + ordersPayment + ", ordersPayEndDate="
				+ ordersPayEndDate + ", ordersAddress=" + ordersAddress + ", ordersDiscount=" + ordersDiscount
				+ ", ordersMessage=" + ordersMessage + ", ordersHp=" + ordersHp + ", ordersDate=" + ordersDate
				+ ", ordersDuration=" + ordersDuration + ", storeNo=" + storeNo + ", oStatusNo=" + oStatusNo
				+ ", storeName=" + storeName + "]";
	}
	  
	  
}
