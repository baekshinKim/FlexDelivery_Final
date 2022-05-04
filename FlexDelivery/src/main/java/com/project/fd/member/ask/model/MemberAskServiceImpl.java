package com.project.fd.member.ask.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberAskServiceImpl implements MemberAskService{
	@Autowired private MemberAskDAO memberAskDao;

	@Override
	public int askWrite(MemberAskVO vo) {
		return memberAskDao.askWrite(vo);
	}

	@Override
	public List<MemberAskVO> selectICAsk(String askId) {
		return memberAskDao.selectICAsk(askId);
	}

	@Override
	public MemberAskVO detailAsk(int askNo) {
		return memberAskDao.detailAsk(askNo);
	}

	@Override
	public MemberAskVO replyAskSelect(int askNo) {
		return memberAskDao.replyAskSelect(askNo);
	}

	@Override
	public void deleteAsk(int askNo) {
		memberAskDao.deleteAsk(askNo);
	}
	
	

}
