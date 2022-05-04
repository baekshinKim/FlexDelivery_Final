package com.project.fd.owner.controller;

import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;


import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.owner.model.OwnerService;
import com.project.fd.owner.model.OwnerVO;


@Controller
@RequestMapping("/owner")
public class OwnerController {
	
	private static final Logger logger
	=LoggerFactory.getLogger(OwnerController.class);
	
	@Autowired
	OwnerService ownerService;

	//회원가입 화면 보여주기 (점포)
	@RequestMapping("/register/register.do")
	public void register(Model model){
		logger.info("회원가입 창 보여주기");
	}
	
	

	
	
	//회원정보 등록
	@RequestMapping("/ownerWrite.do")
	public String write(@ModelAttribute OwnerVO vo, ModelMap model) {
		//1
		logger.info("회원가입 처리 파라미터 vo={}", vo);

		//2
		String hp1=vo.getOwnerHp1();
		String hp2=vo.getOwnerHp2();
		String hp3=vo.getOwnerHp3();

		if(hp2==null || hp2.isEmpty() || hp3==null || hp3.isEmpty()) {
			hp1="";
			hp2="";
			hp3="";
		}
		vo.setOwnerHp1(hp1);
		vo.setOwnerHp2(hp2);
		vo.setOwnerHp3(hp3);
		
		//String hashPwd=BCrypt.hashpw(vo.getOwnerPwd(), BCrypt.gensalt());
		//vo.setOwnerPwd(hashPwd);

		int cnt=ownerService.insertowner(vo);
		logger.info("회원가입 결과, cnt={}", cnt);
		
		String msg="회원가입 실패!", url="/owner/register/register.do";
		if(cnt>0) {
			msg="회원가입되었습니다.";
			url="/owner/index.do";
		}
		
		//3		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	
	
	//회원 중복확인
	@RequestMapping("/register/checkId.do")
	public String checkId(@RequestParam(required = false) String ownerId,
			@RequestParam(defaultValue = "0") String type,
			Model model) {
		//1
		logger.info("아이디 중복확인, 파라미터 ownerId={}, type={}",ownerId, type);

		//2
		int result=0;
		if( ownerId!=null && !ownerId.isEmpty()) {
			if(type.equals("owner")) {  //일반 사용자 아이디 중복확인
				result=ownerService.checkDup(ownerId);
			} /*
				 * else { //admin - 관리자 아이디 중복확인 result=managerService.dupCheck(userid); }
				 */
			logger.info("아이디 중복확인 결과, result={}", result);
		}

		//3
		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID", OwnerService.EXIST_ID);
		model.addAttribute("NON_EXIST_ID", OwnerService.NON_EXIST_ID);

		//4
		return "/owner/register/checkId";
	}

	


	
	//플렉스 소개 뷰 보여주기(점포)
	@RequestMapping("/menu4/introduce.do")
	public void introduce(){
		logger.info("플렉스 소개 뷰 보여주기");
	
	}


	
	

	
	//회원탈퇴 (점포)
	@RequestMapping("/withdraw.do")
	public String withdraw(HttpSession session,Model model,HttpServletResponse response,
			@RequestParam(defaultValue = "0")int ownerNo) {
		String ownerId=(String) session.getAttribute("ownerId");
		
		String msg="탈퇴 실패",url="/owner/index.do";
		
			int cnt = ownerService.withdrawOwner(ownerNo);
			logger.info("회원 탈퇴 결과 cnt = {}", cnt);
			
			if(cnt>0){
				msg="회원탈퇴처리 되었습니다.";
				
				if(session.getAttribute("storeNo")!=null) {
					session.removeAttribute("storeNo");
				}
				logger.info("로그아웃 처리, 파라미터 userid={}, storeNO={}", ownerId);
				
				session.removeAttribute("ownerId");
				session.removeAttribute("ownerName");
				session.removeAttribute("ownerNo");
				session.removeAttribute("authorityNo");
				session.removeAttribute("result");
				
				Cookie ck = new Cookie("ck_userid", ownerId);
				ck.setPath("/");
				ck.setMaxAge(0); //쿠키제거
				response.addCookie(ck);
			}
		
		//3. 
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	
	
	

	//점포탈퇴 (점포)
	@RequestMapping("/withdrawStore.do")
	public String withdrawStore(Model model,HttpServletResponse response,
			@RequestParam(defaultValue = "0")int storeNo) {
		
		String msg="탈퇴 실패",url="/owner/index.do";
		
		int cnt = ownerService.withdrawStore(storeNo);
				logger.info("점포 탈퇴신청 결과 cnt = {}", cnt);
			
		if(cnt>0){
			msg="점포 탈퇴  승인 요청 되었습니다.";
		}
		
		//3. 
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//회원정보 등록
	@RequestMapping(value="/register/registerEdit.do", method=RequestMethod.GET)
	public String edit(HttpSession session,Model model) {
		String ownerId=(String) session.getAttribute("ownerId");
		OwnerVO vo = ownerService.selectOwner(ownerId);
		
		model.addAttribute("vo", vo);
		
		//4
		return "/owner/register/registerEdit";
	}
	
	
	@RequestMapping(value="/register/registerEdit.do", method=RequestMethod.POST)
	public String memberEdit_post(@ModelAttribute OwnerVO vo,HttpSession session, 
			ModelMap model) {
		//1

		logger.info("회원수정 처리, 파라미터 vo={}", vo);
		
		//2
		String hp1=vo.getOwnerHp1();
		String hp2=vo.getOwnerHp2();
		String hp3=vo.getOwnerHp3();

		if(hp2==null || hp2.isEmpty() || hp3==null || hp3.isEmpty()) {
			hp1="";
			hp2="";
			hp3="";
		}
		vo.setOwnerHp1(hp1);
		vo.setOwnerHp2(hp2);
		vo.setOwnerHp3(hp3);

		String msg="회원수정 실패!", url="/owner/register/registerEdit.do";
		int result=ownerService.loginChk(vo.getOwnerId(), vo.getOwnerPwd());
		if(result==OwnerService.LOGIN_OK) {
			int cnt=ownerService.updateOwner(vo);
			logger.info("회원수정 결과, cnt={}", cnt);

			if(cnt>0) {
				msg="회원정보 수정되었습니다.";
				url="/owner/mypage//mypageMain.do";
			}
		}else if(result==OwnerService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";

		
	}

	
	@RequestMapping("/register/agreement.do")
	public String agreement() {
		
		return "owner/register/agreement";
	}
	
	
	@ResponseBody
	@RequestMapping("/checkResult.do")
	public int checkResult(HttpSession session) {
		logger.info("권한 찾기 ajax ");
		String ownerId = (String) session.getAttribute("ownerId");
		
		int result = ownerService.checkAuthority(ownerId);
		logger.info("result 조회 결과 result ={}",result);
		
		return result;
	}
		
}
