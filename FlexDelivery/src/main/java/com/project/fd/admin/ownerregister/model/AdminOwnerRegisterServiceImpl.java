package com.project.fd.admin.ownerregister.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminOwnerRegisterServiceImpl implements AdminOwnerRegisterService{
	@Autowired
	AdminOwnerRegisterDAO registerDao;
	
	@Override
	public List<AdminOwnerRegisterVo> adminOwnerRegistList() {
		return registerDao.adminOwnerRegistList();
	}

	@Override
	public AdminOwnerRegisterVo adminOwnerRegistDetail(long no) {
		return registerDao.adminOwnerRegistDetail(no);
	}

	@Override
	public int adminOwnerRegistApproval(long registNo) {
		return registerDao.adminOwnerRegistApproval(registNo);
	}

	@Override
	public int adminOwnerApproval(int ownerNo) {
		return registerDao.adminOwnerApproval(ownerNo);
	}

	@Override
	public int adminOwnerRegistDeny(long registNo) {
		return registerDao.adminOwnerRegistDeny(registNo);
	}

}
