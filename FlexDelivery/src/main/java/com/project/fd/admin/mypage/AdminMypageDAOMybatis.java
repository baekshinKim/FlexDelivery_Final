package com.project.fd.admin.mypage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.admin.model.AdminVO;

@Repository
public class AdminMypageDAOMybatis implements AdminMypageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.adminmypage.";
	
	@Override
	public int confirmPwd(AdminVO vo) {
		int cnt=sqlSession.selectOne(namespace+"confirmPwd", vo);
		return cnt;
	}

	@Override
	public int updateInfo(AdminVO vo) {
		int cnt=sqlSession.update(namespace+"updateInfo", vo);
		return cnt;
	}

	@Override
	public List<AdminVO> selectInfo(AdminVO vo) {
		return sqlSession.selectList(namespace+"selectInfo", vo);
	}

	@Override
	public AdminVO selectInfoByNO(int no) {
		return sqlSession.selectOne(namespace+"selectInfoByNo", no);
	}

	@Override
	public boolean selectName(String name) {
		boolean bool=false;
		int cnt=sqlSession.selectOne(namespace+"selectName", name);
		if (cnt==0) {
			bool=true;
		}
		return bool;
	}

}
