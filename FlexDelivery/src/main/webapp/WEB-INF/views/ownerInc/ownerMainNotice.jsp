<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




  <div class="row align-items-end">
	  <!-- Single Blog Area -->
	  <div class="col-12 col-md-11" style="margin-bottom:10px; margin-top:20px;">
	      <div class="single-blog-area clearfix ">
	          <!-- Blog Content -->
				<div style="text-align: right">
				</div>                        
                   	<div class="single-blog-content">
                       <div class="line"></div>
                     	  <a href="#" class="post-tag"></a>
                       <div class="row">
	                       	<div class="col-12 col-md-11">
	                       		<h4><a href="<c:url value='/owner/menu3/board/notice.do'/>" style="text-decoration:none; class="post-headline">공지사항 </a></h4>
	                       	</div>
	                       	<div class="col-12 col-md-1">
	                      		 <a href="<c:url value='/owner/menu3/board/notice.do'/>"  style="font-size: 15px; text-decoration:none; color: rgb(255,201,14);margin-right:20px;">more</a>
	                       	</div>
                        </div>
	                         <ul >
	                         	<c:if test="${empty list }">
	                         		<li>공지가 없습니다.</li>
	                         		
	                         	 </c:if>
	                         	<c:if test="${!empty list }">
	                         		<c:forEach var="vo" items="${list }">
			                           	 <li style=" font-size:100%; height:30px; margin-left:20px; ">
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
                     	  <div >
	                     	
               	 	</div>
                  </div>
              </div>
    		</div>
    	 </div>


       
    	
