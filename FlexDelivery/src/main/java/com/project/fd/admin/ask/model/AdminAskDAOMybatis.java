package com.project.fd.admin.ask.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminAskDAOMybatis implements AdminAskDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.adminonetoone.";
	
	@Override
	public List<AdminAskVO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}

	@Override
	public List<AdminAskVO> selectByAuthority(int no) {
		return sqlSession.selectList(namespace+"selectByAuthority", no);
	}

	@Override
	public List<AdminAskVO> selectByReply(String flag) {
		return sqlSession.selectList(namespace+"selectByReply", flag);
	}

	@Override
	public int insertAskReply(AdminAskVO askVo) {
		int cnt=sqlSession.insert(namespace+"insertAskReply", askVo);
		return cnt;
	}

	@Override
	public int updateAskReply(AdminAskVO askVo) {
		int cnt=sqlSession.update(namespace+"updateAskReply", askVo);
		return cnt;
	}

	@Override
	public int deleteAskReply(int no) {
		int cnt=sqlSession.delete(namespace+"deleteAskReply", no);
		return cnt;
	}

	@Override
	public AdminAskVO selectByNo(int no) {
		return sqlSession.selectOne(namespace+"selectByNo", no);
	}

	@Override
	public AdminAskVO selectReplyByNo(int no) {
		AdminAskVO askVo=sqlSession.selectOne(namespace+"selectReplyByNo", no);
		return askVo;
	}

	@Override
	public int updateAsk(AdminAskVO askVo) {
		int cnt=sqlSession.update(namespace+"updateAsk", askVo);
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectNewAsk() {
		List<Map<String, Object>> list=sqlSession.selectList(namespace+"selectNewAsk");
		return list;
	}

	@Override
	public int selectNewAsk2() {
		return sqlSession.selectOne(namespace+"selectNewAsk2");
	}

}
