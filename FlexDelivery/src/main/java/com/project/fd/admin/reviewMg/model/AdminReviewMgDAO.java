package com.project.fd.admin.reviewMg.model;

import java.util.List;

public interface AdminReviewMgDAO {
	public List<AdminReviewMgVO> reviewMgList();
	public AdminReviewMgVO reviewMgDetail(int no);
	public int reviewMgAgree(int no);
	public int reviewMgDeny(int no);
}
