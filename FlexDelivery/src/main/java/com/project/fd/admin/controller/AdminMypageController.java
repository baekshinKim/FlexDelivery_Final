package com.project.fd.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.admin.ask.model.AdminAskService;
import com.project.fd.admin.ask.model.AdminAskVO;
import com.project.fd.admin.model.AdminVO;
import com.project.fd.admin.mypage.AdminMypageService;

@Controller
@RequestMapping("/admin/myPage")
public class AdminMypageController {
  
	 private static final Logger logger
		=LoggerFactory.getLogger(AdminMypageController.class);
	
	@Autowired
	private AdminMypageService mypageService;
	
	@RequestMapping("/myPage.do")
	public void list_myPage(Model model) {
		logger.info("마이페이지1 출력하기");
		
		AdminVO vo=mypageService.selectInfoByNo(1);
		
		model.addAttribute("vo", vo);
		
	}
	
	@RequestMapping("/myPageConfirm.do")
	public String list_myPageConfirm(@ModelAttribute AdminVO vo, @RequestParam String pwd, Model model) {
		logger.info("마이페이지 비밀번호 확인, vo={}", vo);
		logger.info("비밀번호, pwd={}", pwd);
		String msg="비밀번호 불일치! 이전 페이지로 돌아갑니다.";
		String url="/admin/myPage/myPage.do";
		int no=0;
		
		if (pwd.equals(vo.getAdminPwd())) {
			logger.info("비밀번호 일치");
			msg="비밀번호 일치! 정보 수정 페이지로 이동합니다.";
			no=vo.getAdminNo();
			url="/admin/myPage/myPageEdit.do?no="+no;
		} else {
			logger.info("비밀번호 불일치!");
		}
		
		/*int cnt=mypageService.confirmPwd(vo);
		
		logger.info("비밀번호 확인 결과, cnt={}", cnt);
		if (cnt>0) {
			logger.info("비밀번호 일치");
		}*/
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("no", no);
		
		return "common/message"; 
	}
	
	
	@RequestMapping(value="/myPageEdit.do", method = RequestMethod.GET)
	public String edit_info_get(@RequestParam(defaultValue = "0") int no, Model model) {
		logger.info("관리자 개인정보 수정 화면 띄우기");
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/myPage/myPage.do");
			return "common/message";
		}
		
		AdminVO vo=mypageService.selectInfoByNo(no);
		logger.info("관리자 정보 조회, vo={}", vo);
		
		model.addAttribute("vo", vo);
		//model.addAttribute("msg", "개인정보 수정 화면!");
		//model.addAttribute("url", "/admin/myPage/myPageEdit.do?no="+no);
		
		return "admin/myPage/myPageEdit";
	}
	
	@RequestMapping(value="/myPageEdit.do", method=RequestMethod.POST)
	public String edit_info_post(@ModelAttribute AdminVO vo,
			HttpServletRequest request, Model model) {
		logger.info("관리자 개인정보 수정 처리, 파라미터 vo={}", vo);
		HttpSession session=request.getSession();
		
		String msg="개인정보 수정 실패", url="/admin/myPage/myPage.do";
		int cnt=mypageService.updateInfo(vo);
		logger.info("관리자 개인정보 수정 처리 결과, cnt={}", cnt);
		
		if (cnt>0) {
			msg="개인정보를 수정하였습니다.";
			url="/admin/myPage/myPage.do";
			session.setAttribute("adminName",vo.getAdminName());
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@ResponseBody
	@RequestMapping("/myPageEditChkPwd1.do")
	public boolean pwd1_chk(@RequestParam String pwd1) {
		logger.info("비밀번호 ajax, pwd1={}", pwd1);
		boolean bool=true;
		
		if(pwd1.length()<4) {
			bool=false;
		}
		
		return bool;
	}
	
	/*
	@ResponseBody
	@RequestMapping("/myPageEditChkPwd2.do")
	public boolean pwd2_chk(@RequestParam String pwd1, @RequestParam String pwd2) {
		logger.info("비밀번호 ajax, pwd1={}, pwd2={}", pwd1, pwd2);
		boolean bool=false;
		
		if (pwd2.equals(pwd1)) {
			bool=true;
		} 
		return bool;
	}
	*/
	
	
	@ResponseBody
	@RequestMapping("/myPageEditChkName.do")
	public boolean name_chk(@RequestParam String name) {
		logger.info("이름 ajax, name={}", name);
		boolean bool=false;
		if (name!=null && !name.isEmpty()){			
			bool=mypageService.selectName(name);
			logger.info("bool={}", bool);
		}
		
		return bool;
	}
	
	
	
 }


