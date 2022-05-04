package com.project.fd.member.order.model;

import java.util.List;

public interface MemberOrderDAO {
	int insertOrder(MemberOrderVO vo);
	int insertOrderDetail(MemberOrderDetailVO vo);
	List<MemberOrderAllVO> selectOrderOkList(int memberNo);
	List<MemberOrderAllVO> selectOrderIngList(int memberNo);
	List<MemberOrderAllVO> selectOrderCancelList(int memberNo);
	MemberOrderAllVO selectOrderAllByOrdersNo(int ordersNo);
}
