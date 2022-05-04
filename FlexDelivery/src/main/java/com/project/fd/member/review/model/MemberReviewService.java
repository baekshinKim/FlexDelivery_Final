package com.project.fd.member.review.model;

import java.util.List;
import java.util.Map;

public interface MemberReviewService {
	List<MemberReviewVO> selectStoreReview(Map<String, Object> map);
	boolean reviewChk(Map<String, Object> map);
	List<Map<String,Object>> orderListForReview(Map<String, Object> map);
	int reviewWrite(MemberReviewVO vo);
	int deleteReview(int reviewNo);
	int selectStoreNoByReview(int reviewNo);
	int reviewLike(int reviewNo);
	List<MemberReviewCommentVO> selectReviewComment(int StoreNo);
	List<MemberReviewVO> myReviewList(int memberNo);
	List<MemberReviewCommentVO> myReviewComment(int memberNo);
}
