package com.project.fd.member.menu.model;

public class MemberMenuGroupVO {
	private int sMGroupNo;
	private String sMGroupName;
	private int storeNo;
	private int sMGroupCount;
	public int getsMGroupNo() {
		return sMGroupNo;
	}
	public void setsMGroupNo(int sMGroupNo) {
		this.sMGroupNo = sMGroupNo;
	}
	public String getsMGroupName() {
		return sMGroupName;
	}
	@Override
	public String toString() {
		return "MemberStoreMenuGroupVO [sMGroupNo=" + sMGroupNo + ", sMGroupName=" + sMGroupName + ", storeNo="
				+ storeNo + ", sMGroupCount=" + sMGroupCount + "]";
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
	public int getsMGroupCount() {
		return sMGroupCount;
	}
	public void setsMGroupCount(int sMGroupCount) {
		this.sMGroupCount = sMGroupCount;
	}
}