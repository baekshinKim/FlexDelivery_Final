package com.project.fd.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.project.fd.admin.board.model.AdminBoardAllVO;
import com.project.fd.admin.board.model.AdminBoardService;
import com.project.fd.admin.board.model.AdminBoardVO;
import com.project.fd.common.FileUploadUtil;

@Controller
@RequestMapping("/admin/menu3")
public class AdminBoardController {
	
	private Logger logger=LoggerFactory.getLogger(AdminBoardController.class);
	
	@Autowired
	private AdminBoardService boardService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	@RequestMapping(value="/notice.do", method = RequestMethod.GET)
	public String notice_list_get(Model model) {
		logger.info("공지사항 list_get, 리스트 화면 보여주기");
		
		List<AdminBoardAllVO> list=boardService.selectNotice();
		logger.info("list 출력, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/menu3/notice";
	}
	
	//회원or점포가 공지사항 버튼 눌렀을 때 bh="공지사항", authroityNo 전송
	@RequestMapping(value="/noticeMember.do", method = RequestMethod.GET)
	public String noticeMember_list_get(@RequestParam String bh, 
			@RequestParam(defaultValue = "1") int an, Model model) {
		logger.info("멤버용 공지사항 목록창, bh={}, an={}", bh, an);
	
		
		if (bh.isEmpty() || bh==null || an==0) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			model.addAttribute("url", "/admin/menu3/noticeMember.do");
			return "common/message";			
		}
		
		Map<String, Object> map=new HashedMap<String, Object>();
		map.put("boardHead", bh);
		map.put("authorityNo", an);
		
		//Map<String, Object> result=new HashedMap<String, Object>();
		//result=boardService.selectAllForRn(map);
		List<Map<String, Object>> list=boardService.selectAllForRn(map);
		
		logger.info("list 사이즈, list.size={}",	list.size());
		//logger.info("list={}", list);
		model.addAttribute("list", list);
		
		return "admin/menu3/noticeMember";
	}
	
	@RequestMapping(value="/event.do", method = RequestMethod.GET)
	public String event_list_get(Model model) {
		logger.info("이벤트 list_get, 리스트 화면 보여주기");
		
		List<AdminBoardAllVO> list=boardService.selectEvent();
		logger.info("list 출력, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/menu3/event";
	}
	
	/*public String prev_detail(@RequestParam int curNo, @RequestParam String head) {
		logger.info("curNo={}, head={}", curNo, head);
		
		Map<String, Object> map=new HashedMap<String, Object>();
		map.put("curNo", curNo);
		map.put("head", head);
		
		//int cnt=boardService.select
		String str="";
		
		return str;
		///notice/detail.do
	}*/
	
	@RequestMapping(value="/notice/write.do", method = RequestMethod.GET)
	public String notice_write_get(Model model) {
		logger.info("공지사항 write_get, 글쓰기 보여주기");
		
		return "admin/menu3/notice/write";
	}
	
	@RequestMapping(value="/event/write.do", method = RequestMethod.GET)
	public String event_write_get(Model model) {
		logger.info("이벤트 write_get, 글쓰기 보여주기");
		
		return "admin/menu3/event/write";
	}
	
	@RequestMapping(value="/event/write.do", method = RequestMethod.POST)
	public String event_write_post(@ModelAttribute AdminBoardVO boardVo,
			HttpServletRequest request) {
		logger.info("write_post 이벤트 등록 처리, 파라미터 vo={}", boardVo);
	
		//파일 업로드 처리
		String originName="", fileName="";
		long fileSize=0;

		try {
			List<Map<String, Object>> fileList
			=fileUtil.fileUplaod(request, FileUploadUtil.NOTICE_EVENT_TYPE);
			for(Map<String, Object> fileMap : fileList) {
				originName=(String) fileMap.get("originalFileName");
				fileName=(String) fileMap.get("fileName");
				fileSize=(Long)fileMap.get("fileSize");	
			}//for
		} catch (IllegalStateException e) {
			logger.info("파일 업로드 실패!");
			e.printStackTrace();
		} catch (IOException e) {
			logger.info("파일 업로드 실패!");
			e.printStackTrace();
		}
		
		//2
		boardVo.setBoardThumbnail(fileName);
		logger.info("파일 이름 확인, fileName={}", fileName);
		
		int cnt=boardService.insertBoard(boardVo);
		logger.info("파일 업로드 처리 결과, cnt={}", cnt);
		
		return "redirect:/admin/menu3/event.do";
	}
	
	@RequestMapping(value="/notice/write.do", method = RequestMethod.POST)
	public String notice_write_post(@ModelAttribute AdminBoardVO boardVo,
			HttpServletRequest request) {
		logger.info("write_post 공지사항 등록 처리, 파라미터 vo={}", boardVo);
		
		
		//2
		//boardVo.setBoardThumbnail(fileName);
		//logger.info("파일 이름 확인, fileName={}", fileName);
		
		int cnt=boardService.insertBoard(boardVo);
		logger.info("파일 업로드 처리 결과, cnt={}", cnt);
		
		return "redirect:/admin/menu3/notice.do";
	}
	
	@RequestMapping("/event/detail.do")
	public String event_detail(@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("event detail 상세보기 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu3/event.do");
			
			return "common/message";
		}
		
		//2
		AdminBoardAllVO boardAllVo=boardService.selectByNo2(no);
		//=boardService.selectByNo2(no);
		logger.info("상세보기 결과,vo={}", boardAllVo);
		
		//3
		model.addAttribute("vo", boardAllVo);
		
		//4
		return "admin/menu3/event/detail";
	}
	
