package com.project.fd.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadUtil {

	//어디서 사용하는지 알려주는 상수
	public static final int GIFT_PRODUCT_TYPE=1;  //선물하기-상품등록에서 사용
   public static final int HONEYTIP_TYPE=2;  //사장님꿀팁-등록에서 사용
   public static final int NOTICE_EVENT_TYPE=3;   //공지사항&이벤트-등록에서 사용 
   public static final int MENU_TYPE=4;   //메뉴
   public static final int STORES_TYPE=5;  //점포
   public static final int OWNER_REGISTER_TYPE=6;  //사업자등록
   public static final int TEMPORARY_TYPE=7;  //임시 - 사업자등록 파일
   public static final int LCATEGORY_TYPE=8;  //대분류 카테고리-등록에서 사용
   public static final int REVIEW_TYPE=9;
  	
	@Resource(name="fileUploadProperties")
	private Properties fileUploadProps;
	
	private static final Logger logger
		=LoggerFactory.getLogger(FileUploadUtil.class);
	
	public  List<Map<String, Object>> fileUplaod(HttpServletRequest request, 
			int type) throws IllegalStateException, IOException {
		MultipartHttpServletRequest multiRequest 
			= (MultipartHttpServletRequest) request;
		
		//결과를 저장할 리스트
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		Map<String, MultipartFile> filesMap=multiRequest.getFileMap();
		
		Iterator<String> keyIter=filesMap.keySet().iterator();
		while(keyIter.hasNext()) {
			String key=keyIter.next();
			MultipartFile tempFile =filesMap.get(key);
			//=> 업로드된 파일을 임시파일 형태로 제공
			
			if(!tempFile.isEmpty()) { //업로드된 경우
				//파일 크기
				long fileSize = tempFile.getSize();
				String originName = tempFile.getOriginalFilename();
				
				//변경된 파일 이름 구하기
				String fileName = getUniqueFileName(originName); 
						
				//파일 전송-업로드 처리
				String upPath = getUploadPath(type, request);				
				File file = new File(upPath, fileName);
				tempFile.transferTo(file);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("originalFileName", originName);
				map.put("fileName", fileName);
				map.put("fileSize", fileSize);
				
				list.add(map);
			}
		}//while
		
		return list;
	}

	private String getUniqueFileName(String originName) {
		//파일명이 중복될 경우 파일명 변경하기
		//파일명에 현재시간을 붙여서 변경된 파일명 구한다
		//abc.txt => abc_20201230123456789.txt
		int idx=originName.lastIndexOf(".");
		String fName = originName.substring(0,idx);  //abc
		String ext = originName.substring(idx); //.txt
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String today =sdf.format(d);
		
		String result = fName+"_"+today+ext;
		logger.info("변경된 파일명 : {}", result);
		
		return result;
	}
	
	public String getUploadPath(int type, HttpServletRequest request) {
		String testGb=fileUploadProps.getProperty("file.upload.type");
		
		String upPath="";
		if(type==GIFT_PRODUCT_TYPE) {
			if(testGb.equals("test")) {
				upPath=fileUploadProps.getProperty("GiftProductImages.upload.path.test");
			}else {
				upPath=fileUploadProps.getProperty("GiftProductImages.upload.path");				
			}
		}else if(type==HONEYTIP_TYPE) {
			if(testGb.equals("test")) {
				upPath=fileUploadProps.getProperty("HoneytipImages.upload.path.test");
			}else {
				upPath=fileUploadProps.getProperty("HoneytipImages.upload.path");				
			}
		}else if(type==NOTICE_EVENT_TYPE) {
			if(testGb.equals("test")) {
				upPath=fileUploadProps.getProperty("NoticeEventImages.upload.path.test");
			}else {
				upPath=fileUploadProps.getProperty("NoticeEventImages.upload.path");				
			}
		}else if(type==MENU_TYPE) {
			if(testGb.equals("test")) {
				upPath=fileUploadProps.getProperty("MenuImages.upload.path.test");
			}else {
				upPath=fileUploadProps.getProperty("MenuImages.upload.path");				
			}
		}else if(type==STORES_TYPE) {
			if(testGb.equals("test")) {
				upPath=fileUploadProps.getProperty("StoresImages.upload.path.test");
			}else {
				upPath=fileUploadProps.getProperty("StoresImages.upload.path");				
			}
		}else if(type==OWNER_REGISTER_TYPE) {
			if(testGb.equals("test")) {
				upPath=fileUploadProps.getProperty("OwnerRegisterImages.upload.path.test");
			}else {
				upPath=fileUploadProps.getProperty("OwnerRegisterImages.upload.path");				
			}
		}else if(type==TEMPORARY_TYPE) {
			if(testGb.equals("test")) {
				upPath=fileUploadProps.getProperty("TemporaryImages.upload.path.test");
			}else {
				upPath=fileUploadProps.getProperty("TemporaryImages.upload.path");				
			}
		}else if(type==LCATEGORY_TYPE) {
			if(testGb.equals("test")) {
				upPath=fileUploadProps.getProperty("LCategoryImages.upload.path.test");
			}else {
				upPath=fileUploadProps.getProperty("LCategoryImages.upload.path");				
			}
		}else if(type==REVIEW_TYPE) {
			if(testGb.equals("test")) {
				upPath=fileUploadProps.getProperty("Review.upload.path.test");
			}else {
				upPath=fileUploadProps.getProperty("Review.upload.path");				
			}
		}
		
		if(!testGb.equals("test")) {
			upPath 
			= request.getSession().getServletContext().getRealPath(upPath);			
		}
		
		logger.info("파일 업로드 경로: {}", upPath);
		
		return upPath;
	}
	
}









