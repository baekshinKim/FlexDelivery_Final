package com.project.fd.admin.memberMg.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fd.member.model.MemberVO;

@Service
public class AdminMemberMgServiceImpl implements AdminMemberMgService{
	@Autowired
	AdminMemberMgDAO memberMgDao;
	
	@Override
	public List<MemberVO> adminMemberList() {
		return memberMgDao.adminMemberList();
	}

}
