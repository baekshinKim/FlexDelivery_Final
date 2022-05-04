package com.project.fd.owner.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.fd.owner.model.OwnerService;

@Component
public class LicenseInterceptor2 extends HandlerInterceptorAdapter{
	private static final Logger logger
	=LoggerFactory.getLogger(LicenseInterceptor2.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler
			)
			throws Exception {
		
		if(request.getSession().getAttribute("result")==null) {
			request.getSession().setAttribute("result",0);
		}
		
		
		String ownerId = (String)request.getSession().getAttribute("ownerId");
		String result=Integer.toString((Integer)request.getSession().getAttribute("result"));
	
		//int aAgreeNo 
		int ragreeno=(Integer)request.getSession().getAttribute("ragreeno");
	String oRegisterNo=(String)request.getSession().getAttribute("oRegisterNo");
	
	logger.info("사업자등록 확인용 - 인터셉터 2이면 사업자등록 페이지로 이동 ,oRegisterNo={}",oRegisterNo);
	logger.info("ragreeno={}",ragreeno);
	
	PrintWriter out =response.getWriter();
	if(result.equals(OwnerService.NO_LICENSE+"")) {
		response.setContentType("text/html;charset=utf-8");
		
		out.print("<script>");
		out.print("alert('먼저 사업자등록증을 등록해주세요 !');");
		out.print("location.href='"+ request.getContextPath()
				+"/owner/menu1/businessLicense.do';");
		out.print("</script>");
		
		return false;
	}else if(result.equals(OwnerService.LICENSE_STAY+"")) {
		out.print("alert('사업자 등록 승인 대기 중입니다.');");
		out.print("location.href='"+request.getContextPath()+"/owner/index.do';");
		return false;
	}
	
		return true;
	}
	
	
}
