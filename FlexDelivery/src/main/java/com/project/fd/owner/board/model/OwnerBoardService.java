package com.project.fd.owner.board.model;

import java.util.List;

public interface OwnerBoardService {
	public static final String BOARD_NOTICE="공지사항";
	public static final String BOARD_EVENT="이벤트";
	
	public List<OwnerBoardVO> selectAll(OwnerBoardSearchVO ownerBoardSearchVo); 
	public int selectTotalRecord(OwnerBoardSearchVO ownerBoardSearchVo); 
	public OwnerBoardVO selectByNo(int boardNo);
	public List<OwnerBoardVO>  selectMainBoard(String boardHead);
}
