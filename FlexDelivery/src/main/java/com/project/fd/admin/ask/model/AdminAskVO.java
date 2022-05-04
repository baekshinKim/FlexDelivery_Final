package com.project.fd.admin.ask.model;

public class AdminAskVO {
	private int askNo;
	private String askTitle;
	private String askId;
	private String askContent;
	private String askRegdate;
	private int askGroupNo;
	private int askStep;
	private String askReplyFlag;
	private int authorityNo;
	
	public int getAskNo() {
		return askNo;
	}
	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}
	public String getAskTitle() {
		return askTitle;
	}
	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}
	public String getAskId() {
		return askId;
	}
	public void setAskId(String askId) {
		this.askId = askId;
	}
	public String getAskContent() {
		return askContent;
	}
	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}
	public String getAskRegdate() {
		return askRegdate;
	}
	public void setAskRegdate(String askRegdate) {
		this.askRegdate = askRegdate;
	}
	public int getAskGroupNo() {
		return askGroupNo;
	}
	public void setAskGroupNo(int askGroupNo) {
		this.askGroupNo = askGroupNo;
	}
	public int getAskStep() {
		return askStep;
	}
	public void setAskStep(int askStep) {
		this.askStep = askStep;
	}
	public String getAskReplyFlag() {
		return askReplyFlag;
	}
	public void setAskReplyFlag(String askReplyFlag) {
		this.askReplyFlag = askReplyFlag;
	}
	public int getAuthorityNo() {
		return authorityNo;
	}
	public void setAuthorityNo(int authorityNo) {
		this.authorityNo = authorityNo;
	}
	
	@Override
	public String toString() {
		return "AskVO [askNo=" + askNo + ", askTitle=" + askTitle + ", askId=" + askId + ", askContent=" + askContent
				+ ", askRegdate=" + askRegdate + ", askGroupNo=" + askGroupNo + ", askStep=" + askStep
				+ ", askReplyFlag=" + askReplyFlag + ", authorityNo=" + authorityNo + "]";
	}
	
	
}
