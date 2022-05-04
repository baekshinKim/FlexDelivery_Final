package com.project.fd.admin.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Autowired
	private AdminBoardDAO boardDao;

	@Override
	public List<AdminBoardVO> selectAll() {
		return boardDao.selectAll();
	}
	@Override
	public List<AdminBoardAllVO> selectNotice() {
		return boardDao.selectNotice();
	}
	@Override
	public List<AdminBoardAllVO> selectEvent() {
		return boardDao.selectEvent();
	}

	@Override
	public AdminBoardVO selectByNo(int no) {
		return boardDao.selectByNo(no);
	}

	@Override
	public int insertBoard(AdminBoardVO vo) {
		return boardDao.insertBoard(vo);
	}

	@Override
	public int updateBoard(AdminBoardVO vo) {
		return boardDao.updateBoard(vo);
	}

	@Override
	public int deleteBoard(int no) {
		return boardDao.deleteBoard(no);
	}
	@Override
	public List<AdminBoardAllVO> selectAll2() {
		return boardDao.selectAll2();
	}
	@Override
	public AdminBoardAllVO selectByNo2(int no) {
		return boardDao.selectByNo2(no);
	}
	
	@Override
	public int selectRn(Map<String, Object> map) {
		return boardDao.selectRn(map);
	}
	@Override
	public Map<String, Object> selectByRn(Map<String, Object> map) {
		return boardDao.selectByRn(map);
	}
	@Override
	public int selectMinRn(Map<String, Object> map) {
		return boardDao.selectMinRn(map);
	}
	@Override
	public int selectMaxRn(Map<String, Object> map) {
		return boardDao.selectMaxRn(map);
	}
	@Override
	public List<Map<String, Object>> selectAllForRn(Map<String, Object> map) {
		return boardDao.selectAllForRn(map);
	}
	
	
}
