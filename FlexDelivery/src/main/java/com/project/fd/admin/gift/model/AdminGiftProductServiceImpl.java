package com.project.fd.admin.gift.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminGiftProductServiceImpl implements AdminGiftProductService{

	@Autowired
	private AdminGiftProductDAO giftProductDao;
	
	@Override
	public List<AdminGiftProductVO> selectAll() {
		return giftProductDao.selectAll();
	}

	@Override
	public List<AdminGiftCategoryProductVO> selectAll2() {
		return giftProductDao.selectAll2();
	}

	@Override
	public int insertGiftProduct(AdminGiftProductVO giftProductVo) {
		return giftProductDao.insertGiftProduct(giftProductVo);
	}

	@Override
	public int updateGiftProduct(AdminGiftProductVO giftProductVo) {
		return giftProductDao.updateGiftProduct(giftProductVo);
	}

	@Override
	public int deleteGiftProduct(AdminGiftProductVO giftProductVo) {
		return giftProductDao.deleteGiftProduct(giftProductVo);
	}

	@Override
	public boolean checkDu(String gProductName) {
		return giftProductDao.checkDu(gProductName);
	}

	@Override
	public List<AdminGiftCategoryProductVO> selectForAll2(int categoryNo) {
		return giftProductDao.selectForAll2(categoryNo);
	}

}
