package com.project.fd.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.admin.ask.model.AdminAskService;
import com.project.fd.admin.ask.model.AdminAskVO;

@Controller
@RequestMapping("/admin/menu5")
public class AdminAskController {
  
	 private static final Logger logger
		=LoggerFactory.getLogger(AdminAskController.class);
	
	@Autowired
	private AdminAskService askService;
	
	@RequestMapping(value="/oneToOne.do", method = RequestMethod.GET)
	public String list_get(Model model) {
		logger.info("1:1 문의 목록 출력하기");
		
		List<AdminAskVO> list=askService.selectAll();
		logger.info("list 출력, list.size()={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/menu5/oneToOne";
	}
	
	@RequestMapping("/oneToOne/detail.do")
	public String ask_detail(@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("1:1문의 detail 상세보기 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu5/oneToOne.do");
			
			return "common/message";
		}
		
		//2
		AdminAskVO askVo=askService.selectByNo(no);
		logger.info("상세보기 결과,askVo={}", askVo);
		
		AdminAskVO askVo2=askService.selectReplyByNo(no);
		logger.info("문의글 답변 조회 결과, vo={}", askVo2);
		
		//3
		model.addAttribute("vo", askVo);
		model.addAttribute("rVo", askVo2);
		
		//4
		return "admin/menu5/oneToOne/detail";
	}
	
	@RequestMapping(value="/oneToOne/writeReply.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute AdminAskVO askVo,
			HttpServletRequest request) {
		logger.info("1:1 문의 답변 등록 처리, askVo={}", askVo);
		
		int cnt=askService.insertAskReply(askVo);
				
		if (cnt>0) {
			logger.info("1:1 문의 답변 등록 완료, cnt={}", cnt);
			
			askVo.setAskReplyFlag("Y");
			//원글 답글 플래그 y로 바꾸기
			int cnt2=askService.updateAsk(askVo);
			logger.info("1:1 문의 원글 플래그 변경, cnt2={}", cnt2);
		}
		
		return "redirect:/admin/menu5/oneToOne/detail.do?no="+askVo.getAskGroupNo();
	}
	
	@RequestMapping(value="/oneToOne/editReply.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute AdminAskVO askVo,
			HttpServletRequest request, Model model, @RequestParam(defaultValue = "0") int no) {
		logger.info("edit_post 1:1 문의 답변 수정 처리, 파라미터 vo={}, no={}", askVo, no);
		
		String msg="1:1 문의 답변 수정 실패", url="/admin/menu5/oneToOne.do";
		int cnt=askService.updateAskReply(askVo);
		logger.info("1:1 문의 답변 수정 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="답변을 수정하였습니다.";
			//url="/admin/menu5/oneToOne/detail.do?no="+askVo.getAskNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/oneToOne/deleteReply.do", method=RequestMethod.POST)
	public String delete_post(@ModelAttribute AdminAskVO askVo,
			HttpServletRequest request, Model model, @RequestParam(defaultValue = "0") int no) {
		logger.info("1:1 문의 답변 삭제처리, 파라미터 vo={}, no={}", no);
		
		String msg="1:1 문의 답변 삭제 실패", url="/admin/menu5/oneToOne.do";
		int cnt=askService.deleteAskReply(no);
		logger.info("1:1 문의 답변 삭제 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="답변을 삭제하였습니다.";
			
			askVo.setAskReplyFlag("N");
			//원글 답글 플래그 N으로 바꾸기
			int cnt2=askService.updateAsk(askVo);
			logger.info("1:1 문의 원글 플래그 변경, cnt2={}", cnt2);
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
 }


