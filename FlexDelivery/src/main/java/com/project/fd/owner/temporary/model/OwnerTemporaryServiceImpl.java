package com.project.fd.owner.temporary.model;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.project.fd.owner.store.model.OwnerTemporaryVO;

@Service
public class OwnerTemporaryServiceImpl implements OwnerTemporaryService{
	@Autowired
	private OwnerTemporaryDAO ownerTemporaryDao;
	
	public Map<String,Object> selectOwnerInfoAll(String ownerId){
		return ownerTemporaryDao.selectOwnerInfoAll(ownerId);
	}
	
	public int selectLocationNoByLocationName(String locationName) {
		return ownerTemporaryDao.selectLocationNoByLocationName(locationName);
	}
	
	public int selectAgreeCount(int ownerNo) {
		return ownerTemporaryDao.selectAgreeCount(ownerNo);
	}
	
	public int insertTemporary(OwnerTemporaryVO ownerTemporaryVo) {
		return ownerTemporaryDao.insertTemporary(ownerTemporaryVo);
	}
	
	
	@Transactional
	public int realInsertTemporary(OwnerTemporaryVO ownerTemporaryVo) {
		int cnt = 0;
		try {
			int count = ownerTemporaryDao.selectAgreeCount(ownerTemporaryVo.getOwnerno());
			if(count >0) {
				cnt=-2;
			}else {
				cnt=ownerTemporaryDao.insertTemporary(ownerTemporaryVo);
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}
}
