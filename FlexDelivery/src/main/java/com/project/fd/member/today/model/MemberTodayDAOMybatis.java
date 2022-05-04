package com.project.fd.member.today.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberTodayDAOMybatis implements MemberTodayDAO{

		@Autowired
		private SqlSessionTemplate sqlSession;
		
		private String namespace="config.mybatis.mapper.oracle.memberToday.";
		
		public Map<String, Object> selectMCategory(){
			return sqlSession.selectOne(namespace+"selectMCategory");
		}
		
		public List<Map<String, Object>> selectMCategoryStores(Map<String,Object> map){
			return sqlSession.selectList(namespace+"selectMCategoryStores", map);
		}
		
		public List<Map<String, Object>> selectMenuRandomSix(Map<String, Object> map){
			return sqlSession.selectList(namespace+"selectMenuRandomSix", map);
		}
}
