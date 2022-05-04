package com.project.fd.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.member.ask.model.MemberAskService;
import com.project.fd.member.ask.model.MemberAskVO;
import com.project.fd.member.model.MemberService;
import com.project.fd.member.model.MemberVO;

@Controller
@RequestMapping("/member/ask")
public class MemberAskController {
	@Autowired private static final Logger logger=LoggerFactory.getLogger(MemberAskController.class);
	
	@Autowired MemberAskService memberAskService;
	
	@RequestMapping("/askList.do")
	public void askList(Model model,HttpSession session) {
		logger.info("1:1문의 리스트 보여주기");
	}
	
	@RequestMapping(value = "/askWrite.do", method=RequestMethod.POST)
	public String askWrite(@ModelAttribute MemberAskVO memberAskVo, 
			HttpServletRequest request, Model model) {
		logger.info("1:1 글쓰기 처리, 파라미터 vo={}",memberAskVo);
		
		//2
		int cnt = memberAskService.askWrite(memberAskVo);
		logger.info("1:1 글쓰기 처리 결과, cnt={}", cnt);
		
		String msg="1:1문의 실패", url="/member/ask/askList.do";
		if (cnt>0) {
			logger.info("1:1 글쓰기 처리 성공, cnt={}", cnt);
			msg="1:1문의 작성 완료";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping("/askICList.do")
	public String askICList(@RequestParam String askId, Model model) {
		logger.info("1:1 리스트 보여주기, 파라미터 askId={}", askId);
		
		List<MemberAskVO> list = memberAskService.selectICAsk(askId);
		logger.info("1:1내용 조회, 결과 list.size={}",list.size());
		
		model.addAttribute("askICList",list);
		
		return "member/ask/askICList";
	}
	
	@RequestMapping("/askDetail.do")
	public String askDetail(@RequestParam(defaultValue = "0") int askNo, Model model , 
				HttpServletRequest request) {
		logger.info("상세보기 파라미터 askNo={}", askNo);
		if(askNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/member/askList.do");

			return "common/message";
		}
		
		MemberAskVO detailAsk = memberAskService.detailAsk(askNo);
		MemberAskVO replyAskSelect = memberAskService.replyAskSelect(askNo);
		
		logger.info("detailAsk={}, replayAskSelect={}", detailAsk, replyAskSelect);
		
		//3
		model.addAttribute("vo1", detailAsk);
		model.addAttribute("vo2", replyAskSelect);
		
		return "member/ask/askDetail";
	}
	
	@RequestMapping("/askDelete.do")
	public String askDelete(@RequestParam(defaultValue = "0") int askNo, Model model ) {
		logger.info("상세보기 파라미터 askNo={}", askNo);
		if(askNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/member/ask/askList.do");

			return "common/message";
		}
		
		String msg="글 삭제 실패", url="member/ask/askList.do?askNo="+askNo;
		
		memberAskService.deleteAsk(askNo);
		logger.info("글 삭제됨");
		
		msg="문의가 삭제되었습니다.";
		url="/member/ask/askList.do";
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}
	
	
}
