package com.project.fd.owner.request.model;

import com.project.fd.owner.advertise.model.OwnerStoreAdVO;
import com.project.fd.owner.ownerregister.model.OwnerAgreeCategory;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;
import com.project.fd.owner.store.model.OwnerTemporaryVO;

public class OwnerAllRequestVO extends OwnerAgreeCategory{
	// 사업자등록, 입점 정보 , 광고 , 임시 저장함 (수정 ) +  권한 상속  
		private OwnerRegisterVO ownerRegisterVo;
		
		private OwnerStoreAdVO ownerStoreAdVo;
		
		private OwnerStoreAdVO OwnerStoreAdVO;
		
		private OwnerTemporaryVO ownerTemporaryVo;
		
		

		public OwnerTemporaryVO getOwnerTemporaryVo() {
			return ownerTemporaryVo;
		}

		public void setOwnerTemporaryVo(OwnerTemporaryVO ownerTemporaryVo) {
			this.ownerTemporaryVo = ownerTemporaryVo;
		}

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
					+ ", OwnerStoreAdVO=" + OwnerStoreAdVO + ", ownerTemporaryVo=" + ownerTemporaryVo + "]";
		}
		
}
