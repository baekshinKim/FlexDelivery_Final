package com.project.fd.admin.largecategory.model;

import java.util.List;
import java.util.Map;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryViewVO;
import com.project.fd.common.SearchVO;

public interface AdminLargeCategoryDAO {

	List<AdminLargeCategoryVO> selectAll();

	int selectTotalRecord(SearchVO searchVo);

	AdminLargeCategoryVO selectByNo(int no);

	public int insertLargeCategory(AdminLargeCategoryVO largeCategoryVo);

	int updateLargeCategory(AdminLargeCategoryVO largecategoryVo);

	int deleteLargeCategory(AdminLargeCategoryVO largeCategoryVO);

	List<AdminMediumCategoryViewVO> selectAll2();

	boolean checkDu(String content);

	
}
