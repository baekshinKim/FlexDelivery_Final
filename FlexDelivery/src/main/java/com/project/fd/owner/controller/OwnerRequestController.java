package com.project.fd.owner.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.common.FileUploadUtil;
import com.project.fd.owner.advertise.model.OwnerStoreAdVO;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;
import com.project.fd.owner.request.model.OwnerRequestService;
import com.project.fd.owner.store.model.OwnerStoresService;
import com.project.fd.owner.store.model.OwnerStoresVO;
import com.project.fd.owner.store.model.OwnerTemporaryVO;

@Controller
@RequestMapping("/owner/menu2/requests")
public class OwnerRequestController {
	private static final Logger logger  = LoggerFactory.getLogger(OwnerRequestController.class);
	
	@Autowired OwnerRequestService requestService;
	@Autowired private FileUploadUtil fileUtil;
	@Autowired private OwnerStoresService ownerStoresService;
	
	@RequestMapping(value="/requests.do",method=RequestMethod.GET)
	public String ownerrequests_get( HttpSession session,Model model) {
		int ownerNo = (Integer) session.getAttribute("ownerNo");
		logger.info("요청처리현황 보여주기 ownerNo={}",ownerNo);
		
		//List<OwnerAllRegisterVO> list =selectStore(ownerNo);
		List<Map<String, Object>> RegiList =requestService.selectRegi(ownerNo);
		logger.info("요청처리현황 사업자 등록  RegiList.size={}",RegiList.size());
		List<Map<String, Object>> selectStore =requestService.selectStore(ownerNo);
		logger.info("요청처리현황 점포 등록  selectStore.size={}",selectStore.size());
		List<Map<String, Object>>  selectAd =requestService.selectAd(ownerNo);
		logger.info("요청처리현황 광고 등록  selectAd.size={}",selectAd.size());
		List<Map<String, Object>> selectTemp =requestService.selectTemp(ownerNo);
		logger.info("요청처리현황 점포 수정  selectTemp.size={}",selectTemp.size());
		
		model.addAttribute("RegiList", RegiList);
		model.addAttribute("selectStore", selectStore);
		model.addAttribute("selectAd", selectAd);
		model.addAttribute("selectTemp", selectTemp);
		
		
		return "owner/menu2/requests/requests";
	}
	
	@ResponseBody
	@RequestMapping(value = "/requests.do", method = RequestMethod.POST)
	public Map<String, Object> ownerrequests_post( HttpSession session,Model model) {
		 int ownerNo=(Integer)session.getAttribute("ownerNo");
		logger.info("요청처리현황 보여주기 ownerNo={}",ownerNo);
		
		//List<OwnerAllRegisterVO> list =selectStore(ownerNo);
		List<Map<String, Object>> RegiList =requestService.selectRegi(ownerNo);
		logger.info("요청처리현황 사업자 등록  RegiList.size={}",RegiList.size());
		List<Map<String, Object>> selectStore =requestService.selectStore(ownerNo);
		logger.info("요청처리현황 점포 등록  selectStore.size={}",selectStore.size());
		List<Map<String, Object>>  selectAd =requestService.selectAd(ownerNo);
		logger.info("요청처리현황 광고 등록  selectAd.size={}",selectAd.size());
		List<Map<String, Object>> selectTemp =requestService.selectTemp(ownerNo);
		logger.info("요청처리현황 점포 수정  selectTemp.size={}",selectTemp.size());
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("RegiList", RegiList);
		map.put("selectStore", selectStore);
		map.put("selectAd", selectAd);
		map.put("selectTemp", selectTemp);
		
		return  map;
	}
	
	@ResponseBody
	@RequestMapping("/selectRegi.do")
	public List<Map<String, Object>> selectMenuAll(@RequestParam(defaultValue = "0") int ownerNo){
		logger.info("ajax이용-요청처리현황,   ownerNo={}", ownerNo);
		
		List<Map<String, Object>> RegiList =requestService.selectRegi(ownerNo);
		logger.info("요청처리현황 사업자 등록  RegiList={}",RegiList);
		
		return RegiList;
	}
	
