<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <div class="row">
				                  	  <div class="col-12 col-md-1" ></div>
				              				<div class="col-12 col-md-10" >
							                      <ul style="list-style: none">
	                         							<c:if test="${empty list }">
	                         								<li>공지가 없습니다.</li>
	                         							</c:if>
	                         							<c:if test="${!empty list }">
	                         								<c:forEach var="vo" items="${list }">
									                        	<li style=" font-size:100%; height:30px; ">
									                        		<a style="text-decoration:none; color:black;"href="${pageContext.request.contextPath}/owner/menu3/board/boardDetail.do?boardNo=${vo.boardNo}&boardHead=${vo.boardHead}">
								                        			<b>[${vo.boardHead}]</b>&nbsp;
															             <!-- 제목이 긴 경우 일부만 보여주기 -->
																		<c:if test="${fn:length(vo.boardTitle)>=20}">
																			${fn:substring(vo.boardTitle, 0,20) } ...
																		</c:if>
																		<c:if test="${fn:length(vo.boardTitle)<20}">						
																			${vo.boardTitle}
																		</c:if>
																		<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->					
																		<c:if test="${vo.newImgTerm<24 }">
																			<img src="<c:url value='/resources/imgs/new.gif'/>" 
																				alt="new 이미지">
																		</c:if>
									                        		</a>
									                        		<span style="float:right;">${fn:substring(vo.boardRegdate, 0,10) }</span>
									                        	</li>
							                        		</c:forEach>
	                         							</c:if>
							                      </ul>
							                  </div>
							                   <div class="col-12 col-md-10" ></div>
					
							                    <div class="col-12 col-md-2" >
							                      	<a href="<c:url value='/owner/menu3/board/notice.do'/>" style="font-size: 15px; color: gray; ">more..</a>
							                    </div>
                              		  </div>