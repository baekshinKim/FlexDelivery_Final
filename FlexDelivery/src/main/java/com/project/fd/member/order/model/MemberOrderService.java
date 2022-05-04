package com.project.fd.member.order.model;

import java.util.List;

import com.project.fd.member.cart.model.MemberCartViewVO;


public interface MemberOrderService {
	public static final int COUPON_USE=1;
	public static final int GIFT_USE=2;
	public static final int E_COUPON_USE=3;
	
	int insertOrder(MemberOrderVO vo,List<MemberCartViewVO> list,int type,int dcNo);
	List<MemberOrderAllVO> selectOrderOkList(int memberNo);
	List<MemberOrderAllVO> selectOrderIngList(int memberNo);
	List<MemberOrderAllVO> selectOrderCancelList(int memberNo);
	MemberOrderAllVO selectOrderAllByOrdersNo(int ordersNo);
}
