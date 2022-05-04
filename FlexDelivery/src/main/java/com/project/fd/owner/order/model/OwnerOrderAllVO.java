package com.project.fd.owner.order.model;

import java.util.List;
import java.util.Map;

public class OwnerOrderAllVO {
	private OwnerOrderVO orderVo;
	
	private List<Map<String, Object>> orderDetailsList;

	public OwnerOrderVO getOrderVo() {
		return orderVo;
	}

	public void setOrderVo(OwnerOrderVO orderVo) {
		this.orderVo = orderVo;
	}

	public List<Map<String, Object>> getOrderDetailsList() {
		return orderDetailsList;
	}

	public void setOrderDetailsList(List<Map<String, Object>> orderDetailsList) {
		this.orderDetailsList = orderDetailsList;
	}

	@Override
	public String toString() {
		return "OwnerOrderAllVO [orderVo=" + orderVo + ", orderDetailsList=" + orderDetailsList + "]";
	}
	
	
	
}
