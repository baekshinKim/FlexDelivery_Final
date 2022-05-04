package com.project.fd.owner.reviewcomment.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OwnerReivewCommentDAOMybatis implements OwnerReivewCommentDAO{

	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.ownerreviewcomment.";

	@Override
	public int insertComm(OwnerReviewCommentVO vo) {
		return sqlSession.insert(namespace+"insertComm",vo);
	}

	@Override
	public List<Map<String, Object>> selectReView(OwnerReviewSearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectReView",searchVo);
	}

	@Override
	public int getTotalRecord(OwnerReviewSearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord",searchVo);
	}


	@Override
	public int deleteComm(int reviewNo) {
		return sqlSession.delete(namespace+"deleteComm",reviewNo);
	}

	public int updateComm(OwnerReviewCommentVO vo) {
		return sqlSession.update(namespace+"updateComm",vo);
	}

	@Override
	public OwnerReviewCommentVO selectByNo(int reviewNo) {
		return sqlSession.selectOne(namespace+"selectByNo",reviewNo);
	}

	@Override
	public List<Map<String, Object>> selectNocomment(int storeNo) {
		return sqlSession.selectList(namespace+"Nocomment", storeNo);
	}

	@Override
	public int NocmtTotalRecord(int storeNo) {
		return sqlSession.selectOne(namespace+"NocmtTotalRecord",storeNo);
	}

	@Override
	public List<Map<String, Object>> selectblockcmt(int storeNo) {
		return sqlSession.selectList(namespace+"blockcmt", storeNo);
	}

	@Override
	public int blockTotalRecord(int storeNo) {
		return sqlSession.selectOne(namespace+"blockTotalRecord",storeNo);
	}
	
	public List<Map<String, Object>> selectAll(int storeNo){
		return sqlSession.selectList(namespace+"selectAll",storeNo);
	}
	
	public List<Map<String, Object>> reviewReting(int storeNo){
		return sqlSession.selectList(namespace+"reviewReting", storeNo);
	}
	
	public int reviewSingo(int reviewNo) {
		return sqlSession.update(namespace+"reviewSingo",reviewNo);
	}
	
}
