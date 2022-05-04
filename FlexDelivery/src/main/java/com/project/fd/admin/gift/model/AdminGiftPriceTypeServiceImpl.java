package com.project.fd.admin.gift.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminGiftPriceTypeServiceImpl implements AdminGiftPriceTypeService {

	@Autowired
	private AdminGiftPriceTypeDAO giftPriceTypeDao; 
	
	@Override
	public List<AdminGiftPriceTypeVO> selectAll() {
		return giftPriceTypeDao.selectAll();
	}

	@Override
	public int insertGiftPriceType(AdminGiftPriceTypeVO giftPriceTypeVo) {
		return giftPriceTypeDao.insertGiftPriceType(giftPriceTypeVo);
	}

	@Override
	public int updateGiftPriceType(AdminGiftPriceTypeVO giftPriceTypeVo) {
		return giftPriceTypeDao.updateGiftPriceType(giftPriceTypeVo);
	}

	@Override
	public int deleteGiftPriceType(AdminGiftPriceTypeVO giftPriceTypeVo) {
		return giftPriceTypeDao.deleteGiftPriceType(giftPriceTypeVo);
	}

	@Override
	public boolean checkDu(int price) {
		return giftPriceTypeDao.checkDu(price);
	}

}
