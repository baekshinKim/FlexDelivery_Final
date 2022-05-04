<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp" %>    
<!-- CSS start -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon"> --%>
<!-- CSS end --> 

<script type="text/javascript" src="<c:url value='/resources/memberResources/vendor/jquery/jquery.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js' />"></script>


<div class="container">
	<div class="row">
		<div class="main-content container-fluid">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>1:1 문의내역</h3>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="tab-content">
					<div class="tab-pane fade show active" id="qwe">
						<br>
						
							<div class="form-body">
								<div class="row">
									<div class="col-md-1" style=" text-align: center">
										<label>제목</label>
									</div>
									<div class="col-md-11 form-group">
										<input type="text" class="form-control" id="askTitle" name="askTitle" placeholder="문의글 제목을 입력하세요">
									</div>
									<div class="col-md-1" style=" text-align: center">
										<label>내용</label>
									</div>
									<div class="col-md-11 form-group">
										<textarea class="form-control" id="askContent" name="askContent" 
										style="height: 120px;">${vo1.askContent }</textarea>
									</div>
									<div class="col-md-1" style=" text-align: center">
										<label>답변 내용</label>
									</div>
									<div class="col-md-11 form-group">
										<textarea class="form-control" id="askReply" name="askContent" placeholder="답변이 등록되지 않았습니다." style="height: 120px;"><c:if test="${vo2==null }">답변이 등록되지 않았습니다</c:if><c:if test="${vo2!=null }">${vo2.askContent }</c:if></textarea>
									</div>
								</div>
							</div>
							<input type ="hidden" name="askId" id="askId" value="${sessionScope.memberId}">
							<input type ="hidden" name="authorityNo" id="authorityNo" value="${sessionScope.authorityNo}">
					</div>
				</div>
			</section>
		</div>
	</div>
</div>

<!-- script start -->   
<%-- <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script> --%>
<!-- script end -->
<%@include file="../../memInc/bottom.jsp" %>    