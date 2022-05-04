package com.project.fd.member.cart.model;

import java.util.List;
import java.util.Map;

public interface MemberCartDAO {
	int selectCartChk(Map<String, Object> map);
	int deleteByMemberNo(int memberNo);
	int addCart(MemberCartVO vo);
	int cartExist(MemberCartVO vo);
	int cartQtyPlus(MemberCartVO vo);
	List<MemberCartViewVO> selectCartList(int memberNo);
	int cartMinus(int cartNo);
	int cartPlus(int cartNo);
	int deleteCart(int cartNo);
}
