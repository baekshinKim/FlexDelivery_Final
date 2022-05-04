package com.project.fd.owner.request.model;

import java.util.List;
import java.util.Map;

import com.project.fd.owner.advertise.model.OwnerStoreAdVO;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;
import com.project.fd.owner.store.model.OwnerStoresVO;
import com.project.fd.owner.store.model.OwnerTemporaryVO;

public interface OwnerRequestService {
	public static final int SUCCESS_POST = 1;
	public static final int FAIL_POST = 2;
	
	public List<Map<String, Object>> selectRegi(int ownerNo);
	public List<Map<String, Object>> selectStore(int ownerNo);
	public List<Map<String, Object>>  selectAd(int ownerNo);
	public List<Map<String, Object>> selectTemp(int ownerNo);
	
	public OwnerRegisterVO selectRegiVo(long oRegisterNo);
	public OwnerStoresVO selectStoresVO(int storeNo);
	public OwnerTemporaryVO selectTempVO(int tNo);
	public OwnerStoreAdVO selectAD(int storeadNo);
	
	public int updateRegi(long oRegisterNo);
	public int updateStore(int storeNo);
	//public int updateAD(long oRegisterNo);
	public int updateTempstore(int tNo);
	
	public boolean pwdCk(String pwd, int ownerNo);
	
	// index count
		public int selectAgree1(int ownerNo);
		public int selectAgree2(int ownerNo);
		public int selectAgree3(int ownerNo);
		public int selectAgree4(int ownerNo);
}
