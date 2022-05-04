package com.project.fd.owner.faq.model;

import java.util.List;

import com.project.fd.admin.faq.model.AdminFaqCategoryVO;

public interface OwnerfaqDAO {
	List<OwnerFaqVO> selectAll(OwnerFaqSearchVO searchVo);
	 int getTotalRecord(OwnerFaqSearchVO searchVo);
	  List<AdminFaqCategoryVO> selectCategoryAll();
}
