package com.project.fd.owner.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fd.admin.hoenytip.AdminHoneytipService;
import com.project.fd.admin.hoenytip.AdminHoneytipVO;
import com.project.fd.owner.board.model.OwnerBoardService;
import com.project.fd.owner.board.model.OwnerBoardVO;
import com.project.fd.owner.chart.model.OwnerChartService;
import com.project.fd.owner.model.OwnerService;
import com.project.fd.owner.request.model.OwnerRequestService;
import com.project.fd.owner.reviewcomment.model.OwnerReivewCommentService;
import com.project.fd.owner.store.model.OwnerStoresService;


@Controller
@RequestMapping("/owner")
public class OwnerIndexController {
	
	private static final Logger logger
	=LoggerFactory.getLogger(OwnerIndexController.class);
	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private OwnerBoardService ownerBoardService;
	
	@Autowired
	private AdminHoneytipService honeytipService;
	@Autowired private OwnerStoresService ownerStoresService;
	@Autowired private OwnerReivewCommentService reviewcmtService; // 20210214소정 추가 
	
	@Autowired private OwnerRequestService requestService; // 20210214 소정 추가 
	
	@Autowired
	private OwnerChartService ownerChartService; // 20210218 지안추가
	//관리자, 점포 공통 뷰 보여주기(점포)
		@RequestMapping("/index.do")
		public void index(Model model){
			
			model.addAttribute("NO_LICENSE", OwnerService.NO_LICENSE);
			model.addAttribute("NO_STORE", OwnerService.NO_STORE);
			model.addAttribute("HAVE_ALL", OwnerService.HAVE_ALL);
			model.addAttribute("LICENSE_STAY", OwnerService.LICENSE_STAY);
			model.addAttribute("STORE_STAY", OwnerService.STORE_STAY);
			model.addAttribute("WITHDRAW_STAY", OwnerService.WITHDRAW_STAY);
			model.addAttribute("NOTICE", OwnerBoardService.BOARD_NOTICE);
			model.addAttribute("EVENT", OwnerBoardService.BOARD_EVENT);
			
			logger.info("점포 공통 뷰 보여주기");
			
			List<Map<String, Object>> list = ownerChartService.selectMainStoreFour();
			logger.info("list={}",list);
			
			model.addAttribute("list",list);
		}
		
		
		
		//내점포 메인 뷰 보여주기(점포)
		@RequestMapping("/menu2/myStoreIndex.do")
		public String myStoreIndex(Model model, HttpSession session){
			int ownerNo=(Integer)session.getAttribute("ownerNo");
			int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
			logger.info("내점포 메인 뷰 보여주기 storeNo={},ownerNo={}",storeNo,ownerNo);
			
			int totalblockcmt=reviewcmtService.blockTotalRecord(storeNo);
			int totalnocmt=reviewcmtService.NocmtTotalRecord(storeNo);
			List<Map<String, Object>> allList=reviewcmtService.selectAll(storeNo);
			logger.info("리뷰전체  리스트 allList.size={}",allList.size());
			logger.info("미답변  차단 갯수  totalblockcmt={},totalnocmt={}",totalblockcmt,totalnocmt);
			
			int totalagree1=requestService.selectAgree1(ownerNo);
			int totalagree2=requestService.selectAgree2(ownerNo);
			int totalagree3=requestService.selectAgree3(ownerNo);
			int totalagree4=requestService.selectAgree4(ownerNo);
			
			logger.info("request 갯수 totalagree1={},totalagree2={}",totalagree1,totalagree2);
			logger.info("request 갯수 totalagree3={},totalagree4={}",totalagree3,totalagree4);
			//ownerreview 
			model.addAttribute("totalblockcmt", totalblockcmt);
			model.addAttribute("totalnocmt", totalnocmt);
			model.addAttribute("allList", allList);
			
			//int storeNo=ownerStoresService.selectStoreNoByNo(ownerNo);
			//agree
			model.addAttribute("totalagree1", totalagree1);
			model.addAttribute("totalagree2", totalagree2);
			model.addAttribute("totalagree3", totalagree3);
			model.addAttribute("totalagree4", totalagree4);
			
			return "owner/menu2/myStoreIndex";
		}
		
		
		
		
		@RequestMapping("/ownerInc/ownerMainNotice.do")
		public String noticeSix(Model model) {
			//1
			logger.info("메인에 표시될 공지사항 글 목록");
			
			
			String boardHead =OwnerBoardService.BOARD_NOTICE;
			
			//공지사항이면 공지사항 이벤트면 이벤트 
			
			List<OwnerBoardVO> list=ownerBoardService.selectMainBoard(boardHead );
			logger.info("메인 공지사항 또는 이벤트  조회 결과, list.size={}", list.size());
		

			//3. 모델에 결과 저장
			model.addAttribute("list", list);
			

			return "ownerInc/ownerMainNotice";
		}

		
		
		
		@RequestMapping("/ownerInc/ownerMainHoneyTip.do")
		public String mainHoneyTip(Model model) {
			logger.info("메인에 표시될 사장님 꿀팁 글 목록");
			
			List<AdminHoneytipVO> list=honeytipService.ownerHoneyTip();
			logger.info("ownerHoneyTip list 출력, list.size={}", list.size()); //4개 출력되면 정상 ! 
			
			model.addAttribute("list", list);
		
			return "ownerInc/ownerMainHoneyTip";
		}
		
		
		
		@RequestMapping("/ownerInc/ownerMainEvent.do")
		public String eventSix(Model model) {
			//1
			logger.info("메인에 표시될 이벤트 글 목록");
			
			
			String boardHead =OwnerBoardService.BOARD_EVENT;
			
			//공지사항이면 공지사항 이벤트면 이벤트 
			
			List<OwnerBoardVO> list=ownerBoardService.selectMainBoard(boardHead);
			logger.info("메인 공지사항 또는 이벤트  조회 결과, list.size={}", list.size());
		

			//3. 모델에 결과 저장
			model.addAttribute("list", list);
			

			return "ownerInc/ownerMainEvent";
		}
		
		
		
		
		@RequestMapping("/ownerInc/loginView.do")
		public String loginview() {
			//1
			logger.info("메인에 표시될 로그인 뷰 보여주기");
			
			

			return "ownerInc/loginView";
		}


		
		@RequestMapping("/datePicker.do")
		public String dada(Model model) {
			//1
			logger.info("데이터피커 연습용");
			

			return "owner/datePicker/datePicker";
		}

		
		
		@RequestMapping("/menu2/myStoreMainNotice.do")
		public String noticeSix_myStoreIndex(Model model) {
			//1
			logger.info("스토어 메인에 표시될 공지사항 글 목록");
			
			
			String boardHead =OwnerBoardService.BOARD_NOTICE;
			
			//공지사항이면 공지사항 이벤트면 이벤트 
			
			List<OwnerBoardVO> list=ownerBoardService.selectMainBoard(boardHead );
			logger.info("스토어 메인 공지사항 또는 이벤트  조회 결과, list.size={}", list.size());
		

			//3. 모델에 결과 저장
			model.addAttribute("list", list);
			

			return "owner//menu2/myStoreMainNotice";
		}
		
		
		
		
		
}
