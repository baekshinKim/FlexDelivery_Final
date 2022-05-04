<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:if test="${empty list}">
	<div class="col-md-12 pb-12" style="text-align: center">
		<div class="bg-white p-3 h-100 rounded overflow-hidden position-relative shadow-sm">
	        <img alt="" class="img-fluid" src="<c:url value='/resources/imgs/noListDefault.png'/>" style="inline-size: 30em">
		</div>
	</div>
</c:if>
<c:if test="${!empty list}">
<div class="trending-slider">
	<c:forEach var="vo" items="${list}">
		<div class="osahan-slider-item">
	        <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
	           	<!-- 카드 이미지 -->
	            <div class="list-card-image">
	                <div class="star position-absolute"><span class="badge badge-success"><i class="feather-star"></i> ${vo.reviewRating} (${vo.reviewCount})</span></div>
	                <div class="favourite-heart text-danger position-absolute">
	                <c:if test="${!empty likeList}">
		                <c:forEach var="lVo" items="${likeList}">
		                	<c:if test="${lVo.storeNo==vo.storeNo}">
			                	<i class="feather-heart"></i>
		                	</c:if>
		                </c:forEach>
	                </c:if>
	                </div>
	                <c:if test="${vo.sStatusNo==2}">
		                <c:if test="${today==vo.hCategoryNo}">
			                <div class="member-plan position-absolute"><span class="badge badge-success">휴무</span></div>
		                </c:if>
		                <c:if test="${today!=vo.hCategoryNo}">
			                <div class="member-plan position-absolute"><span class="badge badge-primary">영업중</span></div>
		                </c:if>
	                </c:if>
	                <c:if test="${vo.sStatusNo==1 or vo.sStatusNo==3}">
		                <div class="member-plan position-absolute"><span class="badge badge-dark">준비중</span></div>
	                </c:if>
	                
	                <a href="<c:url value='/member/store/storeDetail.do?storeNo=${vo.storeNo}' />">
	                    <c:if test="${vo.storeLogo=='temp.jpg'}">
		                    <img alt="#" src='<c:url value="/resources/imgs/${vo.storeLogo}"/>' class="img-fluid item-img w-100">
	                    </c:if>
	                    <c:if test="${vo.storeLogo!='temp.jpg'}">
		                    <img alt="#" src='<c:url value="/resources/imgs/StoresImages/${vo.storeLogo}"/>' class="img-fluid item-img w-100">
	                    </c:if>
	                    
	                </a>
	            </div>
	            <div class="p-3 position-relative">
	            	<!-- 카드 바디 -->
	                <div class="list-card-body">
	                   <p class="mb-1 h6">
	                   <span>
	                   		${vo.storeName}
	                   </span>
	                    <c:if test="${vo.couponExist>0}">
	                     	<span class="badge badge-danger float-right">COUPON</span>
	                     </c:if>
	               		<%
		                  	Date d = new Date();
		                  	d.setMonth(d.getMonth()+2);
	                 	%>
	                     <c:set var="newday" value="<%=d%>"/>
	                     <fmt:parseDate var="openday" value="${vo.storeRegdate}" type="DATE" pattern="yyyy-MM-dd"/>
						 <c:if test="${openday<newday}">
			                 <span class="badge badge-warning float-right">NEW</span> 
						 </c:if>
		                </p>
	                    <p class="text-gray mb-2">${vo.storeAddress} ${vo.storeAddressDetail}</p>
		                <p class="text-gray mb-2 time">
		                <span class="bg-light text-dark rounded-sm"><i class="feather-clock"></i>
		                	${vo.storeOpenTime} ~ ${vo.storeCloseTime}
		                 </span>
		                </p>
	               		<p class="text-gray mb-2">
	                    <span class="float-left text-black-50"><fmt:formatNumber value="${vo.storeMinPrice}" pattern="#,###원"/>부터 배달비 무료</span></p>
	                </div>
	                <div class="list-card-badge">
	                	<ul class="rating-stars list-unstyled float-right">
		                    <li>
		                    	<c:forEach var="i" begin="1" end="5">
		                    		<c:if test="${vo.reviewRating>=i}">
		                        		<i class="feather-star star_active"></i>
		                    		</c:if>
		                    		<c:if test="${vo.reviewRating<i}">
		                    			<i class="feather-star"></i>
		                    		</c:if>
		                    	</c:forEach>
		                    </li>
		                </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	</c:forEach>
</div>
</c:if>
