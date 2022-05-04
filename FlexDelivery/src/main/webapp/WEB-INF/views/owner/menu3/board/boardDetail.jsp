<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../ownerInc/top.jsp" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	a{
		color:black;
	}
	
	a:hover{
		color: rgb(182,73,197);
		text-decoration: none;
	}
</style>

	<br>
<div class="row">
	
	<input type="hidden" name="boardNo" value="${ownerBoardVo.boardNo }">
	
	<!-- 헤드 시작 -->
	<div class="col-12 col-md-2"></div>
	<div class="col-12 col-md-8 text-center" >
	<c:set var ="notice" value="${NOTICE }"></c:set>
	<c:set var ="event" value="${EVENT }"></c:set>
	<c:set var ="nOre" value="${eventOrNotice}"></c:set>
		<c:if test="${nOre==notice}">
			<h3>공 지 사 항</h3>
		</c:if>
		<c:if test="${nOre==event}">
			<h3>이 벤 트</h3>
		</c:if>
	 	
	 <br>
  	<br>
  	
	</div>
	<div class="col-12 col-md-2"></div>
  
  	
  
  	<!-- 제목 , 날짜  -->
	<div class="col-12 col-md-2"></div>
	<div class="col-12 col-md-8 text-center" >
		<h5>[${ownerBoardVo.boardHead}] ${ownerBoardVo.boardTitle }</h5>	
		<span style="color:gray;"><small>${fn:substring(ownerBoardVo.boardRegdate, 0,10) }</small></span>
	 <hr>
	</div>
	<div class="col-12 col-md-2"></div>
	
	<!-- 내용 시작 -->
	<div class="col-12 col-md-2"></div>
	<div class="col-12 col-md-8 text-center" >
		<!-- 이미지 띄우기 -->
	    <c:set var="type" value="${type }"></c:set> 
	   	<c:if test="${type=='file'}">
	   	<img class="img-fluid mx-auto" src="<c:url value='/resources/imgs/NoticeEventImages/${ownerBoardVo.boardThumbnail}'/>" 
			alt="${ownerBoardVo.boardTitle }" style="height:250px;">
		</c:if>
		<c:if test="${type=='url'}">
	      	<img class="img-fluid mx-auto" src="${ownerBoardVo.boardThumbnail}" style="height:250px;"
			 alt="${ownerBoardVo.boardTitle }">
		</c:if>
		<c:if test="${empty ownerBoardVo.boardThumbnail}">
			<img class="img-fluid mx-auto" src="<c:url value='/resources/imgs/NoticeEventImages/noticeDefault.jpg'/>" alt="${ownerBoardVo.boardTitle}" ">
		</c:if>
		<br>
		<br>
		<!-- 진짜 내용 -->
		<div>
			<c:set var="content" 
			value="${fn:replace(ownerBoardVo.boardContent, newLine,'<br>') }" />
		
			<div class="lastDiv">			
				<p class="content" style="font-size:20px; color:black;">${content}</p>
			</div>
		</div>
		<br>
		<br>
		<hr>
	
	</div>
	<br>
	
	<div class="col-12 col-md-2"></div>
	
	
	<div class="col-12 col-md-2"></div>
	<div class="col-12 col-md-8  text-center" >
		<div>
		
			<c:if test="${nOre==notice}">
				<a href="<c:url value='/owner/menu3/board/notice.do'/>">
				<svg id="goList"  xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left-circle mt-1" viewBox="0 0 16 16">
			 		 <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
				</svg> 
				<span  class="mb-1" style="font-size:23px;">목록으로</span>
				</a>
			</c:if>
			
			<c:if test="${nOre==event}">
				<a href="<c:url value='/owner/menu3/board/event.do'/>">
				<svg id="goList"  xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left-circle mt-1" viewBox="0 0 16 16">
			 		 <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
				</svg> 
				<span  class="mb-1" style="font-size:23px;">목록으로</span>
				</a>
			</c:if>
		</div>
	</div>
 
	<div class="col-12 col-md-2"></div>
</div>
<br>
<br><br>
<%@ include file="../../../ownerInc/bottom.jsp" %>
