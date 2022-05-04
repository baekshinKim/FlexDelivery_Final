package com.project.fd.admin.reviewMg.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminReviewMgDAOMybatis implements AdminReviewMgDAO{
	@Autowired
	SqlSessionTemplate sqlSession;	
	private String namespace ="config.mybatis.mapper.oracle.adminReviewMg.";
	
	@Override
	public List<AdminReviewMgVO> reviewMgList() {
		List<AdminReviewMgVO> list = sqlSession.selectList(namespace+"reviewMgList");
		return list;
	}

	@Override
	public AdminReviewMgVO reviewMgDetail(int no) {
		return sqlSession.selectOne(namespace+"reviewMgDetail", no);
	}

	@Override
	public int reviewMgAgree(int no) {
		return sqlSession.update(namespace+"reviewMgAgree", no);
	}

	@Override
	public int reviewMgDeny(int no) {
		return sqlSession.update(namespace+"reviewMgDeny", no);
	}

}
