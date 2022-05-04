package com.project.fd.admin.gift.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminGiftCategoryServiceImpl implements AdminGiftCategoryService{

	@Autowired
	private AdminGiftCategoryDAO giftCategoryDao;
	
	@Override
	public List<AdminGiftCategoryVO> selectAll() {
		return giftCategoryDao.selectAll();
	}

	@Override
	public List<AdminGiftCategoryProductVO> selectAll2() {
		return giftCategoryDao.selectAll2();
	}

	@Override
	public int insertGiftCategory(AdminGiftCategoryVO giftCategoryVo) {
		return giftCategoryDao.insertGiftCategory(giftCategoryVo);
	}

	@Override
	public int updateGiftCategory(AdminGiftCategoryVO giftCategoryVo) {
		return giftCategoryDao.updateGiftCategory(giftCategoryVo);
	}

	@Override
	public int deleteGiftCategory(AdminGiftCategoryVO giftCategoryVo) {
		return giftCategoryDao.deleteGiftCategory(giftCategoryVo);
	}

	@Override
	public boolean checkDu(String gCategoryName) {
		return giftCategoryDao.checkDu(gCategoryName);
	}

}
