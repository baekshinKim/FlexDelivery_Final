package com.project.fd.member.model;

import java.util.Map;


public interface MemberService {
	//아이디 중복확인시 사용
		public static final int EXIST_ID=1;  //아이디가 이미 존재하는 경우
		public static final int NON_EXIST_ID=2; //존재하지 않는 경우

		//로그인 처리시 사용
		public static final int LOGIN_OK=1; //로그인 성공
		public static final int ID_NONE=2; //아이디가 없는 경우
		public static final int PWD_DISAGREE=3; //비밀번호 불일치

		public int insertMember(MemberVO vo);
		int loginChk(String userid,String pwd);
		MemberVO selectMember(String userid);
		String selectMemberId(MemberVO vo);
		boolean chkMember(MemberVO vo);
		int pwdUpd(MemberVO vo);
		String selectAuth(int no);
		int checkDup(String memberid);
		public int memloNo(String locationName);
		public int updateMember(MemberVO vo);
		public int rupdateMember(MemberVO vo);
		boolean giftChk(MemberVO vo);
		int selectMemNo(Map<String, Object> map);
		int memberOut(String memberId);
		MemberVO getEmail(String memberId);
}
