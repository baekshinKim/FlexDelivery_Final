package com.project.fd.owner.temporary.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.owner.store.model.OwnerTemporaryVO;

@Repository
public class OwnerTemporaryDAOMybatis implements OwnerTemporaryDAO{

	@Autowired SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.ownertemporary.";
	
	public Map<String,Object> selectOwnerInfoAll(String ownerId){
		return sqlSession.selectOne(namespace+"selectOwnerInfoAll",ownerId);
	}
	
	public int selectLocationNoByLocationName(String locationName) {
		return sqlSession.selectOne(namespace+"selectLocationNoByLocationName",locationName);
	}
	
	public int selectAgreeCount(int ownerNo) {
		return sqlSession.selectOne(namespace+"selectAgreeCount", ownerNo);
	}
	
	public int insertTemporary(OwnerTemporaryVO ownerTemporaryVo){
		return sqlSession.insert(namespace+"insertTemporary", ownerTemporaryVo);
	}
}
