package com.project.fd.member.today.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberTodayServiceImpl implements MemberTodayService{

	@Autowired
	private MemberTodayDAO memberTodayDao;
	
	public Map<String, Object> selectMCategory(){
		return memberTodayDao.selectMCategory();
	}
	
	public List<Map<String, Object>> selectMCategoryStores(Map<String,Object> map){
		return memberTodayDao.selectMCategoryStores(map);
	}
	
	public List<Map<String, Object>> selectMenuRandomSix(Map<String, Object> map){
		return memberTodayDao.selectMenuRandomSix(map);
	}
	
}
