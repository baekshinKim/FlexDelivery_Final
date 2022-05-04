package com.project.fd.admin.storeAd.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fd.owner.advertise.model.OwnerStoreAdVO;

@Service
public class AdminStoreAdServiceImpl implements AdminStoreAdService{
	
	@Autowired
	AdminStoreAdDAO adminStoreAdDao;

	@Override
	public List<AdminStoreAdVO> approvalList() {
		return adminStoreAdDao.approvalList();
	}

	@Override
	public AdminStoreAdVO storeAdDetail(int no) {
		return adminStoreAdDao.storeAdDetail(no);
	}

	@Override
	public int storeAdAgree(int no) {
		return adminStoreAdDao.storeAdAgree(no);
	}

}
