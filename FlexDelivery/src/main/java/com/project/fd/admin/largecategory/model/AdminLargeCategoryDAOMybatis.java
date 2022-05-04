package com.project.fd.admin.largecategory.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryViewVO;
import com.project.fd.common.SearchVO;

@Repository
public class AdminLargeCategoryDAOMybatis implements AdminLargeCategoryDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.adminlargecategory.";
	
	@Override
	public List<AdminLargeCategoryVO> selectAll() {
		List<AdminLargeCategoryVO> list=sqlSession.selectList(namespace+"selectAll");
		return list;
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return 0;
	}

	@Override
	public AdminLargeCategoryVO selectByNo(int no) {
		AdminLargeCategoryVO vo=sqlSession.selectOne(namespace+"selectByNo", no);
		return vo;
	}

	@Override
	public int insertLargeCategory(AdminLargeCategoryVO largeCategoryVo) {
		int cnt=sqlSession.insert(namespace+"insertLargecategory", largeCategoryVo);
		return cnt;
	}

	@Override
	public int updateLargeCategory(AdminLargeCategoryVO largecategoryVo) {
		int cnt=sqlSession.update(namespace+"updateLargecategory", largecategoryVo);
		return cnt;
	}

	@Override
	public int deleteLargeCategory(AdminLargeCategoryVO largeCategoryVO) {
		int cnt=sqlSession.delete(namespace+"deleteLargecategory", largeCategoryVO);
		return cnt;
	}

	@Override
	public List<AdminMediumCategoryViewVO> selectAll2() {
		List<AdminMediumCategoryViewVO> list=sqlSession.selectList(namespace+"selectAll2");
		return list;
	}

	@Override
	public boolean checkDu(String content) {
		boolean bool=false;
		int cnt=sqlSession.selectOne(namespace+"checkDu", content);
		if (cnt==0) {
			bool=true;
		} else {
			bool=false;
		}
		
		return bool;
	}



}
