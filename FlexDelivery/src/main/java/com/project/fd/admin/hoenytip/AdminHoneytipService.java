package com.project.fd.admin.hoenytip;

import java.util.List;

public interface AdminHoneytipService {
	List<AdminHoneytipVO> selectAll();
	
	AdminHoneytipVO selectByNo(int no);
	
	int insertHoneytip(AdminHoneytipVO vo);
	
	int updateHoneytip(AdminHoneytipVO vo);
	
	int deleteHoneytip(AdminHoneytipVO vo);
	
	List<AdminHoneytipVO> ownerHoneyTip();
}
