package com.project.fd.owner.board.model;

import java.util.List;

public interface OwnerBoardDAO {

	public List<OwnerBoardVO> selectAll(OwnerBoardSearchVO ownerBoardSearchVo);
	public int selectTotalRecord(OwnerBoardSearchVO ownerBoardSearchVo);
	public OwnerBoardVO selectByNo(int boardNo);
	public List<OwnerBoardVO>  selectMainBoard(String boardHead);
}