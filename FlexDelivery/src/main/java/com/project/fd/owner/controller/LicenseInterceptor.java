package com.project.fd.owner.controller;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.fd.owner.model.OwnerService;

@Component
public class LicenseInterceptor extends HandlerInterceptorAdapter {
	

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(request.getSession().getAttribute("result")==null) {
			request.getSession().setAttribute("result",0);
		}
		
		
		String ownerId = (String)request.getSession().getAttribute("ownerId");
		String result=Integer.toString((Integer)request.getSession().getAttribute("result"));
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print("<script>");
		
		if(ownerId==null || ownerId.isEmpty()) {
			out.print("alert('로그인 부탁드려요');");
			out.print("location.href='"+request.getContextPath()+"/owner/login/login.do';");
		}else{
			if(result.equals(OwnerService.NO_LICENSE+"")) {
				out.print("alert('사업자 등록 부터 부탁드려요');");
				out.print("location.href='"+request.getContextPath()+"/owner/menu1/businessLicense.do';");
			}else if(result.equals(OwnerService.NO_STORE+"")) {
				out.print("alert('점포 등록 부터 부탁드려요');");
				out.print("location.href='"+request.getContextPath()+"/owner/menu1/launch/launch.do';");
			}else if(result.equals(OwnerService.LICENSE_STAY+"")) {
				out.print("alert('사업자 등록 승인 대기 중입니다.');");
				out.print("location.href='"+request.getContextPath()+"/owner/index.do';");
			}else if(result.equals(OwnerService.STORE_STAY+"")) {
				out.print("alert('점포 승인 대기 중입니다.');");
				out.print("location.href='"+request.getContextPath()+"/owner/index.do';");
			}else if(result.equals(OwnerService.HAVE_ALL+"")) {
				out.print("alert('사업자 등록과 점포 승인 내역이 존재합니다. 취소 후 신청 바랍니다. ');");
				out.print("location.href='"+request.getContextPath()+"/owner/index.do';");
			}
			return true;
		}
		
		
		out.print("</script>");
		return false;
	
	}
	
}
