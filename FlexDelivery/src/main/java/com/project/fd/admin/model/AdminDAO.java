package com.project.fd.admin.model;

public interface AdminDAO {
	String selectPwd(String userid);
	AdminVO selectAdmin(String userid);
}	
