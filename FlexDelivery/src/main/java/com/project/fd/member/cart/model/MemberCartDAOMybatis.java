package com.project.fd.member.cart.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberCartDAOMybatis implements MemberCartDAO {
	
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.cart.";
	


	@Override
	public int selectCartChk(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectCartChk",map);
	}


	@Override
	public int deleteByMemberNo(int memberNo) {
		return sqlSession.delete(namespace+"deleteByMemberNo",memberNo);
	}


	@Override
	public int addCart(MemberCartVO vo) {
		return sqlSession.insert(namespace+"addCart",vo);
	}


	@Override
	public int cartExist(MemberCartVO vo) {
		return sqlSession.selectOne(namespace+"cartExist",vo);
	}


	@Override
	public int cartQtyPlus(MemberCartVO vo) {
		return sqlSession.update(namespace+"cartQtyPlus",vo);
	}


	@Override
	public List<MemberCartViewVO> selectCartList(int memberNo) {
		return sqlSession.selectList(namespace+"selectCartList",memberNo);
	}


	@Override
	public int cartMinus(int cartNo) {
		return sqlSession.update(namespace+"cartMinus",cartNo);
	}


	@Override
	public int cartPlus(int cartNo) {
		return sqlSession.update(namespace+"cartPlus",cartNo);
	}


	@Override
	public int deleteCart(int cartNo) {
		return sqlSession.delete(namespace+"deleteCart",cartNo);
	}
	
	
	
}