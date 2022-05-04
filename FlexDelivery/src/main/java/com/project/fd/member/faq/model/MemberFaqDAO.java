package com.project.fd.member.faq.model;

import java.util.List;
import java.util.Map;


public interface MemberFaqDAO {
	public List<MemberFaqVo> selectFaq(int fCategoryNo);
	public List<Map<String, Object>> faqCategoryList();
}
