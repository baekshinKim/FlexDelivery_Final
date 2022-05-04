package com.project.fd.admin.storeAd.model;

import java.util.List;

import com.project.fd.owner.advertise.model.OwnerStoreAdVO;

public interface AdminStoreAdDAO {
	public List<AdminStoreAdVO> approvalList();
	public AdminStoreAdVO storeAdDetail(int no);
	public int storeAdAgree(int no);
}
