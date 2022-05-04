package com.project.fd.owner.model;

import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OwnerServiceImpl implements OwnerService {
	@Autowired
	private OwnerDAO ownerDao;
	
	@Override
	public int loginChk(String userid, String pwd) {
		int result=0;
		String dbPwd=ownerDao.selectPwd(userid);
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=ID_NONE;
		}else{
			if(dbPwd.length()<10) {
				if (dbPwd.equals(pwd)) { //비밀번호 암호화 체크
					result=LOGIN_OK;				
				}else {
					result=PWD_DISAGREE;
				}
			}else{
				if (BCrypt.checkpw(pwd, dbPwd)) {
					
				}else {
					result=PWD_DISAGREE;
				}
			}
			
		}
		return result;
	}

	@Override
	public OwnerVO selectOwner(String userid) {
		return ownerDao.selectOwner(userid);
	}
	
	public int insertowner(OwnerVO ownerVo) {
		return ownerDao.insertowner(ownerVo);
	}
	
	public int checkDup(String ownerId){
		int count=ownerDao.checkDup(ownerId);
		
		int result=0;
		if(count>0) {
			result=EXIST_ID;  //이미 해당 아이디 존재
		}else {
			result=NON_EXIST_ID; //해당 아이디 없다
		}
		
		return result;
	}
	
	
	
	

	@Override
	public int checkAuthority(String userid) {
		
		/* OwnerAuthorityVO vo = ownerDao.selectOwnerAuthorityAll(userid); */
		 Map<String, Object> map = new HashedMap<String, Object>();
		 map.put("userid", userid);
		 map.put("rAgreeNo",1);
		 map.put("sAgreeNo", 0);
		 
		 int cnt1 = ownerDao.selectOwnerAuthorityCount(map); // rAgreeNo = 승인 중 
		
		 
		 map.remove("rAgreeNo");
		 map.put("rAgreeNo",3);
		 int cnt2= ownerDao.selectOwnerAuthorityCount(map); // rAgreeNo= 승인완료

		 
		 map.remove("sAgreeNo");
		 map.put("sAgreeNo",1);
		 int cnt3=ownerDao.selectOwnerAuthorityCount(map); //sAgreeNo = 승인 중
	
		 
		 map.remove("sAgreeNo");
		 map.put("sAgreeNo", 3);
		 int cnt4 = ownerDao.selectOwnerAuthorityCount(map); //sAgreeNo=승인완료
		 
		 
		 map.remove("sAgreeNo");
		 map.put("sAgreeNo", 8);
		 int cnt5 = ownerDao.selectOwnerAuthorityCount(map); //sAgreeNo=탈퇴신청
		 
		 map.remove("sAgreeNo");
		 map.put("sAgreeNo", 2);
		 int cnt6 =  ownerDao.selectOwnerAuthorityCount(map); //sAgreeNo=승인취소
		 
		 map.remove("sAgreeNo");
		 map.put("sAgreeNo", 4);
		 int cnt7 =  ownerDao.selectOwnerAuthorityCount(map); //sAgreeNo=승인반려
	
		 
			/*
			 * System.out.println("vo.getRagreeno()"+vo.getRagreeno());
			 * System.out.println("vo"+vo);
			 */
		 
		 System.out.println("cnt1="+cnt1+",cnt2="+cnt2+",cnt3="+cnt3+",cnt4="+cnt4+",cnt5="+cnt5+",cnt6="+cnt6+",cnt7="+cnt7);
		 
		 
		 int result = NO_LICENSE;
	       if(cnt4==1) {
	          result=HAVE_ALL;
	       }else {
	          if(cnt1==1) {
	             result=LICENSE_STAY;
	             return result;
	          }else if(cnt3==1) {
	             result=STORE_STAY;
	             return result;
	          }else if(cnt5==1) {
	             result=WITHDRAW_STAY;
	             return result;
	          }else if(cnt2==1 || cnt6==1 || cnt7==1) {
	             result=NO_STORE;
	          }
	       }
		 
		 
		/* 
		 if((vo.getOwnerId()!=null && !vo.getOwnerId().isEmpty()) 
				 	&& (vo.getRagreeno()<3 || vo.getRagreeno()==4)) {
			 if(vo.getRagreeno()==1 && vo.getoRegisterNo()!=0) {
				 result=LICENSE_STAY;
			 }else {
				 result=NO_LICENSE;
			 }
		 } else if(vo.getRagreeno()==3
				 	&& (vo.getSagreeno()<3|| vo.getSagreeno()==4)) {
			 if(vo.getSagreeno()==1 && vo.getStoreNo()!=0) {
				 result=STORE_STAY;
			 }else {
				 result=NO_STORE;
			 }
		 }else if(vo.getRagreeno()==3 && vo.getSagreeno()==8 ) {
				 result=WITHDRAW_STAY;
		 }else if(vo.getRagreeno()==3 && vo.getSagreeno()==9) {
				 result=WITHDRAW_SUCCESS;
		 } else if(vo.getRagreeno()==3 && vo.getSagreeno()==3) {
			 	result=HAVE_ALL;
		 }
		 System.out.println("result="+result);
		 */
		return result;
	}
	
	public OwnerAuthorityVO selectOwnerAuthorityAll(String userid) {
		return ownerDao.selectOwnerAuthorityAll(userid);
	}
	
	public int withdrawOwner(int ownerNo) {
		return ownerDao.withdrawOwner(ownerNo);
	}

	
	public int withdrawStore(int storeNo) {
		return ownerDao.withdrawStore(storeNo);
	}
	
	public int updateOwner(OwnerVO vo) {
		return ownerDao.updateOwner(vo);
	}
	
	public int selectOwnerAuthorityCount(Map<String, Object> map) {
		return ownerDao.selectOwnerAuthorityCount(map);
	}
}
