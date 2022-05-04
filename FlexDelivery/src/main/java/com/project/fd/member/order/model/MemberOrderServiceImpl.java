package com.project.fd.member.order.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.fd.member.cart.model.MemberCartDAO;
import com.project.fd.member.cart.model.MemberCartViewVO;
import com.project.fd.member.coupon.model.MemberCouponDAO;
import com.project.fd.member.gift.model.MemberGiftDAO;

@Service
public class MemberOrderServiceImpl implements MemberOrderService{
	@Autowired private MemberOrderDAO orderDao;
	@Autowired private MemberCartDAO cartDao;
	@Autowired private MemberCouponDAO coupDao;
	@Autowired private MemberGiftDAO giftDao;

	@Override
	@Transactional
	public int insertOrder(MemberOrderVO vo,List<MemberCartViewVO> cartList,int type,int dcNo) {
		int cnt=0;
		cnt=orderDao.insertOrder(vo);
		for(int i=0;i<cartList.size();i++) {
			MemberOrderDetailVO detailVo=new MemberOrderDetailVO();
			detailVo.setOrdersNo(vo.getOrdersNo());
			detailVo.setMenuNo(cartList.get(i).getMenuNo());
			detailVo.setmOptionNo(cartList.get(i).getmOptionNo());
			detailVo.setoDetailQty(cartList.get(i).getCartQty());
			cnt=orderDao.insertOrderDetail(detailVo);
		}
		
		if(type>0) {
			if(type==COUPON_USE) {
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("memberNo", vo.getMemberNo());
				map.put("sCBoxNo", dcNo);
				cnt=coupDao.useCoupon(map);
			}else if(type==GIFT_USE) {
				cnt=giftDao.useGift(dcNo);
			}else if(type==E_COUPON_USE) {
				Map<String,Object> map=new HashMap<String, Object>();
				map.put("memberNo",vo.getMemberNo());
				map.put("eCouponNo", dcNo);
				cnt=coupDao.useECoupon(map);
			}
		}
		
		cnt=cartDao.deleteByMemberNo(vo.getMemberNo());
		return cnt;
	}

	@Override
	public List<MemberOrderAllVO> selectOrderOkList(int memberNo) {
		return orderDao.selectOrderOkList(memberNo);
	}

	@Override
	public List<MemberOrderAllVO> selectOrderIngList(int memberNo) {
		return orderDao.selectOrderIngList(memberNo);
	}

	@Override
	public List<MemberOrderAllVO> selectOrderCancelList(int memberNo) {
		return orderDao.selectOrderCancelList(memberNo);
	}

	@Override
	public MemberOrderAllVO selectOrderAllByOrdersNo(int ordersNo) {
		return orderDao.selectOrderAllByOrdersNo(ordersNo);
	} 
	
	
}
