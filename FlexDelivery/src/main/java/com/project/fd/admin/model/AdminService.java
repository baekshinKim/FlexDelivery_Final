package com.project.fd.admin.model;

public interface AdminService {
	//로그인 처리시 사용
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int ID_NONE=2; //아이디가 없는 경우
	public static final int PWD_DISAGREE=3; //비밀번호 불일치

	int loginChk(String userid,String pwd);
	AdminVO selectAdmin(String userid);
}	
