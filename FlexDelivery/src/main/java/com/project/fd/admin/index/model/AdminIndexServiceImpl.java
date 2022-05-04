package com.project.fd.admin.index.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryVO;

@Service
public class AdminIndexServiceImpl implements AdminIndexService{

	@Autowired
	private AdminIndexDAO indexDao;

	@Override
	public int selectNewReview() {
		return indexDao.selectNewReview();
	}

	@Override
	public int selectNewAd() {
		return indexDao.selectNewAd();
	}

	@Override
	public int selectNewRegister() {
		return indexDao.selectNewRegister();
	}

	@Override
	public int selectNewStore() {
		return indexDao.selectNewStore();
	}

	@Override
	public int selectChangeStore() {
		return indexDao.selectChangeStore();
	}

	@Override
	public int selectMNo() {
		return indexDao.selectMNo();
	}

	@Override
	public AdminMediumCategoryVO selectMCategory(int mCategoryNo) {
		return indexDao.selectMCategory(mCategoryNo);
	}

	@Override
	public List<Map<String, Object>> selectFood(int mCategoryNo) {
		return indexDao.selectFood(mCategoryNo);
	}
	
	

}
