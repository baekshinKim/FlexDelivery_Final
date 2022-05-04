package com.project.fd.member.gift.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberGiftServiceImpl implements MemberGiftService{
	@Autowired MemberGiftDAO giftDao;

	@Override
	public List<MemberGiftVO> selectTakeGiftList(int memberNo) {
		return giftDao.selectTakeGiftList(memberNo);
	}

	@Override
	public List<MemberGiftProductVO> giftProductList(int gCategoryNo) {
		return giftDao.giftProductList(gCategoryNo);
	}

	@Override
	public int giftCount(int gCategoryNo) {
		return giftDao.giftCount(gCategoryNo);
	}

	@Override
	public List<Map<String, Object>> giftCategorySlider() {
		return giftDao.giftCategorySlider();
	}

	@Override
	public List<Map<String, Object>> giftPriceList() {
		return giftDao.giftPriceList();
	}

	@Override
	public int giftSend(MemberGiftVO vo) {
		return giftDao.giftSend(vo);
	}

	@Override
	public List<MemberGiftVO> myTakeGiftList(int memberNo) {
		return giftDao.myTakeGiftList(memberNo);
	}

	@Override
	public List<MemberGiftVO> myGiveGiftList(int memberNo) {
		return giftDao.myGiveGiftList(memberNo);
	}
	
	
}
