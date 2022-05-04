package com.project.fd.owner.board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OwnerBoardDAOMybatis implements OwnerBoardDAO{
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.ownerboard.";
	
	
	public List<OwnerBoardVO> selectAll(OwnerBoardSearchVO ownerBoardSearchVo) {
		return sqlSession.selectList(namespace+"selectAll",ownerBoardSearchVo);
	}
	
	public int selectTotalRecord(OwnerBoardSearchVO ownerBoardSearchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",ownerBoardSearchVo);
	}

	public OwnerBoardVO selectByNo(int boardNo) {
		return sqlSession.selectOne(namespace+"selectByNo",boardNo);
	}
	
	public List<OwnerBoardVO>  selectMainBoard(String boardHead) {
		return sqlSession.selectList(namespace+"selectMainBoard",boardHead);
	}
	
}