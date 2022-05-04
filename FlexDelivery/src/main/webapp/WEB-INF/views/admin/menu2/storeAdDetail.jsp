<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/top.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">

<script type="text/javascript">
	$(function () {
		$('#storeAdAgree').click(function () {
			alert("등록하시겠습니까?");
			location.href = '<c:url value="/admin/menu2/storeAdAgree.do?no=${vo.storeadNo}" />';
			event.preventDefault();
		});
		
		$('#storeAdDeny').click(function () {
			alert("취소하시겠습니까?");
			location.href = '<c:url value="/admin/menu2/storeAdList.do" />';
			event.preventDefault();
		});	
	
	});
</script>
<!-- main start -->
<div class="main-content container" style="width: 75%">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>광고승인 세부조회</h3>
                <p class="text-subtitle text-muted">광고 승인 요청과 관련된 세부 내역입니다.</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/index.do'/> ">Main</a></li>
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/menu2/storeAdList.do'/> ">점포 등록/변경 승인 관리</a></li>
                        <li class="breadcrumb-item active" aria-current="page">점포 등록 세부 조회</li>
                    </ol>
                </nav>
            </div>
        </div>

    </div>

    <!-- // Basic multiple Column Form section start -->
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title" >광고 요청 내역 </h4>
                        <h4 class="card-title" >[접수번호 : ${vo.storeadNo},&nbsp &nbsp &nbsp 
                        	접수등록일 : <fmt:formatDate value="${vo.storeadRegdate}" pattern="yyyy년 MM월 dd일     HH시 MM분"/> ]</p></h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="shopName">점포명</label>
                                            <input type="text" id="shopName" class="form-control" name="shopName"
                                                value="${vo.storeName }" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="storeAddress">점포주소</label>
                                            <input type="text" id="storeAddress" class="form-control" name="storeAddress"
                                                value="${vo.storeAddress}  ${vo.storeAddressDetail}" disabled="disabled">
                                        </div>
                                    </div>                                
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="adName" >신청광고명</label>
                                            <input type="text" id="adName" class="form-control" value="${vo.advertiseName}"
                                                name="adName" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="adPrice">신청광고가격</label>
                                            <p id="adPrice" class="form-control" name="adPrice" >
                                            	<fmt:setLocale value="ko_KR" />
                                           		<fmt:formatNumber pattern="#,###원" value="${vo.advertisePrice}"/>
                                           	</p>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="adValidate">광고만료일</label>
                                            <c:if test="${!empty vo.adValidate }">
                                            	<p id="adValidate" class="form-control" name="adValidate">
                                               		${fn:substring(vo.adValidate,0,4)}년 ${fn:substring(vo.adValidate,5,7)}월 ${fn:substring(vo.adValidate,8,10)}일 </p>
                                            </c:if>
                                            <c:if test="${empty vo.adValidate }">
                                            	<p id="adValidate" class="form-control" name="adValidate">- </p>
                                            </c:if>
                                            
                                        </div>
                                    </div>
                                    <!-- 요청사항 -->
                                    <!-- 요청사항 끝 -->
                                    <c:if test="${empty vo.adValidate}">
                                    	<div class="col-12 d-flex justify-content-end">
                         					<input type="submit" id="storeAdAgree" class="btn btn-primary mr-1 mb-1" value="승인">
                                       		<button id="storeAdDeny" class="btn btn-danger mr-1 mb-1">취소</button>
                                   		</div>
                                    </c:if>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- // Basic multiple Column Form section end -->
</div>

<!-- main end -->

<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>   
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->
<%@ include file="../../adminInc/bottom.jsp" %>