package com.project.fd.admin.ownerregister.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminOwnerRegisterDAOMybatis implements AdminOwnerRegisterDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace ="config.mybatis.mapper.oracle.adminOwnerRegister.";
	
	@Override
	public List<AdminOwnerRegisterVo> adminOwnerRegistList() {
		List<AdminOwnerRegisterVo> list = sqlSession.selectList(namespace+"registerList");
		return list;
	}

	@Override
	public AdminOwnerRegisterVo adminOwnerRegistDetail(long no) {
		
		return sqlSession.selectOne(namespace+"registerDetail", no);
	}

	@Override
	public int adminOwnerRegistApproval(long registNo) {
		return sqlSession.update(namespace+"registerApproval", registNo);
	}

	@Override
	public int adminOwnerApproval(int ownerNo) {
		return sqlSession.update(namespace+"ownerApproval", ownerNo);
	}

	@Override
	public int adminOwnerRegistDeny(long registNo) {
		return sqlSession.update(namespace+"registerDeny", registNo);
	}

}
