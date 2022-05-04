package com.project.fd.member.stores.model;

public class MemberLikeStoreVO {
	private int memberNo;
	private int storeNo;
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	@Override
	public String toString() {
		return "MemberLikeStoreVO [memberNo=" + memberNo + ", storeNo=" + storeNo + "]";
	}
	
	
}
