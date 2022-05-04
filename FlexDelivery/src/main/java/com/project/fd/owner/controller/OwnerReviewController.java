package com.project.fd.owner.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
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

import com.project.fd.common.PaginationInfo;
import com.project.fd.common.Utility;
import com.project.fd.owner.reviewcomment.model.OwnerReivewCommentService;
import com.project.fd.owner.reviewcomment.model.OwnerReviewCommentVO;
import com.project.fd.owner.reviewcomment.model.OwnerReviewSearchVO;
import com.project.fd.owner.store.model.OwnerStoresService;

@Controller
@RequestMapping("/owner/menu2/reviewOwner")
public class OwnerReviewController {
	private static final Logger logger
	=LoggerFactory.getLogger(OwnerReviewController.class);
	
	@Autowired OwnerReivewCommentService ownerReCommService;
	//@Autowired MemberReviewService. memberReviewService;
	@Autowired private OwnerStoresService ownerStoresService;

	@RequestMapping(value="/reviewOwner.do", method=RequestMethod.GET)
	public String orderList_get(HttpSession session, Model model) {
		int ownerNo = (Integer) session.getAttribute("ownerNo");
		int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
		logger.info("점포 - 리뷰관리 보여주기 storeNo={}",storeNo);
		
		List<Map<String, Object>> allList=ownerReCommService.selectAll(storeNo);
		logger.info("리뷰메인 리스트 allList.size={}",allList.size());
		
		
		List<Map<String, Object>> nocmtList=ownerReCommService.selectNocomment(storeNo);
		int totalnocmt=ownerReCommService.NocmtTotalRecord(storeNo);
		logger.info("미답변   리스트 nocmtList.size={},totalnocmt={}",nocmtList.size(),totalnocmt);
		
		List<Map<String, Object>> blockList=ownerReCommService.selectblockcmt(storeNo);
		int totalBlock=ownerReCommService.blockTotalRecord(storeNo);
		logger.info("차단 리뷰  리스트 blockList.size={},totalBlock={}",blockList.size(),totalBlock);
		
		
		List<Map<String, Object>> starsList=ownerReCommService.reviewReting(storeNo);
		
		model.addAttribute("starsList", starsList);
		model.addAttribute("totalBlock", totalBlock);
		model.addAttribute("blockList", blockList);
		
		model.addAttribute("totalnocmt", totalnocmt);
		model.addAttribute("nocmtList", nocmtList);
		
		model.addAttribute("allList", allList);
		return "owner/menu2/reviewOwner/reviewOwner";
	}
	
