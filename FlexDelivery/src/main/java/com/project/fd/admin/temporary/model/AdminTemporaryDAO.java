package com.project.fd.admin.temporary.model;

import java.util.List;

import com.project.fd.owner.model.OwnerVO;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;
import com.project.fd.owner.store.model.OwnerStoresVO;

public interface AdminTemporaryDAO {
	public List<AdminTemporaryVO> editList();
	public AdminTemporaryVO editDetail(int no);
	public int editAgree(AdminTemporaryVO vo);
	public int editDeny(int no);
}
