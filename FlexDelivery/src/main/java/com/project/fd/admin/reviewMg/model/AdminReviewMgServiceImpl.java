package com.project.fd.admin.reviewMg.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminReviewMgServiceImpl implements AdminReviewMgService{
	@Autowired
	AdminReviewMgDAO reviewMgDao;

	@Override
	public List<AdminReviewMgVO> reviewMgList() {
		return reviewMgDao.reviewMgList();
	}

	@Override
	public AdminReviewMgVO reviewMgDetail(int no) {
		return reviewMgDao.reviewMgDetail(no);
	}

	@Override
	public int reviewMgAgree(int no) {
		return reviewMgDao.reviewMgAgree(no);
	}

	@Override
	public int reviewMgDeny(int no) {
		return reviewMgDao.reviewMgDeny(no);
	}

}
