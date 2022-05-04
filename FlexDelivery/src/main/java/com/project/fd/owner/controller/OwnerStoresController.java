package com.project.fd.owner.controller;

import java.io.IOException;
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

import com.project.fd.admin.largecategory.model.AdminLargeCategoryService;
import com.project.fd.admin.largecategory.model.AdminLargeCategoryVO;
import com.project.fd.common.FileUploadUtil;
import com.project.fd.owner.board.model.OwnerBoardService;
import com.project.fd.owner.common.LocationVO;
import com.project.fd.owner.model.OwnerService;
import com.project.fd.owner.ownerregister.model.OwnerRegisterService;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;
import com.project.fd.owner.store.model.OwnerStoresService;
import com.project.fd.owner.store.model.OwnerStoresVO;

@Controller
@RequestMapping("/owner/menu1")
public class OwnerStoresController {
	private static final Logger logger
	=LoggerFactory.getLogger(OwnerStoresController.class);
	
	@Autowired OwnerStoresService ownerStoresService;
	
	@Autowired OwnerRegisterService ownerRegisterService;
	
	@Autowired private FileUploadUtil fileUtil;
	
	@Autowired private AdminLargeCategoryService adminlarge;

	 @RequestMapping(value="/launch/launch.do", method=RequestMethod.GET)
	 public String ownerlaunch(Model model,HttpSession session) {
		 String msg="	로그인 먼저 부탁드려요. ", url="/owner/login/login.do";
		 int ownerNo=0;
			if(session.getAttribute("ownerNo")==null) {
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
				return "common/message";
				
			}else {
				ownerNo=(Integer)session.getAttribute("ownerNo");
			}
			
		logger.info("입점신청 세션의 ownerNo={}",ownerNo);
				
		
		 logger.info("점포 - 입점 메인 화면 보여주기 ownerNo={}",ownerNo);
		 
		 // 지역코드번호
		List<LocationVO> location=ownerStoresService.AllLocaion();
				 
		// 대분류 카테고리 
		List<AdminLargeCategoryVO> large=adminlarge.selectAll();
		 logger.info("result large.size={}",large.size());
		 
		int stck= ownerStoresService.dupckstores(ownerNo);
		int regick=ownerStoresService.dupckregi(ownerNo);
		
		// 점포 레지넘버 유무 
		int stresult=OwnerStoresService.NO_STORE, regiresult=OwnerStoresService.NO_LICENSE;
		if(stck>0) {
			stresult=OwnerStoresService.STORE_STAY;
		}
		
		if(regick>0) {
			regiresult=OwnerStoresService.LICENSE_STAY;
		}
		logger.info("regiresult={},stresult={}",regiresult,stresult);
		
		model.addAttribute("regiresult", regiresult);
		model.addAttribute("stresult", stresult);
		model.addAttribute("location", location);
		model.addAttribute("large", large);
				
		return "owner/menu1/launch/launch";
		 
	}
	 
	 //입점신청 
	 @RequestMapping(value="/launch/launch.do", method=RequestMethod.POST)
	 public String register_post(@ModelAttribute OwnerStoresVO ownerStoresVo,
			 HttpServletRequest request, HttpSession session,
			 Model model) { 
		int ownerNo=(Integer)session.getAttribute("ownerNo");
		OwnerRegisterVO vo=ownerRegisterService.selectRegisterByOwnerNo(ownerNo);
		long oRegisterNo=vo.getoRegisterNo();
		logger.info("입점신청 세션의 ownerNo={},oRegisterNo={}",ownerNo,oRegisterNo);
		
		ownerStoresVo.setoRegisterNo(oRegisterNo);
		ownerStoresVo.setOwnerNo(ownerNo);
		ownerStoresVo.setoRegisterNo(oRegisterNo);
		logger.info("점포 - 입점하기 업로드 전  OwnerStoresVO={}",ownerStoresVo);
			//파일 업로드 처리
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

			ownerStoresVo.setStoreLogo(originName);
			ownerStoresVo.setStoreLogo(fileName);
			logger.info("점포 - 입점하기 업로드 후  OwnerStoresVO={}",ownerStoresVo);
			
			int cnt=ownerStoresService.insertOwnerStores(ownerStoresVo);
			logger.info("점포 입점 신청  처리 결과, cnt={},originName={}", cnt,originName);
			
			String msg="점포 입점 신청 실패 !", url="/owner/menu1/launch/launch.do";
			if(cnt>0) {
				msg="점포 입점 신청이 완료되었습니다. 승인 처리 진행은 최대 3일 경과 됩니다.";
				url="/owner/menu1/launch/launch.do";
				//return "owner/menu1/launch/launch";
			}

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
	 
/**
 *  
 *   @RequestMapping("/launch/launchRegister.do")
	 public void register_get(Model model) { //requestparam=>사업자등록했는지
		 logger.info("점포 - 입점 시작하기 보여주기");
		
	 }
	@RequestMapping("/launch/launchNext.do")
	 public String ownerlaunchNext(Model model) {
		
		model.addAttribute("NO_LICENSE", OwnerService.NO_LICENSE);
		model.addAttribute("NO_STORE", OwnerService.NO_STORE);
		model.addAttribute("HAVE_ALL", OwnerService.HAVE_ALL);
		model.addAttribute("LICENSE_STAY", OwnerService.LICENSE_STAY);
		model.addAttribute("STORE_STAY", OwnerService.STORE_STAY);
		model.addAttribute("NOTICE", OwnerBoardService.BOARD_NOTICE);
		model.addAttribute("EVENT", OwnerBoardService.BOARD_EVENT);
		
		 logger.info("점포 - 입점 약관 보여주기");
		 // 지역코드번호
		List<LocationVO> location=ownerStoresService.AllLocaion();
			 
		 // 대분류 카테고리 
		 List<AdminLargeCategoryVO> large=adminlarge.selectAll();
		 logger.info("result large.size={}",large.size());
			model.addAttribute("location", location);
			model.addAttribute("large", large);
			
			return "owner/menu1/launch/launchNext";
	 }
 */

}
