package com.project.fd.owner.ownerregister.model;

import com.project.fd.owner.advertise.model.OwnerStoreAdVO;

public class OwnerAllRegisterVO {
private OwnerRegisterVO ownerRegisterVo;
	
	private OwnerStoreAdVO ownerStoreAdVo;
	
	private OwnerStoreAdVO OwnerStoreAdVO;

	public OwnerRegisterVO getOwnerRegisterVo() {
		return ownerRegisterVo;
	}

	public void setOwnerRegisterVo(OwnerRegisterVO ownerRegisterVo) {
		this.ownerRegisterVo = ownerRegisterVo;
	}

	public OwnerStoreAdVO getOwnerStoreAdVo() {
		return ownerStoreAdVo;
	}

	public void setOwnerStoreAdVo(OwnerStoreAdVO ownerStoreAdVo) {
		this.ownerStoreAdVo = ownerStoreAdVo;
	}

	public OwnerStoreAdVO getOwnerStoreAdVO() {
		return OwnerStoreAdVO;
	}

	public void setOwnerStoreAdVO(OwnerStoreAdVO ownerStoreAdVO) {
		OwnerStoreAdVO = ownerStoreAdVO;
	}

	@Override
	public String toString() {
		return "OwnerAllRegisterVO [ownerRegisterVo=" + ownerRegisterVo + ", ownerStoreAdVo=" + ownerStoreAdVo
				+ ", OwnerStoreAdVO=" + OwnerStoreAdVO + "]";
	}
}
