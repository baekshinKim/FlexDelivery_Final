package com.project.fd.owner.ownerregister.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.common.DateSearchVO;
import com.project.fd.owner.advertise.model.OwnerStoreAdVO;
import com.project.fd.owner.store.model.OwnerStoresVO;

@Repository
public class OwnerRegisterDAOMybatis implements OwnerRegisterDAO{

	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.ownerlaunch.";
	
	@Override
	public int insertRegister(OwnerRegisterVO vo) {
		return sqlSession.insert(namespace+"insertRegister",vo);
	}

	@Override
	public List<OwnerAllRegisterVO> selectTempList(DateSearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectTempList",searchVo);
	}

	@Override
	public int getTotalRecord(DateSearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord",searchVo);
	}

	@Override
	public List<Map<String, Object>> selectLSJAgreeListView(int ownerNo) {
		return sqlSession.selectList(namespace+"selectLSJAgreeListView",ownerNo);
	}

	@Override
	public int deleteAd(int storeadNo) {
		return sqlSession.delete(namespace+"deleteAd",storeadNo);
	}

	@Override
	public int updateAgreeRegi(OwnerRegisterVO vo) {
		return sqlSession.update(namespace+"updateAgreeRegi",vo);
	}

	@Override
	public int oRegisterNoDup(long oRegisterNo) {
		return sqlSession.selectOne(namespace+"dupckRegiNo",oRegisterNo);
	}

	public OwnerStoreAdVO selectAD(int storeadNo) {
		return sqlSession.selectOne(namespace+"selectAD",storeadNo);
	}

	@Override
	public OwnerStoresVO selecSt(int storeNo) {
		return sqlSession.selectOne(namespace+"selecSt",storeNo);
	}
	
	//지안 20210211 추가
	public OwnerRegisterVO selectRegisterByOwnerNo(int ownerNo) {
		return sqlSession.selectOne(namespace+"selectRegisterByOwnerNo",ownerNo);
	}
}