	@ResponseBody
	@RequestMapping("/detailRegi.do")
	public OwnerRegisterVO detailRegi(@RequestParam(defaultValue = "0") long oRegisterNo){
		logger.info("ajax이용-detailRegi, no={}", oRegisterNo);
		
		OwnerRegisterVO vo  = requestService.selectRegiVo(oRegisterNo);
		logger.info("사업자 등록증 상세 조회,   vo={}", vo);
		
		
		return vo;
	}
	
	//Detail로 오픈창 띄워짐 - ownerregister
	@RequestMapping(value = "/tempRegi.do", method = RequestMethod.GET) 
	public String RegiDetail_get(@RequestParam(defaultValue = "0") long no,  Model model,HttpServletRequest request) {
		logger.info("tempRegi.do 창 보여주기 파라미터 no={}",no);
		//select By no = storeNo
		OwnerRegisterVO rgVo=requestService.selectRegiVo(no);
		
		logger.info("/temporary/tempRegi tempRegi result 파라미터  rgVo={}", rgVo);
		
		String type = "url";
		//현재 파일이 인터넷 url 인지 파일 업로드한 url 인지 확인위해서
		if(rgVo.getoRegisterFileName()!=null) {
			String upPath 
			= fileUtil.getUploadPath(FileUploadUtil.OWNER_REGISTER_TYPE, request);
			File nowFile = new File(upPath, rgVo.getoRegisterFileName());
			if(nowFile.exists()) {
				 type="file";
				logger.info("기존 파일 존재여부 type={}",type);
			}
		}else if(rgVo.getoRegisterFileName()==null) {
			type="null";
		}
		
		model.addAttribute("rgVo" , rgVo);
		model.addAttribute("type",type);
		
		return "owner/menu2/requests/tempRegi";
	}
	
	//Detail로 오픈창 띄워짐 - stores 
	@RequestMapping(value = "/Store.do", method = RequestMethod.GET) 
	public String selectStoresDetail_get(@RequestParam(defaultValue = "0") int no,  Model model,HttpServletRequest request) {
		
		logger.info("/tempStrores.do 창 보여주기 파라미터 no={}",no);
		//select By no = storeNo
		OwnerStoresVO stVo=requestService.selectStoresVO(no);
		
		logger.info("/temporary/temp stVo result 파라미터  stVo={}", stVo);
		
		String type = "url";
		//현재 파일이 인터넷 url 인지 파일 업로드한 url 인지 확인위해서
		if(stVo.getStoreLogo()!=null) {
			String upPath 
			= fileUtil.getUploadPath(FileUploadUtil.STORES_TYPE, request);
			File nowFile = new File(upPath, stVo.getStoreLogo());
			if(nowFile.exists()) {
				 type="file";
				logger.info("기존 파일 존재여부 type={}",type);
			}
		}else if(stVo.getStoreLogo()==null) {
			type="null";
		}
		
		model.addAttribute("stVo" ,  stVo);
		model.addAttribute("type",type);
		
		return "owner/menu2/requests/Store";
	}
	
	//Detail - tempStore
	@RequestMapping(value = "/tempStore.do", method = RequestMethod.GET) 
	public String selectTempDetail_get(@RequestParam(defaultValue = "0") int no,  Model model,HttpServletRequest request) {
		logger.info("/temporary/tempStore.do 창 보여주기 파라미터 no={}",no);
		//select By no = storeNo
		OwnerTemporaryVO tempVo=requestService.selectTempVO(no);
		
		logger.info("/temporary/temp stVo result 파라미터  stVo={}", tempVo);
		
		String type = "url";
		//현재 파일이 인터넷 url 인지 파일 업로드한 url 인지 확인위해서
		if(tempVo.gettFileName()!=null) {
			String upPath 
			= fileUtil.getUploadPath(FileUploadUtil.TEMPORARY_TYPE, request);
			File nowFile = new File(upPath, tempVo.gettFileName());
			if(nowFile.exists()) {
				 type="file";
				logger.info("기존 파일 존재여부 type={}",type);
			}
		}else if(tempVo.gettFileName()==null) {
			type="null";
		}
		
		model.addAttribute("tempVo" ,  tempVo);
		model.addAttribute("type",type);
		
		return "owner/menu2/requests/tempStore";
	}
	
