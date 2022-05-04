package com.project.fd.owner.ask.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OwnerAskDAOMybatis implements OwnerAskDAO{

	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.owneronetoone.";
	
	@Override
	public int insertASK(OwnerAskVO ownerAskVo) {
		return sqlSession.insert(namespace+"insertASK", ownerAskVo);
	}


	@Override
	public List<OwnerAskVO> selectAllAsk(OwnerAskSearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAllAsk", searchVo);
	}

	@Override
	public int selectTotalRecord(OwnerAskSearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", searchVo);
	}


	@Override
	public int deleteAsk(int askNo) {
		return sqlSession.delete(namespace+"deleteAsk",askNo);
	}


	@Override
	public OwnerAskVO selectByNo(int askNo) {
		return sqlSession.selectOne(namespace+"selectByNo",askNo);
	}


	@Override
	public int updateASK(OwnerAskVO ownerAskVo) {
		return sqlSession.update(namespace+"updateASK",ownerAskVo);
	}


	@Override
	public OwnerAskVO replyAsk(int askNo) {
		return sqlSession.selectOne(namespace+"replyAsk",askNo);
	}	
	
	
}
