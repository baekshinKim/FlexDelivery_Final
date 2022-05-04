package com.project.fd.member.coupon.model;

import java.util.List;
import java.util.Map;

public interface MemberCouponService {
	List<MemberStoresCouponVO> storeCouponList(Map<String, Object> map);
	List<MemberRegularCouponBoxVO> memberCouponList(Map<String, Object> map);
	int addCoupon(MemberRegularCouponBoxVO vo);
	boolean chkCoupon(int storeNo);
	List<MemberEventCouponBoxVO> eventCouponBoxList(int memberNo);
	List<MemberRegularCouponBoxVO> memberRegularCouponList(int memberNo);
	List<MemberEventCouponBoxVO> memberEventCouponList(int memberNo);
	List<MemberEventCouponBoxVO> eventCouponAll(int memberNo);
	int getEventCoupon(Map<String, Object> map);
}
