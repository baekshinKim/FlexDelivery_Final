package com.project.fd.admin.hoenytip;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminHoneytipDAOMybatis implements AdminHoneytipDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.adminhoneytip.";

	@Override
	public List<AdminHoneytipVO> selectAll() {
		List<AdminHoneytipVO> list=sqlSession.selectList(namespace+"selectAll");
		return list;
	}

	@Override
	public AdminHoneytipVO selectByNo(int no) {
		AdminHoneytipVO vo=sqlSession.selectOne(namespace+"selectByNo", no);
		return vo;
	}

	@Override
	public int insertHoneytip(AdminHoneytipVO vo) {
		int cnt=sqlSession.insert(namespace+"insertHoneytip", vo);
		return cnt;
	}

	@Override
	public int updateHoneytip(AdminHoneytipVO vo) {
		int cnt=sqlSession.update(namespace+"updateHoneytip", vo);
		return cnt;
	}

	@Override
	public int deleteHoneytip(AdminHoneytipVO vo) {
		int cnt=sqlSession.delete(namespace+"deleteHoneytip", vo);
		return cnt;
	}
	
	//owner에서 추가했습니다.
	@Override
	public List<AdminHoneytipVO> ownerHoneyTip() {
		List<AdminHoneytipVO> ownerList=sqlSession.selectList(namespace+"ownerHoneyTip");
		return ownerList;
	}
}
