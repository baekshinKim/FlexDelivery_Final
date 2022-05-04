package com.project.fd.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class MemberLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String memberId=(String)request.getSession().getAttribute("memberId");
		
		if(memberId==null || memberId.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print("<script>");
			out.print("alert('먼저 로그인 하세요');");
			out.print("location.href='"+request.getContextPath()+"/member/login/memberLogin.do';");
			out.print("</script>");
			return false;
		}
		
		return true;
	}
	
}
