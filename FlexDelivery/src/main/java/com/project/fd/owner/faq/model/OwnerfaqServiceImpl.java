package com.project.fd.owner.faq.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fd.admin.faq.model.AdminFaqCategoryVO;

@Service
public class OwnerfaqServiceImpl implements OwnerfaqService{
	
@Autowired private OwnerfaqDAO ownerfaqDao;

@Override
public List<OwnerFaqVO> selectAll(OwnerFaqSearchVO searchVo) {
	return ownerfaqDao.selectAll(searchVo);
}

@Override
public int getTotalRecord(OwnerFaqSearchVO searchVo) {
	return ownerfaqDao.getTotalRecord(searchVo);
}

@Override
public List<AdminFaqCategoryVO> selectCategoryAll() {
	return ownerfaqDao.selectCategoryAll();
}

}
