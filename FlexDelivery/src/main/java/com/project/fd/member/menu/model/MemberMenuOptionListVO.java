package com.project.fd.member.menu.model;

import java.util.List;

public class MemberMenuOptionListVO {

	private List<MemberMenuOptionVO> optionList;

	public List<MemberMenuOptionVO> getOptionList() {
		return optionList;
	}

	public void setOptionList(List<MemberMenuOptionVO> optionList) {
		this.optionList = optionList;
	}

	@Override
	public String toString() {
		return "MemberMenuOptionListVO [optionList=" + optionList + "]";
	}
	
	
}
