<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${empty list}">
	<div class='p-3 rounded shadow-sm bg-white col-md-12' style="text-align:center">
		<img src="<c:url value='/resources/imgs/noListDefault.png'/>" class="img-fluid" style="inline-size:45em;">
	</div>
</c:if>

<c:if test="${!empty list}">
	<c:forEach var="vo" items="${list}">
     <div class="col-md-4 mb-3">
         <div class="bg-white shadow-sm rounded p-4">
             <p class="h6 mb-3"><span class="feather-home text-primary"></span><span class="ml-3">${vo.eCouponName}</span></p>
             <p class="font-weight-bold h5 mb-2 text-end"><fmt:formatNumber value="${vo.eCouponDc}" pattern="#,###원" />할인 쿠폰</p>
             <p class="font-weight-bold mb-2 text-end">From : <fmt:formatDate value='${vo.eCouponStartDate}' pattern="yyyy/MM/dd" /> 부터</p>
             <p class="font-weight-bold mb-2 text-end">To : <fmt:formatDate value='${vo.eCouponEndDate}' pattern="yyyy/MM/dd" /> 까지 사용가능</p>
             <p class="my-3 small text-end">최소 주문 금액 <fmt:formatNumber value="${vo.eCouponMin}" pattern="#,###원" /> 이상부터 사용 가능합니다.</p>
             <div class="d-grid gap-2 col-md-4 mx-auto text-end">
             	<a href="<c:url value='/member/coupon/getECoupon.do?eCouponNo=${vo.eCouponNo}'/>" class="btn btn-outline-primary">발급받기</a>
             </div>
         </div>
     </div>
	</c:forEach>
</c:if>
	