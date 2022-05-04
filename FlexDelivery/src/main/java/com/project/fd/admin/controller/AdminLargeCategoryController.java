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
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.admin.largecategory.model.AdminLargeCategoryService;
import com.project.fd.admin.largecategory.model.AdminLargeCategoryVO;
import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryViewVO;
import com.project.fd.common.FileUploadUtil;

@Controller
@RequestMapping("/admin/menu6")
public class AdminLargeCategoryController {
	private static final Logger logger
		=LoggerFactory.getLogger(AdminLargeCategoryController.class);
	
	@Autowired
	private AdminLargeCategoryService largeCategoryService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	@RequestMapping("/lCategory/ajaxCheck.do")
	@ResponseBody
	public boolean ajax_check(@RequestParam String lCategoryName) {
		logger.info("이름 중복확인, lCategoryName={}", lCategoryName);
		
		boolean isExist=false;
		if(lCategoryName!=null && !lCategoryName.isEmpty()) {
			isExist=largeCategoryService.checkDu(lCategoryName);
			logger.debug("이름 중복확인 결과, isExist={}", isExist);
		}
		return isExist;
		
	}
	
	@RequestMapping(value="/largecategory/write.do", method=RequestMethod.GET)
	public String write_get() {
		logger.info("대분류 카테고리 등록 페이지 보여주기");
		
		return "admin/menu6/largecategory/write";
	}
	
	@RequestMapping(value="/largecategory/write.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute AdminLargeCategoryVO largecategoryVo,
			HttpServletRequest request) {
		//1. 
		logger.info("대분류 카테고리 등록 처리, 파라미터  vo={}", largecategoryVo);
		
		//파일 업로드 처리
		String originName="", fileName="test";
		long fileSize=0;
		
		try {
			List<Map<String, Object>> fileList
				=fileUtil.fileUplaod(request, FileUploadUtil.LCATEGORY_TYPE);
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
		
		if (fileName.isEmpty()) {
			fileName="noImageDefault.png";
		}
		
		//2
		largecategoryVo.setlCategoryFilename(fileName);
		logger.info("파일 이름 확인, fileName={}", fileName);
		
		int cnt=largeCategoryService.insertLargeCategory(largecategoryVo);
		logger.info("파일 업로드 처리 결과, cnt={}", cnt);
		
		//3
		return "admin/menu6/largeCategory.do";
	}
	
	//모달에서 서브밋 하면 폼 정보 가지고 온다~
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
	
	@RequestMapping(value="/largeCategory.do", method=RequestMethod.GET)
	public String list_get(/*@ModelAttribute SearchVO searchVo,*/ Model model) {
		//1.
		//logger.info("대분류 카테고리 목록 페이지, 파라미터 searchVo={}", searchVo);
		logger.info("list_get 대분류 카테고리 목록 페이지");
		
		//2.
		//페이징 처리 관련 세팅
		//[1] PaginationInfo 생성
		/*PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo 세팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());*/
		
		List<AdminMediumCategoryViewVO> list=largeCategoryService.selectAll2();
		logger.info("글목록 결과, list.size={}", list.size());
		
		//int totalRecord=largeCategoryService.selectTotalRecord(searchVo);
		//logger.info("글 개수, totalRecord={}", totalRecord);
		
		//3. 모델에 결과 저장
		model.addAttribute("list", list);
		//model.addAttribute("pagingInfo", pagingInfo);
		
		//4. 뷰페이지 리턴
		return "/admin/menu6/largeCategory";
	}
	
	@RequestMapping(value="/largecategory/edit.do", method=RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue = "0") int no,
			HttpServletRequest request,	Model model) {
		//1
		logger.info("edit_get 수정화면, 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu6/largecategory/list.do");
			return "common/message";
		}

		//2
		AdminLargeCategoryVO vo=largeCategoryService.selectByNo(no);
		logger.info("수정화면, 조회 결과 vo={}", vo);

	
		//3
		model.addAttribute("vo", vo);
		//model.addAttribute("fileInfo", fileInfo);

		//4
		return "/admin/menu6/largecategory/edit";
	}

	@RequestMapping(value="/largeCategory/edit.do", method = RequestMethod.POST)
	public String edit_post(@ModelAttribute AdminLargeCategoryVO largecategoryVo,
			@RequestParam String oldFileName, HttpServletRequest request,
			Model model) {
		//1
		logger.info("edit_post 글수정 처리, 파라미터 vo={}, oldFileName={}", largecategoryVo, oldFileName);

		//업로드 처리
		String fileName="", originName="";
		long fileSize=0;
		int len=0;
		
		try {
			List<Map<String, Object>> fileList
			=fileUtil.fileUplaod(request, FileUploadUtil.LCATEGORY_TYPE);
			len=fileList.size();
			logger.info("fileList.size={}"+fileList.size());
			if (len==1) {
				logger.info("새로운 첨부파일 있음!");
				for(Map<String, Object> map : fileList) {
					originName=(String) map.get("originalFileName");
					fileName=(String) map.get("fileName");
					fileSize=(Long) map.get("fileSize");				
				}
				
			}else {
				logger.info("기존파일 계속 사용!"+oldFileName);
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
		largecategoryVo.setlCategoryFilename(fileName);

		String msg="글 수정 실패", url="/admin/menu6/largeCategory.do";
		int cnt=largeCategoryService.updateLargeCategory(largecategoryVo);
		logger.info("글수정 결과, cnt={}", cnt);	

		if(cnt>0) {
			msg="대분류 카테고리를 수정하였습니다.";

			//새로 업로드한 경우, 기존 파일이 존재하면 기존 파일 삭제
			if(fileName!=null && !fileName.isEmpty() && len==1) {
				String upPath 
				= fileUtil.getUploadPath(FileUploadUtil.LCATEGORY_TYPE, request);
				File oldFile = new File(upPath, oldFileName);
				if(oldFile.exists()) {
					boolean bool=oldFile.delete();
					logger.info("기존 파일 삭제 여부 :{}", bool);
				}					
				msg="대분류 카테고리 - 이미지가 수정되었습니다.";
				url="/admin/menu6/largeCategory.do";
			}
		}//if

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}

	@RequestMapping(value="/largeCategory/delete.do", method=RequestMethod.POST)
	public String delete_post(@ModelAttribute AdminLargeCategoryVO largeCategoryVo,
			@RequestParam String oldFileName, HttpServletRequest request,
			Model model) {
		//1
		logger.info("delete_post 대분류 카테고리 삭제처리, 파라미터 vo={}, oldFileName={}", largeCategoryVo, oldFileName);
		
		if(largeCategoryVo==null) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menu6/largeCategory.do");
			return "common/message";
		}

		//2
		String msg="대분류 삭제 실패", url="/admin/menu6/largeCategory.do";
		/*
		if (largeCategoryVo.getlCategoryFilename()==null) {
			largeCategoryVo.setlCategoryFilename(oldFileName);
		}
		*/
		
		//Map<String, String> map = new HashMap<String, String>();
		//map.put("no", largeCategoryVo.getlCategoryNo()+"");
					
		largeCategoryService.deleteLargeCategory(largeCategoryVo);
		logger.info("대분류 카테고리 삭제!");	
		
		msg="대분류 카테고리가 삭제되었습니다.";

		
		//기존 파일이 존재하면 기존 파일 삭제
		String upPath 
		= fileUtil.getUploadPath(FileUploadUtil.LCATEGORY_TYPE, request);
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
