<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- adminInc/top.jsp -->    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <meta name="description" content="">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- fontawsome -->

<script src="https://kit.fontawesome.com/2d323a629b.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/style.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/css/animate.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/css/classy-nav.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/css/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/css/owl.carousel.css"/>
<!-- Title -->
<title>플렉스 딜리버리 사장님</title>

<!-- Favicon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/adminResources/img/core-img/favicon.ico">
 <script src="${pageContext.request.contextPath}/resources/adminResources/js/jquery/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	function goWithdraw(){
		if(confirm('탈퇴하시겠습니까?')){
			location.href="<c:url value='/owner/withdraw.do'/>";
		}
	};
	
	$(function(){
		$('input').attr("autocomplete","off");
	});
	

</script>

</head>
<body style="background-color: white;" >

<!-- Preloader -->
    <div id="preloader">
        <div class="preload-content">
            <div id="original-load"></div>
        </div>
    </div>



    <!-- Subscribe Modal -->
    <div class="subscribe-newsletter-area">
        <div class="modal fade" id="subsModal" tabindex="-1" role="dialog" aria-labelledby="subsModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="modal-body">
                        <h5 class="title">Subscribe to my newsletter</h5>
                        <form action="#" class="newsletterForm" method="post">
                            <input type="email" name="email" id="subscribesForm2" placeholder="Your e-mail here">
                            <button type="submit" class="btn original-btn">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

  <!-- 사장님이 로그인 안했을 경우  -->
	                  
    <!-- ##### Header Area Start ##### -->
    <header class="header-area">

        <!-- Top Header Area -->
        <div class="top-header">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <!-- Breaking News Area -->
                    <div class="col-12 col-sm-8">
                        <div class="breaking-news-area">
                            <!-- <div id="breakingNewsTicker" class="ticker">
                                <ul>
									왼쪽 상단에 뜨는 휠 같은거                                    
                                    <li><a href="#">고객센터</a></li>
                                    <li><a href="#">사장님꿀팁</a></li>
                                </ul>
                            </div> -->
                        </div>
                    </div>
                    <!-- Top Social Area -->
                    <div class="col-12 col-sm-4">
                        <div class="top-social-area">
                        	<!-- 사장님이  로그인 안했을때-->
                        	<c:if test="${empty sessionScope.ownerId}">
                        		  <a href="<c:url value='/owner/login/login.do'/>" data-toggle="tooltip" data-placement="bottom" title="Login"><i  aria-hidden="false">로그인</i></a>
                          		  <a href="<c:url value='/owner/register/register.do'/>" data-toggle="tooltip" data-placement="bottom" title="Join"><i  aria-hidden="false">회원가입</i></a>
                        	 </c:if>
	                        <!-- 사장님이  로그인 했을때 -->
	                        <c:if test="${!empty sessionScope.ownerId }">
	                        	 <a href="<c:url value='/owner/mypage/mypageMain.do'/>" data-toggle="tooltip" data-placement="bottom" title="mypage"><i  aria-hidden="false">마이페이지</i></a>
	                        	 <a href="<c:url value='/owner/logout.do'/>" data-toggle="tooltip" data-placement="bottom" title="Logout"><i  aria-hidden="false">로그아웃</i></a>
	                        </c:if>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Logo Area -->
        <div class="logo-area text-center">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                       <!-- img src: flex delivery 로고로 변경 필요함 -->
                         <a href="<c:url value='/owner/index.do' />" class="original-logo"><img src="${pageContext.request.contextPath}/resources/imgs/FD.png" alt="FlexDeliveryLogo" style="width: 300px;"></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Nav Area -->
        <div class="original-nav-area" id="stickyNav">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Classy Menu -->
                    <nav class="classy-navbar justify-content-between">

                        <!-- Subscribe btn -->
                        <div class="subscribe-btn">
                           <!--  <a href="#" class="btn subscribe-btn" data-toggle="modal" data-target="#subsModal"></a> -->
                        </div>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu" id="originalNav">
                            <!-- close btn -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="<c:url value='/owner/menu1/launch/launch.do'/>">입점</a></li>
                                    <li><a href="<c:url value='/owner/menu2/myStoreIndex.do'/>">내 가게</a></li>
                                    <li><a href="#">사장님광장</a>
                                        <ul class="dropdown">
                                            <li><a href="<c:url value='/owner/menu3/board/notice.do'/>">공지사항</a></li>
                                            <li><a href="<c:url value='/owner/menu3/board/event.do'/>">이벤트</a></li>
                                            <li><a href="<c:url value='/owner/menu3/honeyTip/honeyTip.do'/>">사장님 꿀팁</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="<c:url value='/owner/menu4/introduce.do'/>">플렉스 딜리버리 소개</a></li>
                                    <li><a href="#">고객센터</a>
                                         <ul class="dropdown">
                                            <li><a href="<c:url value='/owner/menu5/faq.do'/>">자주 하는 질문</a></li>
                                            <c:if test="${!empty sessionScope.ownerId }">
                                          		  <li><a href="<c:url value='/owner/menu5/oneToOne.do'/>">1:1 문의</a></li>
                                            </c:if>
                                        </ul>
                                    </li>
                                    <li><a href="<c:url value='/member/index.do'/>">고객 사이트로 이동</a></li>
                                </ul>

                                <!-- Search Form  -->
                        	
                            <!-- Nav End -->
                            
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->
    
   