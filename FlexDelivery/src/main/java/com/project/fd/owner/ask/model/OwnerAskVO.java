package com.project.fd.owner.ask.model;

public class OwnerAskVO {
	private int askNo;
	private String askTitle;
	private String askId;
	private String askContent;
	private String askRegdate;
	private int askGroupNo;
	private int askStep;
	private String askReplyflag;
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
	public String getAskReplyflag() {
		return askReplyflag;
	}
	public void setAskReplyflag(String askReplyflag) {
		this.askReplyflag = askReplyflag;
	}
	public int getAuthorityNo() {
		return authorityNo;
	}
	public void setAuthorityNo(int authorityNo) {
		this.authorityNo = authorityNo;
	}
	@Override
	public String toString() {
		return "OwnerAskVO [askNo=" + askNo + ", askTitle=" + askTitle + ", askId=" + askId + ", askContent="
				+ askContent + ", askRegdate=" + askRegdate + ", askGroupNo=" + askGroupNo + ", askStep=" + askStep
				+ ", askReplyflag=" + askReplyflag + ", authorityNo=" + authorityNo + "]";
	}
	
	
}
