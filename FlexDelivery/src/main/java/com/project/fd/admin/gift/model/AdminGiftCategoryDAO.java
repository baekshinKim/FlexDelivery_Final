package com.project.fd.admin.gift.model;

import java.util.List;

public interface AdminGiftCategoryDAO {

	List<AdminGiftCategoryVO> selectAll();

	List<AdminGiftCategoryProductVO> selectAll2();

	int insertGiftCategory(AdminGiftCategoryVO giftCategoryVo);

	int deleteGiftCategory(AdminGiftCategoryVO giftCategoryVo);

	int updateGiftCategory(AdminGiftCategoryVO giftCategoryVo);

	boolean checkDu(String gCategoryName);

}
