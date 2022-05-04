package com.project.fd.member.review.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberReviewServiceImpl implements MemberReviewService{
	@Autowired MemberReviewDAO reviewDao;

	@Override
	public List<MemberReviewVO> selectStoreReview(Map<String, Object> map) {
		return reviewDao.selectStoreReview(map);
	}

	@Override
	public boolean reviewChk(Map<String, Object> map) {
		int cnt=reviewDao.reviewChk(map);
		if(cnt>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Map<String, Object>> orderListForReview(Map<String, Object> map) {
		return reviewDao.orderListForReview(map);
	}

	@Override
	public int reviewWrite(MemberReviewVO vo) {
		return reviewDao.reviewWrite(vo);
	}

	@Override
	public int deleteReview(int reviewNo) {
		return reviewDao.deleteReview(reviewNo);
	}

	@Override
	public int selectStoreNoByReview(int reviewNo) {
		return reviewDao.selectStoreNoByReview(reviewNo);
	}

	@Override
	public int reviewLike(int reviewNo) {
		return reviewDao.reviewLike(reviewNo);
	}

	@Override
	public List<MemberReviewCommentVO> selectReviewComment(int StoreNo) {
		return reviewDao.selectReviewComment(StoreNo);
	}

	@Override
	public List<MemberReviewVO> myReviewList(int memberNo) {
		return reviewDao.myReviewList(memberNo);
	}

	@Override
	public List<MemberReviewCommentVO> myReviewComment(int memberNo) {
		return reviewDao.myReviewComment(memberNo);
	}
	
	
	
}
