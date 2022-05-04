package com.project.fd.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.admin.hoenytip.AdminHoneytipService;
import com.project.fd.admin.hoenytip.AdminHoneytipVO;
import com.project.fd.common.FileUploadUtil;

@Controller
@RequestMapping("/admin/menu3")
public class AdminHoneytipController {
	
	private Logger logger=LoggerFactory.getLogger(AdminBoardController.class);
	
	@Autowired
	private AdminHoneytipService honeytipService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	@RequestMapping(value="/honeytip.do", method = RequestMethod.GET)
	public String list_get(Model model) {
		logger.info("사장님꿀팁 list_get, 리스트 화면 보여주기");
		
		List<AdminHoneytipVO> list=honeytipService.selectAll();
		logger.info("list 출력, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/menu3/honeytip";
	}
	
	@RequestMapping(value="/honeytip/write.do", method = RequestMethod.GET)
	public String write_get() {
		logger.info("사장님꿀팁 글쓰기 화면");
			
		return "admin/menu3/honeytip/write";
	}

	@RequestMapping(value="/honeytip/write.do", method = RequestMethod.POST)
	public String write_post(@ModelAttribute AdminHoneytipVO honeytipVo,
			HttpServletRequest request) {
		logger.info("write_post 사장님꿀팁 등록 처리, 파라미터 vo={}", honeytipVo);
	
		//파일 업로드 처리
		String originName="", fileName="";
		long fileSize=0;

		/*if (honeytipVo.getHoneytipThumbnail()==null) {
			fileName="honeytipDefulat.jpg";
		}*/
		
		try {
			List<Map<String, Object>> fileList
			=fileUtil.fileUplaod(request, FileUploadUtil.HONEYTIP_TYPE);
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
		honeytipVo.setHoneytipThumbnail(fileName);
		logger.info("파일 이름 확인, fileName={}", fileName);
		
		int cnt=honeytipService.insertHoneytip(honeytipVo);
		logger.info("파일 업로드 처리 결과, cnt={}", cnt);
		
		
		return "redirect:/admin/menu3/honeytip.do";
	}
	
	//모달에서 서브밋 하면 폼 정보 가지고 온다~
	/*
	@RequestMapping(value="/largeCategory.do", method=RequestMethod.POST)
	
	public String list_post(@ModelAttribute AdminLargeCategoryVO largeCategoryVo,
			HttpServletRequest request) {
		//1. 
		logger.info("list_post 대분류 카테고리 등록 처리, 파라미터  vo={}", largeCategoryVo);
		
		//파일 업로드 처리
		String originName="", fileName="";
		long fileSize=0;
		
		try {
			List<Map<String, Object>> fileList
			=fileUtil.fileUplaod(request, FileUploadUtil.LCATEGORY_TYPE);
			for(Map<String, Object> fileMap : fileList) {
				logger.info("debug={}", fileMap.get("originalFileName"));
				logger.info("debug={}", fileMap.get("fileName"));
				logger.info("debug={}", fileMap.get("fileSize"));
				originName=(String) fileMap.get("originalFileName");
				fileName=(String) fileMap.get("fileName");
				fileSize=(Long) fileMap.get("fileSize");	
				
			}//for
		} catch (IllegalStateException e) {
			logger.info("파일 업로드 실패!");
			e.printStackTrace();
		} catch (IOException e) {
			logger.info("파일 업로드 실패!");
			e.printStackTrace();
		}
		
		//2
		largeCategoryVo.setlCategoryFilename(fileName);
		int cnt=largeCategoryService.insertLargeCategory(largeCategoryVo);
		logger.info("파일 업로드 처리 결과, cnt={}", cnt);
		
		//3
		return "redirect:/admin/menu6/largeCategory.do";
	}
	*/

	@RequestMapping("/honeytip/detail.do")
	public String detail(@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("detail 상세보기 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu3/honeytip.do");
			
			return "common/message";
		}
		
		//2
		AdminHoneytipVO honeytipVo=honeytipService.selectByNo(no);
		logger.info("상세보기 결과,vo={}", honeytipVo);
		
		//3
		model.addAttribute("vo", honeytipVo);
		
		//4
		return "admin/menu3/honeytip/detail";
	}

	@RequestMapping(value="/honeytip/edit.do", method = RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue = "0") int no, Model model) {
		logger.info("사장님꿀팁 글 수정하기 화면, 파라미터 no={}", no);
			
		//1
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu3/honeytip.do");
			return "common/message";
		}
		
