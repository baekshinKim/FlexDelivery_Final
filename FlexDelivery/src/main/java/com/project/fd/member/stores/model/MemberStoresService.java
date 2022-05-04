package com.project.fd.member.stores.model;

import java.util.List;
import java.util.Map;

import com.project.fd.admin.largecategory.model.AdminLargeCategoryVO;

public interface MemberStoresService {
	List<MemberStoresVO> selectFlexAdStores(Map<String, Object> map);
	List<MemberStoresVO> selectOpenAdStores(Map<String, Object> map);
	List<AdminLargeCategoryVO> categorySlider();
	List<MemberStoresVO> selectAllStores(Map<String, Object> map);
	int selectAllStoresCount(Map<String, Object> map);
	MemberStoresVO selectStoresDetail(int storeNo);
	List<MemberLikeStoreVO> selectLikeStore(int memberNo);
	boolean chkLike(MemberLikeStoreVO vo);
	int likeControll(MemberLikeStoreVO vo);
	List<MemberStoresVO> likeStoreList(int memberNo);
	int today();
}
