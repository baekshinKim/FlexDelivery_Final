package com.project.fd.admin.temporary.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.fd.admin.controller.AdminStoresEditController;
import com.project.fd.owner.model.OwnerVO;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;
import com.project.fd.owner.store.model.OwnerStoresVO;

@Repository
public class AdminTemporaryDAOMybatis implements AdminTemporaryDAO {
	
	public static final Logger logger
	= LoggerFactory.getLogger(AdminStoresEditController.class);

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace = "config.mybatis.mapper.oracle.adminTemporary.";

	@Override
	public List<AdminTemporaryVO> editList() {
		List<AdminTemporaryVO> list = sqlSession.selectList(namespace + "editList");
		return list;
	}

	@Override
	public AdminTemporaryVO editDetail(int no) {
		AdminTemporaryVO vo = sqlSession.selectOne(namespace + "editDetail", no);
		return vo;
	}

	@Transactional
	@Override
	public int editAgree(AdminTemporaryVO vo) {
		System.out.println(vo);
		int cnt1 = sqlSession.update(namespace + "editOwner", vo);
		int cnt2 = sqlSession.update(namespace + "editRegister", vo);
		int cnt3 = sqlSession.update(namespace + "editStores", vo);
		int cnt4 = sqlSession.update(namespace + "editTemporary", vo);
		logger.info("editOwner 결과값 : cnt1= {}", cnt1);
		logger.info("editRegister 결과값 : cnt2= {}", cnt2);
		logger.info("editStores 결과값 : cnt3= {}", cnt3);
		logger.info("editTemporary 결과값 : cnt4= {}", cnt4);
		
		int result = -1;
		if(cnt1==1 && cnt2==1 && cnt3==1 && cnt4==1) {
			result = 1;
		}		
		return result;
	}

	@Override
	public int editDeny(int no) {
		return sqlSession.update(namespace + "editDeny", no);
	}
}

