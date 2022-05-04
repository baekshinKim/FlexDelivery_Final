package com.project.fd.admin.storeMg.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.owner.store.model.OwnerStoresVO;

@Repository
public class AdminStoreMgDAOMybatis implements AdminStoreMgDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace ="config.mybatis.mapper.oracle.adminStoreMg.";
	
	@Override
	public List<OwnerStoresVO> storeMgList() {
		List<OwnerStoresVO> list = sqlSession.selectList(namespace+"storeMgList");
		return list;
	}
	
}
