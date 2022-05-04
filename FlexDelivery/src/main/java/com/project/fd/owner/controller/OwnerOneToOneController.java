package com.project.fd.owner.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.common.PaginationInfo;
import com.project.fd.common.Utility;
import com.project.fd.owner.ask.model.OwnerAskSearchVO;
import com.project.fd.owner.ask.model.OwnerAskService;
import com.project.fd.owner.ask.model.OwnerAskVO;

@Controller
@RequestMapping("/owner")
public class OwnerOneToOneController {
	private static final Logger logger
	=LoggerFactory.getLogger(OwnerOneToOneController.class);
	
	@Autowired OwnerAskService ownerAskService;
	
	@Autowired private HttpSession session;

	
	@RequestMapping(value="/menu5/oneToOneWrite.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute OwnerAskVO ownerAskVo,
			HttpSession session) {
		logger.info("문의글 등록 페이지 ownerAskVo={}",ownerAskVo);
		String askId=(String)session.getAttribute("ownerId");
		int authorityNo=(Integer)session.getAttribute("authorityNo");
		logger.info("글수정 처리, 파라미터 authorityNo={},askId={}", authorityNo,askId);
		int askGroupNo=1; // tkd수처리??
		ownerAskVo.setAskGroupNo(askGroupNo);
		ownerAskVo.setAuthorityNo(authorityNo);
		ownerAskVo.setAskId(askId);
		logger.info("문의글 등록 처리 파라미터 22 ownerAskVo={}",ownerAskVo);
		
		//2
		int cnt=ownerAskService.insertASK(ownerAskVo);
		logger.info("문의글쓰기 처리 결과, cnt={}", cnt);
		
		//3
		return "redirect:/owner/menu5/oneToOne.do";
	}
	
	
	@RequestMapping("/menu5/oneToOne.do")
	public String askList_get(@ModelAttribute OwnerAskSearchVO searchVo, Model model) {
		String askId=(String)session.getAttribute("ownerId");
		int authorityNo=(Integer)session.getAttribute("authorityNo");
		logger.info("일대일 문의 리스트 , 파라미터 authorityNo={},askId={}", authorityNo,askId);
		searchVo.setAskId(askId);
		
		logger.info("점포 - 일대일 문의 보여주기");
		logger.info("글 목록 페이지, 파라미터 searchVo={},askId={}", searchVo,askId);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				
		List<OwnerAskVO> list=ownerAskService.selectAllAsk(searchVo);
		logger.info("글목록 결과, list.size={}", list.size());
		
		int totalRecord=ownerAskService.selectTotalRecord(searchVo);
		logger.info("글 개수, totalRecord={}", totalRecord);		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "owner/menu5/oneToOne";
	}
	
	@RequestMapping(value="/menu5/oneToOneDelete.do", method = RequestMethod.GET)
	public String delete_post(@RequestParam(defaultValue = "0") int askNo,
			Model model) {
		logger.info("글삭제 처리, 파라미터 askNo={}", askNo);

		int cnt=ownerAskService.deleteAsk(askNo);
		logger.info("글삭제 결과, cnt={}", cnt);

		String msg="글 삭제 실패", url="/owner/menu5/oneToOne.do";
		if(cnt>0) {
			msg="글삭제되었습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping(value="/menu5/OneToOneDetail.do", method=RequestMethod.GET)
	public String detil_get(@RequestParam(defaultValue = "0") int askNo,
			HttpSession session,
			Model model) {
		String askId=(String)session.getAttribute("ownerId");
		int authorityNo=(Integer)session.getAttribute("authorityNo");
		logger.info("detail, 파라미터 authorityNo={},askId={}", authorityNo,askId);
		
		logger.info("detail , 파라미터 askNo={}", askNo);
		if(askNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/owner/menu5/oneToOne.do");
			return "common/message";
		}
		
		OwnerAskVO vo=ownerAskService.selectByNo(askNo);
		logger.info("디테일 , 조회 결과 vo={}", vo);
		
		OwnerAskVO reVo=ownerAskService.replyAsk(askNo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("reVo", reVo);
		
		return "owner/menu5/OneToOneDetail";
	}
	
	@RequestMapping(value="/menu5/OneToOneEdit.do", method=RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue = "0") int askNo,
			HttpSession session,
			Model model) {
		String askId=(String)session.getAttribute("ownerId");
		int authorityNo=(Integer)session.getAttribute("authorityNo");
		logger.info("글수정 처리, 파라미터 authorityNo={},askId={}", authorityNo,askId);
		
		logger.info("수정화면, 파라미터 askNo={}", askNo);
		if(askNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/owner/menu5/oneToOne.do");
			return "common/message";
		}
		
		OwnerAskVO vo=ownerAskService.selectByNo(askNo);
		logger.info("수정화면, 조회 결과 vo={}", vo);
		
		model.addAttribute("vo", vo);
		
		return "owner/menu5/OneToOneEdit";
	}
	
	

	@RequestMapping(value="/menu5/OneToOneEdit.do", method = RequestMethod.POST)
	public String edit_post(@ModelAttribute OwnerAskVO ownerAskVo,
			Model model) {
		String askId=(String)session.getAttribute("ownerId");
		logger.info("글수정 처리, 파라미터 ownerAskVo={}", ownerAskVo);
		int authorityNo=(Integer)session.getAttribute("authorityNo");
		logger.info("글수정 처리, 파라미터 authorityNo={},askId={}", authorityNo,askId);
		ownerAskVo.setAuthorityNo(authorityNo);
		ownerAskVo.setAskId(askId);
		
		int cnt=ownerAskService.updateASK(ownerAskVo);
		logger.info("글수정 결과, cnt={}", cnt);
		
		String msg="글 수정 실패", url="/owner/menu5/OneToOneDetail?no="+ownerAskVo.getAskNo();
		if(cnt>0) {
			msg="문의글이 수정되었습니다.";
			url="/owner/menu5/oneToOne.do";
		}
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		

		return "common/message";
	}

}
