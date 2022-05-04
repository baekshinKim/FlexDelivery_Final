package com.project.fd.owner.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;


import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.project.fd.common.PaginationInfo;
import com.project.fd.common.SearchVO;
import com.project.fd.common.Utility;
import com.project.fd.owner.advertise.model.OwnerAdvertiseAllVO;
import com.project.fd.owner.advertise.model.OwnerAdvertiseSearchVO;
import com.project.fd.owner.advertise.model.OwnerAdvertiseService;
import com.project.fd.owner.advertise.model.OwnerAdvertiseVO;
import com.project.fd.owner.advertise.model.OwnerStoreAdVO;
import com.project.fd.owner.menu.model.OwnerMenuService;
import com.project.fd.owner.model.OwnerService;
import com.project.fd.owner.model.OwnerVO;
import com.project.fd.owner.store.model.OwnerStoresService;

@Controller
@RequestMapping("/owner/menu2/advertise")
public class OwnerAdvertiseController {
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(OwnerAdvertiseController.class);

	@Autowired
	private OwnerAdvertiseService ownerAdvertiseService;
	

	@Autowired
	private OwnerService ownerService;

	
	
	
	// 테스트용
	@RequestMapping("/test.do")
	public String test_get( HttpServletRequest req, ModelMap model, 
		HttpServletResponse response) throws Exception {
		
		

		logger.info("test 창 보여주기");
	
	
		return "owner/menu2/advertise/test";
	}
	

	// advertiseMain 을 보여주기위한 창
	@RequestMapping(value = "/advertiseMain.do", method = RequestMethod.GET)
	public String advertiseMain_get( HttpSession session, Model model) {
		int storeNo=0;
			
		String msg="점포가 없습니다.", url="/owner/index.do";
		if(session.getAttribute("storeNo")==null) {
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "common/message";
			
		}else {
			storeNo= (Integer)session.getAttribute("storeNo");
		}
		
		logger.info("advertiseMain 창 보여주기, 파라미터 storeNo={}",storeNo);
		
		 List<OwnerAdvertiseAllVO> list = null;
		 list = ownerAdvertiseService.selectAdvertieseView(storeNo);
	     logger.info("현재 진행중 광고 보기 결과 list.size={}", list.size());
		 model.addAttribute("list", list); 
		
	
		return "owner/menu2/advertise/advertiseMain";
	}

	
	
	
	
	// 광고등록을 누를 시 받아오면 pwd 확인용 창을 보내기위함
	@RequestMapping(value = "/advertisePwdCheck.do", method = RequestMethod.GET)
	public String advertisePwdCheck_get(Model model) {
		logger.info("advertisePwdCheck 창 보여주기");
		
		
		int YorN = OwnerService.GO_PWD;
		model.addAttribute("YorN", YorN);
		
		
		return "owner/menu2/advertise/advertisePwdCheck";
	}
	
	
	
	// pwd 확인후 choice 창 가기
	  @RequestMapping(value="/advertisePwdCheck.do", method=RequestMethod.POST)
	  public String advertisePwdCheck_post(@RequestParam(required = false) String ownerPwd, HttpSession session, Model model) {
		  String userid = (String) session.getAttribute("ownerId");
		  logger.info("advertisePwdCheck 창 보여주기 , 파라미터 ownerPwd={}, userid={}",ownerPwd,userid);
		  
		   int result =ownerService.loginChk(userid, ownerPwd);
		   logger.info("비밀번호 확인 결과, result={}", result);
		  
		   int YorN = 0;
		   if(result==OwnerService.LOGIN_OK) {
			   YorN=OwnerService.LOGIN_OK;
		   }else if(result==OwnerService.PWD_DISAGREE) {
			   YorN=OwnerService.PWD_DISAGREE;
		   }
		 
		   model.addAttribute("YorN",YorN);
		   
		   
		   return "owner/menu2/advertise/advertisePwdCheck";
	  }
	  
	  
	  
	  
	  

	// pwd 누르면 choice 창 보여주기
	@RequestMapping(value = "/advertiseChoice.do", method = RequestMethod.GET)
	public String advertiseChoice(Model model) {
		logger.info("advertiseChoice 창 보여주기");
		
		List<OwnerAdvertiseVO> list = ownerAdvertiseService.selectAdvertise();
		logger.info("광고 전체 조회 결과 list.size()=",list.size());
		
		model.addAttribute("list", list);
		
		return "owner/menu2/advertise/advertiseChoice";
	}

	
	
