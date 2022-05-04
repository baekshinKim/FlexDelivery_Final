package com.project.fd.member.order.model;

import java.util.List;

public class MemberOrderAllVO {
	private MemberOrderVO orderVo;
	private List<MemberOrderDetailViewVO> orderDetailList;
	
	public MemberOrderVO getOrderVo() {
		return orderVo;
	}
	public void setOrderVo(MemberOrderVO orderVo) {
		this.orderVo = orderVo;
	}
	public List<MemberOrderDetailViewVO> getOrderDetailList() {
		return orderDetailList;
	}
	public void setOrderDetailList(List<MemberOrderDetailViewVO> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}
	@Override
	public String toString() {
		return "MemberOrderAllVO [orderVo=" + orderVo + ", orderDetailList=" + orderDetailList + "]";
	}
	
	
}
