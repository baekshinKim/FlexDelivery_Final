<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>광고 신청 상세 보기 </title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
	  <script src="${pageContext.request.contextPath}/resources/ownerResources/herbJs/jquery-3.5.1.min.js"></script>
	<style type="text/css">
		html {overflow-x:hidden;}
		.btn-dark {
	    color: #fff;
	    background-color: #222f3e;
	    border-color: #222f3e;
	}
	</style>
    <script src="${pageContext.request.contextPath}/resources/adminResources/js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
    $(function(){
		$('#btclose').click(function(){
				self.close();
		});
	});
	</script>
</head>	
		<div></div>
		<br>
		<br>
		<br>
		<div class="row">
				<div class="col-md-3 col-sm-12"></div>
				<div class="col-md-6 col-sm-12">
				      		<div class="text-center">
				       			<h4> 광고 신청 정보 상세보기  </h4>
				       	   	 </div>
				       	   		<div class="row" id="basic-table">
						          <!-- Table with outer spacing -->
						          <div class="table-responsive"  style="overflow-x: hidden;">
						            <table class="table table-striped">
						              <tbody>
						                <tr class="text-center">
							                  <th class="text-bold-500" >광고 번호  </th>
							                  <td>${adVo.storeadNo}</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500" >신청일 </th>
							                  <td>${adVo.storeadRegdate}</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500"  >만기일  </th>
							                  <td>${adVo.adValidate}</td>
						                </tr>
						              </tbody>
						            </table>
						          </div>
						       </div>
				       	   <!-- 끝  -->
				       	   <div class="text-center" style="margin-top:14px;">
				       	   	 <button class="btn btn-dark block" id="btclose"  name="btclose">확인</button>
				       	   </div>
				       </div>
				   </div>
				<div class="col-md-3 col-sm-12"></div>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/pages/dashboard.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
</body>
</html>
    	