package com.project.fd.owner.board.model;

import com.project.fd.common.SearchVO;

public class OwnerBoardSearchVO extends SearchVO{
	
	private String boardHead;

	public String getBoardHead() {
		return boardHead;
	}

	public void setBoardHead(String boardHead) {
		this.boardHead = boardHead;
	}

	@Override
	public String toString() {
		return "OwnerBoardSearchVO [boardHead=" + boardHead + "]";
	}


	
	
}
