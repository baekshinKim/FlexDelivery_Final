package com.project.fd.admin.mediumcategory.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminMediumCategoryServiceImpl implements AdminMediumCategoryService{
	@Autowired
	private AdminMediumCategoryDAO mediumCategoryDao;
	
	@Override
	public List<AdminMediumCategoryViewVO> selectAll2() {
		return mediumCategoryDao.selectAll2();
	}

	@Override
	public int insertMediumcategory(AdminMediumCategoryVO mediumCategoryVo) {
		return mediumCategoryDao.insertMediumcategory(mediumCategoryVo);
	}

	@Override
	public int updateMediumcategory(AdminMediumCategoryVO mediumCategoryVo) {
		return mediumCategoryDao.updateMediumcategory(mediumCategoryVo);
	}

	@Override
	public int deleteMediumcategory(AdminMediumCategoryVO mediumCategoryVo) {
		return mediumCategoryDao.deleteMediumcategory(mediumCategoryVo);
	}

	@Override
	public boolean checkDu(String mCategoryName) {
		return mediumCategoryDao.checkDu(mCategoryName);
	}

}
