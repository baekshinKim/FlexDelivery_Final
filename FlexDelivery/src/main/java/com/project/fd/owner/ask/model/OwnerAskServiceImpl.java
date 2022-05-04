package com.project.fd.owner.ask.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OwnerAskServiceImpl implements OwnerAskService{

	@Autowired OwnerAskDAO ownerAskDao;

	@Override
	public int insertASK(OwnerAskVO ownerAskVo) {
		return ownerAskDao.insertASK(ownerAskVo);
	}

	@Override
	public List<OwnerAskVO> selectAllAsk(OwnerAskSearchVO searchVo) {
		return ownerAskDao.selectAllAsk(searchVo);
	}

	@Override
	public int selectTotalRecord(OwnerAskSearchVO searchVo) {
		return ownerAskDao.selectTotalRecord(searchVo);
	}

	@Override
	public int deleteAsk(int askNo) {
		return ownerAskDao.deleteAsk(askNo);
	}

	@Override
	public OwnerAskVO selectByNo(int askNo) {
		return ownerAskDao.selectByNo(askNo);
	}

	@Override
	public int updateASK(OwnerAskVO ownerAskVo) {
		return ownerAskDao.updateASK(ownerAskVo);
	}

	@Override
	public OwnerAskVO replyAsk(int askNo) {
		return ownerAskDao.replyAsk(askNo);
	}
	
	
}
