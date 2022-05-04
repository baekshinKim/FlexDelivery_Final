package com.project.fd.owner.controller;


import java.io.File;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;


import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryVO;
import com.project.fd.common.FileUploadUtil;
import com.project.fd.owner.menu.model.OptionResultVO;
import com.project.fd.owner.menu.model.OwnerMainMenuAllVO;
import com.project.fd.owner.menu.model.OwnerMenuAllVO;
import com.project.fd.owner.menu.model.OwnerMenuOptionAllVO;
import com.project.fd.owner.menu.model.OwnerMenuOptionVO;
import com.project.fd.owner.menu.model.OwnerMenuService;
import com.project.fd.owner.menu.model.OwnerMenuVO;
import com.project.fd.owner.menu.model.OwnerOptionRankVO;
import com.project.fd.owner.menu.model.OwnerStoreMainMenuVO;
import com.project.fd.owner.menu.model.OwnerStoreMenuGroupVO;
import com.project.fd.owner.store.model.OwnerStoresService;

//메뉴 옵션 할차례 / 그리고 menu delete edit 할때 그자리로 가게끔하는게 필요하다.. 
@Controller
@RequestMapping("/owner/menu2/foodmenu")
public class OwnerMenuController {
	@Autowired
	private static final Logger logger
		=LoggerFactory.getLogger(OwnerMenuController.class);
	
	@Autowired
	private OwnerMenuService ownerMenuService;
	
	@Autowired
	private OwnerStoresService ownerStoreService;
	
	
	
