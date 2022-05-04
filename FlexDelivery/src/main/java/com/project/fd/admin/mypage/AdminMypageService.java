package com.project.fd.admin.mypage;

import java.util.List;

import com.project.fd.admin.model.AdminVO;

public interface AdminMypageService {

	int confirmPwd(AdminVO vo);
	int updateInfo(AdminVO vo);
	
	List<AdminVO> selectInfo (AdminVO vo);
	AdminVO selectInfoByNo (int no);
	boolean selectName(String name);

}
