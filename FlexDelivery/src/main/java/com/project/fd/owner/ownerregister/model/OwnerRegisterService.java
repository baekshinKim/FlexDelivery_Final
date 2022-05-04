package com.project.fd.owner.ownerregister.model;

import java.util.List;
import java.util.Map;

import com.project.fd.common.DateSearchVO;
import com.project.fd.owner.advertise.model.OwnerStoreAdVO;
import com.project.fd.owner.store.model.OwnerStoresVO;

public interface OwnerRegisterService {
	public static final int EXIST_REGISTER_NO=1;  //REGISTER_NO가 이미 존재하는 경우
	public static final int NON_EXIST_REGISTER_NO=2; //REGISTER_NO 허용 
	
	int insertRegister(OwnerRegisterVO vo);
	List<OwnerAllRegisterVO> selectTempList(DateSearchVO searchVo);
	int getTotalRecord(DateSearchVO searchVo);
	List<Map<String, Object>> selectLSJAgreeListView(int ownerNo);
	int deleteAd(int storeadNo);
	int updateAgreeRegi(OwnerRegisterVO vo);
	int oRegisterNoDup(long oRegisterNo);
	
	public OwnerStoreAdVO selectAD(int storeadNo);
	public OwnerStoresVO selecSt(int storeNo);
	
	public OwnerRegisterVO selectRegisterByOwnerNo(int ownerNo);//지안 추가 20210211
	
}