	 @Autowired private FileUploadUtil fileUtil;
	
	
	//내점포 사이드바에서 메뉴관리 누르면 보내짐
	//현재메뉴 버튼 누르면 보내짐
	@RequestMapping(value = "/menuMain.do", method = RequestMethod.GET) 
	public String menuMain_get(HttpSession session, Model model) {
		int ownerNo = (Integer) session.getAttribute("ownerNo");
		int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
	
		logger.info("menuMain 창 보여주기 파라미터 no={}",storeNo);
		//=>Q.점포 번호가 필요합니다. 세션으로 두는게 편할까??
		
		List<OwnerMenuAllVO> list = null;
		list = ownerMenuService.selectMenuAllView(storeNo);
		logger.info("메뉴 전체 값 조회 결과 list.size ={}" , list.size() );
		
		model.addAttribute("list",list);
		
		return "owner/menu2/foodmenu/menuMain";
	}
	
	
	//main에서 제목누르면 Detail로 오픈창 띄워짐
	@RequestMapping(value = "/menuDetail.do", method = RequestMethod.GET) 
	public String menuDetail_get(@RequestParam(defaultValue = "0") int menuNo,  Model model,HttpServletRequest request) {
		logger.info("menuDetail 창 보여주기 파라미터 no={}",menuNo);
		
		
		//전체 메뉴 구하기
		OwnerMenuAllVO ownerMenuAllVo  = ownerMenuService.selectMenuViewBymenuNo(menuNo);
		logger.info("번호로 검색한 메뉴 전체 조회 결과  ownerMenuAllVo={}" , ownerMenuAllVo );
		
		
		String type = "url";
		//현재 파일이 인터넷 url 인지 파일 업로드한 url 인지 확인위해서
		if(ownerMenuAllVo.getMenuImg()!=null) {
			String upPath 
			= fileUtil.getUploadPath(FileUploadUtil.MENU_TYPE, request);
			File nowFile = new File(upPath, ownerMenuAllVo.getMenuImg());
			if(nowFile.exists()) {
				 type="file";
				logger.info("기존 파일 존재여부 type={}",type);
			}
		}else if(ownerMenuAllVo.getMenuImg()==null) {
			type="null";
		}
		
		//전체 옵션 구하기
		List<OwnerMenuOptionAllVO> list=null;
		list = ownerMenuService.selectMenuOptionAllView(menuNo);
		logger.info("번호로 검색한 메뉴 옵션 전체 조회 결과  list.size={}" , list.size() );
		
		
		model.addAttribute("menuAllVo" , ownerMenuAllVo);
		model.addAttribute("list" , list);	
		model.addAttribute("type",type);
		
		return "owner/menu2/foodmenu/menuDetail";
	}
	
	
//menuGroup.jsp
	//메뉴편집 버튼 누르면  menuGroup보여주기
		@RequestMapping(value = "/menuGroup.do", method = RequestMethod.GET) 
		public String  menuGroup_get(HttpSession session, Model model){
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			logger.info("menuGroup 창 보여주기 , 파라미터 = {} ", storeNo);
			
			//전체 메뉴 그룹 구하기
			List<OwnerStoreMenuGroupVO> list = null;
			list = ownerMenuService.selectMenuGroupByNo(storeNo);
			logger.info("번호로 검색한 메뉴 그룹 리스트 전체 조회 결과  list.size={}" , list.size() );
			
			
			model.addAttribute("list" , list);
			
			return "owner/menu2/foodmenu/menuGroup";
		}
	
		
		
		
		//menuGroup 에서 수정버튼누르면 메뉴 그룹 수정
		@RequestMapping(value = "/menuGroupEdit.do", method = RequestMethod.GET) 
		public String  menuGroupEdit_get(@RequestParam(defaultValue = "0") int sMGroupNo , 
					 Model model ){
			logger.info("menuGroup 수정하기 화면 보여주기 , 파라미터 storeMenuGroupVo={}", sMGroupNo);
			
			//받아온 menuNo으로 update 하기 (점포 번호도 필요)
			
			OwnerStoreMenuGroupVO vo = ownerMenuService.selectMenuGroupByGroupNo(sMGroupNo);
			logger.info("번호로 검색한 메뉴 그룹 전체 조회 결과  vo={}" , vo);
			
			int YorN = OwnerMenuService.FAIL_POST;
			model.addAttribute("YorN", YorN);
			model.addAttribute("vo" , vo);
		
			return "owner/menu2/foodmenu/menuGroupEdit";
		}
		
		
		//menuGroup 에서 수정버튼누르면 메뉴 그룹 수정
			@RequestMapping(value = "/menuGroupEdit.do", method = RequestMethod.POST) 
			public String  menuGroupEdit_post(@ModelAttribute OwnerStoreMenuGroupVO ownerStoreMenuGroupVo, 
						Model model ){
				logger.info("menuGroup 수정하기 , 파라미터 OwnerStoreMenuGroupVO={}", ownerStoreMenuGroupVo);
				
				//받아온 menuNo으로 update 하기 (점포 번호도 필요)
				
				int cnt = ownerMenuService.updateMenuGroupByNo(ownerStoreMenuGroupVo);
				logger.info("번호로 메뉴그룹 업데이트 결과 cnt = {}", cnt);
				
				int YorN = OwnerMenuService.FAIL_POST;
				if(cnt>0){
					 YorN = OwnerMenuService.SUCCESS_POST;
				}
				
				model.addAttribute("YorN", YorN);
					
			
					
				return "owner/menu2/foodmenu/menuGroupEdit";
			}
	
		
			
			
	 //menuGroup 에서 삭제버튼누르면 메뉴 그룹 삭제
		@RequestMapping(value = "/menuGroupDelete.do", method = RequestMethod.GET) 
		public String  menuGroup_delete(@RequestParam(defaultValue = "0") int sMGroupNo, Model model){
			logger.info("menuGroup 삭제하기 , 파라미터 sMGroupNo={}",sMGroupNo);
			
			//받아온 menuNo으로 delete 하기 (점포 번호도 필요)
			int cnt = ownerMenuService.deleteMenuGroupByNo(sMGroupNo);
			logger.info("번호로 메뉴그룹 삭제 결과 cnt = {}", cnt);
			
			
			String msg="삭제 실패!" , url="/owner/menu2/foodmenu/menuGroup.do";
			
			if(cnt>0) {
				msg="삭제 성공!";
			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
		
			return "common/message";
		} 
		
		
		
		
	//menuGroup 에서 등록 버튼 누르면 메뉴 그룹 입력창 보여주기
		@RequestMapping(value ="/menuGroupWrite.do", method = RequestMethod.GET) 
		public String  menuGroup_write_get(HttpSession session, Model model){

			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
		
			logger.info("menuGroup 등록하기창 보여주기 파라미터 storeNo={}",storeNo);
			
			
			int YorN = OwnerMenuService.FAIL_POST;
			model.addAttribute("YorN", YorN);
			model.addAttribute("storeNo",storeNo);
			return "owner/menu2/foodmenu/menuGroupWrite";
		}
		
		
		
		
	//menugroupwirte 에서 등록누르면 post 로 입력해주기
		@RequestMapping(value ="/menuGroupWrite.do", method = RequestMethod.POST) 
		public String  menuGroup_write_post(@ModelAttribute OwnerStoreMenuGroupVO ownerStoreMenuGroupVo, Model model){
			logger.info("menuGroup 입력하기 OwnerStoreMenuGroupVO = {}",ownerStoreMenuGroupVo);
			
			int cnt = ownerMenuService.insertMenuGroup(ownerStoreMenuGroupVo);
			logger.info("menuGroup 입력 결과 cnt = {}",cnt);
			
			int YorN = OwnerMenuService.FAIL_POST;
			if(cnt>0){
				 YorN = OwnerMenuService.SUCCESS_POST;
			}
			
			model.addAttribute("YorN", YorN);
				
			return "owner/menu2/foodmenu/menuGroupWrite";
		}

		
	
	//menuChoice.jsp
	 //대표메뉴버튼 누르면  menuChoice 보여주기 
		@RequestMapping(value = "/menuChoice.do", method = RequestMethod.GET) 
		public String  menuChoice_get(@ModelAttribute OwnerStoreMenuGroupVO vo,
							HttpSession session, Model model){
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			
			logger.info("menuChoice 창 보여주기, 파라미터 vo={} , storeNo={} ", vo, storeNo);
			
			vo.setStoreNo(storeNo);
			
			List<OwnerMenuAllVO> list = null;
			list = ownerMenuService.selectMenuViewBymenuGroupNo(vo);
		
			
			model.addAttribute("list", list);
			model.addAttribute("sMGroupNo",vo.getsMGroupNo());
			//받아온 no 으로 메뉴 no 구하기 , 점포 번호도 받아와햐한다.
			
			return "owner/menu2/foodmenu/menuChoice";
		}
	
		
		
	//menuchoice 에서 수정버튼누르면 메뉴 수정
		@RequestMapping(value = "/menuChoiceEdit.do", method = RequestMethod.GET) 
		public String  menuChoiceEdit_get(@RequestParam(defaultValue = "0") int menuNo, 
					Model model, HttpSession session, HttpServletRequest request){
			logger.info("menu 수정하기 , 파라미터 menuNo={}", menuNo);
			
			//메뉴 넘버로 메뉴 정보가져오기
			if(menuNo==0) {
				model.addAttribute("msg","메뉴 번호가 없습니다.");
				model.addAttribute("url","/owner/menu2/foodmenu/menuGroup.do");
				return "common/message";
			}
			
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			
			//받아온 storeNo으로 메뉴그룹 구하기
			List<OwnerStoreMenuGroupVO> list =null;
			list = ownerMenuService.selectMenuGroupByNo(storeNo);
			logger.info("store번호로 조회 한 메뉴 list 결과 값 ,list.size={}", list.size());
			
			//받아온 menuNo으로 메뉴 구하기
			OwnerMenuVO vo = ownerMenuService.selectMenuByMenuNo(menuNo);
			logger.info("menu번호로 조회 한 메뉴 결과값 vo = {}",vo);
			
			
			String type = "url";
			//현재 파일이 인터넷 url 인지 파일 업로드한 url 인지 확인위해서
			if(vo.getMenuImg()!=null) {
				String upPath 
				= fileUtil.getUploadPath(FileUploadUtil.MENU_TYPE, request);
				File nowFile = new File(upPath, vo.getMenuImg());
				if(nowFile.exists()) {
					 type="file";
					logger.info("기존 파일 존재여부 type={}",type);
				}
			}else if(vo.getMenuImg()==null) {
				type="null";
			}
			
			
			int YorN = OwnerMenuService.FAIL_POST;
			model.addAttribute("YorN", YorN);
			model.addAttribute("menuVo",vo);
			model.addAttribute("list",list);
			model.addAttribute("type",type);
			
			return "owner/menu2/foodmenu/menuChoiceEdit";
		}
	
		
	
	//menuchoice 에서 수정버튼누르면 메뉴 수정
			@RequestMapping(value = "/menuChoiceEdit.do", method = RequestMethod.POST) 
			public String  menuChoiceEdit_post(@ModelAttribute OwnerMenuVO vo, Model model, 
					@RequestParam String oldFileName, HttpServletRequest request){
				logger.info("menu 수정하기 , 파라미터 menuVo={} oldFileName={}",vo,oldFileName);
				
				

				//파일 업로드
				List<Map<String, Object>> list=null;
				String imageUrl="";
				try {
					list=fileUtil.fileUplaod(request, FileUploadUtil.MENU_TYPE);
					for(Map<String, Object> map: list) {
						imageUrl=(String) map.get("fileName");
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				
				if(imageUrl==null || imageUrl.isEmpty()) {
					vo.setMenuImg(oldFileName);
				}else {
					vo.setMenuImg(imageUrl);
				}
				
				
				
				
				logger.info("menuUrl ,menulUrl = {}",vo.getMenuImg());
				//받아온 menuNo으로 update 하기 (점포 번호도 필요)
				int cnt = ownerMenuService.updateMenuByNo(vo);
				logger.info("메뉴 수정  결과, cnt={}", cnt);	
				
				int YorN = OwnerMenuService.FAIL_POST;
				
				if(cnt>0) {
					
					YorN = OwnerMenuService.SUCCESS_POST;
					
					//새로 업로드한 경우, 기존 파일이 존재하면 기존 파일 삭제
					if(!vo.getMenuImg().equals(oldFileName)) {
						String upPath 
							= fileUtil.getUploadPath(FileUploadUtil.MENU_TYPE, request);
						File oldFile = new File(upPath, oldFileName);
						if(oldFile.exists()) {
							boolean bool=oldFile.delete();
							logger.info("기존 파일 삭제 여부 :{}", bool);
						}					
					}
				}
				
				
				model.addAttribute("YorN", YorN);
				
				return "owner/menu2/foodmenu/menuChoiceEdit";
			}
		
		
	 //menuchoice 에서 삭제버튼 누르면 메뉴 삭제
		@RequestMapping(value = "/menuChoiceDelete.do", method = RequestMethod.GET) 
		public String  menuChoice_delete(@RequestParam(defaultValue = "0") int menuNo,Model model,HttpServletRequest request){
			logger.info("menu 삭제하기 , 파라미터 menuNo={}", menuNo);
			
			
			String oldFileName ="";
			OwnerMenuVO vo = ownerMenuService.selectMenuByMenuNo(menuNo);
			oldFileName =  vo.getMenuImg();
			logger.info("oldFilename= {}", oldFileName);
			
			//받아온 menuNo으로 delete 하기 (점포 번호도 필요)
			int cnt = ownerMenuService.deleteMenuByNo(menuNo);
			logger.info("번호로 메뉴그룹 삭제 결과 cnt = {}", cnt);
			
			
			String msg="삭제 실패!" , url="/owner/menu2/foodmenu/menuGroup.do";
			
			if(cnt>0) {
				msg="삭제 성공!";
				String upPath 
				= fileUtil.getUploadPath(FileUploadUtil.MENU_TYPE, request);
				File oldFile = new File(upPath, oldFileName);
				if(oldFile.exists()) {
					boolean bool=oldFile.delete();
					logger.info("기존 파일 삭제 여부 :{}", bool);
				}	
			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
		
			return "common/message";
		} 
		
		
	//menuChoice 에서 등록버튼 누르면 메뉴 입력
		@RequestMapping(value = "/menuChoiceWrite.do", method = RequestMethod.GET) 
		public String  menuChoice_write(HttpSession session,Model model,
					@RequestParam (defaultValue = "0") int sMGroupNo){
			
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			logger.info("menuWrite 등록하기 창 보여주기,  파라미터 storeNo={} ", storeNo);
			
			List<OwnerStoreMenuGroupVO> list = null;
			list = ownerMenuService.selectMenuGroupByNo(storeNo);
			//점포번호로 menuName insert하기
			
			int YorN = OwnerMenuService.FAIL_POST;
			
			
			//만약 같은 이름이 있다면 등록못하게 수정해야함
			model.addAttribute("sMGroupNoNo",sMGroupNo);
			model.addAttribute("storeNo",storeNo);
			model.addAttribute("list", list);
			model.addAttribute("YorN", YorN);
			
			
			return "owner/menu2/foodmenu/menuChoiceWrite";
		}
		
		
		

	
		//메뉴 등록 하기
		@RequestMapping(value = "/menuChoiceWrite.do", method = RequestMethod.POST)
		public String menuChoice_Write_Post(@ModelAttribute OwnerMenuVO vo,
				HttpServletRequest request, 
				Model model) {
			logger.info("메뉴 등록 처리, 파라미터 vo={}", vo);
			
			//파일 업로드
			List<Map<String, Object>> list=null;
			String imageUrl="";
			try {
				list=fileUtil.fileUplaod(request, FileUploadUtil.MENU_TYPE);
				for(Map<String, Object> map: list) {
					imageUrl=(String) map.get("fileName");
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			vo.setMenuImg(imageUrl);
			
			//2
			int cnt=ownerMenuService.insertMenu(vo);
			logger.info("메뉴 등록 경과, 파라미터 vo={}, 결과값  cnt={}", vo,cnt);
			
			int YorN = OwnerMenuService.FAIL_POST;
			
			if(cnt>0){
				 YorN = OwnerMenuService.SUCCESS_POST;
			}
			

			//3
			model.addAttribute("YorN", YorN);
		
		
			return "owner/menu2/foodmenu/menuChoiceWrite";
		}


		

	//옵션편집 버튼 누르면  menuOption.jsp
		@RequestMapping(value = "/menuOption.do", method = RequestMethod.GET) 
		public String  menuOptionGroup_get(HttpSession session, Model model){
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			logger.info("menuOption 창 보여주기 , 파라미터 = {} ", storeNo);
			
			//전체 메뉴 그룹 구하기
			List<OwnerStoreMenuGroupVO> list = null;
			list = ownerMenuService.selectMenuGroupByNo(storeNo);
			logger.info("번호로 검색한 메뉴 그룹 리스트 전체 조회 결과  list.size={}" , list.size() );
			
			List<OwnerOptionRankVO> oList = null;
			oList= ownerMenuService.selectOptionRankAll();
			logger.info("옵션 랭크 전체 결과  oList.size={}" , oList.size() );
			
			model.addAttribute("list" , list);
			model.addAttribute("oList", oList);
		
		
			
			
			return "owner/menu2/foodmenu/menuOption";
		}
	
		
		
		
		
		
		
		
		
	//대표메뉴버튼 누르면  signatureMenu.jsp
		@RequestMapping(value = "/signatureMenu.do", method = RequestMethod.GET) 
		public String  signatureMenu_get(HttpSession session, Model model,HttpServletRequest request){
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			logger.info("signatureMenu 창 보여주기 , 파라미터 = {} ", storeNo);
			
			int countResult = ownerMenuService.selectCountMainMenu(storeNo);
			logger.info("현재 mainMenu 갯수 결과 , result = {} ", countResult);
			
			OwnerMainMenuAllVO mainAllVo =null;
			
			
			
			
			
			String type = "url";
			if(countResult>0) {
				mainAllVo = ownerMenuService.selectMainMenuAll(storeNo);
				logger.info("mainMenu mediumCategory 등의 조회 결과 mainAllVo={} ", mainAllVo);
				//현재 파일이 인터넷 url 인지 파일 업로드한 url 인지 확인위해서
				
				if(mainAllVo.getMenuVo().getMenuImg()!=null) {
					String upPath 
					= fileUtil.getUploadPath(FileUploadUtil.MENU_TYPE, request);
					File nowFile = new File(upPath, mainAllVo.getMenuVo().getMenuImg());
					if(nowFile.exists()) {
						 type="file";
						logger.info("기존 파일 존재여부 type={}",type);
					}
				}else if(mainAllVo.getMenuVo().getMenuImg()==null) {
					type="null";
				}
			}
			
			
			
			
			model.addAttribute("storeNo", storeNo);
			model.addAttribute("mainAllVo", mainAllVo );
			model.addAttribute("countResult", countResult);
			model.addAttribute("type", type);
			
			return "owner/menu2/foodmenu/signatureMenu";
		}
		
		
		
		
		@RequestMapping(value = "/signatureMenuWrite.do", method = RequestMethod.GET) 
		public String  signatureMenuWrite_GET(@RequestParam(defaultValue = "0")  int storeNo, Model model){
			logger.info("대표메뉴 창 보여주기 파라미터 storeNo={}", storeNo);
			
			
			//중분류 구하기
			List<AdminMediumCategoryVO> cList = null;
			cList = ownerMenuService.selectAllMCByLCByStoreNo(storeNo);			
			logger.info("중분류 카테고리 list ={}",cList.size());
			
			
			//메뉴 리스트 구하기
			List<OwnerMenuAllVO> mList = null;
			mList = ownerMenuService.selectMenuAllView(storeNo);		
			logger.info("멘 카테고리 list ={}",mList.size());
			
			
			int YorN = OwnerMenuService.FAIL_POST;
			model.addAttribute("YorN", YorN);
			model.addAttribute("mList", mList);
			model.addAttribute("cList", cList);
			
			
			return "owner/menu2/foodmenu/signatureMenuWrite";
		}
		
		
		
		
		@RequestMapping(value = "/signatureMenuWrite.do", method = RequestMethod.POST) 
		public String  signatureMenuWrite_POST(@ModelAttribute OwnerStoreMainMenuVO mainVo, Model model){
			logger.info("대표메뉴 창 보여주기 파라미터 storeNo={}", mainVo);
			
			
			//중분류 구하기
			
			
			int cnt = ownerMenuService.insertMainMenu(mainVo);
			
			int YorN = OwnerMenuService.FAIL_POST;
			if(cnt>0){
				 YorN = OwnerMenuService.SUCCESS_POST;
			}
			
			model.addAttribute("YorN", YorN);
			
			return "owner/menu2/foodmenu/signatureMenuWrite";
		}

		
		
		
		@RequestMapping(value = "/signatureMenuEdit.do", method = RequestMethod.GET) 
		public String  signatureMenuEdit_GET(@RequestParam(defaultValue = "0") int storeNo, Model model){
			logger.info("대표메뉴 창 보여주기 파라미터 storeNo={}", storeNo);
			
			
			//storeNo으로 대표메뉴 전체 select하기
			OwnerStoreMainMenuVO mainVo= ownerMenuService.selectMainMenuByStoreNo(storeNo);
			logger.info("대표메뉴 전체 조회 결과  mainVo={}",mainVo);
			
			//중분류 구하기
			List<AdminMediumCategoryVO> cList = null;
			cList = ownerMenuService.selectAllMCByLCByStoreNo(storeNo);			
			logger.info("중분류 카테고리 list ={}",cList.size());
			
			
			//메뉴 리스트 구하기
			List<OwnerMenuAllVO> mList = null;
			mList = ownerMenuService.selectMenuAllView(storeNo);		
			logger.info("멘 카테고리 list ={}",mList.size());
			
			
			int YorN = OwnerMenuService.FAIL_POST;
			model.addAttribute("YorN", YorN);
			model.addAttribute("mList", mList);
			model.addAttribute("cList", cList);
			model.addAttribute("mainVo", mainVo);
			
			return "owner/menu2/foodmenu/signatureMenuEdit";
		}
		
		
		
		@RequestMapping(value = "/signatureMenuEdit.do", method = RequestMethod.POST) 
		public String  signatureMenuEdit_POST(@ModelAttribute OwnerStoreMainMenuVO mainVo, Model model){
			logger.info("대표메뉴 수정하기 post 전송 mainVo={}", mainVo);
			
			
			
			int cnt = ownerMenuService.updateMainMenu(mainVo);
			logger.info("대표메뉴 update 결과 cnt={}", cnt);
			
			int YorN = OwnerMenuService.FAIL_POST;
			if(cnt>0){
				 YorN = OwnerMenuService.SUCCESS_POST;
			}
			
			model.addAttribute("YorN", YorN);
			
			
			return "owner/menu2/foodmenu/signatureMenuEdit";
		}
		
				
		
		
		//에이젝스 도전!
		@ResponseBody  
		@RequestMapping("/checkDupGroupName.do")
		public boolean checkDupGroupName(@RequestParam(defaultValue = "0") String sMGroupName, HttpSession session) {
		logger.info("ajax이용-checkDupGroupName,sMGroupName={}", sMGroupName);
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("storeNo", storeNo);
			map.put("sMGroupName",sMGroupName);
			int result = ownerMenuService.checkDupGroupName(map);
			logger.info("그룹 이름 중복 확인 결과 result={}", result);
			boolean bool = false;
			
			if(result>0) {
				bool=true;
			}
			
			
		return bool; 
		}
		
		
		
		@ResponseBody  
		@RequestMapping("/checkDupMenuName.do")
		public boolean checkDupMenuName(@RequestParam(defaultValue = "0") String menuName,
				@RequestParam(defaultValue = "0") int sMGroupNo , HttpSession session) {
			int ownerNo = (Integer) session.getAttribute("ownerNo");
			int storeNo = ownerStoreService.selectStoreNoByNo(ownerNo);
			
		logger.info("ajax이용-checkDupMenuName,   menuName={}, sMGroupNo={}", menuName, sMGroupNo);
		
			
			Map<String, Object> map = new HashedMap<String, Object>();
			map.put("menuName", menuName);
			map.put("sMGroupNo", sMGroupNo);
			map.put("storeNo", storeNo);
			
			int result = ownerMenuService.checkDupMenuName(map);
			logger.info("메뉴 이름 중복 확인 결과 result={}", result);
			boolean bool = false;
			
			if(result>0) {
				bool=true;
			}
			
			
		return bool; 
		}

		
		@ResponseBody
		@RequestMapping("/selectAllByGroupNo.do")
		public List<OwnerMenuVO> selectMenuAll(@RequestParam(defaultValue = "0") int sMGroupNo){
			logger.info("ajax이용-selectMenuAll,   sMGroupNo={}", sMGroupNo);
			
			List<OwnerMenuVO> list=null;
			list = ownerMenuService.selectMenuByGroupNo(sMGroupNo);
			logger.info("그룹 넘버로  메뉴 리스트 조회,   list.size={}", list.size());
			
			
			return list;
		}
		
		
		@ResponseBody
		@RequestMapping("/selectOptionByMenuNo.do")
		public List<OwnerMenuOptionVO> selectOptionByMenuNo(@RequestParam(defaultValue = "0") int menuNo,
				@RequestParam(defaultValue = "0") int oRankNo){
			logger.info("ajax이용-selectOptionByMenuNo,   menuNo={}, oRankNo={}", menuNo ,oRankNo);
			
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("menuNo", menuNo+"");
			map.put("oRankNo",oRankNo+"");
			
			
			
			List<OwnerMenuOptionVO> list=null;
			list = ownerMenuService.selectOptionAllByMenuNo(map);
			logger.info("메뉴 번호로 옵션 전체 조회,   list.size={}", list.size());
			
			
			return list;
		}
		
		
		
		
		@ResponseBody
		@RequestMapping("/inputGroupNoMenuNoToOption.do")
		public OptionResultVO inputGroupNoMenuNoToOption(@RequestParam(defaultValue = "0") int menuNo,
					@RequestParam(defaultValue = "0") int sMGroupNo){
			logger.info("ajax이용-inputGroupNoMenuNoToOption,   sMGroupNo={} , menuNo={}", sMGroupNo, menuNo);
			
			List<OwnerOptionRankVO> list=null;
			list = ownerMenuService.selectOptionRankAll();
			logger.info("옵션 순위 전체 조회,   list.size={}", list.size());
			
			
			OwnerMenuVO menuVo = ownerMenuService.selectMenuByMenuNo(menuNo);
			logger.info("메뉴 번호로 전체 조회,  menuVo={}", menuVo);
			
			OwnerStoreMenuGroupVO groupVo = ownerMenuService.selectMenuGroupByGroupNo(sMGroupNo);
			logger.info("메뉴 그룹 번호로 전체 조회,  groupVo={}", groupVo);
			
			OptionResultVO vo = new OptionResultVO();
			
			vo.setList(list);
			vo.setMenuNo(menuNo);
			vo.setsMGroupNo(sMGroupNo);
			vo.setMenuName(menuVo.getMenuName());
			vo.setsMGroupName(groupVo.getsMGroupName());
			
			return vo;
		}
	
		
		@ResponseBody  
		@RequestMapping("/checkOptionName.do")
		public boolean checkOptionName(@RequestParam(defaultValue = "0") int menuNo, 
				@RequestParam(defaultValue = "0") int oRankNo,@RequestParam(defaultValue = "0") String mOptionName) {
			logger.info("ajax이용-checkOptionName,   menuNo={}, oRankNo={}", menuNo,oRankNo);
		
			Map<String, String> map = new HashMap<String, String>();
			map.put("menuNo",menuNo+"");
			map.put("oRankNo", oRankNo+"");
			map.put("mOptionName", mOptionName);
		
			
			int result = ownerMenuService.checkOptionName(map);
			logger.info("메뉴 이름 중복 확인 결과 result={}", result);
			boolean bool = false;
			
			if(result>0) {
				bool=true;
			}
			
			
		return bool; 
		}

		
		@ResponseBody  
		@RequestMapping("/insertOption.do")
		public int insertOption(@ModelAttribute OwnerMenuOptionVO optionVo) {
		logger.info("ajax이용-insertOption,   optionVo={}", optionVo);
		
			int cnt = ownerMenuService.insertOption(optionVo);
			logger.info("옵션 입력 결과 cnt={}", cnt);
			
		return cnt; 
		}
		
		
		
		
		@ResponseBody  
		@RequestMapping("/optionSelectOne.do")
		public OptionResultVO editOption(@RequestParam(defaultValue = "0") int mOptionNo,
				@RequestParam(defaultValue = "0") int menuNo) {
		logger.info("ajax이용-optionSelectOne,   mOptionNo={},,menuNo={}", mOptionNo,menuNo);
		
			OwnerMenuOptionVO optionVo = ownerMenuService.selectOptionByOptionNo(mOptionNo);
			logger.info("옵션 select 결과 cnt={}", optionVo);
			
			
			
				OwnerMenuAllVO vo= ownerMenuService.selectMenuViewBymenuNo(menuNo);
				logger.info("메뉴 select 결과 vo={}", vo);
				List<OwnerOptionRankVO> list = ownerMenuService.selectOptionRankAll();
				logger.info("메뉴 optionRank 결과 list={}", list.size());
				
				OptionResultVO optionReVo  = new OptionResultVO();
				optionReVo.setMenuName(vo.getMenuName());
				optionReVo.setMenuNo(menuNo);
				optionReVo.setsMGroupName(vo.getsMGroupName());
				optionReVo.setsMGroupNo(vo.getsMGroupNo());
				optionReVo.setList(list);	
				optionReVo.setOptionVo(optionVo);
				logger.info("메뉴 optionReVo 결과 optionReVo={}", optionReVo);
			
			
		return optionReVo; 
		}
		
		
		
		
		
		@ResponseBody  
		@RequestMapping("/optionUpdate.do")
		public int optionUpdate(@ModelAttribute OwnerMenuOptionVO optionVo) {
		logger.info("ajax이용-optionUpdate,   optionVo={}", optionVo);
			
			int cnt = ownerMenuService.updateOption(optionVo);
			logger.info("메뉴 옵션 업데이트 결과 cnt ={}", cnt);
		
		return cnt; 
		}

		
		
		@ResponseBody  
		@RequestMapping("/optionDelete.do")
		public int optionDelete(@RequestParam(defaultValue = "0") int mOptionNo) {
		logger.info("ajax이용-optionDelete,   mOptionNo={}", mOptionNo);
			
			int cnt = ownerMenuService.deleteOption(mOptionNo);
			logger.info("메뉴 옵션 업데이트 결과 cnt ={}", cnt);
		
		return cnt; 
		}

		
		

}
