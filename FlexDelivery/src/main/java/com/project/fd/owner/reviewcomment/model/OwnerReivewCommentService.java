package com.project.fd.owner.reviewcomment.model;

import java.util.List;
import java.util.Map;

public interface OwnerReivewCommentService {
	public int insertComm(OwnerReviewCommentVO vo);
	public  List<Map<String, Object>> selectReView(OwnerReviewSearchVO searchVo);
	public int getTotalRecord(OwnerReviewSearchVO searchVo);
	public int deleteComm(int reviewNo);
	public int updateComm(OwnerReviewCommentVO vo);
	public  OwnerReviewCommentVO selectByNo(int reviewNo);
	
	public List<Map<String, Object>> selectNocomment(int storeNo);
	 int NocmtTotalRecord(int storeNo);
	 
	 public List<Map<String, Object>> selectblockcmt(int storeNo);
	 int blockTotalRecord(int storeNo);

	 public List<Map<String, Object>> selectAll(int storeNo);
	 List<Map<String, Object>> reviewReting(int storeNo);
	 
	 public  int reviewSingo(int reviewNo);
}
