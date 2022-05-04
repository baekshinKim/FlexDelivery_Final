package com.project.fd.owner.reviewcomment.model;

import java.util.List;
import java.util.Map;

public interface OwnerReivewCommentDAO {
	 int insertComm(OwnerReviewCommentVO vo);
	 List<Map<String, Object>> selectReView(OwnerReviewSearchVO searchVo);
	 int getTotalRecord(OwnerReviewSearchVO searchVo);
	 int deleteComm(int reviewNo);
	 int updateComm(OwnerReviewCommentVO vo);
	 OwnerReviewCommentVO selectByNo(int reviewNo);
	 
	 public List<Map<String, Object>> selectNocomment(int storeNo);
	 int NocmtTotalRecord(int storeNo);
	 
	 public List<Map<String, Object>> selectblockcmt(int storeNo);
	 int blockTotalRecord(int storeNo);
	 
	 List<Map<String, Object>> selectAll(int storeNo);
	 List<Map<String, Object>> reviewReting(int storeNo);
	 
	public  int reviewSingo(int reviewNo);
}