	//Detail - AD
	@RequestMapping(value = "/tempAD.do", method = RequestMethod.GET) 
	public String selectADDetail_get(@RequestParam(defaultValue = "0") int no,  Model model,HttpServletRequest request) {
		logger.info("/temporary/tempAD.do 창 보여주기 파라미터 no={}",no);
		//select By no = storeNo
		OwnerStoreAdVO selectAD=requestService.selectAD(no);
		
		logger.info("/temporary/temp stVo result 파라미터  stVo={}", selectAD);
		
		model.addAttribute("adVo" ,  selectAD);
	
		
		return "owner/menu2/requests/tempAD";
	}
	
	
	
	
	
	//
	//
		//delete - ownerregister
		@RequestMapping(value = "/deleteRegi.do", method = RequestMethod.POST) 
		public String deleteRegi_get(@RequestParam(defaultValue = "0") long no,
				@RequestParam String pwd, Model model,HttpServletRequest request, HttpSession session) {
			logger.info("삭제  처리  파라미터 ownerregisterNo={}",no);
			//select By no = ownerNo
			int ownerNo=(Integer)session.getAttribute("ownerNo");
			logger.info("pwdCK  처리  파라미터 ownerNo={}",ownerNo);
			
			String msg="사업자 등록 신청 취소에  실패하였습다. ", url="/owner/menu2/requests/tempRegi.do?no="+no;
			int YorN =OwnerRequestService.FAIL_POST;
			if(requestService.pwdCk(pwd,ownerNo)) {
				int cnt =requestService.updateRegi(no);
				logger.info("삭제  결과, cnt={}", cnt);
				
				if(cnt>0) {
				msg="정상적으로 취소되었습니다.";
				 YorN =OwnerRequestService.SUCCESS_POST;
				}
			}else {
				msg="비밀번호가 일치하지 않습니다.";
			}
		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			model.addAttribute("YorN", YorN);
			
			return "common/message";
		}
		
		//delete  - stores 
		@RequestMapping(value = "/deleteStore.do", method = RequestMethod.POST) 
		public String deleteStores_get(@RequestParam(defaultValue = "0") int no,
				@RequestParam String pwd, HttpSession session, Model model,HttpServletRequest request) {
			logger.info("삭제  처리  파라미터 storeNo={}",no);
			
			int ownerNo=(Integer)session.getAttribute("ownerNo");
			logger.info("pwdCK  처리  파라미터 ownerNo={}",ownerNo);
			String msg="삭제에  실패하였습다. ", url="/owner/menu2/requests/Store.do?no="+no;
			if(requestService.pwdCk(pwd,ownerNo)) {
				int cnt =requestService.updateStore(no);
				logger.info("삭제  결과, cnt={}", cnt);
				
				if(cnt>0) {
					msg="정상적으로 취소되었습니다.";
				}
			}else {
				msg="비밀번호가 일치하지 않습니다.";
			}
		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
	
		
		//delete - tempStore
		@RequestMapping(value = "/deletetempStore.do", method = RequestMethod.POST) 
		public String deleteTemp_get(@RequestParam(defaultValue = "0") int no, @RequestParam String pwd,
				HttpSession session,   Model model,HttpServletRequest request) {
			logger.info("임시저장함 취소 신청 tNo={}",no);
			
			int ownerNo=(Integer)session.getAttribute("ownerNo");
			logger.info("pwdCK  처리  파라미터 ownerNo={}",ownerNo);

			String msg="삭제에  실패하였습다. ", url="/owner/menu2/requests/tempStore.do?no="+no;
			if(requestService.pwdCk(pwd,ownerNo)) {
				int cnt =requestService.updateTempstore(no);
				logger.info("삭제  결과, cnt={}", cnt);
				if(cnt>0) {
					msg="정상적으로 취소되었습니다.";
				}
			}else {
				msg="비밀번호가 일치하지 않습니다.";
			}
		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}

		
		
 
	
}
