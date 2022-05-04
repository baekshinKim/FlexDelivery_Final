package com.project.fd.member.today.model;

import java.util.List;
import java.util.Map;

public interface MemberTodayDAO {
	public Map<String, Object> selectMCategory();
	public List<Map<String, Object>> selectMCategoryStores(Map<String,Object> map);
	public List<Map<String, Object>> selectMenuRandomSix(Map<String, Object> map);
}
