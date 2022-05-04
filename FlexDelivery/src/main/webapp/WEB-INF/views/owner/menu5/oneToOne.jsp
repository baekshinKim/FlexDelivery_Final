<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<h3>1:1 문의하기</h3>
						<p class="text-subtitle text-muted">사장님의 궁금증을 명쾌하게 해결해 드립니다.</p>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="card">
					<div class="card-header"></div>
					<div class="card-body">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#qwe">1:1 문의하기</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="qwe">
								<br>
								<form class="form form-horizontal" method="POST" name="frm1" action="<c:url value='/owner/menu5/oneToOneWrite.do'/>">
									<div class="form-body">
										<div class="row">
											<div class="col-md-4"></div>
											<div class="col-md-8 form-group">
												<label>제목</label> 
												<input type="text" id="askTitle" class="form-control" name="askTitle" placeholder="문의글 제목을 입력하세요">
											</div>
											<div class="col-md-4"></div>
											<div class="col-md-8 form-group">
												<label>내용</label>
												<textarea id="askContent" class="form-control" name="askContent" placeholder="문의글 내용을 입력하세요" style="height: 120px;"></textarea>
											</div>
											<div class="col-12 col-md-8 offset-md-4 form-group">
												<div class='form-check'>
													<div class="checkbox">
														<input type="checkbox" id="checkbox1" class='form-check-input' checked> 
														<label for="checkbox1">[필수] 개인정보 수집 및 이용에 동의합니다.</label>
													</div>
												</div>
											</div>
											<div class="col-sm-12 d-flex justify-content-end">
												<input type="submit" class="btn btn-primary mr-1 mb-1" id="btAsk" value="문의하기">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="tab-pane fade show active" id="qwe">
							<!--  -->
							<br>
							<!-- Hoverable rows start -->
							<div class="row" id="table-hover-row">
								<div class="col-12">
									<div class="card">
										<div class="card-content">
											<!-- table hover -->
											<div class="table-responsive">
												<table class="table table-hover mb-0">
													<thead>
														<tr>
															<th>번호</th>
															<th colspan="3">제목</th>
															<th></th>
															<th>등록일시</th>
															<th>상태</th>
															<th>취소하기</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${!empty list}">
															<c:forEach var="vo" items="${list}">
																<tr>
																	<td class="text-bold-500">${vo.askNo}</td>
																	<td colspan="3">
																		<a href="<c:url value='/owner/menu5/OneToOneDetail.do?askNo=${vo.askNo}'/>"> ${vo.askTitle } </a>
																	</td>
																	<td></td>
																	<td>${vo.askRegdate}</td>
																	<c:if test="${vo.askReplyflag =='Y'}">
																		<td><span class="badge bg-success">답변완료</span></td>
																	</c:if>
																	<c:if test="${vo.askReplyflag == 'N'}">
																		<td><span class="badge bg-danger">미답변</span></td>
																	</c:if>
																	<td>
																		<span class="badge bg-dark"> 
																			<a href="#" id="btDel" onclick="deleteFunc(${vo.askNo})" style="color:white;">취소</a>
																		</span>
																	</td>
																</tr>
															</c:forEach>
														</c:if>
													</tbody>
												</table>
												<!-- 페이지 시작-->
												<div class="card-body">
													<nav aria-label="Page navigation example">
														<ul class="pagination pagination-primary justify-content-center">
															<!-- 페이지 번호 추가 -->
															<c:if test="${pagingInfo.firstPage>1 }">
																<li class="page-item">
																	<a class="page-link" href="#" aria-label="Previous" onclick="pageFunc(${pagingInfo.firstPage-1})"> 
																		<span aria-hidden="true">&laquo;</span>
																	</a>
																</li>
															</c:if>
															<!-- [1][2][3][4][5][6][7][8][9][10] -->
															<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
																<c:if test="${i==pagingInfo.currentPage }">
																	<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
																</c:if>
																<c:if test="${i!=pagingInfo.currentPage }">
																	<li class="page-item">
																		<a class="page-link" href="#" onclick="pageFunc(${i})">${i}</a>
																	</li>
																</c:if>
															</c:forEach>
															<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
																<li class="page-item">
																	<a class="page-link" href="#" aria-label="Previous" onclick="pageFunc(${pagingInfo.lastPage+1})"> 
																		<span aria-hidden="true">&raquo;</span>
																	</a>
																</li>
															</c:if>
														</ul>
													</nav>
												</div>
												<br> <br> <br>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- card  -->
				</div>
			</section>
		</div>
	</div>
</div>
<!--  -->
<!--  -->
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#askTitle').focus();
	$('#btAsk').click(function(){
		if($('#askTitle').val().length<1){
			alert('문의글 제목을 입력하세요');
			$('#askTitle').focus();
			event.preventDefault();
		}else if($('#askContent').val().length<1){
			alert('문의하실 내용을 입력하세요');
			$('#askContent').focus();
			event.preventDefault();
		}else if(!$('#checkbox1').is(":checked")){
			alert('개인 정보 수집 이용에 동의하셔야 합니다.');
			$('#checkbox').focus();
			event.preventDefault();
		}else{
			alert('일대일 문의 등록이 완료되었습니다.');
			location.href = '<c:url value="/owner/menu5/oneToOne.do"/>';
		}
	});
});
	function deleteFunc(askNo){
		if(!confirm('취소하시겠습니까?')){
		event.preventDefault();
		}else{
		location.href = '<c:url value="/owner/menu5/oneToOneDelete.do?askNo="/>'+askNo;
		}
	}
</script>
<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->
<%@include file="../../ownerInc/bottom.jsp"%>