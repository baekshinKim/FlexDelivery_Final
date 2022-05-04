package com.project.fd.owner.store.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.owner.common.LocationVO;
import com.project.fd.owner.model.OwnerAuthorityVO;

@Repository
public class OwnerStoresDAOMybatis implements OwnerStoresDAO{

	@Autowired SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.ownerstores.";
	
	public int insertOwnerStores(OwnerStoresVO vo) {
		return sqlSession.insert(namespace+"registerStores",vo);
	}

	public int selectStoreNoByNo(int ownerNo) {
		return sqlSession.selectOne(namespace+"selectStoreNoByNo", ownerNo);
	}


	
	
	@Override
	public List<LocationVO> AllLocaion() {
		return sqlSession.selectList(namespace+"AllLocation");
	}

	public OwnerAuthorityVO selectOwnerAuthorityAll(String userid) {
		return sqlSession.selectOne(namespace+"selectOwnerAuthorityAll", userid);
	}
	
	@Override
	public OwnerStoresVO selectByNo(int storeNo) {
		return sqlSession.selectOne(namespace+"selectByNo",storeNo);
	}

	@Override
	public int updateStores(OwnerStoresVO ownerStoresVO) {
		return sqlSession.update(namespace+"updateStores",ownerStoresVO);
	}	

	public OwnerStoresVO selectStoreByOwnerNo(int ownerNo) {
		return sqlSession.selectOne(namespace+"selectStoreByOwnerNo", ownerNo);
	}
	
	public Map<String, Object> selectOperationViewAll(int ownerNo) {
		return sqlSession.selectOne(namespace+"selectOperationViewAll", ownerNo);
	}
	
	public int holidayUpdate(Map<String, Object> map) {
		return sqlSession.update(namespace+"holidayUpdate", map);
	}
	
	public int updateStatus(Map<String,Object> map) { //지안 20210211수정
		return sqlSession.update(namespace+"updateStatus", map);
	}
	
	public int updateTime(Map<String,Object> map) {
		return sqlSession.update(namespace+"updateTime", map);
	}
	
	public int updateMinPrice(Map<String,Object> map) { //지안 20210217 추가
		return sqlSession.update(namespace+"updateMinPrice", map);
	}
	
	
	//백신 
	public OwnerStoresVO selectBasic(int ownerNo) {
		return sqlSession.selectOne(namespace+"selectBasic", ownerNo);
	}
	
	public int updateContent(Map<String, Object> map) {
		return sqlSession.update(namespace+"updateContent", map);
	}
	
	public int updateLogo(OwnerStoresVO ownerStoresVo) {
		return sqlSession.update(namespace+"updatelogo", ownerStoresVo);
	}

	
	public List<Map<String, Object>> selectsStatusAll(){
		return sqlSession.selectList(namespace+"selectsStatusAll");
	}
	
	
	//지안 20210211 수정 다시 시작
	public String selectLCategoryName(int lCategoryNo) {
		return sqlSession.selectOne(namespace+"selectLCategoryName", lCategoryNo);
	}
	//지안 20210211 수정끝
	
	public int dupckstores(int ownerNo) {
		return sqlSession.selectOne(namespace+"dupckstores", ownerNo);
	}
	
	public int dupckregi(int ownerNo) {
		return sqlSession.selectOne(namespace+"dupckregi", ownerNo);
	}

}
