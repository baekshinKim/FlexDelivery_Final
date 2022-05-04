package com.project.fd.member.ask.model;

import java.sql.Timestamp;

public class MemberAskVO {

	private int askNo;
	private String askTitle;
	private String askId;
	private String askContent;
	private Timestamp askRegdate;
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
	public Timestamp getAskRegdate() {
		return askRegdate;
	}
	public void setAskRegdate(Timestamp askRegdate) {
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
		return "MemberAskVO [askNo=" + askNo + ", askTitle=" + askTitle + ", askId=" + askId + ", askContent="
				+ askContent + ", askRegdate=" + askRegdate + ", askGroupNo=" + askGroupNo + ", askStep=" + askStep
				+ ", askReplyFlag=" + askReplyFlag + ", authorityNo=" + authorityNo + "]";
	}
	
	
}
