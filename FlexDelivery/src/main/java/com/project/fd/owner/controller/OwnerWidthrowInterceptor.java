
package com.project.fd.owner.controller;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.fd.owner.model.OwnerService;

@Component
public class OwnerWidthrowInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger
	=LoggerFactory.getLogger(OwnerWidthrowInterceptor.class);

	@Autowired
	private OwnerService ownerService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String result="0";
		
		String ownerId = (String)request.getSession().getAttribute("ownerId");
		result= Integer.toString(ownerService.checkAuthority(ownerId));
		System.out.println("인터셉터에서 result"+result);
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print("<script>");
		
			if(result.equals(OwnerService.NO_STORE+"") || result.equals(OwnerService.LICENSE_STAY+"")) {
				logger.info("탈퇴관련 인터셉터 - preHandle() result={}", result);
				out.print("alert('사업자등록 승인 취소를 우선적으로 진행해 주세요.');");
				out.print("location.href='"+request.getContextPath()+"/owner/index.do';");
			
			}else if(result.equals(OwnerService.STORE_STAY+"") ) {
				logger.info("탈퇴관련 인터셉터- preHandle() result={}", result);
				out.print("alert('점포 승인 취소를 우선적으로 진행해 주세요');");
				out.print("location.href='"+request.getContextPath()+"/owner/index.do';");
			
			}else if(result.equals(OwnerService.WITHDRAW_STAY+"")) {
				logger.info("탈퇴관련 인터셉터 - preHandle() result={}", result);
				out.print("alert('점포 탈퇴 승인 대기 중입니다.');");
				out.print("location.href='"+request.getContextPath()+"/owner/index.do';");
			
			}else if(result.equals(OwnerService.NO_LICENSE+"") || result.equals(OwnerService.WITHDRAW_SUCCESS+"")){
				out.print("location.href='"+request.getContextPath()+"/owner/mypage/mypageDeleteOwner.do';");
				
			}else if(result.equals(OwnerService.HAVE_ALL+"")) {
				return true;
			}else {
				out.print("location.href='"+request.getContextPath()+"/owner/index.do';");
			}
		
		out.print("</script>");
		return false;
	}
	
}
