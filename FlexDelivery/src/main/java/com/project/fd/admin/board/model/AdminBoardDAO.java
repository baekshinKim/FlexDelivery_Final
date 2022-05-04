package com.project.fd.admin.board.model;

import java.util.List;
import java.util.Map;

public interface AdminBoardDAO {

	List<AdminBoardVO> selectAll();
	AdminBoardVO selectByNo(int no);

	int insertBoard(AdminBoardVO vo);
	int updateBoard(AdminBoardVO vo);
	int deleteBoard(int no);

	List<AdminBoardAllVO> selectNotice();
	List<AdminBoardAllVO> selectEvent();

	List<AdminBoardAllVO> selectAll2();
	AdminBoardAllVO selectByNo2(int no);

	int selectRn(Map<String, Object> map);
	Map<String, Object> selectByRn(Map<String, Object> map);
	int selectMinRn(Map<String, Object> map);
	int selectMaxRn(Map<String, Object> map);
	List<Map<String, Object>> selectAllForRn(Map<String, Object> map);

}
