package com.project.fd.owner.request.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.fd.owner.advertise.model.OwnerStoreAdVO;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;
import com.project.fd.owner.store.model.OwnerStoresVO;
import com.project.fd.owner.store.model.OwnerTemporaryVO;

@Service
public class OwnerRequestServiceImpl implements OwnerRequestService{

	@Autowired OwnerRequestDAO requestDao;

	@Override
	public List<Map<String, Object>> selectRegi(int ownerNo) {
		return requestDao.selectRegi(ownerNo);
	}

	@Override
	public List<Map<String, Object>> selectStore(int ownerNo) {
		return requestDao.selectStore(ownerNo);
	}

	@Override
	public List<Map<String, Object>>  selectAd(int ownerNo) {
		return requestDao.selectAd(ownerNo);
	}

	@Override
	public List<Map<String, Object>> selectTemp(int ownerNo) {
		return requestDao.selectTemp(ownerNo);
	}

	@Override
	public OwnerRegisterVO selectRegiVo(long oRegisterNo) {
		return requestDao.selectRegiVo(oRegisterNo);
	}

	@Override
	public OwnerStoresVO selectStoresVO(int storeNo) {
		return requestDao.selectStoresVO(storeNo);
	}

	@Override
	public OwnerTemporaryVO selectTempVO(int tNo) {
		return requestDao.selectTempVO(tNo);
	}

	@Override
	public OwnerStoreAdVO selectAD(int storeadNo) {
		return requestDao.selectAD(storeadNo);
	}

	@Override
	public int updateRegi(long oRegisterNo) {
		return requestDao.updateRegi(oRegisterNo);
	}

	@Override
	public int updateStore(int storeNo) {
		return requestDao.updateStore(storeNo);
	}

	@Override
	public int updateTempstore(int tNo) {
		return requestDao.updateTempstore(tNo);
	}

	@Override
	public boolean pwdCk(String pwd, int ownerNo) {
		String dbPwd=requestDao.selectPwd(ownerNo);
		
		boolean result=false;
		if(dbPwd.equals(pwd)) {
			result=true;
		}

		return result;
	}

	@Transactional
	@Override
	public int selectAgree1(int ownerNo) {
		int result=0;
		int store1=requestDao.selectAgree1(ownerNo);
		int register1=requestDao.ownerregistercnt1(ownerNo);
		int temp1=requestDao.tempcnt1(ownerNo);
		int adcnt1=requestDao.adcnt1(ownerNo);
		
		result=store1+register1+temp1+adcnt1;
		return result;
	}

	@Transactional
	@Override
	public int selectAgree2(int ownerNo) {
		int result=0;
		int store2=requestDao.selectAgree2(ownerNo);
		int register2=requestDao.ownerregistercnt2(ownerNo);
		int temp2=requestDao.tempcnt2(ownerNo);
		
		result=store2+register2+temp2;
		return result;
	}

	@Transactional
	@Override
	public int selectAgree3(int ownerNo) {
		int result=0;
		int store3=requestDao.selectAgree3(ownerNo);
		int register3=requestDao.ownerregistercnt3(ownerNo);
		int temp3=requestDao.tempcnt3(ownerNo);
		int adcnt=requestDao.adcnt3(ownerNo);
		
		result=store3+register3+temp3+adcnt;
		return result;
	}

	@Transactional
	@Override
	public int selectAgree4(int ownerNo) {
		int result=0;
		int store4=requestDao.selectAgree4(ownerNo);
		int register4=requestDao.ownerregistercnt4(ownerNo);
		int temp4=requestDao.tempcnt4(ownerNo);
		
		result=store4+register4+temp4;
		return result;
	}
	
	
	
}
