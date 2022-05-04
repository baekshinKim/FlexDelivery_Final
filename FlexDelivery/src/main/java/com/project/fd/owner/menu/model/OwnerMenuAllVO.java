package com.project.fd.owner.menu.model;


//메뉴 + 메뉴그룹 + 점포 뷰 작성 VO
//따로따로 꺼내는게 아니기때문에 resultMap 은 아닌것같아서.. 일단은 뷰! 내가 잘못알고있는거면
//나중에 수정하기! 
public class OwnerMenuAllVO {
	//메뉴
	private int menuNo;
	private String menuName;
	private int menuPrice;
	private String menuImg;
	private String menuContent;
	private int sMGroupNo; 
	
	//메뉴그룹번호
	//private int sMGroupNo;
	private String sMGroupName;
	private int storeNo;
	

	//점포
	//private int storeNo;
	private int lCategoryNo;
	private int aAgreeNo;
	
	//번호
	private int rnum;
	
	
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
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
	public int getlCategoryNo() {
		return lCategoryNo;
	}
	public void setlCategoryNo(int lCategoryNo) {
		this.lCategoryNo = lCategoryNo;
	}
	public int getaAgreeNo() {
		return aAgreeNo;
	}
	public void setaAgreeNo(int aAgreeNo) {
		this.aAgreeNo = aAgreeNo;
	}
	@Override
	public String toString() {
		return "OwnerMenuAllVO [menuNo=" + menuNo + ", menuName=" + menuName + ", menuPrice=" + menuPrice + ", menuImg="
				+ menuImg + ", menuContent=" + menuContent + ", sMGroupNo=" + sMGroupNo + ", sMGroupName=" + sMGroupName
				+ ", storeNo=" + storeNo + ", lCategoryNo=" + lCategoryNo + ", aAgreeNo=" + aAgreeNo + ", rnum=" + rnum
				+ "]";
	}
	
	
	
	
}