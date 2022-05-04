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
    <title>상세 메뉴 확인</title>
    
 

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
		$('#btMenuCheck').click(function(){
				self.close();
		});
	});
	
	</script>
</head>	
		<!-- 메뉴 컨텐츠 내용 br 바꾸기 -->
		<c:set var="content" 
			value="${fn:replace(menuAllVo.menuContent, newLine,'<br>') }" />

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
				       			<h4> 메 뉴 상 세 보 기 </h4>
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
														="<c:url value='/resources/imgs/MenuImages/${menuAllVo.menuImg}'/>" 
														alt="${menuAllVo.menuName }" style="height:250px; width:80%;">
												</c:if>
												<c:if test="${type=='url'}">
				 		               				<img src="${menuAllVo.menuImg}" style="height:250px; width:80%;"
		       											 alt="${menuAllVo.menuName }">
		       									</c:if>
				                			</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500" >광고 번호 </th>
							                  <td>${menuAllVo.menuName}</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500" >신청 일자 </th>
							                  <td>${menuAllVo.sMGroupName}</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500"  >만료 기간 </th>
							                  <td>${menuAllVo.menuPrice}원</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500"  >ㅇㅇㅇ</th>
							                  <td>${content}</td>
						                </tr>
						              </tbody>
						            </table>
						          </div>
						       </div>
				       	   <!-- 끝  -->
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
    	