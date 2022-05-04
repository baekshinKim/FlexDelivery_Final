<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../adminInc/top.jsp" %>    
	
<!-- css start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
   
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<!-- css end -->

<div class="container">
	<div class="row">
	
		<div class="buttons">
	        <a href="#" class="btn btn-secondary round">Secondary</a>
	        <a href="#" class="btn btn-info round">Info</a>
	        <a href="#" class="btn btn-warning round">Warning</a>
	        <a href="#" class="btn btn-success round">Success</a>
	        <a href="#" class="btn btn-light round">Light</a>
	    </div>
	    
		<!-- Hoverable rows start -->
		<div class="row" id="table-hover-row">
  			<div class="col-12">
    			<div class="card">
					<div class="card-header">
						<h4 class="card-title">오늘 뭐 먹지? - 랜덤 추천</h4>
					</div>
					<div class="card-content">
						<div class="card-body">
						   
						</div>
  
						<a href="#" class="btn btn-dark round">등록</a>
						<!-- table hover -->
 						<div class="table-responsive">
							<table class="table table-hover mb-0">
								<thead>
							    <tr>
							      <th>번호</th>
							      <th colspan="3">대분류</th>
							
							      <th>중분류</th>
							      <th>노출 회수 </th>
							      <th>비고</th>
							    </tr>
								</thead>
								<tbody>
							    <tr>
							      <td class="text-bold-500">1</td>
							      <td colspan="3">한식</td>
							      <td>찌개</td>
							      <td><span class="badge bg-warning badge-pill badge-round ml-1">8</span></td>
							      <td></td>
							    </tr>
							    <tr>
							      <td class="text-bold-500">2</td>
							      <td colspan="3">한식</td>
							      <td>탕</td>
							      <td><span class="badge bg-info badge-pill badge-round ml-1">7</span></td>
							      <td><a href="#"><i
							            class="badge-circle badge-circle-light-secondary font-medium-1" data-feather="mail"></i></a></td>
							    </tr>
							    <tr>
							      <td class="text-bold-500">3</td>
							      <td colspan="3">양식</td>
							      <td>스테이크</td>
							      <td><span class="badge bg-danger badge-pill badge-round ml-1">6</span></td>
							      <td></td>
							    </tr>
							    <tr>
							      <td class="text-bold-500">4</td>
							      <td colspan="3">양식</td>
							      <td>파스타</td>
							      <td><span class="badge bg-secondary badge-pill badge-round ml-1">5</span></td>
							      <td><a href="#"><i
							            class="badge-circle badge-circle-light-secondary font-medium-1" data-feather="mail"></i></a></td>
							    </tr>
							    
								</tbody>
							</table>
						</div>
						<!-- table hover -->
					</div>
				</div>
			</div>
		</div>
		<!-- Hoverable rows end -->
		
		
		
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

<%@include file="../../adminInc/bottom.jsp" %>    
    