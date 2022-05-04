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

<div class="main-content container" style="width: 75%">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>회원 조회 및 현황</h3>
				<p class="text-subtitle text-muted">전체 회원 현황 리스트입니다.</p>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb" class='breadcrumb-header'>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="<c:url value='/admin/main.do'/> ">Main</a></li>
						<li class="breadcrumb-item active" aria-current="page">회원
							조회/현황</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>

	<!-- 등급기준현황표 시작 -->
	<div class="row" id="basic-table">
		<div class="col-12 col-md-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">등급기준현황</h4>
				</div>
				<div class="card-content">
					<div class="card-body">
						<!-- Table with outer spacing -->
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>등급명</th>
										<th>승급기준(이용횟수/월)</th>
										<th>쿠폰갯수(개/월)</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-bold-500">웰컴</td>
										<td>-</td>
										<td class="text-bold-500">-</td>

									</tr>
									<tr>
										<td class="text-bold-500">패밀리</td>
										<td>5회</td>
										<td class="text-bold-500">1개</td>

									</tr>
									<tr>
										<td class="text-bold-500">엘리트</td>
										<td>10회</td>
										<td class="text-bold-500">2개</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 등급기준 현황표 끝 -->
	<!-- 등급기준 변경 시작 -->
    <section class="input-group-select">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">등급 기준 변경</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4 mb-2">
                                    <h6>등급명</h6>
                                    <div class="input-group mb-3">
                                        <label class="input-group-text" for="inputGroupSelect01">Options</label>
                                        <select class="form-select" id="inputGroupSelect01">
                                            <option selected>Choose...</option>
                                            <option value="1">웰컴</option>
                                            <option value="2">패밀리</option>
                                            <option value="3">엘리트</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-2">
                                    <h6>승급기준(이용횟수/월)</h6>
                                    <div class="input-group mb-3">
                                        <label class="input-group-text" for="inputGroupSelect01">Options</label>
                                        <select class="form-select" id="inputGroupSelect01">
                                            <option selected>Choose...</option>
                                            <option value="0">-</option>
                                            <option value="1">1회</option>
                                            <option value="2">2회</option>
                                            <option value="3">3회</option>
                                            <option value="4">4회</option>
                                            <option value="5">5회</option>
                                            <option value="6">6회</option>
                                            <option value="7">7회</option>
                                            <option value="8">8회</option>
                                            <option value="9">9회</option>
                                            <option value="10">10회</option>
                                            <option value="11">11회</option>
                                            <option value="12">12회</option>
                                            <option value="13">13회</option>
                                            <option value="14">14회</option>
                                            <option value="15">15회</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-2">
                                    <h6>쿠폰갯수(개/월)</h6>
                                    <div class="input-group mb-3">
                                        <label class="input-group-text" for="inputGroupSelect01">Options</label>
                                        <select class="form-select" id="inputGroupSelect01">
                                            <option selected>Choose...</option>
                                            <option value="0">-</option>
                                            <option value="1">1개</option>
                                            <option value="2">2개</option>
                                            <option value="3">3개</option>
                                            <option value="4">4개</option>
                                            <option value="5">5개</option>
                                            <option value="6">6개</option>
                                            <option value="7">7개</option>
                                            <option value="8">8개</option>
                                            <option value="9">9개</option>
                                            <option value="10">10개</option>
                                            <option value="11">11개</option>
                                            <option value="12">12개</option>
                                            <option value="13">13개</option>
                                            <option value="14">14개</option>
                                            <option value="15">15개</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-start">
                                	<button type="submit" class="btn btn-primary mr-1 mb-1">승인</button>
                                	<button type="reset" class="btn btn-danger mr-1 mb-1">back</button>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Bootstrap Select end -->
	<!-- 등급기준 변경 끝 -->
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