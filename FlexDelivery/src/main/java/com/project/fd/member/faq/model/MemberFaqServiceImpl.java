package com.project.fd.member.faq.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberFaqServiceImpl implements MemberFaqService{

	@Autowired private MemberFaqDAO memberFaqDao;
	
	@Override
	public List<MemberFaqVo> selectFaq(int fCategoryNo) {
		return memberFaqDao.selectFaq(fCategoryNo);
	}

	@Override
	public List<Map<String, Object>> faqCategoryList() {
		return memberFaqDao.faqCategoryList();
	}

	
}
