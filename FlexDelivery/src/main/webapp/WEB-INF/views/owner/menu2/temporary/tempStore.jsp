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
    <title>점포 입점 신청 상세 보기 </title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
	  <script src="${pageContext.request.contextPath}/resources/ownerResources/herbJs/jquery-3.5.1.min.js"></script>
	<style type="text/css">
		html {overflow-x:hidden;}
	</style>
	
	<!-- 클릭시 및 페이지 이동 -->
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="${pageContext.request.contextPath}/resources/adminResources/js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
    $(function(){
		$('#btclose').click(function(){
				self.close();
		});
	});
	</script>
</head>	
		<!-- 메뉴 컨텐츠 내용 br 바꾸기 -->
		<div></div>
		<br>
		<br>
		<br>
		<div class="row">
				<div class="col-md-3 col-sm-12"></div>
				<div class="col-md-6 col-sm-12">
				<!-- 메뉴에 관한 내용 -->
				<div class="card" >
				      <div class="card-body">
				      		<div class="text-center">
				       			<h4> 사업자 정보 상세보기  </h4>
				       	   	 </div>
				       	   <!-- 그룹에 관한 내용(테이블) -->
				       	   		<div class="row" id="basic-table">
						          <!-- Table with outer spacing -->
						          <div class="table-responsive"  style="overflow-x: hidden;">
						            <table class="table">
						              <tbody>
						                <tr>
						                	<td colspan="4" class="text-center">
						                	<c:set var="type" value="${type }"></c:set> 
						                		<c:if test="${type=='file'}">
						                			<img src
														="<c:url value='/resources/imgs/StoresImages/${stVo.storeLogo}'/>" 
														alt="${stVo.menuName }" style="height:250px; width:80%;"  class="thumbnail">
												</c:if>
												<c:if test="${type=='url'}">
				 		               				<img src="<c:url value='/resources/imgs/StoresImages/${stVo.storeLogo}'/>"  style="height:250px; width:80%;"
		       											 alt="${stVo.storeLogo }" class="thumbnail">
		       									</c:if>
				                			</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500" >점포명  </th>
							                  <td>${stVo.storeName}</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500"  >점포 주소 </th>
							                  <td>${stVo.storeAddress}</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500">상세 주소 </th>
							                  <td>${stVo.storeAddressDetail}</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500">점포 지역명 </th> <!-- 나중에 네임으로 다 바꾸기  -->
							                  <td>${stVo.locationName}</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500"> 메뉴 대분류 </th>
							                  <td>${stVo.lCategoryName}</td>
						                </tr>
						              </tbody>
						            </table>
						          </div>
						       </div>
				       	   <!-- 끝  -->
				       	     <div class="text-center">
				       	   	 <button class="btn btn-primary block" id="btclose"  name="btclose">확인</button>
				       	     </div>
				       </div>
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
    	