	// choice 페이지에서 버튼 누르면 등록창 가진다.
	@RequestMapping(value = "/advertiseWrite.do", method = RequestMethod.GET)
	public String advertiseWrite_get(@RequestParam(defaultValue = "0") int advertiseNo, 
				HttpSession session, Model model) {
		//storeNo 구하기
		int storeNo=0;
		
		String msg="점포가 없습니다.", url="/owner/index.do";
		if(session.getAttribute("storeNo")==null) {
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "common/message";
			
		}else {
			storeNo= (Integer)session.getAttribute("storeNo");
		}
		logger.info("advertiseWrite 창 보여주기, 파라미터 advertiseNo={} , storeNo={}", advertiseNo,storeNo);
		
		String ownerId = (String) session.getAttribute("ownerId");
		OwnerVO oVo = ownerService.selectOwner(ownerId);
		logger.info("오너 조회 결과 oVo={}", oVo);
		
		String hp="";
		if(oVo.getOwnerHp2()!=null && oVo.getOwnerHp3()!=null ) {
			hp+=oVo.getOwnerHp1()+"-";
			hp+=oVo.getOwnerHp2()+"-";
			hp+=oVo.getOwnerHp3();
		}
		
		
		// 오늘날짜
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		logger.info("오늘 날짜 조회 결과 today={}", today);
		// write 에서 choice를 제목에 박아주기
		
		
		
		//번호로 광고 가져오기
		OwnerAdvertiseVO vo = ownerAdvertiseService.selectAdvertiseByNo(advertiseNo);
		
		model.addAttribute("hp", hp);
		model.addAttribute("today", today);
		model.addAttribute("oVo", oVo);
		model.addAttribute("vo", vo );
		model.addAttribute("storeNo", storeNo);
		return "owner/menu2/advertise/advertiseWrite";
	}

	
	
	// 광고신청 누를시 신청함 insert
	@RequestMapping(value = "/advertiseWrite.do", method = RequestMethod.POST)
	public String advertiseWrite_post(@ModelAttribute OwnerStoreAdVO ownerStoreAdVo, Model model) {
		logger.info("advertiseWrite 등록, 파라미터 ownerStoreAdVo={}", ownerStoreAdVo);
		
		// insert
		int cnt = ownerAdvertiseService.insertAdvertiseAd(ownerStoreAdVo);
		logger.info("insert 조회 결과 cnt={}", cnt);
		
		String msg="등록 실패!", url="/owner/menu2/advertise/advertiseChoice.do";
		
		if(cnt>0) {
			msg="등록 성공!";
			url="/owner/menu2/advertise/advertiseMain.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}

	
	
	// main에서 탭의 만료버튼 누르면 나옵니다.
	@RequestMapping("/advertiseExpire.do")
	public String advertiseExpire_post(@ModelAttribute OwnerAdvertiseSearchVO searchVo, 
				HttpSession session, Model model) {
			//storeNo 구하기
				int storeNo=0;
				
				String msg="점포가 없습니다.", url="/owner/index.do";
				if(session.getAttribute("storeNo")==null) {
					model.addAttribute("msg",msg);
					model.addAttribute("url",url);
					return "common/message";
					
				}else {
					storeNo= (Integer)session.getAttribute("storeNo");
				}
				
			//1
			logger.info("만료된 글 목록 페이지, 파라미터 searchVo={},storeNo={}", searchVo,storeNo);
			
			//2
			//페이징 처리 관련 셋팅
			//[1] PaginationInfo 생성
			PaginationInfo pagingInfo = new PaginationInfo();
			pagingInfo.setBlockSize(Utility.BLOCKSIZE);
			pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
			pagingInfo.setCurrentPage(searchVo.getCurrentPage());
			
			//[2] SearchVo 셋팅
			//날짜가 넘어오지 않은 경우 현재일자를 셋팅
			String startDay=searchVo.getStartDay();
			if(startDay==null || startDay.isEmpty()) {
				Date d = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String today=sdf.format(d);
				searchVo.setStartDay(today);
				searchVo.setEndDay(today);			
			}
			logger.info("searchVo ={}",searchVo);
			
			
			searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
			searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			searchVo.setStoreNo(storeNo);
					
			List<OwnerAdvertiseAllVO> list=ownerAdvertiseService.selectAdvertieseViewExpire(searchVo);
			logger.info("글목록 결과, list.size={}", list.size());
			
			int totalRecord=ownerAdvertiseService.selectTotalRecord(searchVo);
			logger.info("글 개수, totalRecord={}", totalRecord);		
			pagingInfo.setTotalRecord(totalRecord);
			
			
		
			//3. 모델에 결과 저장
			model.addAttribute("list", list);
			model.addAttribute("pagingInfo", pagingInfo);
			model.addAttribute("searchVo", searchVo);
			//4. 뷰페이지 리턴
			return "owner/menu2/advertise/advertiseExpire";
		}
	
	
	
	
	

}
