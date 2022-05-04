package com.project.fd.owner.reviewcomment.model;

import java.util.List;
import java.util.Map;

public class OwnerReviewListVO {
	private List<Map<String, Object>> optionList;

	public List<Map<String, Object>> getOptionList() {
		return optionList;
	}

	public void setOptionList(List<Map<String, Object>> optionList) {
		this.optionList = optionList;
	}

	@Override
	public String toString() {
		return "OwnerReviewListVO [optionList=" + optionList + "]";
	}
	
	
}
