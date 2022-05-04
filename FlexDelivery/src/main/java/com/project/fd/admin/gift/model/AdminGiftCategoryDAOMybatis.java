package com.project.fd.admin.gift.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminGiftCategoryDAOMybatis implements AdminGiftCategoryDAO{

	private String namespace="config.mybatis.mapper.oracle.admingiftcategory.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AdminGiftCategoryVO> selectAll() {
		List<AdminGiftCategoryVO> list=sqlSession.selectList(namespace+"selectAll");
		return list;
	}

	@Override
	public List<AdminGiftCategoryProductVO> selectAll2() {
		List<AdminGiftCategoryProductVO> list=sqlSession.selectList(namespace+"selectAll2");
		return list;
	}

	@Override
	public int insertGiftCategory(AdminGiftCategoryVO giftCategoryVo) {
		int cnt=sqlSession.insert(namespace+"insertGiftCategory", giftCategoryVo);
		// TODO Auto-generated method stub
		return cnt;
	}

	@Override
	public int deleteGiftCategory(AdminGiftCategoryVO giftCategoryVo) {
		int cnt=sqlSession.delete(namespace+"deleteGiftCategory", giftCategoryVo);
		return cnt;
	}

	@Override
	public int updateGiftCategory(AdminGiftCategoryVO giftCategoryVo) {
		int cnt=sqlSession.update(namespace+"updateGiftCategory", giftCategoryVo);
		return cnt;
	}

	@Override
	public boolean checkDu(String gCategoryName) {
		boolean bool=false;
		int cnt=sqlSession.selectOne(namespace+"checkDu", gCategoryName);
		if (cnt==0) {
			bool=true;
		}
		return bool;
	}
}
