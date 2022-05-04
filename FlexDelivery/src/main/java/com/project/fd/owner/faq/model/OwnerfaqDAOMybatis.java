package com.project.fd.owner.faq.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.admin.faq.model.AdminFaqCategoryVO;

@Repository
public class OwnerfaqDAOMybatis implements OwnerfaqDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.ownerfaq.";

	@Override
	public List<OwnerFaqVO> selectAll(OwnerFaqSearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAll", searchVo);
	}

	@Override
	public int getTotalRecord(OwnerFaqSearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord", searchVo);
	}

	@Override
	public List<AdminFaqCategoryVO> selectCategoryAll() {
		return  sqlSession.selectList(namespace+"selectCategoryAll");
	}
	
	
}
