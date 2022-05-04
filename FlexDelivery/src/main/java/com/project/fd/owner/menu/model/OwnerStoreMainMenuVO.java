package com.project.fd.owner.menu.model;


//음식 대표메뉴 테이블
public class OwnerStoreMainMenuVO {
	private int storeNo;
	private int menuNo;
	private int mCategoryNo;
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
	public int getmCategoryNo() {
		return mCategoryNo;
	}
	public void setmCategoryNo(int mCategoryNo) {
		this.mCategoryNo = mCategoryNo;
	}
	@Override
	public String toString() {
		return "StoreMainMenuVO [storeNo=" + storeNo + ", menuNo=" + menuNo + ", mCategoryNo=" + mCategoryNo + "]";
	}
	
	
	
	
}
