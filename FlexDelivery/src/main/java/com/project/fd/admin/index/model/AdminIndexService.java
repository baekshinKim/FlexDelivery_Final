package com.project.fd.admin.index.model;

import java.util.List;
import java.util.Map;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryVO;

public interface AdminIndexService {
	//리뷰신고
	int selectNewReview();

	//광고신청
	int selectNewAd();

	//사업자 승인
	int selectNewRegister();
	
	//점포 승인
	int selectNewStore();
	
	//점포 변경
	int selectChangeStore();
	
	//오늘의 추천
	//중분류 카테고리 no (랜덤 범위 구하기)
	int selectMNo();
	
	//중분류 카테고리 이름
	AdminMediumCategoryVO selectMCategory(int mCategoryNo);

	//가게 no, 이름, 메뉴 이름
	List<Map<String, Object>> selectFood(int mCategoryNo);
}
