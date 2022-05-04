package com.project.fd.owner.model;

public class OwnerAuthorityVO {
	private long oRegisterNo;
	private int ragreeno; //별칭이라 혹시몰라 붙여썼습니다. _ 안썼어요
	private int storeNo;
	private int sagreeno; // 별칭이라 혹시 몰라 붙여썼어요 언더바 안썼어요
	private int ownerNo;
	private String ownerId;
	
	public long getoRegisterNo() {
		return oRegisterNo;
	}
	public int getRagreeno() {
		return ragreeno;
	}
	public void setRagreeno(int ragreeno) {
		this.ragreeno = ragreeno;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public int getSagreeno() {
		return sagreeno;
	}
	public void setSagreeno(int sagreeno) {
		this.sagreeno = sagreeno;
	}
	public int getOwnerNo() {
		return ownerNo;
	}
	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}
	public String getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}
	public void setoRegisterNo(long oRegisterNo) {
		this.oRegisterNo = oRegisterNo;
	}
	@Override
	public String toString() {
		return "OwnerAuthorityVO [oRegisterNo=" + oRegisterNo + ", ragreeno=" + ragreeno + ", storeNo=" + storeNo
				+ ", sagreeno=" + sagreeno + ", ownerNo=" + ownerNo + ", ownerId=" + ownerId + "]";
	}
	
	
	
	
	
}
