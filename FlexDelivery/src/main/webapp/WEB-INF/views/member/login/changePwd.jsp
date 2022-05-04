<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Askbootstrap">
    <meta name="author" content="Askbootstrap">
    <link rel="icon" type="image/png" href="<c:url value='/resources/memberResources/img/fav.png' />">
    <title>비밀번호 변경</title>
    <!-- Slick Slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/memberResources/vendor/slick/slick.min.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/memberResources/vendor/slick/slick-theme.min.css' />" />
    <!-- Feather Icon-->
    <link href="<c:url value='/resources/memberResources/vendor/icons/feather.css' />" rel="stylesheet" type="text/css">
    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/resources/memberResources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<c:url value='/resources/memberResources/css/style.css' />" rel="stylesheet">
    <!-- Sidebar CSS -->
    <link href="<c:url value='/resources/memberResources/vendor/sidebar/demo.css' />" rel="stylesheet">
    <script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/resources/memberResources/js/member.js' />"></script>
    <script type="text/javascript">
    	$(function(){
    		$('form[name=frmChange]').submit(function(){
    	         if($('#memberPwd').val().length<1){
    	            alert('비밀번호를 입력하세요');
    	            $('#memberPwd').focus();
    	            event.preventDefault();
    	         }else if($('#memberPwd2').val().length<1){
    	            alert('비밀번호를 재입력해주세요');
    	            $('#memberPwd2').focus();
    	            event.preventDefault();            
    	         }else if($('#memberPwd').val()!=$('#memberPwd2').val()){
    	        	 alert('비밀번호 확인이 일치하지 않습니다');
    	        	 $('#memberPwd2').focus();
    	        	 event.prventDefault();
    	         }
    	      });
    	});
    </script>
    
</head>

<body>
    <div class="login-page vh-100">
        <video loop autoplay muted id="vid">
            <source src="<c:url value='/resources/memberResources/img/bg.mp4' />" type="video/mp4">
            <source src="<c:url value='/resources/memberResources/img/bg.mp4' />" type="video/ogg">
         </video>
        <div class="d-flex align-items-center justify-content-center vh-100">
            <div class="px-5 col-md-6 ml-auto">
                <div class="px-5 col-10 mx-auto">
                	<hr>
                    <h2 class="text-dark my-0">CHANGE PWD</h2>
                   	<br>
                    <p class="text-50 lead">비밀번호 변경</p>
                    <form class="mt-5 mb-4" name="frmChange" method="post" action="<c:url value='/member/login/changePwd.do' />">
                    	<input type="hidden" name="memberId" value="${memberId}">
                        <div class="form-group">
                        	<div class="input-group">
	                            <input type="password" placeholder="변경할 비밀번호 입력" class="form-control" id="memberPwd" name="memberPwd">
	                            <input type="password" placeholder="변경할 비밀번호 재입력" class="form-control" id="memberPwd2" name="memberPwd2">
                        	</div>
                        </div>
                        <button class="btn btn-primary btn-lg btn-block">CHANGE</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="<c:url value='/resources/memberResources/vendor/jquery/jquery.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/resources/memberResources/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
    <!-- slick Slider JS-->
    <script type="text/javascript" src="<c:url value='/resources/memberResources/vendor/slick/slick.min.js' />"></script>
    <!-- Sidebar JS-->
    <script type="text/javascript" src="<c:url value='/resources/memberResources/vendor/sidebar/hc-offcanvas-nav.js' />"></script>
    <!-- Custom scripts for all pages-->
    <script type="text/javascript" src="<c:url value='/resources/memberResources/js/osahan.js' />"></script>
</body>

</html>