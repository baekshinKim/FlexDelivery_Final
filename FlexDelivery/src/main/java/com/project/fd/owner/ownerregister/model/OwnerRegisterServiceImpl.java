package com.project.fd.owner.ownerregister.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fd.common.DateSearchVO;
import com.project.fd.owner.advertise.model.OwnerStoreAdVO;
import com.project.fd.owner.store.model.OwnerStoresVO;

@Service
public class OwnerRegisterServiceImpl implements OwnerRegisterService{

	@Autowired private OwnerRegisterDAO ownerRegisterDao;

	@Override
	public int insertRegister(OwnerRegisterVO vo) {
		return ownerRegisterDao.insertRegister(vo);
	}

	//tempList
	@Override
	public List<OwnerAllRegisterVO> selectTempList(DateSearchVO searchVo) {
		return ownerRegisterDao.selectTempList(searchVo);
	}
	//tempList
	@Override
	public int getTotalRecord(DateSearchVO searchVo) {
		return ownerRegisterDao.getTotalRecord(searchVo);
	}

	@Override
	public List<Map<String, Object>> selectLSJAgreeListView(int ownerNo) {
		return ownerRegisterDao.selectLSJAgreeListView(ownerNo);
	}

	@Override
	public int deleteAd(int storeadNo) {
		return ownerRegisterDao.deleteAd(storeadNo);
	}

	@Override
	public int updateAgreeRegi(OwnerRegisterVO vo) {
		return ownerRegisterDao.updateAgreeRegi(vo);
	}

	@Override
	public int oRegisterNoDup(long oRegisterNo) {
		int count= ownerRegisterDao.oRegisterNoDup(oRegisterNo);
		
		int result=0;
		if(count>0) {
			result=EXIST_REGISTER_NO;
		}else {
			result=NON_EXIST_REGISTER_NO;
		}
		
		return result;
	}

	@Override
	public OwnerStoreAdVO selectAD(int storeadNo) {
		return ownerRegisterDao.selectAD(storeadNo);
	}

	@Override
	public OwnerStoresVO selecSt(int storeNo) {
		return ownerRegisterDao.selecSt(storeNo);
	}


	public OwnerRegisterVO selectRegisterByOwnerNo(int ownerNo) {	//지안 추가 20210211
		return ownerRegisterDao.selectRegisterByOwnerNo(ownerNo);
	}

	
	
	
}
