package com.project.fd.admin.temporary.model;

import java.util.List;

import com.project.fd.owner.model.OwnerVO;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;
import com.project.fd.owner.store.model.OwnerStoresVO;

public interface AdminTemporaryService {
	public List<AdminTemporaryVO> editList();
	public AdminTemporaryVO editDetail(int no);
	public int editAgree(AdminTemporaryVO vo);
	/*
	public int editOwner(OwnerVO ownerVo);
	public int editOwnerRegister(OwnerRegisterVO registerVo);
	public int editStores(OwnerStoresVO storesVo);
	*/
	public int editDeny(int no);
}
