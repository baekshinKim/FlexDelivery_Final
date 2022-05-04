package com.project.fd.admin.gift.model;

import java.util.List;

public interface AdminGiftPriceTypeDAO {

	List<AdminGiftPriceTypeVO> selectAll();

	int insertGiftPriceType(AdminGiftPriceTypeVO giftPriceTypeVo);

	int deleteGiftPriceType(AdminGiftPriceTypeVO giftPriceTypeVo);

	int updateGiftPriceType(AdminGiftPriceTypeVO giftPriceTypeVo);

	boolean checkDu(int price);

}
