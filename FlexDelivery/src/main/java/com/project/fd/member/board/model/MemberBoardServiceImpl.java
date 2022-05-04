package com.project.fd.member.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberBoardServiceImpl implements MemberBoardService{
	@Autowired private MemberBoardDAO boardDao;

	@Override
	public List<MemberBoardVO> selectEvent(MemberBoardSearchVO vo) {
		return boardDao.selectEvent(vo);
	}

	@Override
	public List<MemberBoardVO> selectNotice(MemberBoardSearchVO vo) {
		return boardDao.selectNotice(vo);
	}

	@Override
	public int eventCount(MemberBoardSearchVO vo) {
		return boardDao.eventCount(vo);
	}

	@Override
	public int noticeCount(MemberBoardSearchVO vo) {
		return boardDao.noticeCount(vo);
	}

	@Override
	public MemberBoardVO boardDetail(int boardNo) {
		return boardDao.boardDetail(boardNo);
	}

	@Override
	public List<MemberBoardVO> boardMain() {
		return boardDao.boardMain();
	}
}
