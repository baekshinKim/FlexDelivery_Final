package com.project.fd.owner.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.common.FileUploadUtil;
import com.project.fd.owner.model.OwnerService;
import com.project.fd.owner.ownerregister.model.OwnerRegisterService;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;

@Controller
@RequestMapping("/owner/menu1")
public class OwnerRegisterController {
	private static final Logger logger
	=LoggerFactory.getLogger(OwnerRegisterController.class);
	
	@Autowired private OwnerRegisterService ownerRegisterService;
	
	@Autowired private FileUploadUtil fileUtil;
	
	 //사업자 등록증 처리 
	 @RequestMapping(value="/launch/launchWrite.do",method=RequestMethod.POST)
	 public String ownerLicenseOk(@ModelAttribute OwnerRegisterVO vo, 
			 HttpServletRequest request, HttpSession session,
			 Model model) {
		 int ownerNo=(Integer)session.getAttribute("ownerNo");
		 vo.setOwnerNo(ownerNo);
		logger.info("사업자등록증 업로드 페이지 파라미터 ownerNo={},vo={}",ownerNo,vo);

		 //파일 업로드 처리
			String originName="", fileName="test";
			long fileSize=0;
			try {
				List<Map<String, Object>> fileList
				=fileUtil.fileUplaod(request, FileUploadUtil.OWNER_REGISTER_TYPE);
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
			
			vo.setoRegisterFileName(fileName);
			vo.setoRegisterOriginalFileName(originName);
			logger.info("originName={}",vo.getoRegisterOriginalFileName());
			logger.info("originName={}",vo.getoRegisterFileName());
			logger.info("vo={}",vo);
			
			int cnt=0;
			String msg="사업자 등록증 등록이 실패되었습니다. \n다시 작성해주세요. ",
					url="/owner/menu1/launch/launch.do";
			logger.info("vo={}",vo);
			
			cnt=ownerRegisterService.insertRegister(vo);
			if(cnt>0) {
				msg="사업자 등록증 등록 신청이 완료되었습니다.";
			}
			logger.info("제출 처리 결과, cnt={}", cnt);

			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}
	 
	 @ResponseBody
		@RequestMapping("/AjaxRegisterNo.do")
		public boolean ajaxCheckNO(@RequestParam long oRegisterNo) {
			logger.info("ajax 이용-아이디 중복확인, oRegisterNo={}", oRegisterNo);
			
			boolean bool=false;

			int result=(Integer)ownerRegisterService.oRegisterNoDup(oRegisterNo);
			logger.info("같은 사업자 등록번호가 있는지  결과, result={}", result);
			
			
			if(result==OwnerRegisterService.EXIST_REGISTER_NO) {
				bool=true;  //이미 존재
			}else if(result==OwnerRegisterService.NON_EXIST_REGISTER_NO) {
				bool=false;	//사용 가능		
			}
			
			return bool;
		}
	 

	 @RequestMapping("/launch/zipcode.do")
		public String zipcode(){
			
			logger.info("우편번호 조회 화면 ");
			
			return "owner/menu1/launch/zipcode";
		}
		
		@RequestMapping("/launch/ajaxZipcode.do")
		public void ajaxZipcode(HttpServletRequest req, ModelMap model, 
				HttpServletResponse response) throws Exception {
			logger.debug("owner Zipcode page");
			// 요청변수 설정
			String currentPage = req.getParameter("currentPage");    //요청 변수 설정 (현재 페이지. currentPage : n > 0)
			String countPerPage = req.getParameter("countPerPage");  //요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
			String confmKey = req.getParameter("confmKey");          //요청 변수 설정 (승인키)
			String keyword = req.getParameter("dong");            //요청 변수 설정 (키워드)
			
			// OPEN API 호출 URL 정보 설정
			String apiUrl = "https://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage+"&countPerPage="+countPerPage+"&keyword="+URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+confmKey;
			URL url = new URL(apiUrl);
	    	BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
	    	StringBuffer sb = new StringBuffer();
	    	String tempStr = null;

	    	while(true){
	    		tempStr = br.readLine();
	    		if(tempStr == null) break;
	    		sb.append(tempStr);								// 응답결과 XML 저장
	    	}
	    	br.close();
	    	
	    	response.setCharacterEncoding("UTF-8");
			response.setContentType("text/xml");
			response.getWriter().write(sb.toString());			// 응답결과 반환
	    }
/*
 *  @RequestMapping(value = "/businessLicense.do",method = RequestMethod.GET)
	 public void ownerLicense() {
		 logger.info("사업자 등록증 등록  화면 보여주기");
	 }
 * 	 
 */
}
