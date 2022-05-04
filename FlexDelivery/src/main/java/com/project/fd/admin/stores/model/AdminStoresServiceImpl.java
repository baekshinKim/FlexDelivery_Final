package com.project.fd.admin.stores.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fd.owner.store.model.OwnerTemporaryVO;

@Service
public class AdminStoresServiceImpl implements AdminStoresService{
	
	@Autowired
	AdminStoresDAO adminStoresDao;

	@Override
	public List<AdminStoresVO> adminApprovalList() {
		return adminStoresDao.adminApprovalList();
	}

	@Override
	public AdminStoresVO adminApprovalDetail(int no) {	
		return adminStoresDao.adminApprovalDetail(no);
	}

	@Override
	public int adminApprovalAgree(int no) {
		return adminStoresDao.adminApprovalAgree(no);
	}

	@Override
	public int adminApprovalDeny(int no) {
		return adminStoresDao.adminApprovalDeny(no);
	}

	@Override
	public int adminOutAgree(int no) {
		
		return adminStoresDao.adminOutAgree(no);
	}

	@Override
	public int adminOutDeny(int no) {
		
		return adminStoresDao.adminOutDeny(no);
	}
}
