package com.project.fd.member.faq.model;

import java.util.List;
import java.util.Map;

public interface MemberFaqService {
	public List<MemberFaqVo> selectFaq(int fCategoryNo);
	List<Map<String, Object>> faqCategoryList();
}
