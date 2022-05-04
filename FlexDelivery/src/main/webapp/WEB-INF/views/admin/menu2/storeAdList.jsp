<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInc/top.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<br><br>

<div class="main-content container">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>점포 광고 승인 관리</h3>
                <p class="text-subtitle text-muted">점포 광고 승인/변경 관리 페이지입니다. </p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/main.do'/> ">Main</a></li>
                        <li class="breadcrumb-item active" aria-current="page">광고 승인 관리</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="card">
            <div class="card-header">
                	광고 승인/변경  현황표
            </div>
            <div class="card-body">
                <table class='table table-striped' id="table1">
                    <thead>
                        <tr>
                            <th>광고접수번호</th>
                            <th>신청광고명</th>
                            <th>점포명</th>
                            <th>결제여부</th>
                            <th>광고접수일</th>
                            <th>승인상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    <!-- 반복구간 시작 -->
                    <c:if test="${empty list }">
						<tr>
							<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
						</tr>
					</c:if>
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>
									<a href="<c:url value='/admin/menu2/storeAdDetail.do?no=${vo.storeadNo}'/>" >							
									<p>${vo.storeadNo}</p></a>
								</td>
								<td>
									<a href="<c:url value='/admin/menu2/storeAdDetail.do?no=${vo.storeadNo}'/>" >
									<p>${vo.advertiseName}</p></a>								
								</td>
								<td>
									<a href="<c:url value='/admin/menu2/storeAdDetail.do?no=${vo.storeadNo}'/>" >
									<p>${vo.storeName}</p></a>
								</td>
								<td>
									<a href="<c:url value='/admin/menu2/storeAdDetail.do?no=${vo.storeadNo}'/>" >
									<c:if test="${vo.adPayFlag == 'Y' }">
										<p>결제완료</p></a>
									</c:if>
									<c:if test="${vo.adPayFlag == 'N' }">
										<p>미결제</p></a>
									</c:if>									
								</td>								
								<td>
									<a href="<c:url value='/admin/menu2/storeAdDetail.do?no=${vo.storeadNo}'/>" >
									<p><fmt:formatDate value="${vo.storeadRegdate}" pattern="yyyy년 MM월 dd일"/></p></a>
								</td>
								<td>
									<c:if test="${empty vo.adValidate}">
										<span class="badge bg-light">승인대기</span>
									</c:if>
									<c:if test="${!empty vo.adValidate}">
										<span class="badge bg-success">승인완료</span>
									</c:if>
								</td>
							</tr>
						</c:forEach>
                        
                    <!-- 반복구간 끝 -->
                    </tbody>
                </table>
            </div>
        </div>

    </section>
</div>

<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>   
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->


<%@ include file="../../adminInc/bottom.jsp" %>