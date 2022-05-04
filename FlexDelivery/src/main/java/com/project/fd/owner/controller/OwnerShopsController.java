package com.project.fd.owner.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.common.FileUploadUtil;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;
import com.project.fd.owner.store.model.OwnerStoresService;
import com.project.fd.owner.store.model.OwnerStoresVO;

@Controller
@RequestMapping("/owner")
public class OwnerShopsController {
	
	@Autowired
	private static final Logger logger 
	= LoggerFactory.getLogger(OwnerShopsController.class);
		
	@Autowired private FileUploadUtil fileUtil;

	@Autowired private OwnerStoresService ownerStoreService;

	@RequestMapping(value="/menu2/basic/basic.do", method=RequestMethod.GET)
	public void ownerbasic(HttpSession session, Model model) {
		
		int ownerNo = (Integer) session.getAttribute("ownerNo");
		logger.info("내 점포 - 기본정보 보여주기 매개변수 ownerNo = {}", ownerNo);
		
		OwnerStoresVO vo = ownerStoreService.selectBasic(ownerNo);
		logger.info("점주 번호로 조회한 가게 결과조회 basic={}",vo);
				
		model.addAttribute("vo", vo);
	}
	

@RequestMapping("/updateContent.do")
public String updateContent(  @RequestParam(defaultValue = "0") int storeNo, 
		@RequestParam(defaultValue = "0") String storeContent, Model model){
		logger.info("소개 업데이트 storeContent={}, storeNO={}", storeContent,storeNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("storeNo", storeNo);
		map.put("storeContent", storeContent);
		
		int cnt = ownerStoreService.updateContent(map);
		logger.info("업데이트 결과 cnt={}", cnt);
				
		String msg="글 수정 실패", url="/owner/menu2/basic/basic.do";
		if(cnt>0) { msg="글수정되었습니다.";
		url="/owner/menu2/basic/basic.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
//파일 업로드 처리
@RequestMapping(value="/menu2/basic/basic.do", method=RequestMethod.POST)
public String logoRegister(@ModelAttribute OwnerStoresVO ownerStoresVo,
		 HttpServletRequest request, HttpSession session,
		 Model model) { 
	int ownerNo=(Integer)session.getAttribute("ownerNo");
	int storeNo=(Integer)session.getAttribute("storeNo");
	String originName="", fileName="";
	long fileSize=0;
	try {
		List<Map<String, Object>> fileList
		=fileUtil.fileUplaod(request, FileUploadUtil.STORES_TYPE);
		for(Map<String, Object> fileMap : fileList) {
			originName=(String) fileMap.get("originalFileName");
			fileName=(String) fileMap.get("fileName");//
			fileSize=(Long)fileMap.get("fileSize");				
		}//for
		
	} catch (IllegalStateException e) {
		logger.info("파일 업로드 실패!");
		e.printStackTrace();
	} catch (IOException e) {
		logger.info("파일 업로드 실패!");
		e.printStackTrace();
	}
	ownerStoresVo.setStoreNo(storeNo);
	ownerStoresVo.setStoreLogo(fileName);
	
	logger.info("Logo업로드 처리 후 vo={}",ownerStoresVo);
	
	int cnt = ownerStoreService.updateLogo(ownerStoresVo);
	logger.info("Logo업로드 업데이트 결과 cnt={}", cnt);
	
	String msg="Logo 수정 실패", url="/owner/menu2/basic/basic.do";
	if(cnt>0) { msg="Logo가 수정되었습니다.";
	url="/owner/menu2/basic/basic.do";
	}
	
	model.addAttribute("msg", msg);
	model.addAttribute("url", url);
	
	return "common/message";
 	}	
}


