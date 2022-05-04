<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../ownerInc/top.jsp"%>
<!-- CSS start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/oneToOne.css" />
<!-- CSS end -->
<div class="container">
	<div class="row">
		<div class="main-content container-fluid">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>1:1 문의하기 상세보기</h3>
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
								<a class="nav-link active" data-toggle="tab" href="#qwe">1:1 문의글 상세보기 </a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="qwe">
								<br> 
								<input type="hidden" name="askNo" value="${vo.askNo}">
								<input type="hidden" name="askContent" value="${vo.askContent}">
								<input type="hidden" name="askTitle" value="${vo.askTitle}">
								<div class="form-body">
									<div class="row">
										<div class="col-md-4"></div>
										<div class="col-md-8 form-group">
											<label>제목</label>
											<p>${vo.askTitle }</p>
										</div>
										<div class="col-md-4"></div>
										<div class="col-md-8 form-group">
											<label>내용</label>
											<p>${vo.askContent }</p>
										</div>
										<div class="col-12 col-md-8 offset-md-4 form-group">
											<div class='form-check'>
												<div class="checkbox">
													<label for="checkbox1">답변을 받기 이전에는 '수정하기' 버튼을 눌러
														수정이 가능합니다.</label>
												</div>
											</div>
										</div>
									</div>
								<c:if test="${!empty reVo.askContent }">
									<div class="row">
										<div class="col-md-4"></div>
										<div class="col-md-8 form-group">
											<label>Re : </label>
											<p>${reVo.askTitle }</p>
										</div>
										<div class="col-md-4"></div>
										<div class="col-md-8 form-group">
												<label>답변 내용</label>
											<p>${reVo.askContent }</p>
										</div>
										<div class="col-12 col-md-8 offset-md-4 form-group">
										</div>
									</div>		
									</c:if>
									<div class="col-12 col-md-8 offset-md-4 form-group">
										<c:if test="${vo.askReplyflag =='N' }">
											<a href="<c:url value='/owner/menu5/OneToOneEdit.do?askNo='/>${vo.askNo}" class="btn btn-primary mr-1 mb-1" id="btEdit">수정</a>
										</c:if>
											<a href="<c:url value='/owner/menu5/oneToOne.do'/>" class="btn btn-primary mr-1 mb-1">목록 </a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>
<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->
<%@include file="../../ownerInc/bottom.jsp"%>