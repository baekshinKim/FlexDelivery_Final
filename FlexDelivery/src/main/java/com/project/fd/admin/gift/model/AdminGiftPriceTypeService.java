package com.project.fd.admin.gift.model;

import java.util.List;

public interface AdminGiftPriceTypeService {
	List<AdminGiftPriceTypeVO> selectAll();
	
	int insertGiftPriceType(AdminGiftPriceTypeVO giftPriceTypeVo);
	
	int updateGiftPriceType(AdminGiftPriceTypeVO giftPriceTypeVo);
	
	int deleteGiftPriceType(AdminGiftPriceTypeVO giftPriceTypeVo);

	boolean checkDu(int price);
	
	
}
