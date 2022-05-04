package com.project.fd.admin.model;

public class AdminVO {
	  private int adminNo;
	  private String adminId;
	  private String adminName;
	  private String adminPwd;
	  private int authorityNo;
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPwd() {
		return adminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	public int getAuthorityNo() {
		return authorityNo;
	}
	public void setAuthorityNo(int authorityNo) {
		this.authorityNo = authorityNo;
	}
	@Override
	public String toString() {
		return "AdminVO [adminNo=" + adminNo + ", adminId=" + adminId + ", adminName=" + adminName + ", adminPwd="
				+ adminPwd + ", authorityNo=" + authorityNo + "]";
	}
	  
	  
}
