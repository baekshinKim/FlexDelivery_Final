package com.project.fd.admin.faq.model;

import java.util.List;

public interface AdminFaqCategoryDAO {

	List<AdminFaqCategoryVO> selectCategoryAll();

	List<AdminFaqAllViewVO> selectAll2();

	int insertFaqCategory(AdminFaqCategoryVO faqCategoryVo);

	int updateFaqCategory(AdminFaqCategoryVO faqCategoryVo);

	int deleteFaqCategory(int no);

	boolean checkDu(String fCategoryName);


}
