<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Askbootstrap">
    <meta name="author" content="Askbootstrap">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/memberResources/img/fav.png">
    <title>FLEX-DELIVERY</title>
    <!-- Slick Slider -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/memberResources/vendor/slick/slick.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/memberResources/vendor/slick/slick-theme.min.css" />
    <!-- Feather Icon-->
    <link href="${pageContext.request.contextPath}/resources/memberResources/vendor/icons/feather.css" rel="stylesheet" type="text/css">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/memberResources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/memberResources/css/style.css" rel="stylesheet">
    <!-- Sidebar CSS -->
    <link href="${pageContext.request.contextPath}/resources/memberResources/vendor/sidebar/demo.css" rel="stylesheet">
   	<title>FLEX-DELIVERY, ENJOY!</title>
</head>

<body class="fixed-bottom-bar">
    <header class="section-header">
        <section class="header-main shadow-sm bg-white" style="line-height:4em">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-4 d-flex align-items-center m-none">
                    	<a href="${pageContext.request.contextPath}/member/index.do" class="brand-wrap mb-0">
                    		<img src="${pageContext.request.contextPath}/resources/imgs/FD2.png" alt="FlexDeliveryLogo" class="img-fluid">
                    	</a>
                    </div>
                    <!-- col.// -->
                    <div class="col-8">
                        <div class="d-flex align-items-center justify-content-end pr-5">
                            <!-- offers -->
                            <c:if test="${empty sessionScope.memberId}">
	                            <a href="${pageContext.request.contextPath}/member/login/memberLogin.do" class="widget-header mr-4 text-white btn bg-primary m-none">
	                                <div class="icon d-flex align-items-center">
	                                    <i class="feather-disc h6 mr-2 mb-0"></i> <span>로그인</span>
	                                </div>
	                            </a>
                            </c:if>
                            <c:if test="${!empty sessionScope.memberId}">
                            	 <a href="${pageContext.request.contextPath}/member/login/logout.do" class="widget-header mr-4 text-white btn bg-primary m-none">
	                                <div class="icon d-flex align-items-center">
	                                    <i class="feather-disc h6 mr-2 mb-0"></i> <span>로그아웃</span>
	                                </div>
                           		</a>
                            </c:if>
                            <!-- signin -->
                            <c:if test="${empty sessionScope.memberId}">
	                            <a href="${pageContext.request.contextPath}/member/register/register.do" class="widget-header mr-4 text-dark m-none">
	                                <div class="icon d-flex align-items-center">
	                                    <i class="feather-user h6 mr-2 mb-0"></i> <span>회원가입</span>
	                                </div>
	                            </a>
                            </c:if>
                            <!-- my account -->
                            <c:if test="${!empty sessionScope.memberId}">
	                            <div class="dropdown mr-4 m-none">
	                                <a href="${pageContext.request.contextPath}/resources/memberResources/#" class="dropdown-toggle text-dark py-3 d-block" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                    <img alt="#" src="${pageContext.request.contextPath}/resources/imgs/profile.png" class="img-fluid rounded-circle header-user mr-2 header-user">안녕하세요 ${sessionScope.memberName}님 
	                                </a>
	                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
	                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/mypage/main.do">마이페이지</a>
	                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/board/board.do">알림광장</a>
	                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/faq/faqList.do">고객센터</a>
	                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/addOn/addOn.do">FLEX-OFFERS</a>
	                                </div>
	                            </div>
	                        </c:if>
                            <c:if test="${empty sessionScope.memberId}">
	                            <div class="dropdown mr-4 m-none">
	                                <a href="${pageContext.request.contextPath}/resources/memberResources/#" class="dropdown-toggle text-dark py-3 d-block" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                    FLEX DELIVERY에 지금 바로 가입하세요!
	                                </a>
	                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
	                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/board/board.do">알림광장</a>
	                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/#">고객센터</a>
	                                </div>
	                            </div>
	                        </c:if>
                            <!-- signin -->
                            <a href="${pageContext.request.contextPath}/member/cart/cartView.do" class="widget-header mr-4 text-dark">
                                <div class="icon d-flex align-items-center">
                                    <i class="feather-shopping-cart h6 mr-2 mb-0"></i> <span>장바구니</span>
                                </div>
                            </a>
                            <a class="toggle" href="${pageContext.request.contextPath}/resources/memberResources/#">
                                <span></span>
                            </a>
                        </div>
                        <!-- widgets-wrap.// -->
                    </div>
                    <!-- col.// -->
                </div>
                <!-- row.// -->
            </div>
            <!-- container.// -->
        </section>
        <!-- header-main .// -->
    </header>