	// review List 
	@RequestMapping(value="/reviewOwnerList.do", method=RequestMethod.POST)
	public String orderList_post(@ModelAttribute OwnerReviewSearchVO searchVo,
			HttpSession session, Model model) {
		String msg="로그인 해주세요.", url="/owner/index.do";
		int storeNo=0;
		if(session.getAttribute("ownerNo")==null) {
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "common/message";
			
		}else {
			storeNo=(Integer)session.getAttribute("storeNo");
		}
		searchVo.setStoreNo(storeNo);
		logger.info("점포 - 리뷰관리 보여주기 storeNo={},searchVo.getStoreNo()={}",storeNo,searchVo.getStoreNo());
		
		logger.info("리뷰 전체 보여주기 , 파라미터 searchVo={}", searchVo);
		
		//[1]
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2]
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		//날짜가 넘어오지 않은 경우 현재일자를 셋팅
		String startDay=searchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today=sdf.format(d);
			searchVo.setStartDay(today);
			searchVo.setEndDay(today);			
		}
		logger.info("searchVo={}",searchVo);
		
		int totalRecord=ownerReCommService.getTotalRecord(searchVo);
		logger.info("리뷰 전체 조회,  레코드 개수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		List<Map<String, Object>> reviewList=ownerReCommService.selectReView(searchVo);
		logger.info("리뷰 전체 조회, reviewList.size={}", reviewList.size());
		
		
		List<Map<String, Object>> allList=ownerReCommService.selectAll(storeNo);
		logger.info("리뷰메인 리스트 allList.size={}",allList.size());
		
		
		List<Map<String, Object>> nocmtList=ownerReCommService.selectNocomment(storeNo);
		int totalnocmt=ownerReCommService.NocmtTotalRecord(storeNo);
		logger.info("미답변   리스트 nocmtList.size={},totalnocmt={}",nocmtList.size(),totalnocmt);
		
		List<Map<String, Object>> blockList=ownerReCommService.selectblockcmt(storeNo);
		int totalBlock=ownerReCommService.blockTotalRecord(storeNo);
		logger.info("차단 리뷰  리스트 blockList.size={},totalBlock={}",blockList.size(),totalBlock);
		
		model.addAttribute("blockList", blockList);
		
		model.addAttribute("totalnocmt", totalnocmt);
		model.addAttribute("nocmtList", nocmtList);
		
		model.addAttribute("allList", allList);
		
		model.addAttribute("totalBlock", totalBlock);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("searchVo", searchVo);
		
		return "owner/menu2/reviewOwner/reviewOwnerList";
	}
	
	@RequestMapping(value="/reviewOwnerWrite.do",method=RequestMethod.POST)
	public String reviewWrite(@ModelAttribute OwnerReviewCommentVO vo, HttpSession session,
			Model model) {
		int ownerNo = (Integer) session.getAttribute("ownerNo");
		int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
		logger.info("요청처리현황 보여주기 ownerNo={}",ownerNo);
		vo.setStoreNo(storeNo);
		logger.info("ownercomment page, vo={}",vo);
		int cnt=ownerReCommService.insertComm(vo);
		logger.info("코멘트 작성  결과, cnt={}", cnt);
		String msg="답변 작성에 실패하였습니다. 다시 시도해주세요.", url="/owner/menu2/reviewOwner/nocomment.do";
		if(cnt>0) {
			msg="답변이 정상적으로 등록되었습니다. ";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/reviewOwner.do",method=RequestMethod.POST)
	public String reviewWrite_write(@ModelAttribute OwnerReviewCommentVO vo, HttpSession session,
			Model model) {
		int ownerNo = (Integer) session.getAttribute("ownerNo");
		int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
		logger.info("요청처리현황 보여주기 ownerNo={}",ownerNo);
		vo.setStoreNo(storeNo);
		logger.info("ownercomment page, vo={}",vo);
		int cnt=ownerReCommService.insertComm(vo);
		logger.info("코멘트 작성  결과, cnt={}", cnt);
		String msg="답변 작성에 실패하였습니다. 다시 시도해주세요.", url="/owner/menu2/reviewOwner/reviewOwner.do";
		if(cnt>0) {
			msg="답변이 정상적으로 등록되었습니다. ";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping(value="/reviewOwnerDelete.do", method = RequestMethod.GET)
	public String delete_post(@RequestParam(defaultValue = "0") int reviewNo,
			Model model) {
		logger.info("글삭제 처리, 파라미터 reviewNo={}", reviewNo);

		int cnt=ownerReCommService.deleteComm(reviewNo);
		logger.info("글삭제 결과, cnt={}", cnt);
		String msg="답변 삭제에 실패하였습니다. 다시 시도해주세요. ", url="/owner/menu2/reviewOwner/reviewOwner.do";
		if(cnt>0) {
			msg="답변이 정상적으로 삭제되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@ResponseBody
	@RequestMapping(value="/edit.do", method=RequestMethod.GET)
	public OwnerReviewCommentVO edit_get(@RequestParam(defaultValue = "0") int reviewNo,
			Model model) {
		logger.info("수정화면, 파라미터 reviewNo={}", reviewNo);
		
		OwnerReviewCommentVO vo=ownerReCommService.selectByNo(reviewNo);
		logger.info("수정화면, 조회 결과 vo={}", vo);
		
		model.addAttribute("vo", vo);
		
		return vo;
	}
	
	
	@RequestMapping(value="/edit.do", method = RequestMethod.POST)
	public String edit_post(@ModelAttribute OwnerReviewCommentVO vo,
			Model model) {
		logger.info("글수정 처리, 파라미터 vo={}", vo);
		
		int cnt=ownerReCommService.updateComm(vo);
		logger.info("글수정 결과, cnt={}", cnt);
		
		String msg="리뷰 답변 수정하기를  실패하였습다. ", url="/owner/menu2/reviewOwner/reviewOwner.do";
		if(cnt>0) {
			msg="정상적으로 수정되었습니다.";
		}
	
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	// 차단 
	@RequestMapping("/blockcmt.do")
	public String blockList_get(HttpSession session, Model model) {
		String msg="로그인 해주세요.", url="/owner/index.do";
		int storeNo=0;
		if(session.getAttribute("ownerNo")==null) {
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "common/message";
			
		}else {
			storeNo=(Integer)session.getAttribute("storeNo");
		}
		logger.info("점포 - 리뷰관리 보여주기 storeNo={}",storeNo);
		
		List<Map<String, Object>> blockList=ownerReCommService.selectblockcmt(storeNo);
		int totalBlock=ownerReCommService.blockTotalRecord(storeNo);
		logger.info("차단 리뷰  리스트 blockList.size={},totalBlock={}",blockList.size(),totalBlock);
		
		
		List<Map<String, Object>> allList=ownerReCommService.selectAll(storeNo);
		logger.info("리뷰메인 리스트 allList.size={}",allList.size());
		
		
		int totalnocmt=ownerReCommService.NocmtTotalRecord(storeNo);
		List<Map<String, Object>> nocmtList=ownerReCommService.selectNocomment(storeNo);
		logger.info("차  리스트 nocmtList.size={},totalnocmt={}",nocmtList.size(),totalnocmt);
		
		model.addAttribute("allList", allList);
		
		model.addAttribute("totalnocmt", totalnocmt);
		model.addAttribute("nocmtList", nocmtList);
		
		model.addAttribute("totalBlock", totalBlock);
		model.addAttribute("blockList", blockList);
		return "owner/menu2/reviewOwner/blockcmt";
	}
	
	// 미답변 
		@RequestMapping("/nocomment.do")
		public String nocmtList_get(HttpSession session, Model model) {
			String msg="로그인 해주세요.", url="/owner/index.do";
			int storeNo=(Integer)session.getAttribute("storeNo");
		
			logger.info("점포 - 리뷰관리 보여주기 storeNo={}",storeNo);
			
			List<Map<String, Object>> nocmtList=ownerReCommService.selectNocomment(storeNo);
			int totalnocmt=ownerReCommService.NocmtTotalRecord(storeNo);
			logger.info("미답 리뷰  리스트 nocmtList.size={},totalnocmt={}",nocmtList.size(),totalnocmt);
			
			List<Map<String, Object>> allList=ownerReCommService.selectAll(storeNo);
			logger.info("리뷰메인 리스트 allList.size={}",allList.size());
			
			List<Map<String, Object>> blockList=ownerReCommService.selectblockcmt(storeNo);
			int totalBlock=ownerReCommService.blockTotalRecord(storeNo);
			logger.info("차단 리뷰  리스트 blockList.size={},totalBlock={}",blockList.size(),totalBlock);
			
			model.addAttribute("allList", allList);
			
			model.addAttribute("totalBlock", totalBlock);
			model.addAttribute("blockList", blockList);
			
			model.addAttribute("totalnocmt", totalnocmt);
			model.addAttribute("nocmtList", nocmtList);
			return "owner/menu2/reviewOwner/nocomment";
		}
		
		//별점 차트
		
		@ResponseBody
		@RequestMapping("/ratingstars.do")
		public Map<String, Object> avg_stars(HttpSession session,
				Model model) {
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			logger.info("stars rating chart ajax ownerNo={}",ownerNo);
			
			int storeNo = ownerStoresService.selectStoreNoByNo(ownerNo);
			logger.info("차트 , storeNo={}", storeNo);
			
			List<Map<String, Object>> starsList=ownerReCommService.reviewReting(storeNo);
			Map<String, Object> map = new HashedMap<String, Object>();
			
			map.put("starsList", starsList);
			logger.info("map={}" , map);
			return map;
		}
		
		@RequestMapping(value="/reviewOwnerSingo.do", method = RequestMethod.GET)
		public String reviewSingo(@RequestParam(defaultValue = "0") int reviewNo,
				Model model) {
			logger.info("reviewSingo 처리, 파라미터 reviewNo={}", reviewNo);

			int cnt=ownerReCommService.reviewSingo(reviewNo);
			logger.info("reviewSingo 결과, cnt={}", cnt);
			String msg="댓글 신고에 실패하였습니다. 다시 시도해주세요. ", url="/owner/menu2/reviewOwner/reviewOwner.do";
			if(cnt>0) {
				msg="댓글 신고가 정상적으로 되었습니다.";
			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
		
	/*
	// 미답변 
	@ResponseBody
	@RequestMapping("/nocomment.do")
	public List<Map<String, Object>> nocmtList_get(HttpSession session, Model model) {
		String msg="로그인 해주세요.", url="/owner/index.do";
		int storeNo=(Integer)session.getAttribute("storeNo");
	
		logger.info("점포 - 리뷰관리 보여주기 storeNo={}",storeNo);
		
		List<Map<String, Object>> nocmtList=ownerReCommService.selectNocomment(storeNo);
		int totalnocmt=ownerReCommService.NocmtTotalRecord(storeNo);
		logger.info("차단 리뷰  리스트 nocmtList.size={},totalnocmt={}",nocmtList.size(),totalnocmt);
		
		model.addAttribute("totalnocmt", totalnocmt);
		model.addAttribute("nocmtList", nocmtList);
		return nocmtList;
	}
	

	@ResponseBody
	@RequestMapping(value="/reviewOwnerWrite.do",method=RequestMethod.POST)
	public OwnerReviewCommentVO reviewWrite(@ModelAttribute OwnerReviewCommentVO vo,
			Model model) {
	
		logger.info("ownercomment ajax page, vo={}",vo);
		
		logger.info("ownercomment ajax page, parameter={}",vo.getrCommentContent());
		
		int cnt=ownerReCommService.insertComm(vo); //regdate null나오는데 해결해주세욥 
	
		logger.info("댓글달기 결과 : cnt={}",cnt);
		if(cnt>0) {
			logger.info("댯글 등록 성공");
		}
		
		//vo=ownerReCommService.selectByNo(vo.getReviewNo());
		model.addAttribute("vo", vo);
		return vo;
	}
	 * */
}
