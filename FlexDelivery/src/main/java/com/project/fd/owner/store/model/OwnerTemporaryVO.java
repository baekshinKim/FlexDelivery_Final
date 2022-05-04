package com.project.fd.owner.store.model;

public class OwnerTemporaryVO {
	private int tNo ; /* 임시저장번호 */
	// session 
	private int storeNo; /* 점포번호 */
	private int ownerno;/* 점주번호 */
	
	// ownerregister table
	private long oRegisterNo ;/* 사업자등록번호 */
	private String tFileName ; /* 변경사업자등록증파일이름 */
	private String tOriginalFileName; /* 변경사업자등록증원본파일이름 */
	
	// stores table 
	private String tStoreName; /* 변경점포명 */
	private String tStoreAddress ; /* 변경점포주소 */
	private String tStoreAddressDetail; /* 변경점포상세주소 */
	private int locationNo ;/* 지역코드번호 */
	
	// owner table 
	private String tOwnerName ;/* 변경점주이름 */
	private String tOwnerHp1 ;/* 변경점주연락처1 */
	private String tOwnerHp2 ; /* 변경점주연락처2 */
	private String tOwnerHp3 ; /* 변경점주연락처3 */
	
	// 관리자용 
	private String tDetail ;/* 변경내용상세 */
	private String tRegdate ;/* 변경신청일 */
	private String tSubmitDate;/* 변경승인일 */
	private int aAgreeNo; /* 관리자승인번호 */
	
//	지역 이름  대분류 카테고리 네암 
	private String locationName;
	private String lCategoryName;
	
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public int getOwnerno() {
		return ownerno;
	}
	public void setOwnerno(int ownerno) {
		this.ownerno = ownerno;
	}
	public long getoRegisterNo() {
		return oRegisterNo;
	}
	public void setoRegisterNo(long oRegisterNo) {
		this.oRegisterNo = oRegisterNo;
	}
	public String gettFileName() {
		return tFileName;
	}
	public void settFileName(String tFileName) {
		this.tFileName = tFileName;
	}
	public String gettOriginalFileName() {
		return tOriginalFileName;
	}
	public void settOriginalFileName(String tOriginalFileName) {
		this.tOriginalFileName = tOriginalFileName;
	}
	public String gettStoreName() {
		return tStoreName;
	}
	public void settStoreName(String tStoreName) {
		this.tStoreName = tStoreName;
	}
	public String gettStoreAddress() {
		return tStoreAddress;
	}
	public void settStoreAddress(String tStoreAddress) {
		this.tStoreAddress = tStoreAddress;
	}
	public String gettStoreAddressDetail() {
		return tStoreAddressDetail;
	}
	public void settStoreAddressDetail(String tStoreAddressDetail) {
		this.tStoreAddressDetail = tStoreAddressDetail;
	}
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}
	public String gettOwnerName() {
		return tOwnerName;
	}
	public void settOwnerName(String tOwnerName) {
		this.tOwnerName = tOwnerName;
	}
	public String gettOwnerHp1() {
		return tOwnerHp1;
	}
	public void settOwnerHp1(String tOwnerHp1) {
		this.tOwnerHp1 = tOwnerHp1;
	}
	public String gettOwnerHp2() {
		return tOwnerHp2;
	}
	public void settOwnerHp2(String tOwnerHp2) {
		this.tOwnerHp2 = tOwnerHp2;
	}
	public String gettOwnerHp3() {
		return tOwnerHp3;
	}
	public void settOwnerHp3(String tOwnerHp3) {
		this.tOwnerHp3 = tOwnerHp3;
	}
	public String gettDetail() {
		return tDetail;
	}
	public void settDetail(String tDetail) {
		this.tDetail = tDetail;
	}
	public String gettRegdate() {
		return tRegdate;
	}
	public void settRegdate(String tRegdate) {
		this.tRegdate = tRegdate;
	}
	public String gettSubmitDate() {
		return tSubmitDate;
	}
	public void settSubmitDate(String tSubmitDate) {
		this.tSubmitDate = tSubmitDate;
	}
	public int getaAgreeNo() {
		return aAgreeNo;
	}
	public void setaAgreeNo(int aAgreeNo) {
		this.aAgreeNo = aAgreeNo;
	}
	
	
	
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public String getlCategoryName() {
		return lCategoryName;
	}
	public void setlCategoryName(String lCategoryName) {
		this.lCategoryName = lCategoryName;
	}
	@Override
	public String toString() {
		return "OwnerTemporaryVO [tNo=" + tNo + ", storeNo=" + storeNo + ", ownerno=" + ownerno + ", oRegisterNo="
				+ oRegisterNo + ", tFileName=" + tFileName + ", tOriginalFileName=" + tOriginalFileName
				+ ", tStoreName=" + tStoreName + ", tStoreAddress=" + tStoreAddress + ", tStoreAddressDetail="
				+ tStoreAddressDetail + ", locationNo=" + locationNo + ", tOwnerName=" + tOwnerName + ", tOwnerHp1="
				+ tOwnerHp1 + ", tOwnerHp2=" + tOwnerHp2 + ", tOwnerHp3=" + tOwnerHp3 + ", tDetail=" + tDetail
				+ ", tRegdate=" + tRegdate + ", tSubmitDate=" + tSubmitDate + ", aAgreeNo=" + aAgreeNo
				+ ", locationName=" + locationName + ", lCategoryName=" + lCategoryName + "]";
	}
	
	
	
	
}
