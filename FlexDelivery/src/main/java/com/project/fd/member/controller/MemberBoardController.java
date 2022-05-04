package com.project.fd.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.member.board.model.MemberBoardPaging;
import com.project.fd.member.board.model.MemberBoardSearchVO;
import com.project.fd.member.board.model.MemberBoardService;
import com.project.fd.member.board.model.MemberBoardVO;

@Controller
@RequestMapping("/member/board")
public class MemberBoardController {
	@Autowired private static final Logger logger=LoggerFactory.getLogger(MemberBoardController.class);
	@Autowired private MemberBoardService boardServ;
	
	@RequestMapping("/boardReset.do")
	public String boardReset(@ModelAttribute MemberBoardSearchVO vo,Model model) {
		logger.info("게시판 초기화");
		MemberBoardSearchVO vo2=new MemberBoardSearchVO();
		vo.setMemberBoardSearchVO(vo2);
		
		return "member/board/board";
	}
	
	@RequestMapping("/board.do")
	public void boardMain(@ModelAttribute MemberBoardSearchVO vo,Model model) {
		logger.info("알림광장 메인페이지,vo={}");
		int eCount=boardServ.eventCount(vo);
		int nCount=boardServ.noticeCount(vo);
		
		model.addAttribute("eCount",eCount);
		model.addAttribute("nCount",nCount);
	}
	
	@RequestMapping("/noticeBoard.do")
	public void notice(@ModelAttribute MemberBoardSearchVO vo,Model model) {
		logger.info("공지사항 게시판 초기출력vo={}",vo);
		MemberBoardPaging nPaging=new MemberBoardPaging();
		nPaging.setBlockSize(10);
		nPaging.setCountPerPage(5);
		nPaging.setCurrentPage(vo.getCurrentPage());
		
		vo.setCountPerPage(5);
		vo.setFirstIndex(nPaging.getFirstIndex());
		List<MemberBoardVO> nlist=boardServ.selectNotice(vo);
		logger.info("nlist.size={}",nlist.size());
		
		int total=boardServ.noticeCount(vo);
		logger.info("total={}",total);
		nPaging.setTotalRecord(total);
		
		model.addAttribute("nlist",nlist);
		model.addAttribute("nPaging",nPaging);
	}
	
	@ResponseBody
	@RequestMapping("/searchNotice.do")
	public Map<String, Object> searchNotice(@ModelAttribute MemberBoardSearchVO vo){
		logger.info("공지사항 게시판 ajax , vo={}",vo);
		MemberBoardPaging nPaging=new MemberBoardPaging();
		nPaging.setBlockSize(10);
		nPaging.setCountPerPage(5);
		nPaging.setCurrentPage(vo.getCurrentPage());
		
		vo.setCountPerPage(5);
		vo.setFirstIndex(nPaging.getFirstIndex());
		List<MemberBoardVO> nlist=boardServ.selectNotice(vo);
		logger.info("AJAX nlist.size={}",nlist.size());
		
		int total=boardServ.noticeCount(vo);
		logger.info("AJAX total={}",total);
		nPaging.setTotalRecord(total);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("nlist",nlist);
		map.put("nPaging", nPaging);
		map.put("searchKeyword", vo.getSearchKeyword());
		return map;
	}
	
	@RequestMapping("/eventBoard.do")
	public void event(@ModelAttribute MemberBoardSearchVO vo,Model model) {
		logger.info("이벤트게시판 초기출력 vo={}",vo);
		MemberBoardPaging ePaging=new MemberBoardPaging();
		ePaging.setBlockSize(10);
		ePaging.setCountPerPage(5);
		ePaging.setCurrentPage(vo.getCurrentPage());
		
		vo.setCountPerPage(5);
		vo.setFirstIndex(ePaging.getFirstIndex());
		List<MemberBoardVO> elist=boardServ.selectEvent(vo);
		logger.info("nlist.size={}",elist.size());
		
		int total=boardServ.eventCount(vo);
		logger.info("total={}",total);
		ePaging.setTotalRecord(total);
		
		model.addAttribute("elist",elist);
		model.addAttribute("ePaging",ePaging);
	}
	
	@ResponseBody
	@RequestMapping("/searchEvent.do")
	public Map<String, Object> searchEvent(@ModelAttribute MemberBoardSearchVO vo){
		logger.info("이벤트 게시판 ajax , vo={}",vo);
		MemberBoardPaging ePaging=new MemberBoardPaging();
		ePaging.setBlockSize(10);
		ePaging.setCountPerPage(5);
		ePaging.setCurrentPage(vo.getCurrentPage());
		
		vo.setCountPerPage(5);
		vo.setFirstIndex(ePaging.getFirstIndex());
		List<MemberBoardVO> elist=boardServ.selectEvent(vo);
		logger.info("AJAX elist.size={}",elist.size());
		
		int total=boardServ.eventCount(vo);
		logger.info("AJAX total={}",total);
		ePaging.setTotalRecord(total);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("elist",elist);
		map.put("ePaging", ePaging);
		map.put("searchKeyword", vo.getSearchKeyword());
		return map;
	}
	
	@RequestMapping("/detail.do")
	public String detailBoard(@RequestParam int boardNo,Model model) {
		logger.info("게시판 상세보기");
		MemberBoardVO vo=boardServ.boardDetail(boardNo);
		model.addAttribute("vo",vo);
		return "member/board/boardDetail";
	}
	
}	
