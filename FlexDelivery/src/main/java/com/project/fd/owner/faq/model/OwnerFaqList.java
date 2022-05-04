package com.project.fd.owner.faq.model;

import java.util.List;

public class OwnerFaqList {
	private List<OwnerFaqVO> FaqItems;

	public List<OwnerFaqVO> getFaqItems() {
		return FaqItems;
	}

	public void setFaqItems(List<OwnerFaqVO> faqItems) {
		FaqItems = faqItems;
	}

	@Override
	public String toString() {
		return "OwnerFaqList [FaqItems=" + FaqItems + "]";
	}
	
	
}
