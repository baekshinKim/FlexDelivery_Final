package com.project.fd.member.cart.model;

public class MemberCartVO {
	private int cartNo;
	private int storeNo;
	private int menuNo;
	private int mOptionNo;
	private int memberNo;
	private int cartQty;
	private String storeName;
	private String cartRegdate;
	
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getCartQty() {
		return cartQty;
	}
	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getCartRegdate() {
		return cartRegdate;
	}
	public void setCartRegdate(String cartRegdate) {
		this.cartRegdate = cartRegdate;
	}
	@Override
	public String toString() {
		return "MemberCartVO [cartNo=" + cartNo + ", storeNo=" + storeNo + ", menuNo=" + menuNo + ", mOptionNo="
				+ mOptionNo + ", memberNo=" + memberNo + ", cartQty=" + cartQty + ", storeName=" + storeName
				+ ", cartRegdate=" + cartRegdate + "]";
	}
	
	
}
