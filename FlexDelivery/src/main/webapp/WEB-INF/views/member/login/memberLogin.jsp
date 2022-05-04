<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript" src="<c:url value='/resources/memberResources/vendor/jquery/jquery.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/member.js' />"></script>
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
				"${pageContext.request.contextPath}/member/login/forgotId.do", 
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
				"${pageContext.request.contextPath}/member/login/forgotPwd.do", 
				"Find ID", 
				'toolbar=no, menubar=no, height='+popupHeight+', width='+ popupWidth +', left='+popupX+', top='+popupY+',scrollbars=0');
		});
	
	});
	
	
</script>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Askbootstrap">
    <meta name="author" content="Askbootstrap">
    <link rel="icon" type="image/png" href="<c:url value='/resources/memberResources/img/fav.png' />">
    <title>FLEX-LOGIN</title>
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
                    <a href="<c:url value='/member/index.do'/>"><h2 class="text-dark my-0">WECOME FLEX-DELIVERY</h2></a>
                   	<br>
                    <form class="mt-5 mb-4" action="<c:url value='/login.do' />">
                    	<input type="hidden" name="idx" value="${idx}"> 
                        <div class="form-group">
                            <input type="text" placeholder="ID" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="userid" value="${cookie.ck_memberid.value}">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="PASSWORD" class="form-control" id="exampleInputPassword1" name="pwd">
                        </div>
						<div class="checkbox ">
							<label>
								<input type="checkbox" name="chkSave" 
								<c:if test="${!empty cookie.ck_memberid}">
									checked="checked"
								</c:if>
								> 아이디 저장
							</label>
						</div>
                        <br>
                        <button class="btn btn-primary btn-lg btn-block">LOGIN</button>
                    </form>
                    <a href="#" class="text-decoration-none">
                        <p class="text-center" id="forgotId">아이디 찾기</p>
                    </a>
                    <a href="#" class="text-decoration-none">
                        <p class="text-center" id="forgotPwd">비밀번호 찾기</p>
                    </a>
                    <div class="d-flex align-items-center justify-content-center">
                        <a href="<c:url value='/member/register/register.do' />">
                            <p class="text-center m-0">회원가입</p>
                        </a>
                    </div>
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