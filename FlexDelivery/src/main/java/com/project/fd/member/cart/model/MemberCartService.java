package com.project.fd.member.cart.model;

import java.util.List;
import java.util.Map;

public interface MemberCartService {
	boolean CartChk(Map<String, Object> map);
	int deleteByMemberNo(int memberNo);
	int addCart(MemberCartVO vo);
	List<MemberCartViewVO> selectCartList(int memberNo);
	int cartPlus(int cartNo);
	int cartMinus(int cartNo);
	int deleteCart(int cartNo);
}
