package com.project.fd.member.menu.model;

import java.util.List;

public class MemberMenuAllVO {
	private MemberMenuVO memberMenuVo;
	private List<MemberMenuOptionVO> menuOptionList;
	public MemberMenuVO getMemberMenuVo() {
		return memberMenuVo;
	}
	public void setMemberMenuVo(MemberMenuVO memberMenuVo) {
		this.memberMenuVo = memberMenuVo;
	}
	public List<MemberMenuOptionVO> getMenuOptionList() {
		return menuOptionList;
	}
	public void setMenuOptionList(List<MemberMenuOptionVO> menuOptionList) {
		this.menuOptionList = menuOptionList;
	}
	@Override
	public String toString() {
		return "MemberMenuAllVO [vo=" + memberMenuVo + ", menuOptionList=" + menuOptionList + "]";
	}
	
}
