package com.project.fd.member.controller;

import java.util.List;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.admin.largecategory.model.AdminLargeCategoryService;
import com.project.fd.admin.largecategory.model.AdminLargeCategoryVO;
import com.project.fd.member.board.model.MemberBoardService;
import com.project.fd.member.board.model.MemberBoardVO;
import com.project.fd.member.model.MemberService;
import com.project.fd.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger
		=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired private MemberService memberService;
	@Autowired private AdminLargeCategoryService lCategoryServ;
	@Autowired private MemberBoardService boardServ;
	
	@RequestMapping("/register/register.do")
	public String register(){
		logger.info("회원가입 화면 보여주기");
		
		return "member/register/register";
	}
	
	@RequestMapping("/memberWrite.do")
	public String write(@ModelAttribute MemberVO vo, @RequestParam String locationName,
			ModelMap model) {
		//1
		logger.info("회원가입 처리 파라미터 vo={}", vo);
		//2
		int lono=memberService.memloNo(locationName);
		vo.setLocationNo(lono);
		
		String hashPwd=BCrypt.hashpw(vo.getMemberPwd(), BCrypt.gensalt());
		vo.setMemberPwd(hashPwd);
		
		int cnt=memberService.insertMember(vo);
		logger.info("회원가입 결과, cnt={}", cnt);
		
		String msg="회원가입 실패!", url="/member/register.do";
		if(cnt>0) {
			msg="회원가입되었습니다.";
			url="/member/index.do";
		}
		
		//3		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping("/member.do")
	public String membermainjw() {
		logger.info("회원 메인 보여주기");
		
		return "member/member";
	}
	
	@RequestMapping("/index.do")
	public String memberIndex(Model model) {
		logger.info("회원 메인화면 보여주기");
		List<AdminLargeCategoryVO> list=lCategoryServ.selectAll();
		logger.info("list.size={}",list.size());
		List<MemberBoardVO> bList=boardServ.boardMain();
		
		model.addAttribute("list",list);
		model.addAttribute("bList",bList);
		return "member/index";
	}
	
	@ResponseBody
	@RequestMapping("/ajaxCheckId.do")
	public boolean ajaxCheckId(@RequestParam String memberid) {
		logger.info("ajax 이용-아이디 중복확인, id={}", memberid);
		
		boolean bool=false;
		int result=memberService.checkDup(memberid);
		logger.info("아이디 중복확인 결과, result={}", result);
		
		if(result==MemberService.EXIST_ID) {
			bool=true;  //이미 존재
		}else if(result==MemberService.NON_EXIST_ID) {
			bool=false;	//사용 가능		
		}
		
		return bool;
	}

	@RequestMapping("/sidebarList.do")
	public String sidebarList(Model model) {
		logger.info("사이드바 대분류출력");
		List<AdminLargeCategoryVO> list=lCategoryServ.selectAll();
		model.addAttribute("list",list);
		return "memInc/sidebarList";
	}

	@RequestMapping("register/zipcode.do")
	public String zipcode(){
		//1
		logger.info("우편번호 조회창 보여주기");
		
		//4
		return "member/register/zipcode";
	}
	
	
	@RequestMapping("/register/ajaxZipcode.do")
	public void ajaxZipcode(HttpServletRequest req, ModelMap model, 
			HttpServletResponse response) throws Exception {
		// 요청변수 설정
		String currentPage = req.getParameter("currentPage");    //요청 변수 설정 (현재 페이지. currentPage : n > 0)
		String countPerPage = req.getParameter("countPerPage");  //요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
		String confmKey = req.getParameter("confmKey");          //요청 변수 설정 (승인키)
		String keyword = req.getParameter("dong");            //요청 변수 설정 (키워드)
		
		// OPEN API 호출 URL 정보 설정
		String apiUrl = "https://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage+"&countPerPage="+countPerPage+"&keyword="+URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+confmKey;
		URL url = new URL(apiUrl);
    	BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
    	StringBuffer sb = new StringBuffer();
    	String tempStr = null;

    	while(true){
    		tempStr = br.readLine();
    		if(tempStr == null) break;
    		sb.append(tempStr);								// 응답결과 XML 저장
    	}
    	br.close();
    	
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		response.getWriter().write(sb.toString());			// 응답결과 반환
    }
	
	@RequestMapping(value="/register/memberEdit.do", method = RequestMethod.GET)
	public String memberEdit_get(HttpSession session, Model model) {
		String memberId=(String) session.getAttribute("memberId");
		logger.info("회원수정 페이지, 파라미터 memberId={}", memberId);
		
		MemberVO vo=memberService.selectMember(memberId);
		logger.info("회원 수정페이지, 조회 결과 vo={}", vo);
		
		model.addAttribute("vo",vo);
		
		return "member/register/memberEdit";
	}
	
	@RequestMapping(value = "/memberEdit.do", method = RequestMethod.POST)
	public String memberEdit_post(@ModelAttribute MemberVO vo, HttpSession session,
			ModelMap model, @RequestParam(required=false) String locationName) {
		String memberId= (String) session.getAttribute("memberId");
		String loName= (String) session.getAttribute("locationName");
		
		String msg="회원수정 실패!", url="/member/register/memberEdit.do";
		if (loName==null) {
			int cnt = memberService.rupdateMember(vo);
			logger.info("회원수정 결과, cnt={}", cnt);
			
			if(cnt>0) {
				msg="회원정보 수정되었습니다.";
			}
		}else {
			int lono=memberService.memloNo(loName);
			vo.setLocationNo(lono);
			String hashPwd=BCrypt.hashpw(vo.getMemberPwd(), BCrypt.gensalt());
			vo.setMemberPwd(hashPwd);
			int cnt =memberService.updateMember(vo);
			logger.info("회원수정 결과, cnt={}", cnt);
			if(cnt>0) {
				msg="회원정보 수정되었습니다.";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
		
	}
	
	@ResponseBody
	@RequestMapping("/memberGiftChk.do")
	public boolean memberchk(@ModelAttribute MemberVO vo) {
		logger.info("선물하기 회원이름={},회원 핸드폰={}",vo.getMemberName(),vo.getMemberHp3());
		return memberService.giftChk(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/memberOut.do",method = RequestMethod.POST)
	public int memberOut(@RequestParam String memberPwd,HttpSession session,HttpServletResponse response) {
		logger.info("회원 탈퇴처리, memberNo={}",memberPwd);
		String memberId=(String)session.getAttribute("memberId");
		int cnt=memberService.loginChk(memberId, memberPwd);
		if(cnt==MemberService.PWD_DISAGREE) {
			return 2; // 비밀번호 불일치
		}else if(cnt==MemberService.LOGIN_OK) {
			cnt=memberService.memberOut(memberId);
			if(cnt>0) {
				session.removeAttribute("memberId");
				session.removeAttribute("memberName");
				session.removeAttribute("memberNo");
				session.removeAttribute("authorityNo");
				session.removeAttribute("locationNo");
				
				Cookie ck=new Cookie("ck_memberid",memberId);
				ck.setMaxAge(0);
				ck.setPath("/");
				response.addCookie(ck);
				return 1; //성공
			}else {
				return 4; //회원탈퇴 실패
			}
		}
		return 3; //회원인증 실패
	}
	
}
