package com.project.fd.member.stores.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fd.admin.largecategory.model.AdminLargeCategoryVO;

@Service
public class MemberStoresServiceImpl implements MemberStoresService{
	
	@Autowired private MemberStoresDAO memStoresDao;

	@Override
	public List<MemberStoresVO> selectFlexAdStores(Map<String, Object> map) {
		return memStoresDao.selectFlexAdStores(map);
	}

	@Override
	public List<MemberStoresVO> selectOpenAdStores(Map<String, Object> map) {
		return memStoresDao.selectOpenAdStores(map);
	}

	@Override
	public List<AdminLargeCategoryVO> categorySlider() {
		return memStoresDao.categorySlider();
	}

	@Override
	public List<MemberStoresVO> selectAllStores(Map<String, Object> map) {
		return memStoresDao.selectAllStores(map);
	}

	@Override
	public int selectAllStoresCount(Map<String, Object> map) {
		return memStoresDao.selectAllStoresCount(map);
	}

	@Override
	public MemberStoresVO selectStoresDetail(int storeNo) {
		return memStoresDao.selectStoresDetail(storeNo);
	}

	@Override
	public List<MemberLikeStoreVO> selectLikeStore(int memberNo) {
		return memStoresDao.selectLikeStore(memberNo);
	}

	@Override
	public boolean chkLike(MemberLikeStoreVO vo) {
		int cnt=memStoresDao.chkLike(vo);
		if(cnt>0) {
			return true;
		}
		return false;
	}

	@Override
	public int likeControll(MemberLikeStoreVO vo) {
		int chkLike=memStoresDao.chkLike(vo);
		int cnt=0;
		if(chkLike>0) {
			cnt=memStoresDao.delLike(vo);
			cnt++;
		}else {
			cnt=memStoresDao.addLike(vo);
		}
		return cnt;
	}

	@Override
	public List<MemberStoresVO> likeStoreList(int memberNo) {
		return memStoresDao.likeStoreList(memberNo);
	}

	@Override
	public int today() {
		return memStoresDao.today();
	}
	
	
}
