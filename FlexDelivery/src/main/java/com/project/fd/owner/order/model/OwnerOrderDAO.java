package com.project.fd.owner.order.model;

import java.util.List;
import java.util.Map;

import com.project.fd.owner.advertise.model.OwnerAdvertiseSearchVO;

public interface OwnerOrderDAO {
	public int selectTotalRecord(Map<String, Object> map);
	public List<Map<String, Object>> selectOrderAllView(Map<String, Object> map);
	public String selectMenuNoByOrderNo(int ordersNo);
	public int selectCountByOrderNo(int ordersNo);
	public List<Map<String, Object>> selectMenuDetailByOrdersNo(int ordersNo);
	public int updateOrdersToRequestIng(int ordersNo);
	public int updateOrdersToDeliveryIng(Map<String, Object> map);
	public int updateOrdersCancel(int ordersNo);
	public List<Map<String, Object>> selectOrderListView(Map<String, Object> map);
	public int selectTotalRecordTWO(Map<String, Object> map);
	public Map<String, Object> selectOrderAllByOrdersNo(int ordersNo);
	public int selectCountByStoreNo(int storeNo);
}
