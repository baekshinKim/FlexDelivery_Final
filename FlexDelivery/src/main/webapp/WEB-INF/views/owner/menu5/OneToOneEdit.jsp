<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../ownerInc/top.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/oneToOne.css" />
<div class="container">
	<div class="row">
		<div class="main-content container-fluid">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>1:1 문의글 수정하기</h3>
						<p class="text-subtitle text-muted">사장님의 궁금증을 명쾌하게 해결해 드립니다.</p>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="card">
					<div class="card-header"></div>
					<div class="card-body">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#qwe">1:1 문의글 수정하기 </a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="qwe">
								<br>
								<form class="form form-horizontal" method="POST" name="frm1" action="<c:url value='/owner/menu5/OneToOneEdit.do'/>">
									<input type="hidden" name="askNo" value="${vo.askNo}">
									<div class="form-body">
										<div class="row">
											<div class="col-md-4"></div>
											<div class="col-md-8 form-group">
												<label>제목</label> 
												<input type="text" id="askTitle" class="form-control" name="askTitle" value="${vo.askTitle}">
											</div>
											<div class="col-md-4"></div>
											<div class="col-md-8 form-group">
												<label>내용</label>
												<textarea id="askContent" class="form-control" name="askContent" style="height: 120px;">${vo.askContent }</textarea>
											</div>
											<div class="col-12 col-md-8 offset-md-4 form-group">
												<div class='form-check'>
													<div class="checkbox">
														<input type="checkbox" id="checkbox1"
															class='form-check-input' checked> <label
															for="checkbox1">[필수] 개인정보 수집 및 이용에 동의합니다.</label>
													</div>
												</div>
											</div>
											<div class="col-sm-12 d-flex justify-content-end">
												<input type="submit" class="btn btn-primary" id="btEdit" value="수정 하기">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<%@include file="../../ownerInc/bottom.jsp"%>