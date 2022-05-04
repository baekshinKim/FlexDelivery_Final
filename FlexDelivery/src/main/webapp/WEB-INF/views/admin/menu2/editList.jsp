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
                <h3>점포 변경 관리</h3>
                <p class="text-subtitle text-muted">점포 등록 변경 관리 페이지입니다. </p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/index.do'/> ">Main</a></li>
                        <li class="breadcrumb-item active" aria-current="page">점포 변경 관리</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="card">
            <div class="card-header">
                	변경 관리 현황표
            </div>
            <div class="card-body">
                <table class='table table-striped' id="table1">
                    <thead>
                        <tr>
                            <th>접수번호</th>
                            <th>점포명</th>
                            <th>점주명</th>
                            <th>연락처</th>
                            <th>지역</th>
                            <th>승인상태</th>
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
									<a href="<c:url value='/admin/menu2/editDetail.do?no=${vo.tNo}&sNo=${vo.storeNo }'/>" >							
									<p>${vo.tNo}</p></a>
								</td>
								<td>
									<a href="<c:url value='/admin/menu2/editDetail.do?no=${vo.tNo}&sNo=${vo.storeNo }'/>" >
									<p>${vo.tStoresName}</p></a>								
								</td>
								<td>
									<a href="<c:url value='/admin/menu2/editDetail.do?no=${vo.tNo}&sNo=${vo.storeNo }'/>" >
									<p>${vo.tOwnerName}</p></a>
								</td>
								<td>
									<a href="<c:url value='/admin/menu2/editDetail.do?no=${vo.tNo}&sNo=${vo.storeNo }'/>" >
									<p>${vo.tOwnerHp1}-${vo.tOwnerHp2}-${vo.tOwnerHp3}</p></a>
								</td>
								<td>
									<a href="<c:url value='/admin/menu2/editDetail.do?no=${vo.tNo}&sNo=${vo.storeNo }'/>" >
									<p>${vo.tStoresAddress} ${vo.tStoresAddressDetail}</p></a>
								</td>
								<td><c:if test="${vo.aAgreeNo == 5}">
										<span class="badge bg-light">변경대기</span>
									</c:if> 
									<c:if test="${vo.aAgreeNo == 6}">
										<span class="badge bg-success">변경완료</span>
									</c:if>
									<c:if test="${vo.aAgreeNo == 7}">
										<span class="badge bg-danger">변경반려</span>
									</c:if>
								</td>
							</tr>
						</c:forEach>
						<!-- 반복구간 끝 -->
                    </tbody>
                </table>
            </div>
        </div>
		<form id="excelFrm" name="excelFrm" method="post" enctype="multipart/form-data">
    		<button type="button" class="badge bg-success" onclick="doExcelDownloadProcess()">LIST 엑셀다운로드</button>
		</form>
    </section>
</div>

<!-- script start -->
<script type="text/javascript">    
    function doExcelDownloadProcess(){
        var f = document.excelFrm;
        f.action = "editDownloadExcel.do";
        f.submit();
    }
</script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>   
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->



<%@ include file="../../adminInc/bottom.jsp" %>