<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
 

		
		
		

<div class="single-blog-area blog-style-2 wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="1000ms">
        <div class="row align-items-center" >
               <div class="col-12 col-md-10"  style="margin-top:10px;">
                   	<a href="<c:url value='/owner/menu3/board/event.do'/>" style="text-decoration:none; color:black;  "><h4 >이벤트</h4></a>
                </div>
                <div class="col-12 col-md-1">
                  	<a href="<c:url value='/owner/menu3/board/event.do'/>" style="font-size: 15px; margin-right:20px;  text-decoration:none; color: rgb(255,201,14);">more</a>
                </div>
                <div class="col-12 col-md-1"> </div>
                    <br><br><br><br>
				<div class="col-12 col-md-11 text-center" >
					<c:if test="${empty list}">
						<div class="card">
				  			<div class="card-body">
				 				이벤트 준비 중 입니다.
				  			</div>
						</div>
					</c:if>
					<div class="row">
						<c:if test="${!empty list }">
							<c:forEach var="vo" items="${list}" varStatus="status">
									<div class="col-12 col-md-4 p-4">
								  	  	<div class="card h-100" >
									      <!-- 이미지 띄우기 -->
										   <!-- 나중에 파일 업로드 후에 아래 주석을 풀어주세요.. 지금은 이미지 확인차.. -->
											 	<c:if test="${fn:substring(vo.boardThumbnail, 0,4)=='http' }">
										      		<img src="${vo.boardThumbnail}" class="card-img-top"  alt ="${vo.boardTitle }"  style="height:150px;"
													 alt="${vo.boardTitle }">
												</c:if>
												<c:if test="${fn:substring(vo.boardThumbnail, 0,4)!='http' and (!empty vo.boardThumbnail) }">
													<img src
													="<c:url value='/resources/imgs/NoticeEventImages/${vo.boardThumbnail}'/>" 
													alt="${vo.boardTitle }" class="card-img-top" alt ="${vo.boardTitle }"style="height:150px;">
												</c:if>
										        <!-- 내용띄우기 -->
										     	<div class="card-body">
										       		 <h5 class="card-title">
									       		 		<a class="event" href="<c:url value='/owner/menu3/board/boardDetail.do?boardNo=${vo.boardNo }&boardHead=${vo.boardHead }'/>"
									       		 					 >
										       		 		<c:if test="${fn:length(vo.boardTitle)>=10}">
																${fn:substring(vo.boardTitle, 0,10) } ..
															</c:if>
															<c:if test="${fn:length(vo.boardTitle)<10}">				
																${vo.boardTitle}
															</c:if>
																				<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->					
															<c:if test="${vo.newImgTerm<24 }">
																<img src="<c:url value='/resources/imgs/new.gif'/>" 
																	alt="new 이미지">
															</c:if>
														</a>
													</h5>
										        	<p class="card-text"><span><small>${fn:substring(vo.boardRegdate, 0,10) }</small></span></p>
										     	</div>
										    </div>
								     
										 </div>
							 </c:forEach>
						  </c:if>
					   </div>
				</div>

		<div class="col-12 col-md-1"></div>
			
                      </div>
                  </div>