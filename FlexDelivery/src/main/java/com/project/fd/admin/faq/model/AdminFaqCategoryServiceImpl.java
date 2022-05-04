package com.project.fd.admin.faq.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminFaqCategoryServiceImpl implements AdminFaqCategoryService {

	@Autowired
	private AdminFaqCategoryDAO faqCategoryDao;
	
	@Override
	public List<AdminFaqCategoryVO> selectCategoryAll() {
		return faqCategoryDao.selectCategoryAll();
	}

	@Override
	public List<AdminFaqAllViewVO> selectAll2() {
		return faqCategoryDao.selectAll2();
	}

	@Override
	public int insertFaqCategory(AdminFaqCategoryVO faqCategoryVo) {
		return faqCategoryDao.insertFaqCategory(faqCategoryVo);
	}

	@Override
	public int updateFaqCategory(AdminFaqCategoryVO faqCategoryVo) {
		return faqCategoryDao.updateFaqCategory(faqCategoryVo);
	}

	@Override
	public int deleteFaqCategory(int no) {
		return faqCategoryDao.deleteFaqCategory(no);
	}

	@Override
	public boolean checkDu(String fCategoryName) {
		return faqCategoryDao.checkDu(fCategoryName);
	}

}
