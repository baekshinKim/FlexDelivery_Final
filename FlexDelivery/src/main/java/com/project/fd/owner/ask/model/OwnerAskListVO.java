package com.project.fd.owner.ask.model;

import java.util.List;

public class OwnerAskListVO {
	private List<OwnerAskVO> AskItems;

	public List<OwnerAskVO> getAskItems() {
		return AskItems;
	}

	public void setAskItems(List<OwnerAskVO> askItems) {
		AskItems = askItems;
	}

	@Override
	public String toString() {
		return "OwnerAskListVO [AskItems=" + AskItems + "]";
	}
	
	
}
