package com.project.fd.owner.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.common.FileUploadUtil;
import com.project.fd.common.PaginationInfo;
import com.project.fd.common.Utility;
import com.project.fd.owner.board.model.OwnerBoardSearchVO;
import com.project.fd.owner.board.model.OwnerBoardService;
import com.project.fd.owner.board.model.OwnerBoardVO;
import com.project.fd.owner.model.OwnerService;

@Controller
@RequestMapping("/owner/menu3/board")
public class OwnerBoardController {

	private static final Logger logger
	=LoggerFactory.getLogger(OwnerBoardController.class);
	
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private OwnerBoardService ownerBoardService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	
//저도.. 최대한 중복을 줄이고싶었는데.. 계속 오류나서.. 일단은 notice / event 나눠서 담았습니다 ㅜㅜㅜㅜㅜㅜㅜ 	
	

	
	//공지사항 부분 시작
		
		//공지사항 보여주기
	
			


		@RequestMapping("/notice.do")
		public String noticeList(@ModelAttribute OwnerBoardSearchVO searchVo, Model model) {
			//1
			logger.info("공지사항 글 목록, 파라미터 BoardSearchVO={}", searchVo);
			
			
			//2
			//페이징 처리 관련 셋팅
			//[1] PaginationInfo 생성
			PaginationInfo pagingInfo = new PaginationInfo();
			pagingInfo.setBlockSize(Utility.BLOCKSIZE);
			pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
			pagingInfo.setCurrentPage(searchVo.getCurrentPage());

			//[2] SearchVo 셋팅
			searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
			searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			searchVo.setBoardHead(OwnerBoardService.BOARD_NOTICE);
			
			//공지사항이면 공지사항 이벤트면 이벤트 
			
			List<OwnerBoardVO> list=ownerBoardService.selectAll(searchVo);
			logger.info("공지사항 또는 이벤트  조회 결과, list.size={}", list.size());

			int totalRecord=ownerBoardService.selectTotalRecord(searchVo);
			logger.info("글 개수, totalRecord={}", totalRecord);		
			pagingInfo.setTotalRecord(totalRecord);

			//3. 모델에 결과 저장
			model.addAttribute("list", list);
			model.addAttribute("pagingInfo", pagingInfo);

			return "owner/menu3/board/notice";
		}

	
		
		//이벤트 시작
		
		@RequestMapping("/event.do")
		public String eventList(@ModelAttribute OwnerBoardSearchVO searchVo, Model model) {
			//1
			logger.info(" 이벤트  글 목록, 파라미터 BoardSearchVO={}", searchVo);
			
			
			//2
			//페이징 처리 관련 셋팅
			//[1] PaginationInfo 생성
			PaginationInfo pagingInfo = new PaginationInfo();
			pagingInfo.setBlockSize(Utility.BLOCKSIZE);
			pagingInfo.setRecordCountPerPage(Utility.EVENT_RECORD_COUNT);
			pagingInfo.setCurrentPage(searchVo.getCurrentPage());

			//[2] SearchVo 셋팅
			searchVo.setRecordCountPerPage(Utility.EVENT_RECORD_COUNT);
			searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			searchVo.setBoardHead(OwnerBoardService.BOARD_EVENT);
			
			//공지사항이면 공지사항 이벤트면 이벤트 
			
			List<OwnerBoardVO> list=ownerBoardService.selectAll(searchVo);
			logger.info("공지사항 또는 이벤트  조회 결과, list.size={}", list.size());

			int totalRecord=ownerBoardService.selectTotalRecord(searchVo);
			logger.info("글 개수, totalRecord={}", totalRecord);		
			pagingInfo.setTotalRecord(totalRecord);

			//3. 모델에 결과 저장
			model.addAttribute("list", list);
			model.addAttribute("pagingInfo", pagingInfo);

			return "owner/menu3/board/event";
		}

		
	
	
	
	
	
		
		@RequestMapping("/boardDetail.do")
		public String noticeDetail(@RequestParam(defaultValue = "0") int boardNo
					,@RequestParam(defaultValue = "0") String boardHead,
				HttpServletRequest request, Model model) {
			//1
			logger.info("상세보기 파라미터 boardNo={}, boardHead={}", boardNo,boardHead);
			
			if(boardHead== null || boardHead.isEmpty()) {
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/owner/index.do");
			}else if(boardHead.equals(OwnerBoardService.BOARD_EVENT) && boardNo==0) {
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/owner/menu3/board/event.do");

				return "common/message";
			}else if(boardHead.equals(OwnerBoardService.BOARD_NOTICE) && boardNo==0) {
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/owner/menu3/board/notice.do");

				return "common/message";
			}
			
			
			
			//2
			OwnerBoardVO ownerBoardVo=ownerBoardService.selectByNo(boardNo);
			logger.info("상세보기 결과,vo={}", ownerBoardVo);

			String type = "url";
			//현재 파일이 인터넷 url 인지 파일 업로드한 url 인지 확인위해서
			if(ownerBoardVo.getBoardThumbnail()!=null) {
				String upPath 
				= fileUtil.getUploadPath(FileUploadUtil.NOTICE_EVENT_TYPE, request);
				File nowFile = new File(upPath, ownerBoardVo.getBoardThumbnail());
				if(nowFile.exists()) {
					 type="file";
					logger.info("기존 파일 존재여부 type={}",type);
				}
			}else if(ownerBoardVo.getBoardThumbnail()==null) {
				type="null";
			}
			
			
			//2-2 
			//공지 이벤트 알기
			String eventOrNotice="";
			if(boardHead.equals(OwnerBoardService.BOARD_EVENT)) {
				eventOrNotice=OwnerBoardService.BOARD_EVENT;
			}else if(boardHead.equals(OwnerBoardService.BOARD_NOTICE)) {
				eventOrNotice=OwnerBoardService.BOARD_NOTICE;
			}
			
			//3
			model.addAttribute("ownerBoardVo", ownerBoardVo);
			model.addAttribute("type",type);
			model.addAttribute("eventOrNotice",eventOrNotice);
			model.addAttribute("EVENT",OwnerBoardService.BOARD_EVENT);
			model.addAttribute("NOTICE",OwnerBoardService.BOARD_NOTICE);

			

			//4
			return "owner/menu3/board/boardDetail";
		}

	
	
	
	
	
	
	
	
	
	
	
	

	
	


}
