<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/top.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/apexcharts/apexcharts.css">
<br><br>

<div class="main-content container">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>회원  조회 및 현황</h3>
                <p class="text-subtitle text-muted">전체 회원 현황 리스트입니다. </p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/index.do'/> ">Main</a></li>
                        <li class="breadcrumb-item active" aria-current="page">회원 조회/현황</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="card">
            <div class="card-header">
                	회원 현황표
            </div>
            <div class="card-body">
                <table class='table table-striped' id="table1">
                    <thead>
                        <tr>
                            <th>회원ID</th>
                            <th>회원명</th>
                            <th>주   소</th>
                            <th>연락처</th>
                            <th>Email</th>
                            <th>이용상태</th>
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
									<p>${vo.memberId}</p>
								</td>
								<td>
									<p>${vo.memberName}</p>								
								</td>
								<td>
									<p>${vo.memberAddress} ${vo.memberAddressDetail}</p>
								</td>
								<td>
									<p>${vo.memberHp1}-${vo.memberHp2}-${vo.memberHp3}</p>
								</td>
								<td>
									<p>${vo.memberEmail1}@${vo.memberEmail2}</p>
								</td>
								<td><c:if test="${empty vo.memberOutdate}">
										<span class="badge bg-success">이용중</span>
									</c:if> 
									<c:if test="${!empty vo.memberOutdate}">
										<span class="badge bg-danger">이용정지</span>
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
<!-- 
<section class="section">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">점포 현황</h4>
				</div>
				<div class="card-body">
					<div class="divider">
						<div class="divider-text">점포 현황 차트</div>
					</div>
					<div class="row">
						
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<h4>Bar Chart</h4>
								</div>
								<div class="card-body">
									<div id="bar"></div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<h4>Radial Gradient Chart</h4>
								</div>
								<div class="card-body">
									<div id="radialGradient"></div>
								</div>
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>

</section> -->
</div>

<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>   
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>

<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/dayjs/dayjs.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/pages/ui-apexchart.js"></script>

<!-- script end -->



<%@ include file="../../adminInc/bottom.jsp" %>