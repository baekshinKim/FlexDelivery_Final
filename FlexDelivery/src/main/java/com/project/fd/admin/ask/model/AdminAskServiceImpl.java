package com.project.fd.admin.ask.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminAskServiceImpl implements AdminAskService{

	@Autowired
	private AdminAskDAO askDao;
	
	@Override
	public List<AdminAskVO> selectAll() {
		return askDao.selectAll();
	}

	@Override
	public List<AdminAskVO> selectByAuthority(int no) {
		return askDao.selectByAuthority(no);
	}

	@Override
	public List<AdminAskVO> selectByReply(String flag) {
		return askDao.selectByReply(flag);
	}

	@Override
	public int insertAskReply(AdminAskVO askVo) {
		return askDao.insertAskReply(askVo);
	}

	@Override
	public int updateAskReply(AdminAskVO askVo) {
		return askDao.updateAskReply(askVo);
	}

	@Override
	public int deleteAskReply(int no) {
		return askDao.deleteAskReply(no);
	}

	@Override
	public AdminAskVO selectByNo(int no) {
		return askDao.selectByNo(no);
	}

	@Override
	public AdminAskVO selectReplyByNo(int no) {
		return askDao.selectReplyByNo(no);
	}

	@Override
	public int updateAsk(AdminAskVO askVo) {
		return askDao.updateAsk(askVo);
	}

	@Override
	public List<Map<String, Object>> selectNewAsk() {
		return askDao.selectNewAsk();
	}

	@Override
	public int selectNewAsk2() {
		return askDao.selectNewAsk2();
	}

}
