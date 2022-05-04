package com.project.fd.admin.storeMg.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fd.owner.store.model.OwnerStoresVO;

@Service
public class AdminStoreMgServiceImpl implements AdminStoreMgService{
	@Autowired
	AdminStoreMgDAO storeMgDao;
	
	@Override
	public List<OwnerStoresVO> storeMgList() {
		return storeMgDao.storeMgList();
	}
}
