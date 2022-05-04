package com.project.fd.admin.index.model;

import java.util.List;
import java.util.Map;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryVO;

public interface AdminIndexDAO {

	int selectNewReview();

	int selectNewAd();

	int selectNewRegister();

	int selectNewStore();

	int selectChangeStore();

	int selectMNo();

	List<Map<String, Object>> selectFood(int mCategoryNo);

	AdminMediumCategoryVO selectMCategory(int mCategoryNo);

}
