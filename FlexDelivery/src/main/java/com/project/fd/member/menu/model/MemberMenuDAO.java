package com.project.fd.member.menu.model;

import java.util.List;

public interface MemberMenuDAO {
	List<MemberMenuGroupVO> selectMenuGroupByStoreNo(int storeNo);
	List<MemberMenuAllVO> selectMenuBySMGroupNo(int sMGroupNo);
	MemberMenuAllVO selectMainMenu(int storeNo);
}
