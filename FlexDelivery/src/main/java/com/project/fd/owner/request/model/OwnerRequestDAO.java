package com.project.fd.owner.request.model;

import java.util.List;
import java.util.Map;

import com.project.fd.owner.advertise.model.OwnerStoreAdVO;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;
import com.project.fd.owner.store.model.OwnerStoresVO;
import com.project.fd.owner.store.model.OwnerTemporaryVO;

public interface OwnerRequestDAO {
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
	
	public String selectPwd(int ownerNo); 
	
	// index count
	public int selectAgree1(int ownerNo);
	public int ownerregistercnt1(int ownerNo);
	public int tempcnt1(int ownerNo);
	
	public int selectAgree2(int ownerNo);
	public int ownerregistercnt2(int ownerNo);
	public int tempcnt2(int ownerNo);
	
	public int selectAgree3(int ownerNo);
	public int ownerregistercnt3(int ownerNo);
	public int tempcnt3(int ownerNo);
	
	public int selectAgree4(int ownerNo);
	public int ownerregistercnt4(int ownerNo);
	public int tempcnt4(int ownerNo);
	
	public int adcnt1(int ownerNo);
	public int adcnt3(int ownerNo);
	
}
