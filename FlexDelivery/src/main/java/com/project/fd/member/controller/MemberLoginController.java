package com.project.fd.member.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.common.Utility;
import com.project.fd.member.model.MemberEmailSender;
import com.project.fd.member.model.MemberService;
import com.project.fd.member.model.MemberVO;

@Controller
@RequestMapping("/member/login")
public class MemberLoginController {
	@Autowired
	private static final Logger logger=LoggerFactory.getLogger(MemberLoginController.class);
	
	@Autowired private MemberService memServ;
	@Autowired private MemberEmailSender mailSender;
	
	@RequestMapping("/memberLogin.do")
	public String memberLogin_view(Model model) {
		int idx=Utility.MEMBER_LOGIN;
		logger.info("로그인화면 보여주기,idx={} ,1이면 회원",idx);
		model.addAttribute("idx",idx);
		return "member/login/memberLogin";
	}
	
	@RequestMapping(value="/forgotId.do",method = RequestMethod.GET)
	public String forgotId_view() {
		logger.info("아이디 찾기 화면 보여주기");
		return "member/login/forgotId";
	}
	
	@RequestMapping(value="/forgotId.do",method = RequestMethod.POST)
	public String forgotId_POST(@ModelAttribute MemberVO vo,Model model) {
		logger.info("아이디 찾기, 매개변수 vo={}",vo);
		String memberId=memServ.selectMemberId(vo);
		logger.info("아이디 찾기 결과 memberId={}",memberId);

		model.addAttribute("memberId",memberId);
		return "member/login/gotId";
	}
	
	@RequestMapping(value="/gotId.do")
	public void gotId(@RequestParam String memberId) {
		logger.info("memberId={}",memberId);
	}
	
	@RequestMapping(value="/forgotPwd.do",method = RequestMethod.GET)
	public void forgotPwd_view() {
		logger.info("비밀번호 찾기 화면 보여주기");
	}
	
	@RequestMapping(value="/forgotPwd.do",method = RequestMethod.POST)
	public String forgotPwd_post(@ModelAttribute MemberVO vo,Model model) {
		logger.info("비밀번호 찾기, 매개변수 vo={}",vo);
		logger.info("vo로 조회한 회원결과 bool={}",memServ.chkMember(vo));
		if(!memServ.chkMember(vo)) {
			model.addAttribute("msg","일치하는 아이디가 없습니다.");
			model.addAttribute("url","/member/login/forgotPwd.do");
			
			return "common/message";
		}
		String key="";
		for(int i=0;i<8;i++) {
			if(i==1||i==3||i==7) {
				int x=(int)(Math.random()*9)+1;
				key+=Integer.toString(x);				
			}else {
				key+=(char)((Math.random()*26)+97);
			}
		}
		
		MemberVO emailVo=memServ.getEmail(vo.getMemberId());
		
		logger.info("랜덤키 생성값 key={}",key);
		String subject="<Flex-Delivery> 비밀번호 찾기 인증번호";
		String content="<h2>FLEX-DELIVERY</h2><p>인증번호 : "+key+"를 입력하세요</p>";
		String receiver=emailVo.getMemberEmail1()+"@"+emailVo.getMemberEmail2();	//받는사람 이메일주소 , 임시로 내메일
		String sender="admin@FlexDelivery.com";		//보내는사람 이메일주소
		
		try {
			mailSender.sendEmail(subject, content, receiver, sender);
			logger.info("이메일 발송 성공!");
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패!");
			e.printStackTrace();
		}
		model.addAttribute("key",key);
		return "member/login/validateKey";
	}
	
	@RequestMapping(value="/validateKey.do",method = RequestMethod.POST)
	public String validateKey_post(@RequestParam String key,@RequestParam String userKey,@RequestParam String memberId,Model model) {
		logger.info("인증키 검사 핸들링, key={},사용자입력값={}",key,userKey);
		logger.info("memberId 넘어오는지 ? {}",memberId);
		if(!key.equals(userKey)) {
			model.addAttribute("msg","인증번호가 일치하지 않습니다.");
			model.addAttribute("url","/member/login/forgotPwd.do");
			return "common/message";
		}else {
			return "redirect:/member/login/changePwd.do?memberId="+memberId;
		}
	}
	
	@RequestMapping(value="/changePwd.do",method = RequestMethod.GET)
	public String changePwd_view(@RequestParam String memberId,Model model) {
		logger.info("비밀번호 변경창 보여주기,memberId={}",memberId);
		model.addAttribute("memberId",memberId);
		return "member/login/changePwd";
	}
	@RequestMapping(value = "/changePwd.do",method = RequestMethod.POST)
	public String changePwd_Post(@ModelAttribute MemberVO vo) {
		logger.info("비밀번호 변경,memberId={},memberPwd={}",vo.getMemberId(),vo.getMemberPwd());
		
		//사용자 입력 비밀번호 암호화
		String hashPwd=BCrypt.hashpw(vo.getMemberPwd(), BCrypt.gensalt());
		vo.setMemberPwd(hashPwd);
		logger.info("해쉬변경 암호 hashPwd={}",hashPwd);
		memServ.pwdUpd(vo);
		
		return "member/login/success";
	}
	
	@RequestMapping("/logout.do")
	public String logOut(HttpSession session,Model model) {
		logger.info("로그아웃 처리");
		session.removeAttribute("memberId");
		session.removeAttribute("memberName");
		session.removeAttribute("memberNo");
		session.removeAttribute("authorityNo");
		session.removeAttribute("locationNo");
		session.removeAttribute("memberNo");
		
		model.addAttribute("msg","로그아웃 처리 되었습니다.");
		model.addAttribute("url","/member/index.do");
		
		return "common/message";
	}
}
