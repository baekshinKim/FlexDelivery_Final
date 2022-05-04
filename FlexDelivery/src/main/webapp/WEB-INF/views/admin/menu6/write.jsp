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
			                <th colspan="3">이름</th>
			                <th></th>
			                <th>이미지파일</th>
			              </tr>
			            </thead>
			            <tbody>
			              <tr>
			                <td class="text-bold-500">1</td>
			                <td colspan="3"><input type="text"></td>
			                <td>쉬발~~</td>
			                <td></td>
			              </tr>          
			            </tbody>
			          </table>
			        </div>
			      </div>
			    </div>
			</div>
		</div>
	</div>
</div>
<!-- Hoverable rows end -->


<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>

<!-- script end -->

    