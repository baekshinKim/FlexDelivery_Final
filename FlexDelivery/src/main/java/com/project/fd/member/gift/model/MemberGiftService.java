package com.project.fd.member.gift.model;

import java.util.List;
import java.util.Map;

public interface MemberGiftService {
	List<MemberGiftVO> selectTakeGiftList(int memberNo);
	List<MemberGiftProductVO> giftProductList(int gCategoryNo);
	int giftCount(int gCategoryNo);
	List<Map<String, Object>> giftCategorySlider();
	List<Map<String, Object>> giftPriceList();
	int giftSend(MemberGiftVO vo);
	List<MemberGiftVO> myTakeGiftList(int memberNo);
	List<MemberGiftVO> myGiveGiftList(int memberNo);
}	
