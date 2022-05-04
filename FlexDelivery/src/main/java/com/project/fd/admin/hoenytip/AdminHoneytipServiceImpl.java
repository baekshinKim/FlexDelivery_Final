package com.project.fd.admin.hoenytip;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminHoneytipServiceImpl implements AdminHoneytipService{

	@Autowired 
	private AdminHoneytipDAO honeytipDao;

	@Override
	public List<AdminHoneytipVO> selectAll() {
		return honeytipDao.selectAll();
	}

	@Override
	public AdminHoneytipVO selectByNo(int no) {
		return honeytipDao.selectByNo(no);
	}

	@Override
	public int insertHoneytip(AdminHoneytipVO vo) {
		return honeytipDao.insertHoneytip(vo);
	}

	@Override
	public int updateHoneytip(AdminHoneytipVO vo) {
		return honeytipDao.updateHoneytip(vo);
	}

	@Override
	public int deleteHoneytip(AdminHoneytipVO vo) {
		return honeytipDao.deleteHoneytip(vo);
	}

	@Override
	public List<AdminHoneytipVO> ownerHoneyTip() {
		return honeytipDao.ownerHoneyTip();
	}
	
	
}
