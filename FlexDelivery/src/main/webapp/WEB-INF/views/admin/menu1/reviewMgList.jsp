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
                <h3>리뷰 신고 관리</h3>
                <p class="text-subtitle text-muted">리뷰 신고 관리 페이지입니다. </p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/index.do'/> ">Main</a></li>
                        <li class="breadcrumb-item active" aria-current="page">리뷰 신고 관리 목록</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="card">
            <div class="card-header">
                	리뷰 신고 관리 목록
            </div>
            <div class="card-body">
                <table class='table table-striped' id="table1">
                    <thead>
                        <tr>
                            <th>리뷰번호</th>
                            <th>회원아이디</th>
                            <th>리뷰 등록일</th>
                            <th>점포명</th>
                            <th>리뷰신고일</th>
                            <th>처리상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    <!-- 반복구간 시작 -->
                    <c:if test="${empty list }">
						<tr>
							<td colspan="6" class="align_center">데이터가 존재하지 않습니다.</td>
						</tr>
					</c:if>
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>
									<a href="<c:url value='/admin/menu1/reviewMgDetail.do?no=${vo.reviewNo}'/>" >							
									<p>${vo.reviewNo}</p></a>
								</td>
								<td>
									<a href="<c:url value='/admin/menu1/reviewMgDetail.do?no=${vo.reviewNo}'/>" >
									<p>${vo.memberId}</p></a>								
								</td>
								<td>
									<a href="<c:url value='/admin/menu1/reviewMgDetail.do?no=${vo.reviewNo}'/>" >
									<p><fmt:formatDate value="${vo.reviewRegdate}" pattern="yyyy년 MM월 dd일"/></p></a>
								</td>
								<td>
									<a href="<c:url value='/admin/menu1/reviewMgDetail.do?no=${vo.reviewNo}'/>" >
									<p>${vo.storeName}</p></a>
								</td>
								<td>
									<a href="<c:url value='/admin/menu1/reviewMgDetail.do?no=${vo.reviewNo}'/>" >
									<p><fmt:formatDate value="${vo.reportDate}" pattern="yyyy년 MM월 dd일"/></p></a>
								</td>
								<td>
									<c:if test="${vo.reviewDelFlag == 'N'}">
										<span class="badge bg-success">처리 대기중</span>
									</c:if> 
									<c:if test="${vo.reviewDelFlag == 'Y'}">
										<span class="badge bg-danger">삭제처리</span>
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