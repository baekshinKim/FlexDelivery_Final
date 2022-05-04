package com.project.fd.member.order.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberOrderDAOMybatis implements MemberOrderDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.memberOrder.";
	
	@Override
	public int insertOrder(MemberOrderVO vo) {
		return sqlSession.insert(namespace+"insertOrder",vo);
	}

	@Override
	public int insertOrderDetail(MemberOrderDetailVO vo) {
		return sqlSession.insert(namespace+"insertOrderDetail",vo);
	}

	@Override
	public List<MemberOrderAllVO> selectOrderOkList(int memberNo) {
		return sqlSession.selectList(namespace+"selectOrderOkList",memberNo);
	}

	@Override
	public List<MemberOrderAllVO> selectOrderIngList(int memberNo) {
		return sqlSession.selectList(namespace+"selectOrderIngList",memberNo);
	}

	@Override
	public List<MemberOrderAllVO> selectOrderCancelList(int memberNo){
		return sqlSession.selectList(namespace+"selectOrderCancelList",memberNo);
	}

	@Override
	public MemberOrderAllVO selectOrderAllByOrdersNo(int ordersNo) {
		return sqlSession.selectOne(namespace+"selectOrderAllByOrdersNo",ordersNo);
	}
}
