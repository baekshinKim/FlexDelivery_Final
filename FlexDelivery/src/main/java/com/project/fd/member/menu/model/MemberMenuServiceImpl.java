package com.project.fd.member.menu.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberMenuServiceImpl implements MemberMenuService{
	
	@Autowired private MemberMenuDAO menuDao;
	
	@Override
	public List<MemberMenuGroupVO> selectMenuGroupByStoreNo(int storeNo) {
		return menuDao.selectMenuGroupByStoreNo(storeNo);
	}

	@Override
	public List<MemberMenuAllVO> selectMenuBySMGroupNo(int sMGroupNo) {
		return menuDao.selectMenuBySMGroupNo(sMGroupNo);
	}

	@Override
	public MemberMenuAllVO selectMainMenu(int storeNo) {
		return menuDao.selectMainMenu(storeNo);
	}

}
