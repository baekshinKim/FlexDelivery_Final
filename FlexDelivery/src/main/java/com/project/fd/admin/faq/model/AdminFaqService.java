package com.project.fd.admin.faq.model;

import java.util.List;
import java.util.Map;

public interface AdminFaqService {
	
	List<AdminFaqVO> selectAll();
	
	List<AdminFaqAllViewVO> selectAll2();
	
	List<AdminFaqVO> selectFor(int categoryNo);

	List<AdminFaqAllViewVO> selectFor2(int categoryNo);
	
	
	int insertFaq(AdminFaqVO faqVo);
	
	int updateFaq(AdminFaqVO faqVo);
	
	int deleteFaq(int no);
	
	List<Map<String, Object>> chkFCategory(int no);
	
}
