package com.project.fd.admin.faq.model;

import java.util.List;
import java.util.Map;

public interface AdminFaqDAO {

	List<AdminFaqVO> selectAll();

	List<AdminFaqAllViewVO> selectAll2();

	int insertFaq(AdminFaqVO faqVo);

	int updateFaq(AdminFaqVO faqVo);

	int deleteFaq(int no);

	List<AdminFaqVO> selectFor(int categoryNo);

	List<AdminFaqAllViewVO> selectFor2(int categoryNo);

	List<Map<String, Object>> chkFCategory(int no);


}
