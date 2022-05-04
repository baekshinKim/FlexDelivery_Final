<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp"%>
<div class="osahan-favorites">
    <div class="d-none">
        <div class="bg-primary border-bottom p-3 d-flex align-items-center">
            <a class="toggle togglew toggle-2" href="#"><span></span></a>
            <h4 class="font-weight-bold m-0 text-white">Favorites</h4>
        </div>
    </div>
   	<c:if test="${empty list}">
   	
	   	<div class="container most_popular py-5">
		   	<div class="bg-white p-3 mb-3 restaurant-detailed-ratings-and-reviews shadow-sm rounded">
		   		<h2 class="font-weight-bold mb-3">찜한 가게</h2>	
		   		<div class="row" style="text-align: center">
			   		<div class="col-md-12 mb-3">
			   			<img alt="" class="img-fluid" src="<c:url value='/resources/imgs/noListDefault.png'/>" style="min-width:439px">
			   		</div>
		   		</div>
		   	</div>
		</div>
   	</c:if>
    <!-- Most popular -->
	<c:if test="${!empty list}" >
	    <div class="container most_popular py-5">
	        <h2 class="font-weight-bold my-5">찜한 가게</h2>
	        <div class="row  justify-content-center align-items-center">
	        	<c:forEach var="vo" items="${list}">
		            <div class="col-md-4 col-6 mb-3">
		                <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm grid-card">
		                    <div class="list-card-image">
		                        <div class="star position-absolute"><span class="badge badge-success"><i class="feather-star"></i> ${vo.reviewRating} (${vo.reviewCount})</span></div>
		                        <div class="favourite-heart text-danger position-absolute"><i class="feather-heart"></i></div>
		                        <c:if test="${vo.sStatusNo==2}">
					                <div class="member-plan position-absolute"><span class="badge badge-primary">영업중</span></div>
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
				                     	<span class="badge badge-danger float-right">coupon</span>
				                     </c:if>
				               		<%
					                  	Date d = new Date();
					                  	d.setMonth(d.getMonth()+2);
				                 	%>
				                     <c:set var="newday" value="<%=d%>"/>
				                     <fmt:parseDate var="openday" value="${vo.storeRegdate}" type="DATE" pattern="yyyy-MM-dd"/>
									 <c:if test="${openday<newday}">
						                 <span class="badge badge-warning float-right">new</span> 
									 </c:if>
					                </p>
				                    <p class="text-gray mb-2">${vo.storeAddress} ${vo.storeAddressDetail}</p>
					                <p class="text-gray mb-2 time">
					                <span class="bg-light text-dark rounded-sm"><i class="feather-clock"></i>
					                	${vo.storeOpenTime} ~ ${vo.storeCloseTime}
					                 </span>
					                </p>
				               		<p class="text-gray mb-2">
				                    <span class="float-left text-black-50"><fmt:formatNumber value="${vo.storeMinPrice}" type="currency"/>부터 배달가능</span></p>
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
	    </div>
	</c:if>
</div>
            

<%@include file="../../memInc/bottom.jsp"%>