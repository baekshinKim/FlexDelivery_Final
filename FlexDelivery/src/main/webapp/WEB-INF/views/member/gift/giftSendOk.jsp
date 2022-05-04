<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp" %>    
<div class="d-none">
    <div class="bg-primary border-bottom p-3 d-flex align-items-center mb-4">
        <a class="toggle togglew toggle-2" href="#"><span></span></a>
        <h4 class="font-weight-bold m-0 text-white">선물하기</h4>
    </div>
</div>
<div class="location-page container">
    <div class="d-flex align-items-center justify-content-center flex-column py-5">
        <img alt="#" src="<c:url value='/resources/memberResources/img/location.png' />" class="img-fluid" alt="Responsive image">
        <div class="px-4 text-center mt-4">
            <h5 class="text-dark">선물을 성공적으로 FLEX 했습니다!</h5>
            <a href="<c:url value='/member/index.do' />" class="btn btn-lg btn-primary btn-block my-4"><i class="feather-navigation"></i> 홈으로</a>
            <a href="<c:url value='/member/gift/myGift.do'/>" class="btn btn-lg btn-light btn-block my-4">선물함으로 이동 <i class="feather-arrow-right"></i></a>
        </div>
    </div>
</div>
<%@include file="../../memInc/bottom.jsp" %>    