package com.project.fd.admin.gift.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminGiftPriceTypeDAOMybatis implements AdminGiftPriceTypeDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.admingiftpricetype.";

	@Override
	public List<AdminGiftPriceTypeVO> selectAll() {
		List<AdminGiftPriceTypeVO> list=sqlSession.selectList(namespace+"selectAll");
		return list;
	}

	@Override
	public int insertGiftPriceType(AdminGiftPriceTypeVO giftPriceTypeVo) {
		int cnt=sqlSession.insert(namespace+"insertGiftPriceType", giftPriceTypeVo);
		return cnt;
	}

	@Override
	public int deleteGiftPriceType(AdminGiftPriceTypeVO giftPriceTypeVo) {
		int cnt=sqlSession.delete(namespace+"deleteGiftPriceType", giftPriceTypeVo);
		return cnt;
	}

	@Override
	public int updateGiftPriceType(AdminGiftPriceTypeVO giftPriceTypeVo) {
		int cnt=sqlSession.update(namespace+"updateGiftPriceType", giftPriceTypeVo);
		return cnt;
	}

	@Override
	public boolean checkDu(int price) {
		boolean bool=false;
		
		int cnt=sqlSession.selectOne(namespace+"checkDu", price);
		if (cnt==0) {
			bool=true;
		} else {
			bool=false;
		}
		
		return bool;
	}
}
