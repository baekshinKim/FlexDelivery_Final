package com.project.fd.admin.gift.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.admin.faq.model.AdminFaqAllViewVO;

@Repository
public class AdminGiftProductDAOMybatis implements AdminGiftProductDAO{

	private String namespace="config.mybatis.mapper.oracle.admingiftproduct.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AdminGiftProductVO> selectAll() {
		List<AdminGiftProductVO> list=sqlSession.selectList(namespace+"selectAll");
		return list;
	}

	@Override
	public List<AdminGiftCategoryProductVO> selectAll2() {
		List<AdminGiftCategoryProductVO> list=sqlSession.selectList(namespace+"selectAll2");
		return list;
	}

	@Override
	public int insertGiftProduct(AdminGiftProductVO giftProductVo) {
		int cnt=sqlSession.insert(namespace+"insertGiftProduct", giftProductVo);
		// TODO Auto-generated method stub
		return cnt;
	}

	@Override
	public int deleteGiftProduct(AdminGiftProductVO giftProductVo) {
		int cnt=sqlSession.delete(namespace+"deleteGiftProduct", giftProductVo);
		return cnt;
	}

	@Override
	public int updateGiftProduct(AdminGiftProductVO giftProductVo) {
		int cnt=sqlSession.update(namespace+"updateGiftProduct", giftProductVo);
		return cnt;
	}

	@Override
	public boolean checkDu(String gProductName) {
		boolean bool;
		int cnt=sqlSession.selectOne(namespace+"checkDu", gProductName);
		if (cnt==0) {
			bool=true;
		} else {
			bool=false;
		}
		return bool;
	}

	@Override
	public List<AdminGiftCategoryProductVO> selectForAll2(int categoryNo) {
		List<AdminGiftCategoryProductVO> list=sqlSession.selectList(namespace+"selectForAll2", categoryNo);
		return list;
	}
}
