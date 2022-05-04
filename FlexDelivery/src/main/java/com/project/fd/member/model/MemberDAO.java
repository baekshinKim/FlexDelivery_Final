package com.project.fd.member.model;

import java.util.Map;

public interface MemberDAO {
	public int insertMember(MemberVO vo);
	public String selectPwd(String userid);
	MemberVO selectMember(String userid);
	String selectMemberId(MemberVO vo);
	int chkMember(MemberVO vo);
	int pwdUpd(MemberVO vo);
	String selectAuth(int no);
	public int checkDup(String memberid);
	public int memloNo(String locationName);
	public int updateMember(MemberVO vo);
	public int rupdateMember(MemberVO vo);
	int giftChk(MemberVO vo);
	int selectMemNo(Map<String, Object> map);
	int memberOut(String memberId);
	MemberVO getEmail(String memberId);
}
