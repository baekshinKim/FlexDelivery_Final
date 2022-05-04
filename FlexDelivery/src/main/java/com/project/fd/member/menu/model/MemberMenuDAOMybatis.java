package com.project.fd.member.menu.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberMenuDAOMybatis implements MemberMenuDAO{
	
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.memberMenu.";
	
	@Override
	public List<MemberMenuGroupVO> selectMenuGroupByStoreNo(int storeNo) {
		return sqlSession.selectList(namespace+"selectMenuGroupByStoreNo",storeNo);
	}

	@Override
	public List<MemberMenuAllVO> selectMenuBySMGroupNo(int sMGroupNo) {
		return sqlSession.selectList(namespace+"selectMenuBySMGroupNo",sMGroupNo);
	}

	@Override
	public MemberMenuAllVO selectMainMenu(int storeNo) {
		return sqlSession.selectOne(namespace+"selectMainMenu",storeNo);
	}

}
