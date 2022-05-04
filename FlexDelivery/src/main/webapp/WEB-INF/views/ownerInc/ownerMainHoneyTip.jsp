<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    	<!-- 꿀팁 4개만 메인에서 보여지기  -->
          <div class="single-blog-area blog-style-2 wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="1000ms">
              <div class="row align-items-center" >
                  <div class="col-12 col-md-10">
                      <a href="<c:url value='/owner/menu3/honeyTip/honeyTip.do'/>" class="event" style="text-decoration:none; color:black; "><h4>사장님 꿀팁 </h4></a>
                     </div>
                   	<div class="col-12 col-md-1">
                     	<a href="<c:url value='/owner/menu3/honeyTip/honeyTip.do'/>"  class="event" style="font-size: 15px;  text-decoration:none; color: rgb(255,201,14); margin-right:20px;">more</a>
                     </div>
                         <div class="col-12 col-md-1"> </div>
                           <br><br><br><br>
                           	<c:if test="${!empty list }">
								<c:forEach var="vo" items="${list}" >
	                          	<div class="col-12 col-md-3" >
	                              <div class="single-blog-thumbnail">
	                               	<c:if test="${fn:substring(vo.honeytipThumbnail, 0,4)=='http' }">
									      		<img src="${vo.honeytipThumbnail}" class="card-img-top"style="margin-bottom: 40px;"
												 alt="${vo.honeytipTitle }">
											</c:if>
											<c:if test="${fn:substring(vo.honeytipThumbnail, 0,4)!='http' and (!empty vo.honeytipThumbnail) }">
												<img src
												="<c:url value='/resources/imgs/HoneytipImages/${vo.honeytipThumbnail}'/>" 
												alt="${vo.honeytipTitle }" class="card-img-top" style="margin-bottom: 40px;">
											</c:if>
									</div>
	                          	</div>
	                         <div class="col-12 col-md-2" style="height:200px; padding-right:0px; ">
	                              <!-- Blog Content -->
	                              <div class="single-blog-content" style="margin-bottom: 40px;">
	                                  <div class="line mb-2"></div>
	                                  <a href="<c:url value='/owner/menu3/honeyTip/detail.do?honeyTipNo=${vo.honeytipNo}'/>" class="post-tag event">HONEY TIP</a>
	                                  <a href="<c:url value='/owner/menu3/honeyTip/detail.do?honeyTipNo=${vo.honeytipNo}'/>" class="post-headline event"><b>${vo.honeytipTitle }</b></a></h4>
	                                  	<div class="post-meta">
	                                      <p>By FLEX DELIVERY</p>
	                                      <p></p>
	                                  </div>
	                              </div>
	                          </div>
	                        <div class="col-12 col-md-1"></div>
	                      </c:forEach>
						</c:if>
				</div>
		</div>
