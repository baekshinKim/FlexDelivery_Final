package com.project.fd.admin.storeAd.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.owner.advertise.model.OwnerStoreAdVO;

@Repository
public class AdminStoreAdDAOMybatis implements AdminStoreAdDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace ="config.mybatis.mapper.oracle.adminStoreAd.";

	@Override
	public List<AdminStoreAdVO> approvalList() {
		List<AdminStoreAdVO> list = sqlSession.selectList(namespace+"approvalList");
		return list;
	}

	@Override
	public AdminStoreAdVO storeAdDetail(int no) {
		return sqlSession.selectOne(namespace+"storeAdDetail", no);
	}

	@Override
	public int storeAdAgree(int no) {
		return sqlSession.update(namespace+"storeAdAgree", no);
	}

}
