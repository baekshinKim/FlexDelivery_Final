package com.project.fd.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.admin.model.AdminService;
import com.project.fd.common.Utility;
import com.project.fd.member.model.MemberService;
import com.project.fd.owner.model.OwnerService;

@Controller
public class LogoutController {

	@Autowired
	private static final Logger logger=LoggerFactory.getLogger(LogoutController.class);
	
	//@Autowired private MemberService memServ;
	//@Autowired private AdminService adminServ;
	//@Autowired private OwnerService ownerServ;
	
	@RequestMapping("/logout.do")
	public String logout(@RequestParam int idx, HttpSession session, Model model){
		
		//
		logger.info("로그아웃처리, idx={}",idx);
		String msg="로그아웃 실패!",url="";
		
		if(idx==Utility.MEMBER_LOGOUT) {
			logger.info("회원 로그아웃처리");
		
			session.removeAttribute("memberId");
			session.removeAttribute("memberName");
			session.removeAttribute("memberNo");
			session.removeAttribute("authorityNo");
			session.removeAttribute("locationNo");
			session.removeAttribute("memberNo");
				
			msg="성공적으로 로그아웃 되었습니다!";
			url="/member/index.do";
			
			
		}else if(idx==Utility.OWNER_LOGOUT) {
	
			session.removeAttribute("ownerId");
			session.removeAttribute("ownerName");
			session.removeAttribute("ownerNo");
			session.removeAttribute("authorityNo");
			session.removeAttribute("result");
			session.removeAttribute("storeNo");
			
			/*
			if(auVo.getStoreNo()>0) {
				session.setAttribute("storeNo", auVo.getStoreNo());
			}
			*/
			msg="성공적으로 로그아웃 되었습니다!";
			url="/owner/index.do";
		
		}else if(idx==Utility.ADMIN_LOGOUT) {
			
			session.removeAttribute("adminId");
			session.removeAttribute("adminName");
			session.removeAttribute("adminNo");
			session.removeAttribute("authorityNo");
			
			msg="성공적으로 로그아웃 되었습니다! 관리자는 로그인 없이 페이지를 이용할 수 없습니다. 로그인 페이지로 이동합니다.";
			//msg="성공적으로 로그아웃 되었습니다! \"+\n\"관리자는 로그인 없이 페이지를 이용할 수 없습니다. 로그인 페이지로 이동합니다.";
			url="/admin/login/login.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
			
		return "common/message";
		
		//
	}

	
}
