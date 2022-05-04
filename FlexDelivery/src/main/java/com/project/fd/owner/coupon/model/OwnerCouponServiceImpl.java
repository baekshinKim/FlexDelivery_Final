package com.project.fd.owner.coupon.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.project.fd.admin.coupons.model.AdminRegularCouponVO;

@Service
public class OwnerCouponServiceImpl implements OwnerCouponService{
	@Autowired OwnerCouponDAO couponDao;

	@Override
	public List<Map<String, Object>> Allcoupons(OwnerCouponSearchVO searchVo) {
		return couponDao.Allcoupons(searchVo);
	}

	@Override
	public int getTotalRecord(OwnerCouponSearchVO searchVo) {
		return couponDao.getTotalRecord(searchVo);
	}

	@Override
	public List<AdminRegularCouponVO> Allselect() {
		return couponDao.Allselect();
	}

	@Override
	@Transactional
	public int deleteCoupon(List<OwnerCouponVO> cpList) {

		int cnt=0;
		try {
			for(OwnerCouponVO vo : cpList) {
				int scBoxNo=vo.getScBoxNo();
				if(scBoxNo!=0) {  //체크된 것만 삭제
					cnt=couponDao.deleteCoupon(scBoxNo);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}

		return cnt;
	}

	@Override
	public List<Map<String, Object>> useCoupons(int storeNo) {
		return couponDao.useCoupons(storeNo);
	}

	@Override
	public List<Map<String, Object>> expireAll(int storeNo) {
		return couponDao.expireAll(storeNo);
	}

	@Override
	@Transactional
	public int registerCoupon(OwnerCouponVO vo){
		int cnt=0;
		try {			
			int count=couponDao.dupCouponNo(vo);
			if(count>0) {
				cnt=OwnerCouponService.EXIST_CP;  //이미 등록되어 있으면 skip  2
			}else {
				cnt=couponDao.registerCoupon(vo); //1
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}

		return cnt;
	}

	@Override
	public int updateCoupon(int scBoxNo) {
		return couponDao.updateCoupon(scBoxNo);
	}
	@Override
	public int deleteCoupon(int scBoxNo) {
		return couponDao.deleteCoupon(scBoxNo);
	}

}
