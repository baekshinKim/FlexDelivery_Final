package com.project.fd.admin.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fd.admin.model.AdminVO;

@Service
public class AdminMypageServiceImpl implements AdminMypageService{

	@Autowired
	private AdminMypageDAO mypageDao;
	
	@Override
	public int confirmPwd(AdminVO vo) {
		return mypageDao.confirmPwd(vo);
	}

	@Override
	public int updateInfo(AdminVO vo) {
		return mypageDao.updateInfo(vo);
	}

	@Override
	public List<AdminVO> selectInfo(AdminVO vo) {
		return mypageDao.selectInfo(vo);
	}

	@Override
	public AdminVO selectInfoByNo(int no) {
		return mypageDao.selectInfoByNO(no);
	}

	@Override
	public boolean selectName(String name) {
		return mypageDao.selectName(name);
	}

}
