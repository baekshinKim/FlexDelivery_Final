package com.project.fd.owner.advertise.model;

import java.util.List;

import com.project.fd.common.SearchVO;

public interface OwnerAdvertiseService {
	public List<OwnerAdvertiseAllVO> selectAdvertieseView(int storeNo);
	public List<OwnerAdvertiseVO> selectAdvertise();
	public OwnerAdvertiseVO selectAdvertiseByNo(int no);
	public int insertAdvertiseAd(OwnerStoreAdVO ownerStoreAdVo);
	public List<OwnerAdvertiseAllVO> selectAdvertieseViewExpire(OwnerAdvertiseSearchVO ownerAdvertiseSearchVo);
	public int selectTotalRecord(OwnerAdvertiseSearchVO ownerAdvertiseSearchVo);
}