	@RequestMapping("/notice/detailMember.do")
	public String noticeMember_detail(@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("회원용 공지사항 상세보기 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu3/noticeMember.do");
			
			return "common/message";
		}
		
		//2
		AdminBoardAllVO boardAllVo=boardService.selectByNo2(no);
		logger.info("상세보기 결과,vo={}", boardAllVo);
		
		
		Map<String, Object> map=new HashedMap<String, Object>();
		map.put("boardHead", boardAllVo.getBoardHead());
		map.put("authorityNo", boardAllVo.getAuthorityNo());
		map.put("boardNo", boardAllVo.getBoardNo());
		int rn=boardService.selectRn(map);
		
		//3
		model.addAttribute("vo", boardAllVo);
		model.addAttribute("rn", rn);
		
		//4
		return "admin/menu3/notice/detailMember";
	}
	
	@RequestMapping("/notice/detail.do")
	public String notice_detail(@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("notice detail 상세보기 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu3/notice.do");
			
			return "common/message";
		}
		
		//2
		AdminBoardAllVO boardAllVo=boardService.selectByNo2(no);
		logger.info("상세보기 결과,vo={}", boardAllVo);
		
		//3
		model.addAttribute("vo", boardAllVo);
		
		//4
		return "admin/menu3/notice/detail";
	}
	
	@RequestMapping(value="/event/delete.do", method=RequestMethod.POST)
	public String event_delete_post(@RequestParam String oldFileName, HttpServletRequest request,
			@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("event delete_post 이벤트 삭제처리, 파라미터 no={} oldFileName={}", no, oldFileName);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu3/event.do");
			return "common/message";
		}

		//2
		String msg="이벤트 삭제 실패", url="/admin/menu3/event.do";
		/*
		if (largeCategoryVo.getlCategoryFilename()==null) {
			largeCategoryVo.setlCategoryFilename(oldFileName);
		}
		*/
		
		//Map<String, String> map = new HashMap<String, String>();
		//map.put("no", largeCategoryVo.getlCategoryNo()+"");
				
		boardService.deleteBoard(no);
		logger.info("이벤트 삭제!");	
		
		msg="이벤트 게시글이 삭제되었습니다.";

		//기존 파일이 존재하면 기존 파일 삭제
		String upPath 
		= fileUtil.getUploadPath(FileUploadUtil.NOTICE_EVENT_TYPE, request);
		File oldFile = new File(upPath, oldFileName);
		if(oldFile.exists()) {
			boolean bool=oldFile.delete();
			logger.info("기존 파일 삭제 여부 :{}", bool);
		}			
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}
	
	
	@RequestMapping(value="/notice/delete.do", method=RequestMethod.POST)
	public String notice_delete_post(HttpServletRequest request,
			@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("notice delete_post 공지사항 삭제처리, 파라미터 no={}", no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu3/notice.do");
			return "common/message";
		}
		
		//2
		String msg="공지사항 삭제 실패", url="/admin/menu3/notice.do";
		
		//Map<String, String> map = new HashMap<String, String>();
		//map.put("no", largeCategoryVo.getlCategoryNo()+"");
		
		boardService.deleteBoard(no);
		logger.info("공지사항 삭제!");	
		
		msg="공지사항 게시글이 삭제되었습니다.";
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping(value="/event/edit.do", method = RequestMethod.GET)
	public String event_edit_get(@RequestParam(defaultValue = "0") int no, Model model) {
		logger.info("이벤트 글 수정하기 화면, 파라미터 no={}", no);
			
		//1
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu3/event.do");
			return "common/message";
		}
		
		//2
		AdminBoardVO boardVo=boardService.selectByNo(no);
		logger.info("수정화면, 조회 결과 vo={}", boardVo);
		
		//3
		model.addAttribute("vo", boardVo);
		
		//4
		return "admin/menu3/event/edit";
	}

	@RequestMapping(value="/notice/edit.do", method = RequestMethod.GET)
	public String notice_edit_get(@RequestParam(defaultValue = "0") int no, Model model) {
		logger.info("공지사항 수정하기 화면, 파라미터 no={}", no);
		
		//1
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu3/notice.do");
			return "common/message";
		}
		
		//2
		AdminBoardVO boardVo=boardService.selectByNo(no);
		logger.info("수정화면, 조회 결과 vo={}", boardVo);
		
		//3
		model.addAttribute("vo", boardVo);
		
		//4
		return "admin/menu3/notice/edit";
	}
	
	@RequestMapping(value="/event/edit.do", method = RequestMethod.POST)
	public String event_edit_post(@ModelAttribute AdminBoardVO boardVo,
			@RequestParam String oldFileName, HttpServletRequest request,
			Model model) {
		//1
		logger.info("edit_post 글수정 처리, 파라미터 vo={}, oldFileName={}", boardVo, oldFileName);

		//업로드 처리
		String fileName="", originName="";
		long fileSize=0;
		int len=0;
		
					
		try {
			List<Map<String, Object>> fileList
			=fileUtil.fileUplaod(request, FileUploadUtil.NOTICE_EVENT_TYPE);
			len=fileList.size();
			logger.info("fileList.size={}"+fileList.size());
			if (len==1) {
				logger.info("새로운 첨부파일 있음!");
				for(Map<String, Object> map : fileList) {
					originName=(String) map.get("originalFileName");
					fileName=(String) map.get("fileName");
					fileSize=(Long) map.get("fileSize");				
				}//for
			} else {
				logger.info("기존 파일 계속 사용!"+oldFileName);
				fileName=oldFileName;
			}

			logger.info("파일 업로드 성공");
		} catch (IllegalStateException e) {
			logger.info("파일 업로드 실패");
			e.printStackTrace();
		} catch (IOException e) {
			logger.info("파일 업로드 실패");
			e.printStackTrace();
		}	
		//2
		boardVo.setBoardThumbnail(fileName);
		
		String msg="글 수정 실패", url="/admin/menu3/event.do";
		int cnt=boardService.updateBoard(boardVo);
		logger.info("글수정 결과, cnt={}", cnt);	

		if(cnt>0) {
			msg="이벤트 게시글을 수정하였습니다.";

			//새로 업로드한 경우, 기존 파일이 존재하면 기존 파일 삭제
			if(fileName!=null && !fileName.isEmpty()&&len==1) {
				String upPath 
				= fileUtil.getUploadPath(FileUploadUtil.NOTICE_EVENT_TYPE, request);
				File oldFile = new File(upPath, oldFileName);
				if(oldFile.exists()) {
					boolean bool=oldFile.delete();
					logger.info("기존 파일 삭제 여부 :{}", bool);
				}					
				logger.info("이벤트 - 이미지가 수정되었습니다.");
				url="/admin/menu3/event.do";
			}
		}//if

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping(value="/notice/edit.do", method = RequestMethod.POST)
	public String notice_edit_post(@ModelAttribute AdminBoardVO boardVo,
			HttpServletRequest request, Model model) {
		//1
		logger.info("edit_post 글수정 처리, 파라미터 vo={}", boardVo);

		String msg="글 수정 실패", url="/admin/menu3/notice.do";
		int cnt=boardService.updateBoard(boardVo);
		logger.info("글수정 결과, cnt={}", cnt);	
		
		if(cnt>0) {
			msg="공지사항 게시글을 수정하였습니다.";
			url="/admin/menu3/notice.do";
		}//if
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}

}