		//2
		AdminHoneytipVO honeytipVo=honeytipService.selectByNo(no);
		logger.info("수정화면, 조회 결과 vo={}", honeytipVo);
		
		//3
		model.addAttribute("vo", honeytipVo);
		
		//4
		return "admin/menu3/honeytip/edit";
	}

	
	@RequestMapping(value="/honeytip/edit.do", method = RequestMethod.POST)
	public String edit_post(@ModelAttribute AdminHoneytipVO honeytipVo,
			@RequestParam String oldFileName, HttpServletRequest request,
			Model model) {
		//1
		logger.info("edit_post 글수정 처리, 파라미터 vo={}, oldFileName={}", honeytipVo, oldFileName);

		//업로드 처리
		String fileName="", originName="";
		long fileSize=0;
		int len=0;
					
		try {
			List<Map<String, Object>> fileList
			=fileUtil.fileUplaod(request, FileUploadUtil.HONEYTIP_TYPE);
			len=fileList.size();
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
		honeytipVo.setHoneytipThumbnail(fileName);
	
		
		String msg="글 수정 실패", url="/admin/menu3/honeytip.do";
		int cnt=honeytipService.updateHoneytip(honeytipVo);
		logger.info("글수정 결과, cnt={}", cnt);	

		if(cnt>0) {
			msg="사장님꿀팁 게시글을 수정하였습니다.";

			//새로 업로드한 경우, 기존 파일이 존재하면 기존 파일 삭제
			if(fileName!=null && !fileName.isEmpty()&&len==1) {
				String upPath 
				= fileUtil.getUploadPath(FileUploadUtil.HONEYTIP_TYPE, request);
				File oldFile = new File(upPath, oldFileName);
				if(oldFile.exists()) {
					boolean bool=oldFile.delete();
					logger.info("기존 파일 삭제 여부 :{}", bool);
				}					
				logger.info("사장님꿀팁 - 이미지가 수정되었습니다.");
				url="/admin/menu3/honeytip.do";
			}
		}//if

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}

	@RequestMapping(value="/honeytip/delete.do", method=RequestMethod.POST)
	public String delete_post(@ModelAttribute AdminHoneytipVO honeytipVo,
			@RequestParam String oldFileName, HttpServletRequest request,
			@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("delete_post 사장님꿀팁 삭제처리, 파라미터 vo={} oldFileName={}", honeytipVo, oldFileName);
		logger.info("no={}", no);
		
		if(honeytipVo==null || no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu3/honeytip.do");
			return "common/message";
		}

		//2
		String msg="사장님꿀팁 삭제 실패", url="/admin/menu3/honeytip.do";
		/*
		if (largeCategoryVo.getlCategoryFilename()==null) {
			largeCategoryVo.setlCategoryFilename(oldFileName);
		}
		*/
		
		//Map<String, String> map = new HashMap<String, String>();
		//map.put("no", largeCategoryVo.getlCategoryNo()+"");
					
		honeytipService.deleteHoneytip(honeytipVo);
		logger.info("사장님꿀팁 삭제!");	
		
		msg="사장님꿀팁 게시글이 삭제되었습니다.";

		//기존 파일이 존재하면 기존 파일 삭제
		String upPath 
		= fileUtil.getUploadPath(FileUploadUtil.HONEYTIP_TYPE, request);
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
	

}
