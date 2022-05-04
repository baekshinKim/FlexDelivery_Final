package com.project.fd.admin.index.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryVO;

@Repository
public class AdminIndexDAOMybatis implements AdminIndexDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.adminindex.";

	@Override
	public int selectNewReview() {
		return sqlSession.selectOne(namespace+"selectNewReview");
	}

	@Override
	public int selectNewAd() {
		return sqlSession.selectOne(namespace+"selectNewAd");
	}

	@Override
	public int selectNewRegister() {
		return sqlSession.selectOne(namespace+"selectNewRegister");
	}

	@Override
	public int selectNewStore() {
		return sqlSession.selectOne(namespace+"selectNewStore");
	}

	@Override
	public int selectChangeStore() {
		return sqlSession.selectOne(namespace+"selectChangeStore");
	}

	@Override
	public int selectMNo() {
		return sqlSession.selectOne(namespace+"selectMNo");
	}

	@Override
	public List<Map<String, Object>> selectFood(int mCategoryNo) {
		List<Map<String, Object>> list=sqlSession.selectList(namespace+"selectFood", mCategoryNo);
		return list;
	}

	@Override
	public AdminMediumCategoryVO selectMCategory(int mCategoryNo) {
		
		return sqlSession.selectOne(namespace+"selectMCategory", mCategoryNo);
	}
	
	

}
