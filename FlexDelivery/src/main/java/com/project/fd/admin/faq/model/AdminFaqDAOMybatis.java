package com.project.fd.admin.faq.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminFaqDAOMybatis implements AdminFaqDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.adminfaq.";

	@Override
	public List<AdminFaqVO> selectAll() {
		List<AdminFaqVO> list=sqlSession.selectList(namespace+"selectAll");
		return list;
	}

	@Override
	public List<AdminFaqAllViewVO> selectAll2() {
		List<AdminFaqAllViewVO> list=sqlSession.selectList(namespace+"selectAll2");
		return list;
	}

	@Override
	public int insertFaq(AdminFaqVO faqVo) {
		int cnt=sqlSession.insert(namespace+"insertFaq", faqVo);
		return cnt;
	}

	@Override
	public int updateFaq(AdminFaqVO faqVo) {
		int cnt=sqlSession.update(namespace+"updateFaq", faqVo);
		return cnt;
	}

	@Override
	public int deleteFaq(int no) {
		int cnt=sqlSession.delete(namespace+"deleteFaq", no);
		return cnt;
	}

	@Override
	public List<AdminFaqVO> selectFor(int categoryNo) {
		List<AdminFaqVO> list=sqlSession.selectList(namespace+"selectFor", categoryNo);
		return list;
	}

	@Override
	public List<AdminFaqAllViewVO> selectFor2(int categoryNo) {
		List<AdminFaqAllViewVO> list=sqlSession.selectList(namespace+"selectFor2", categoryNo);
		return list;
	}

	@Override
	public List<Map<String, Object>> chkFCategory(int no) {
		List<Map<String, Object>> list=sqlSession.selectList(namespace+"chkFCategory", no);
		return list;
	}
}
