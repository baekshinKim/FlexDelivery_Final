package com.project.fd.owner.ask.model;

import com.project.fd.common.SearchVO;

public class OwnerAskSearchVO extends SearchVO{

	private String askId;

	public String getAskId() {
		return askId;
	}

	public void setAskId(String askId) {
		this.askId = askId;
	}

	@Override
	public String toString() {
		return "OwnerAskSearchVO [askId=" + askId + "]";
	}
	
	
}
