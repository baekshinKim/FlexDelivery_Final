package com.project.fd.member.cart.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberCartServiceImpl implements MemberCartService{

	@Autowired MemberCartDAO cartDao;

	@Override
	public boolean CartChk(Map<String, Object> map) {
		int cnt=cartDao.selectCartChk(map);
		if(cnt>0) {
			return true;
		}		
		return false;
	}

	@Override
	public int deleteByMemberNo(int memberNo) {
		return cartDao.deleteByMemberNo(memberNo);
	}
	

	@Override
	public int addCart(MemberCartVO vo) {
		int cnt=0;
		if(cartDao.cartExist(vo)>0) {
			cnt=cartDao.cartQtyPlus(vo);
			System.out.println("장바구니에 존재하는경우 찍힘");
		}else {
			cnt=cartDao.addCart(vo);
			System.out.println("장바구니에 존재하지 않는경우 찍힘");
		}
		return cnt;
	}


	@Override
	public List<MemberCartViewVO> selectCartList(int memberNo) {
		return cartDao.selectCartList(memberNo);
	}

	@Override
	public int cartPlus(int cartNo) {
		return cartDao.cartPlus(cartNo);
	}
	
	@Override
	public int cartMinus(int cartNo) {
		return cartDao.cartMinus(cartNo);
	}

	@Override
	public int deleteCart(int cartNo) {
		return cartDao.deleteCart(cartNo);
	}
	
	
	
	
	/*
	@Override
	@Transactional
	public int addCart(List<MemberCartVO> list) {
		int cnt=0;
		try {
			for (MemberCartVO vo:list) {
				System.out.println("vo를 찍어보자! : "+vo);
				if(cartDao.cartExist(vo)>0) {
					cnt=cartDao.cartQtyPlus(vo);
					System.out.println("장바구니에 존재하는경우 찍힘");
				}else {
					cnt=cartDao.addCart(vo);
					System.out.println("장바구니에 존재하지 않는경우 찍힘");
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
	*/
	
}
