package com.project.fd.owner.advertise.model;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.common.SearchVO;

@Repository
public class OwnerAdvertiseDAOMybatis implements OwnerAdvertiseDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.owneradvertise.";
	
	
	@Override
	public List<OwnerAdvertiseAllVO> selectAdvertieseView(int storeNo) {
		return sqlSession.selectList(namespace+"selectAdvertieseView", storeNo);
	}
	
	public List<OwnerAdvertiseVO> selectAdvertise() {
		return sqlSession.selectList(namespace+"selectAdvertise");
	}
	
	public OwnerAdvertiseVO selectAdvertiseByNo(int no) {
		return sqlSession.selectOne(namespace+"selectAdvertiseByNo", no);
	}
	
	public int insertAdvertiseAd(OwnerStoreAdVO ownerStoreAdVo) {
		return sqlSession.insert(namespace+"insertAdvertiseAd", ownerStoreAdVo);
	}
	
	public List<OwnerAdvertiseAllVO> selectAdvertieseViewExpire(OwnerAdvertiseSearchVO ownerAdvertiseSearchVo) {
		return sqlSession.selectList(namespace+"selectAdvertieseViewExpire", ownerAdvertiseSearchVo);
	}
	
	public int selectTotalRecord(OwnerAdvertiseSearchVO ownerAdvertiseSearchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",ownerAdvertiseSearchVo);
	}
	
	
	
	
}
