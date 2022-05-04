package com.project.fd.member.cart.model;

public class MemberCartViewVO {
	private int cartNo;
	private int storeNo;
	private int menuNo;
	private int mOptionNo;
	private int memberNo;
	private int cartQty;
	private String storeName;
	private String cartRegdate;
	private String mOptionName;
	private int mOptionPrice;
	private String menuName;
	private int menuPrice;
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
	@Override
	public String toString() {
		return "MemberCartViewVO [cartNo=" + cartNo + ", storeNo=" + storeNo + ", menuNo=" + menuNo + ", mOptionNo="
				+ mOptionNo + ", memberNo=" + memberNo + ", cartQty=" + cartQty + ", storeName=" + storeName
				+ ", cartRegdate=" + cartRegdate + ", mOptionName=" + mOptionName + ", mOptionPrice=" + mOptionPrice
				+ ", menuName=" + menuName + ", menuPrice=" + menuPrice + "]";
	}
	
	
}
