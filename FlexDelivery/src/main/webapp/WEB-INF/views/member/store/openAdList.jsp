<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${!empty list}">
	<c:forEach var="vo" items="${list}">
		<div class="col-md-3 col-6 pb-3">
		    <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
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
		            <div class="list-card-body">
		                <p class="mb-1 h6">
	                   <span>
	                   	${vo.storeName}
	                   </span>
	                    <c:if test="${vo.couponExist>0}">
	                     	<span class="badge badge-danger sm float-right">COUPON</span>
	                     </c:if>
	               		<%
		                  	Date d = new Date();
		                  	d.setMonth(d.getMonth()+2);
	                 	%>
	                     <c:set var="newday" value="<%=d%>"/>
	                     <fmt:parseDate var="openday" value="${vo.storeRegdate}" type="DATE" pattern="yyyy-MM-dd"/>
						 <c:if test="${openday<newday}">
			                 <span class="badge badge-sm-warning float-right">NEW</span> 
						 </c:if>
		                </p>
		                <p class="text-gray mb-1 small">${vo.storeAddress} ${vo.storeAddressDetail}</p>
	               		<p class="text-gray mb-2">
	                    <span class="float-left text-black-50"><fmt:formatNumber value="${vo.storeMinPrice}" pattern="#,###원"/>부터</span></p>
		            </div>
		        </div>
		    </div>
		</div>
	</c:forEach>
</c:if>
<c:if test="${empty list}">
	<div class="col-md-12 pb-12" style="text-align: center">
		<div class="bg-white p-3 h-100 rounded overflow-hidden position-relative shadow-sm">
	        <img alt="" class="img-fluid" src="<c:url value='/resources/imgs/noListDefault.png'/>" style="inline-size: 30em">
		</div>
	</div>
</c:if>