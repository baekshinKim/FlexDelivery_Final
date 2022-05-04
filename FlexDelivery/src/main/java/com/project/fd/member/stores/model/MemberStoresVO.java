package com.project.fd.member.stores.model;

public class MemberStoresVO {
	/*NOT NULL*/
	//private OwnerStoresFormVO ownerStoresFormVo;
	private int storeNo;
	private String storeName; /* 점포명 */
	private String storeLogo;/* 점포로고이미지 */
	private String storeAddress;/* 점포주소 */
	private String storeAddressDetail; /* 점포상세주소 */
	
	//널 
	private String storeContent; /* 점포소개 */

	private String storeRegdate;/* 점포등록일 */
	private String storeOutdate; /* 점포탈퇴일 */
	private String storeOpenTime; /* 점포오픈시간 */
	private String storeCloseTime ; /* 점포마감시간 */
	private int storeMinPrice;/* 최소주문금액 */
	
	
	/*포린키*/
	private int lCategoryNo;  /* 대분류카테고리번호 */
	private int locationNo;  /* 지역코드번호 */
	private int sStatusNo;  /* 점포영업상태번호1 */
	private int hCategoryNo; /* 휴무요일번호 7*/
	
	private int aAgreeNo; /* 관리자승인번호 */
	private int ownerNo; /* 점주번호 */
	private long oRegisterNo;/* 사업자등록번호 */
	
	private int reviewCount; /* 리뷰 갯수 */
	private int couponExist;	/* 점포 쿠폰함에 있는 쿠폰갯수 , 0이상이면 쿠폰 사용중임 */
	private double reviewRating; /* 리뷰 평점 평균  */
	
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getCouponExist() {
		return couponExist;
	}
	public void setCouponExist(int couponExist) {
		this.couponExist = couponExist;
	}
	public double getReviewRating() {
		return reviewRating;
	}
	public void setReviewRating(double reviewRating) {
		this.reviewRating = reviewRating;
	}

	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreLogo() {
		return storeLogo;
	}
	public void setStoreLogo(String storeLogo) {
		this.storeLogo = storeLogo;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public String getStoreAddressDetail() {
		return storeAddressDetail;
	}
	public void setStoreAddressDetail(String storeAddressDetail) {
		this.storeAddressDetail = storeAddressDetail;
	}
	public String getStoreRegdate() {
		return storeRegdate;
	}
	public void setStoreRegdate(String storeRegdate) {
		this.storeRegdate = storeRegdate;
	}
	public String getStoreContent() {
		return storeContent;
	}
	public void setStoreContent(String storeContent) {
		this.storeContent = storeContent;
	}
	public String getStoreOutdate() {
		return storeOutdate;
	}
	public void setStoreOutdate(String storeOutdate) {
		this.storeOutdate = storeOutdate;
	}
	public String getStoreOpenTime() {
		return storeOpenTime;
	}
	public void setStoreOpenTime(String storeOpenTime) {
		this.storeOpenTime = storeOpenTime;
	}
	public String getStoreCloseTime() {
		return storeCloseTime;
	}
	public void setStoreCloseTime(String storeCloseTime) {
		this.storeCloseTime = storeCloseTime;
	}
	public int getStoreMinPrice() {
		return storeMinPrice;
	}
	public void setStoreMinPrice(int storeMinPrice) {
		this.storeMinPrice = storeMinPrice;
	}
	public int getOwnerNo() {
		return ownerNo;
	}
	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}
	public int getlCategoryNo() {
		return lCategoryNo;
	}
	public void setlCategoryNo(int lCategoryNo) {
		this.lCategoryNo = lCategoryNo;
	}
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}
	public int getsStatusNo() {
		return sStatusNo;
	}
	public void setsStatusNo(int sStatusNo) {
		this.sStatusNo = sStatusNo;
	}
	public int gethCategoryNo() {
		return hCategoryNo;
	}
	public void sethCategoryNo(int hCategoryNo) {
		this.hCategoryNo = hCategoryNo;
	}
	public int getaAgreeNo() {
		return aAgreeNo;
	}
	public void setaAgreeNo(int aAgreeNo) {
		this.aAgreeNo = aAgreeNo;
	}
	public long getoRegisterNo() {
		return oRegisterNo;
	}
	public void setoRegisterNo(long oRegisterNo) {
		this.oRegisterNo = oRegisterNo;
	}
	@Override
	public String toString() {
		return "MemberStoresVO [storeNo=" + storeNo + ", storeName=" + storeName + ", storeLogo=" + storeLogo
				+ ", storeAddress=" + storeAddress + ", storeAddressDetail=" + storeAddressDetail + ", storeContent="
				+ storeContent + ", storeRegdate=" + storeRegdate + ", storeOutdate=" + storeOutdate
				+ ", storeOpenTime=" + storeOpenTime + ", storeCloseTime=" + storeCloseTime + ", storeMinPrice="
				+ storeMinPrice + ", lCategoryNo=" + lCategoryNo + ", locationNo=" + locationNo + ", sStatusNo="
				+ sStatusNo + ", hCategoryNo=" + hCategoryNo + ", aAgreeNo=" + aAgreeNo + ", ownerNo=" + ownerNo
				+ ", oRegisterNo=" + oRegisterNo + ", reviewCount=" + reviewCount + ", couponExist=" + couponExist
				+ ", reviewRating=" + reviewRating + "]";
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
}
