package com.project.fd.owner.ownerregister.model;

import java.util.List;
import java.util.Map;

import com.project.fd.common.DateSearchVO;
import com.project.fd.owner.advertise.model.OwnerStoreAdVO;
import com.project.fd.owner.store.model.OwnerStoresVO;

public interface OwnerRegisterDAO {
	int insertRegister(OwnerRegisterVO vo);
	List<OwnerAllRegisterVO> selectTempList(DateSearchVO searchVo);
	int getTotalRecord(DateSearchVO searchVo);
	List<Map<String, Object>> selectLSJAgreeListView(int ownerNo);
	int deleteAd(int storeadNo);
	int updateAgreeRegi(OwnerRegisterVO vo);
	int oRegisterNoDup(long oRegisterNo);
	
	//취소 딜리트 다시 츄라이하는중 
	public OwnerStoreAdVO selectAD(int storeadNo);
	public OwnerStoresVO selecSt(int storeNo);
	
	public OwnerRegisterVO selectRegisterByOwnerNo(int ownerNo);//지안 추가 20210211
}
