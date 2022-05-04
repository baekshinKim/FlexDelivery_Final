package com.project.fd.member.gift.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberGiftDAOMybatis implements MemberGiftDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.memberGift.";
	@Override
	public List<MemberGiftVO> selectTakeGiftList(int memberNo) {
		return sqlSession.selectList(namespace+"selectTakeGiftList",memberNo);
	}
	@Override
	public int useGift(int giftNo) {
		return sqlSession.update(namespace+"useGift",giftNo);
	}
	@Override
	public List<MemberGiftProductVO> giftProductList(int gCategoryNo) {
		return sqlSession.selectList(namespace+"giftProductList",gCategoryNo);
	}
	@Override
	public int giftCount(int gCategoryNo) {
		return sqlSession.selectOne(namespace+"giftCount",gCategoryNo);
	}
	@Override
	public List<Map<String, Object>> giftCategorySlider() {
		return sqlSession.selectList(namespace+"giftCategorySlider");
	}
	@Override
	public List<Map<String, Object>> giftPriceList() {
		return sqlSession.selectList(namespace+"giftPriceList");
	}
	@Override
	public int giftSend(MemberGiftVO vo) {
		return sqlSession.insert(namespace+"giftSend",vo);
	}
	@Override
	public List<MemberGiftVO> myTakeGiftList(int memberNo) {
		return sqlSession.selectList(namespace+"myTakeGiftList",memberNo);
	}
	@Override
	public List<MemberGiftVO> myGiveGiftList(int memberNo) {
		return sqlSession.selectList(namespace+"myGiveGiftList",memberNo);
	}
	
	
	
}
