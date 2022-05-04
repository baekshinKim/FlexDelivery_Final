package com.project.fd.owner.model;

import java.util.Map;

public interface OwnerService {
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int ID_NONE=2; //아이디가 없는 경우
	public static final int PWD_DISAGREE=3; //비밀번호 불일치
	
	//advertise 에서 로그인 창 들어갈때 필요한 상수
	public static final int GO_PWD=4;
	
	//아이디 중복확인시 사용
	public static final int EXIST_ID=1;  //아이디가 이미 존재하는 경우
	public static final int NON_EXIST_ID=2; //존재하지 않는 경우
	
	//권한에 따른 확인 시 사용
	/*public static final int HAVE_OWNER=1;*/ // 
	public static final int NO_LICENSE=1;  //회원가입은 했으나 사업자 등록증 없는 경우
	public static final int NO_STORE=2; // 사업자 등록은 했지만 점포가 없는 경우
	public static final int HAVE_ALL=3; // 모든것을 다 가진 경우 
	public static final int LICENSE_STAY=4; // 라이센스 승인대기중인 경우
	public static final int STORE_STAY=5; //점포 승인대기중인 경우
	public static final int WITHDRAW_STAY=6; //점포 탈퇴 신청중
	public static final int WITHDRAW_SUCCESS=7; //점포 탈퇴 성공
	
	int loginChk(String userid,String pwd);
	OwnerVO selectOwner(String userid);
	public int insertowner(OwnerVO ownerVo);
	
	public int checkDup(String ownerId);
	public int checkAuthority(String userid);
	public OwnerAuthorityVO selectOwnerAuthorityAll(String userid);
	public int withdrawOwner(int ownerNo);
	public int withdrawStore(int storeNo) ;
	public int updateOwner(OwnerVO vo);
	public int selectOwnerAuthorityCount(Map<String, Object> map) ;
	
}
