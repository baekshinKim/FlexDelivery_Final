<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp" %>
<div class="d-none">
    <div class="bg-primary p-3 d-flex align-items-center">
        <a class="toggle togglew toggle-2" href="#"><span></span></a>
        <h4 class="font-weight-bold m-0 text-white">주문성공!</h4>
    </div>
</div>
<div class="py-5 osahan-coming-soon d-flex justify-content-center align-items-center">
    <div class="col-md-6">
        <!-- continue -->
        <div class="bg-white rounded text-center p-4 shadow-sm">
            <img alt="" src="<c:url value='/resources/imgs/orderSuccessDefault2.png'/>" class="img-fluid mb-2" style="min-width: 90%">
            <h6 class="font-weight-bold mb-2">고객님의 주문이 요청되었습니다!</h6>
            <p class="small text-muted">매장에서 주문이 접수되면 주문내역에서 확인할 수 있습니다</p>
            <a href="<c:url value='/member/order/orderList.do'/>" class="btn rounded btn-primary btn-lg btn-block">주문내역 확인</a>
            <a href="<c:url value='/member/index.do'/>" class="btn rounded btn-light btn-lg btn-block">홈으로</a>
        </div>
    </div>
</div>
<%@include file="../../memInc/bottom.jsp"%>