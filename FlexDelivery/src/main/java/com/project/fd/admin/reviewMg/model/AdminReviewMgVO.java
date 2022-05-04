package com.project.fd.admin.reviewMg.model;

import java.sql.Timestamp;

public class AdminReviewMgVO {
	private int 		reviewNo;	// 리뷰번호 number
	private String		reviewContent;	// 리뷰내용 varchar2(2000 byte)
	private Timestamp	reviewRegdate;	// 리뷰등록일 date
	private String		reviewReport;	// 리뷰신고플래그	varchar2(10 byte)
	private Timestamp	reportDate; //리뷰신고일
	private	String		reviewFilename; //	리뷰이미지 varchar2(200 byte)
	private String		reviewDelFlag; //	리뷰 삭제플래그 varchar2(10 byte)
	private String		memberId; //	리뷰작성 멤버 ID varchar2(200 byte)
	private	String		storeName;	// 리뷰신고 점포명 varchar2(150 byte)
	private String		storeAddress; //	점포주소 varchar2(300 byte)
	private String		storeAddressDetail; //	점포상세주소 varchar2(200 byte)//
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Timestamp getReviewRegdate() {
		return reviewRegdate;
	}
	public void setReviewRegdate(Timestamp reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
	}
	public String getReviewReport() {
		return reviewReport;
	}
	public void setReviewReport(String reviewReport) {
		this.reviewReport = reviewReport;
	}
	public Timestamp getReportDate() {
		return reportDate;
	}
	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}
	public String getReviewFilename() {
		return reviewFilename;
	}
	public void setReviewFilename(String reviewFilename) {
		this.reviewFilename = reviewFilename;
	}
	public String getReviewDelFlag() {
		return reviewDelFlag;
	}
	public void setReviewDelFlag(String reviewDelFlag) {
		this.reviewDelFlag = reviewDelFlag;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
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
	@Override
	public String toString() {
		return "AdminReviewMgVO [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewRegdate="
				+ reviewRegdate + ", reviewReport=" + reviewReport + ", reportDate=" + reportDate + ", reviewFilename="
				+ reviewFilename + ", reviewDelFlag=" + reviewDelFlag + ", memberId=" + memberId + ", storeName="
				+ storeName + ", storeAddress=" + storeAddress + ", storeAddressDetail=" + storeAddressDetail + "]";
	}
		
}
