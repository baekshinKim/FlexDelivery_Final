package com.project.fd.admin.mediumcategory.model;

import java.util.List;

public interface AdminMediumCategoryService {

	List<AdminMediumCategoryViewVO> selectAll2();
	
	int insertMediumcategory(AdminMediumCategoryVO mediumCategoryVo);

	int updateMediumcategory(AdminMediumCategoryVO mediumCategoryVo);
	
	int deleteMediumcategory(AdminMediumCategoryVO mediumCategoryVo);

	boolean checkDu(String mCategoryName);

}
