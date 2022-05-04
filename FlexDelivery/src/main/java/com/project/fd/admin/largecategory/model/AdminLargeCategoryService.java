package com.project.fd.admin.largecategory.model;

import java.util.List;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryViewVO;
import com.project.fd.common.SearchVO;

public interface AdminLargeCategoryService {

	List<AdminLargeCategoryVO> selectAll();
	
	List<AdminMediumCategoryViewVO> selectAll2();

	int selectTotalRecord(SearchVO searchVo);

	AdminLargeCategoryVO selectByNo(int no);

	int insertLargeCategory(AdminLargeCategoryVO largecategoryVo);

	int updateLargeCategory(AdminLargeCategoryVO largecategoryVo);

	int deleteLargeCategory(AdminLargeCategoryVO largecategoryVo);

	boolean checkDu(String content);

}
