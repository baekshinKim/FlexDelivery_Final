package com.project.fd.owner.coupon.model;

import java.util.List;
import java.util.Map;

import com.project.fd.admin.coupons.model.AdminRegularCouponVO;

public interface OwnerCouponDAO {
	public List<Map<String, Object>> Allcoupons(OwnerCouponSearchVO searchVo);
	public int getTotalRecord(OwnerCouponSearchVO searchVo);
	public  List<Map<String, Object>> expireAll(int storeNo);
	
	List<Map<String, Object>> useCoupons(int storeNo);
	
	// all regular coupon
	public List<AdminRegularCouponVO> Allselect();
	public int registerCoupon(OwnerCouponVO vo);
	
	public int deleteCoupon(int scBoxNo);
	public int updateCoupon(int scBoxNo);
	
	public int dupCouponNo(OwnerCouponVO vo);
}
