<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V3</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/css/main.css">
<!--===============================================================================================-->

<script type="text/javascript" src="<c:url value='/resources/memberResources/vendor/jquery/jquery.min.js' />"></script>
<script type="text/javascript">
	$(function(){
		$('#forgotId').click(function(){
			window.screen.width 
			window.screen.height 
			
			var popupWidth = 700;
			var popupHeight = 500;
			
			var popupX = (window.screen.width/2)-(popupWidth/2);
			var popupY = (window.screen.height/2)-(popupHeight/2);
			
			window.open(
				"${pageContext.request.contextPath}/owner/login/forgotId.do", 
				"Find ID", 
				'toolbar=no, menubar=no, height='+popupHeight+', width='+ popupWidth +', left='+popupX+', top='+popupY+',scrollbars=0');
		});
		
		$('#forgotPwd').click(function(){
			window.screen.width
			window.screen.height 
			
			var popupWidth = 700; 
			var popupHeight = 500;
			
			var popupX = (window.screen.width/2)-(popupWidth/2);
			var popupY = (window.screen.height/2)-(popupHeight/2);
			
			window.open(
				"${pageContext.request.contextPath}/owner/login/forgotPwd.do", 
				"Find Pwd", 
				'toolbar=no, menubar=no, height='+popupHeight+', width='+ popupWidth +', left='+popupX+', top='+popupY+',scrollbars=0');
		});
	
	});
</script>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('${pageContext.request.contextPath}/resources/ownerResources/Login_v3/images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="<c:url value='/login.do' />">
						<div style="display:flex; justify-content: center;">
							<a href="<c:url value='/owner/index.do' />">
								<img alt="logo" src="${pageContext.request.contextPath}/resources/imgs/OwnerLoginLogo.png" style="width:200px; height: 75px;">
							</a>
						</div>
					<span class="login100-form-title p-b-34 p-t-27">
						L O G I N
					</span>
						<input type="hidden" name="idx" value="${idx}"> 
					<div class="wrap-input100 validate-input" data-validate = "Enter your Id">
						<input type="text" class="input100 text-right" id="exampleInputEmail1" aria-describedby="emailHelp" name="userid" autocomplete="off" value="${cookie.ck_ownerid}">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter your password">
						 <input type="password" class="input100 text-right" id="exampleInputPassword1" name="pwd">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<div class="contact100-form-checkbox" >
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="chkSave"
								<c:if test="${!empty cookie.ck_ownerid}">
									checked="checked"
								</c:if>>
							<label class="label-checkbox100" for="ckb1">
							아이디 저장
							</label>
					</div>
				
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">
							Login
						</button>
					</div>
					</form>
					<br>
					
					<div class="text-center p-t-35 ml-2">
						<a class="txt1" href="<c:url value='/owner/index.do' />">
							Home
						</a> 
					    <span style="color:white; " class="m-l-5"> ㅣ </span>
						<a class="txt1" href="<c:url value='/owner/register/register.do'/>">
							회원가입
						</a>
						
					</div>
					
					<br>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/ownerResources/Login_v3/js/main.js"></script>

</body>
</html>