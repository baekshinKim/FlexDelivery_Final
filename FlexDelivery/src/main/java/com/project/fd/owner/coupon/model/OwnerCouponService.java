package com.project.fd.owner.coupon.model;

import java.util.List;
import java.util.Map;

import com.project.fd.admin.coupons.model.AdminRegularCouponVO;

public interface OwnerCouponService {
	public static final int NON_EXIST_CP=1; //존재하지 않는 경우
	public static final int EXIST_CP=2;  //쿠폰함에  이미 존재하는 경우
	
	public List<Map<String, Object>> Allcoupons(OwnerCouponSearchVO searchVo);
	public int getTotalRecord(OwnerCouponSearchVO searchVo);
	public  List<Map<String, Object>> expireAll(int storeNo);
	
	List<Map<String, Object>> useCoupons(int storeNo);
	
	// all regular coupon
	public List<AdminRegularCouponVO> Allselect();
	public int registerCoupon(OwnerCouponVO vo);
	
	public int deleteCoupon(List<OwnerCouponVO> cpList);
	public int updateCoupon(int scBoxNo);
	public int deleteCoupon(int scBoxNo);
	
}
