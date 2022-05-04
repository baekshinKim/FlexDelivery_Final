<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- adminInc/top.jsp -->    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <meta name="description" content="">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->



<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/style.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/css/animate.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/css/classy-nav.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/css/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/css/owl.carousel.css"/>

<!-- Title -->
<title>플렉스 딜리버리: 관리자 로그인</title>

<!-- Favicon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/adminResources/img/core-img/favicon.ico">

</head>
<body>

<!-- Preloader -->
    <div id="preloader">
        <div class="preload-content">
            <div id="original-load"></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">

        <!-- Top Header Area -->
        <div class="top-header" style="background-color: white;">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <!-- Breaking News Area -->
                    <div class="col-12 col-sm-8">
                        <div class="breaking-news-area">
                            <div id="breakingNewsTicker" class="ticker">
                                <ul>
                                    <li><a href="<c:url value='/member/index.do'/>">고객 사이트로 이동</a></li>
                                    <li><a href="<c:url value='/owner/index.do'/>">사장님 사이트로 이동</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Top Social Area -->
                    <!-- div class="col-12 col-sm-4">
                        <div class="top-social-area">
                            <a href="#" data-toggle="tooltip" data-placement="bottom" title="Login"><i  aria-hidden="false">로그인</i></a>
                            <a href="#" data-toggle="tooltip" data-placement="bottom" title="Join"><i  aria-hidden="false">회원가입</i></a>
                            
                        </div>
                    </div> -->
                </div>
            </div>
        </div>

        <!-- Logo Area -->
        <div class="logo-area text-center" style="background-color: white;">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                    	<a href="<c:url value='/admin/index.do' />" class="original-logo">
                        <img src="${pageContext.request.contextPath}/resources/imgs/FD.png" alt="FlexDeliveryLogo" style="width: 300px;"></a>
                		
                    </div>
                </div>
            </div>
        </div>


    </header>
    <!-- ##### Header Area End ##### -->
    
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="${pageContext.request.contextPath}/resources/adminResources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/resources/adminResources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/resources/adminResources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="${pageContext.request.contextPath}/resources/adminResources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/resources/adminResources/js/active.js"></script>
    