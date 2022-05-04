package com.project.fd.owner.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OwnerBoardServiceImpl implements OwnerBoardService{

	@Autowired
	private OwnerBoardDAO ownerBoardDao;
	

	public List<OwnerBoardVO> selectAll(OwnerBoardSearchVO ownerBoardSearchVo) {
		return ownerBoardDao.selectAll(ownerBoardSearchVo);
	}
	
	public int selectTotalRecord(OwnerBoardSearchVO ownerBoardSearchVo) {
		return ownerBoardDao.selectTotalRecord(ownerBoardSearchVo); 
	}

	public OwnerBoardVO selectByNo(int boardNo) {
		return  ownerBoardDao.selectByNo(boardNo);
	}
		
	public List<OwnerBoardVO>  selectMainBoard(String boardHead){
		return ownerBoardDao.selectMainBoard(boardHead);
	}
}
