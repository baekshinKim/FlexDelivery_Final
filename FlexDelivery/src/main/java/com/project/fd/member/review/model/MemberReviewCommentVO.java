package com.project.fd.member.review.model;

import java.sql.Timestamp;

public class MemberReviewCommentVO {
	private int reviewNo; /* 리뷰번호 */
	private int storeNo; /* 점포번호 - fk */
	private String rCommentContent; /* 코멘트내용 */
	private Timestamp rCommentRegdate;
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getrCommentContent() {
		return rCommentContent;
	}
	public void setrCommentContent(String rCommentContent) {
		this.rCommentContent = rCommentContent;
	}
	public Timestamp getrCommentRegdate() {
		return rCommentRegdate;
	}
	public void setrCommentRegdate(Timestamp rCommentRegdate) {
		this.rCommentRegdate = rCommentRegdate;
	}
	@Override
	public String toString() {
		return "MemberReviewCommentVO [reviewNo=" + reviewNo + ", storeNo=" + storeNo + ", rCommentContent="
				+ rCommentContent + ", rCommentRegdate=" + rCommentRegdate + "]";
	}
	
	
}
