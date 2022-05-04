package com.project.fd.admin.mediumcategory.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMediumCategoryDAOMybatis implements AdminMediumCategoryDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.adminmediumcategory.";
	
	/*
	public List<Map<String, Object>> selectAll2(int mCategoryNo) {
		return sqlSession.selectList(namespace+"selectAll2", mCategoryNo);
		}
	*/
	
	@Override
	public List<AdminMediumCategoryViewVO> selectAll2() {
		return sqlSession.selectList(namespace+"selectAll2");
	}

	@Override
	public int insertMediumcategory(AdminMediumCategoryVO mediumCategoryVo) {
		int cnt=sqlSession.insert(namespace+"insertMediumcategory", mediumCategoryVo);
		return cnt;
	}

	@Override
	public int updateMediumcategory(AdminMediumCategoryVO mediumCategoryVo) {
		int cnt=sqlSession.update(namespace+"updateMediumcategory", mediumCategoryVo);
		return cnt;
	}

	@Override
	public int deleteMediumcategory(AdminMediumCategoryVO mediumCategoryVo) {
		int cnt=sqlSession.delete(namespace+"deleteMediumcategory", mediumCategoryVo);
		return cnt;
	}

	@Override
	public boolean checkDu(String mCategoryName) {
		boolean bool=false;
		int cnt=sqlSession.selectOne(namespace+"checkDu", mCategoryName);
		if (cnt==0) {
			bool=true;
		}
		return bool;
	}
}
