<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">


  <script src="${pageContext.request.contextPath}/resources/ownerResources/herbJs/jquery-3.5.1.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/ownerResources/registerOwner/vendor/jquery/jquery.min.js"></script>
  <script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find('#ownerId').val("${param.ownerId}");
			$(opener.document).find('#chkId').val("Y");	
			self.close();
		});
		
		
	});
</script>
</head>
<body>
	<br><br><Br>
 <div class="row match-height">
   	<div class="col-md-4 col-sm-12"></div>
    <div class="col-md-4 col-sm-12 text-center">
		<h2>아이디 중복 검사</h2><br>
		<form name="frmId" method="post" 
			action="<c:url value='/owner/register/checkId.do'/>">
			<input type="hidden" name="type"  value="${param.type}">
			 
			<input type="text" name="ownerId" id="ownerId" 
			 title="아이디입력" value="${param.ownerId}">
			 
			<input type="submit"  id="submit" value="아이디 확인" style="background-color: rgb(182,120,210); color:white; ">
			
			<c:if test="${result==EXIST_ID }">
				<p class="mt-3">이미 등록된 아이디입니다. 다른 아이디를 입력하세요.</p>
			</c:if>
			<c:if test="${result==NON_EXIST_ID }">
				<input type="button" value="사용" id="btUse" style="background-color: rgb(182,120,210); color:white;">
				<p class="mt-3">사용가능한 아이디입니다.[사용]버튼을 클릭하세요</p>
			</c:if>
		</form>
	</div>
	<div class="col-md-4 col-sm-12"></div>
</div>
</body>
</html>