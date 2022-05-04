package com.project.fd.member.faq.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberFaqDAOMybatis implements MemberFaqDAO{

	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.memberFaq.";
	
	@Override
	public List<MemberFaqVo> selectFaq(int fCategoryNo) {
		return sqlSession.selectList(namespace+"faqSelect", fCategoryNo);
	}

	@Override
	public List<Map<String, Object>> faqCategoryList() {
		return sqlSession.selectList(namespace+"faqCategoryList");
	}
	
	
	

}
