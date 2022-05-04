package com.project.fd.admin.hoenytip;

public class AdminHoneytipVO {
	private int honeytipNo;
	private String honeytipTitle;
	private String honeytipContent;
	private String honeytipThumbnail;
	private String honeytipRegdate;
	
	public int getHoneytipNo() {
		return honeytipNo;
	}
	public String getHoneytipTitle() {
		return honeytipTitle;
	}
	public String getHoneytipContent() {
		return honeytipContent;
	}
	public String getHoneytipThumbnail() {
		return honeytipThumbnail;
	}
	public String getHoneytipRegdate() {
		return honeytipRegdate;
	}
	public void setHoneytipNo(int honeytipNo) {
		this.honeytipNo = honeytipNo;
	}
	public void setHoneytipTitle(String honeytipTitle) {
		this.honeytipTitle = honeytipTitle;
	}
	public void setHoneytipContent(String honeytipContent) {
		this.honeytipContent = honeytipContent;
	}
	public void setHoneytipThumbnail(String honeytipThumbnail) {
		this.honeytipThumbnail = honeytipThumbnail;
	}
	public void setHoneytipRegdate(String honeytipRegdate) {
		this.honeytipRegdate = honeytipRegdate;
	}
	
	@Override
	public String toString() {
		return "AdminHoneytipVO [honeytipNo=" + honeytipNo + ", honeytipTitle=" + honeytipTitle + ", honeytipContent="
				+ honeytipContent + ", honeytipThumbnail=" + honeytipThumbnail + ", honeytipRegdate=" + honeytipRegdate
				+ "]";
	}
	
	
}
