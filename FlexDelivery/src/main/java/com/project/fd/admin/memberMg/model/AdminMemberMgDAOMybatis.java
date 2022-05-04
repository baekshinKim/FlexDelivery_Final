package com.project.fd.admin.memberMg.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.member.model.MemberVO;

@Repository
public class AdminMemberMgDAOMybatis implements AdminMemberMgDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace ="config.mybatis.mapper.oracle.adminMemberMg.";

	@Override
	public List<MemberVO> adminMemberList() {
		List<MemberVO> list = sqlSession.selectList(namespace+"memberList");
		return list;
	}
	
}
