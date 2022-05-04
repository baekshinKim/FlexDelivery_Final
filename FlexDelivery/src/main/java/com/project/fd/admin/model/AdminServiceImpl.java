package com.project.fd.admin.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDao;
	
	@Override
	public int loginChk(String userid, String pwd) {
		String dbPwd=adminDao.selectPwd(userid);
		int result=0;
		if(dbPwd!=null && !dbPwd.isEmpty()) {
			if(dbPwd.equals(pwd)) {
				result=LOGIN_OK;
			}else {
				result=PWD_DISAGREE;
			}
		}else {
			result=ID_NONE;
		}
		return result;
	}

	@Override
	public AdminVO selectAdmin(String userid) {
		return adminDao.selectAdmin(userid);
	}
	
}
