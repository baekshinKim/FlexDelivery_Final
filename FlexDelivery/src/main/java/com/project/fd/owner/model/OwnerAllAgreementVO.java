package com.project.fd.owner.model;

import com.project.fd.admin.temporary.model.AdminTemporaryVO;
import com.project.fd.owner.advertise.model.OwnerAdvertiseVO;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;
import com.project.fd.owner.store.model.OwnerStoresVO;

public class OwnerAllAgreementVO {
	//사업관리등록서 등록
	private OwnerRegisterVO ownerRegisterVo;
	
	//입점
	private OwnerStoresVO ownerStoresVo;

	// 광고 
	private OwnerAdvertiseVO ownerAdVo;
	
	// temp Stores
	private AdminTemporaryVO tempVo;
	
	public OwnerAdvertiseVO getOwnerAdVo() {
		return ownerAdVo;
	}

	public void setOwnerAdVo(OwnerAdvertiseVO ownerAdVo) {
		this.ownerAdVo = ownerAdVo;
	}

	public AdminTemporaryVO getTempVo() {
		return tempVo;
	}

	public void setTempVo(AdminTemporaryVO tempVo) {
		this.tempVo = tempVo;
	}
	
	public OwnerRegisterVO getOwnerRegisterVo() {
		return ownerRegisterVo;
	}

	public void setOwnerRegisterVo(OwnerRegisterVO ownerRegisterVo) {
		this.ownerRegisterVo = ownerRegisterVo;
	}

	public OwnerStoresVO getOwnerStoresVo() {
		return ownerStoresVo;
	}

	public void setOwnerStoresVo(OwnerStoresVO ownerStoresVo) {
		this.ownerStoresVo = ownerStoresVo;
	}

	@Override
	public String toString() {
		return "OwnerAllAgreementVO [ownerRegisterVo=" + ownerRegisterVo + ", ownerStoresVo=" + ownerStoresVo
				+ ", ownerAdVo=" + ownerAdVo + ", tempVo=" + tempVo + "]";
	}
	
	
	
}
