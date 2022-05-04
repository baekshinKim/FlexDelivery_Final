 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Askbootstrap">
    <meta name="author" content="Askbootstrap">
    <link rel="icon" type="image/png" href="<c:url value='/resources/memberResources/img/fav.png' />">
    <title>아이디 찾기</title>
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
    <script type="text/javascript">
    	$(function(){
    		$('button[type=button]').click(function(){
    			window.close();
    		})
    	});
    </script>
</head>

<body>
    <div class="login-page vh-100">
        <video loop autoplay muted id="vid">
            <source src="<c:url value='/resources/memberResources/img/bg.mp4' />" type="video/mp4">
            <source src="<c:url value='/resources/memberResources/img/bg.mp4' />" type="video/ogg">
         </video>
         <div class="col-12" style="background: #d92662;height: 50px"></div>
        <div class="d-flex align-items-center justify-content-center vh-90" style="line-height: 2">
            <div class="px-5 col-md-6 ml-auto">
                <div class="px-5 col-10 mx-auto">
                	<br>
                    <hr>
                    <h2 class="text-dark my-0">FIND ID</h2>
                   	<br>
                    <p class="text-50 lead">아이디 찾기</p>
                    <br>
	                <c:if test="${!empty memberId}">
                    	<div class="row justify-content-center">
                    		<div class="col-sm-4 col-4">
		                    	<p>아이디 찾기 결과 : </p>
                    		</div>
                    		<div class="col-sm-4 col-4">
                    			<c:set var="str" value="${memberId}" />
                    			<c:set var="length" value="${fn:length(str)}" />
                    			<c:set var="subStr" value="${fn:substring(str,3,length)}" />
		                    	<p class="text-40 lead">${fn:replace(str,subStr,"*")} </p>
		                    </div>
                    	</div>
			            <button class="btn btn-primary btn-lg btn-block mt-5 mb-4" type="button">CLOSE</button>
                    	<a href="<c:url value='/member/login/forgotPwd.do' />" class="text-decoration-none">
                        	<p class="text-center" id="forgotPwd">비밀번호 찾기</p>
                   		</a>
	                </c:if>
                    <c:if test="${empty memberId}">
                    	<hr>
	                    <h4 class="m-0">탈퇴하였거나 존재하지 않는회원입니다</h4>
	                    <hr>
                   		<button class="btn btn-primary btn-lg btn-block mt-5 mb-3" type="button">CLOSE</button>
	                    <a href="<c:url value='/member/login/forgotId.do' />" class="text-decoration-none">
                        	<p class="text-center" id="forgotId">재검색</p>
                   		</a>
                    </c:if>
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