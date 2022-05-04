package com.project.fd.owner.advertise.model;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class OwnerAdvertiseServiceImpl implements OwnerAdvertiseService {
	
	@Autowired
	private OwnerAdvertiseDAO ownerAdvertiseDao;

	@Override
	public List<OwnerAdvertiseAllVO> selectAdvertieseView(int storeNo) {
		return ownerAdvertiseDao.selectAdvertieseView(storeNo);
	}
	
	public List<OwnerAdvertiseVO> selectAdvertise(){
		return ownerAdvertiseDao.selectAdvertise();
	}
	
	public OwnerAdvertiseVO selectAdvertiseByNo(int no) {
		return  ownerAdvertiseDao.selectAdvertiseByNo(no);
	}
	
	public int insertAdvertiseAd(OwnerStoreAdVO ownerStoreAdVo) {
		return ownerAdvertiseDao.insertAdvertiseAd(ownerStoreAdVo);
	}
	
	public List<OwnerAdvertiseAllVO> selectAdvertieseViewExpire(OwnerAdvertiseSearchVO ownerAdvertiseSearchVo){
		return ownerAdvertiseDao.selectAdvertieseViewExpire(ownerAdvertiseSearchVo);
	}
	public int selectTotalRecord(OwnerAdvertiseSearchVO ownerAdvertiseSearchVo) {
		return ownerAdvertiseDao.selectTotalRecord(ownerAdvertiseSearchVo);
	}
}
