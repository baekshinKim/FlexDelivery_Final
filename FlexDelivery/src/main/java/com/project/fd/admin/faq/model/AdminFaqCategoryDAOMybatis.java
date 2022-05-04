package com.project.fd.admin.faq.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminFaqCategoryDAOMybatis implements AdminFaqCategoryDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.adminfaq.";

	@Override
	public List<AdminFaqCategoryVO> selectCategoryAll() {
		List<AdminFaqCategoryVO> list=sqlSession.selectList(namespace+"selectCategoryAll");
		return list;
	}

	@Override
	public List<AdminFaqAllViewVO> selectAll2() {
		List<AdminFaqAllViewVO> list=sqlSession.selectList(namespace+"selectAll2");
		return list;
	}

	@Override
	public int insertFaqCategory(AdminFaqCategoryVO faqCategoryVo) {
		int cnt=sqlSession.insert(namespace+"insertFaqCategory", faqCategoryVo);
		return cnt;
	}

	@Override
	public int updateFaqCategory(AdminFaqCategoryVO faqCategoryVo) {
		int cnt=sqlSession.update(namespace+"updateFaqCategory", faqCategoryVo);
		return cnt;
	}

	@Override
	public int deleteFaqCategory(int no) {
		int cnt=sqlSession.delete(namespace+"deleteFaqCategory", no);
		return cnt;
	}

	@Override
	public boolean checkDu(String fCategoryName) {
		boolean bool=false;
		int cnt=sqlSession.selectOne(namespace+"checkDu", fCategoryName);
		if (cnt==0) {
			bool=true;
		}
		return bool;
	}
}
