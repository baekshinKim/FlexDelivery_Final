package com.project.fd.admin.board.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminBoardDAOMybatis implements AdminBoardDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.adminboard.";

	@Override
	public List<AdminBoardVO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}
	
	@Override
	public List<AdminBoardAllVO> selectNotice() {
		return sqlSession.selectList(namespace+"selectNotice");
	}
	
	@Override
	public List<AdminBoardAllVO> selectEvent() {
		return sqlSession.selectList(namespace+"selectEvent");
	}

	@Override
	public AdminBoardVO selectByNo(int no) {
		AdminBoardVO vo=sqlSession.selectOne(namespace+"selectByNo", no);
		return vo;
	}
	
	@Override
	public List<AdminBoardAllVO> selectAll2() {
		return sqlSession.selectList(namespace+"selectAll2");
	}
	
	@Override
	public AdminBoardAllVO selectByNo2(int no) {
		return sqlSession.selectOne(namespace+"selectByNo2", no);
	}

	@Override
	public int insertBoard(AdminBoardVO vo) {
		int cnt=sqlSession.insert(namespace+"insertBoard", vo);
		return cnt;
	}

	@Override
	public int updateBoard(AdminBoardVO vo) {
		int cnt=sqlSession.update(namespace+"updateBoard", vo);
		return cnt;
	}

	@Override
	public int deleteBoard(int no) {
		int cnt=sqlSession.delete(namespace+"deleteBoard", no);
		return cnt;
	}

	@Override
	public int selectRn(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectRn", map);
	}

	@Override
	public Map<String, Object> selectByRn(Map<String, Object> map) {
		Map<String, Object> result=sqlSession.selectOne(namespace+"selectByRn", map);
		return result;
	}

	@Override
	public int selectMinRn(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectMinRn", map);
	}

	@Override
	public int selectMaxRn(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectMaxRn", map);
	}

	@Override
	public List<Map<String, Object>> selectAllForRn(Map<String, Object> map) {
		List<Map<String, Object>> result=sqlSession.selectList(namespace+"selectAllForRn", map);
		return result;
	}
}
