package com.project.fd.member.menu.model;

public class MemberMenuVO {
	private int menuNo;
	private String menuName;
	private int menuPrice;
	private String menuImg;
	private String menuContent;
	private int sMGroupNo;
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
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
	public String getMenuImg() {
		return menuImg;
	}
	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}
	public String getMenuContent() {
		return menuContent;
	}
	public void setMenuContent(String menuContent) {
		this.menuContent = menuContent;
	}
	public int getsMGroupNo() {
		return sMGroupNo;
	}
	public void setsMGroupNo(int sMGroupNo) {
		this.sMGroupNo = sMGroupNo;
	}
	@Override
	public String toString() {
		return "MemberMenuVO [menuNo=" + menuNo + ", menuName=" + menuName + ", menuPrice=" + menuPrice + ", menuImg="
				+ menuImg + ", menuContent=" + menuContent + ", sMGroupNo=" + sMGroupNo + ", menuOptionList="
				+  "]";
	}
	
	
}
