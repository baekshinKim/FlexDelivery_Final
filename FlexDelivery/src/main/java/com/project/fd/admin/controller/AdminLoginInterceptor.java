package com.project.fd.admin.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class AdminLoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger
		=LoggerFactory.getLogger(AdminLoginInterceptor.class);
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
			Object handler, Exception ex)throws Exception {
		//logger.info("view 생성 후 호출-afterCompletion()");
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object
			handler,ModelAndView modelAndView) throws Exception {
		//logger.info("컨트롤러 수행 후 호출 - postHandle()");
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		//logger.info("컨트롤러 수행 전 호출 - preHandle()");
		/*
		String uri = request.getRequestURI();
		logger.info("uri={}",uri);
		//=>http://localhost:9090/springherb/admin/login/adminLogin.do
		//=> uri => /springherb/admin/login/adminLogin.do
		//관리자 로그인 페이지는 걸러낸다
		if(uri.indexOf("/admin/login/login.do")!=-1){
			return true; //에러 처리하지 않는다
		}*/
		
		//HttpSession session = request.getSession();
		String adminId = (String)request.getSession().getAttribute("adminId");
		//관리자 로그인되지 않은 경우 에러 처리
		if(adminId==null || adminId.isEmpty()){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 없이 이용이 불가능합니다.');");
			out.println("location.href='"+request.getContextPath()+"/admin/login/login.do';");
			out.println("</script>");
			return false;
		}else{
			return true;
		}
	} 
}
