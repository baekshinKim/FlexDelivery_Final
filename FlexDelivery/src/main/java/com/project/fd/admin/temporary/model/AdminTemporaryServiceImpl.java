package com.project.fd.admin.temporary.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fd.owner.model.OwnerVO;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;
import com.project.fd.owner.store.model.OwnerStoresVO;

@Service
public class AdminTemporaryServiceImpl implements AdminTemporaryService{
	@Autowired
	AdminTemporaryDAO temporaryDao;

	@Override
	public List<AdminTemporaryVO> editList() {
		return temporaryDao.editList();
	}

	@Override
	public AdminTemporaryVO editDetail(int no) {
		return temporaryDao.editDetail(no);
	}


	
	@Override
	public int editDeny(int no) {
		return temporaryDao.editDeny(no);
	}


	@Override
	public int editAgree(AdminTemporaryVO vo) {
		return temporaryDao.editAgree(vo);
	}

}
