package com.project.fd.owner.order.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.owner.advertise.model.OwnerAdvertiseSearchVO;

@Repository
public class OwnerOrderDAOMybatis implements OwnerOrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.ownerorder.";
	
	public int selectTotalRecord(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", map);
	}
	
	public List<Map<String, Object>> selectOrderAllView(Map<String, Object> map){
		return sqlSession.selectList(namespace+"selectOrderAllView", map);
	}
	
	public String selectMenuNoByOrderNo(int ordersNo){
		return sqlSession.selectOne(namespace+"selectMenuNoByOrderNo", ordersNo);
	}
	
	public int selectCountByOrderNo(int ordersNo){
		return sqlSession.selectOne(namespace+"selectCountByOrderNo", ordersNo);
	}
	
	public List<Map<String, Object>> selectMenuDetailByOrdersNo(int ordersNo){
		return sqlSession.selectList(namespace+"selectMenuDetailByOrdersNo",ordersNo);
	}
	
	public int updateOrdersToRequestIng(int ordersNo){
		return sqlSession.update(namespace+"updateOrdersToRequestIng",ordersNo);
	}
	
	public int updateOrdersToDeliveryIng(Map<String, Object> map){
		return sqlSession.update(namespace+"updateOrdersToDeliveryIng",map);
	}
	
	public int updateOrdersCancel(int ordersNo){
		return sqlSession.update(namespace+"updateOrdersCancel",ordersNo);
	}
	
	public List<Map<String, Object>> selectOrderListView(Map<String, Object> map){
		return sqlSession.selectList(namespace+"selectOrderListView",map);
	}
	
	public int selectTotalRecordTWO(Map<String, Object> map){
		return sqlSession.selectOne(namespace+"selectTotalRecordTWO",map);
	}
	
	
	public Map<String, Object> selectOrderAllByOrdersNo(int ordersNo){
		return sqlSession.selectOne(namespace+"selectOrderAllByOrdersNo",ordersNo);
	}
	
	public int selectCountByStoreNo(int storeNo) {
		return  sqlSession.selectOne(namespace+"selectCountByStoreNo", storeNo);
	}
	
}
