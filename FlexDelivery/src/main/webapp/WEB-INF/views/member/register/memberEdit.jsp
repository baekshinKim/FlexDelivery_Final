<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript" src="<c:url value='/resources/memberResources/vendor/jquery/jquery.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/member.js' />"></script>
<script type="text/javascript">
	$(function(){
		$('#wr_submit').click(function(){
			if($('#memberPwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#memberPwd').focus();
				event.preventDefault();
			}else if($('#memberPwd').val()!=$('#memberPwd2').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#memberPwd2').focus();
				event.preventDefault();
			}else if(!validate_phone($('#memberHp1').val()) ||
					!validate_phone($('#memberHp2').val()) ||
					!validate_phone($('#memberHp3').val())){
				alert('전화번호는 숫자만 가능합니다.');
				$('#memberHp1').focus();
				event.preventDefault();
			}else if ($('#memberHp1').val().length<3 ||
					 $('#memberHp2').val().length<3 ||
					 $('#memberHp3').val().length<4){
					 alert('3자리 숫자 이상 입력하세요.');
					$('#memberHp1').focus();
					event.preventDefault();
			
			}else if ($('#memberEmail1').val().length<1 ||
					 $('#memberEmail2').val().length<1) {
					 alert('이메일을 입력해주세요.');
					$('#memberEmail1').focus();
					event.preventDefault();
			
			}else if ($('#memberAddress').val().length<1) {
				 	alert('주소를 입력해주세요.');
					$('#memberAddress').focus();
					event.preventDefault();
					
			}else if ($('#memberAddressDetail').val().length<1) {
			 	alert('상세주소를 입력해주세요.');
				$('#memberAddressDetail').focus();
				event.preventDefault();
				
			}
			
		});
	});
</script>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Askbootstrap">
    <meta name="author" content="Askbootstrap">
    <link rel="icon" type="image/png" href="<c:url value='/resources/memberResources/img/fav.png' />">
    <title>FlexDelivery 회원정보 수정</title>
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
    <div class="osahan-signup login-page">
        <div class="d-flex align-items-center justify-content-center flex-column vh-110">
            <div class="px-6 ">
                <div class="px-5 col-10 mx-auto ml-auto">
                    <!-- <p class="text-50">Sign up to continue</p> -->
                    <form class="mt-5 mb-4" method="post" action="<c:url value='/member/memberEdit.do'/>">
                    <h2 class="text-dark my-0">회원정보 수정</h2>
                    	<br>
                        <div class="form-group">
                            <label for="exampleInputName1" class="text-dark">이름</label>
                            <input type="text" placeholder="이름을 입력하세요" class="form-control" id="memberName" name="memberName" aria-describedby="nameHelp" value="${vo.memberName }" disabled>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputNumber1" class="text-dark">아이디</label>
                            <input type="text" placeholder="ID를 입력하세요" class="form-control" name="memberId" id="memberId" aria-describedby="numberHelp" value="${vo.memberId }" readonly>
                            <span class="error" style="color: red"> </span>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="text-dark">비밀번호</label>
                            <input type="password" placeholder="비밀번호를 입력하세요" class="form-control" id="memberPwd" name="memberPwd">
                            <br>
                            <label for="exampleInputPassword1" class="text-dark">비밀번호 확인</label>
                            <input type="password" placeholder="비밀번호를 다시 입력하세요." class="form-control" id="memberPwd2" name="memberPwd2">
                        </div>
						<label for="exampleInputNumber1" class="text-dark">전화번호</label>
						<div class="row">
							<div class="col-md-4" >
								<input type="text"  placeholder="번호 입력" class="form-control" id="memberHp1" name="memberHp1" aria-describedby="numberHelp" style="background-color: #fafaf9;" value="${vo.memberHp1 }">
							</div>
							<div class="col-md-4">
								<input type="text" placeholder="번호 입력" class="form-control" id="memberHp2" name="memberHp2" aria-describedby="numberHelp" style="background-color: #fafaf9;" value="${vo.memberHp2 }">
							</div>
							<div class="col-md-4">
								<input type="text" placeholder="번호 입력" class="form-control" id="memberHp3" name="memberHp3" aria-describedby="numberHelp" style="background-color: #fafaf9;" value="${vo.memberHp3 }">
							</div>
						</div>
						<br> 
						<label for="" class="text-dark">이메일</label>
						<div class="row" style="line-height: 33px">
							<div class="col-md-5" >
								<input type="text"  placeholder="이메일 입력" class="form-control" id="memberEmail1" name="memberEmail1" aria-describedby="numberHelp" style="background-color: #fafaf9;" value="${vo.memberEmail1 }">
							</div>
							<p style="margin: 0rem;">@</p>
							<div class="col-md-5">
								<input type="text" placeholder="이메일 입력" class="form-control" id="memberEmail2" name="memberEmail2" aria-describedby="numberHelp" style="background-color: #fafaf9;" value="${vo.memberEmail2 }">
							</div>
						</div>
						<br>
						<div class="row">
							<label for="exampleInputaddress" class="text-dark" style="line-height: 33px">주소 검색</label>
							<div class="col-md-4" >
								<input type="text"  placeholder="우편번호" ReadOnly title="주소" class="form-control" name="memberZipcode" id="memberZipcode" aria-describedby="numberHelp" style="background-color: #fafaf9;" value="${vo.memberZipcode }">
							</div>
							<input type="Button" value="우편번호 찾기" id="btZipcode" title="새창열림">
							<!-- <span class="float-right"><a href="#" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#extras">검색</a></span> -->
						</div>
						<br>
						
						<div class="form-group">
							<label for="exampleInputaddress" class="text-dark">주소</label>
							<input type="text" ReadOnly class="form-control" id="memberAddress" name="memberAddress" aria-describedby="numberHelp" style="background-color: #fafaf9;" value="${vo.memberAddress}">
						</div>
						<div class="form-group">
							<label for="exampleInputaddress" class="text-dark">상세주소</label>
							<input type="text" placeholder="상세주소를 입력하세요." class="form-control" id="memberAddressDetail" name="memberAddressDetail" aria-describedby="numberHelp" style="background-color: #fafaf9;" value="${vo.memberAddressDetail }">
						</div>
						
						<input type="submit" class="btn btn-primary btn-lg btn-block" id="wr_submit" value="수정 완료">
						
<!--					<div class="py-2">
							<button class="btn btn-facebook btn-lg btn-block"><i class="feather-facebook"></i> Connect with Facebook</button>
						</div> -->
                    	<input type ="hidden" name="locationName" id="locationName">
                    	<input type ="hidden" name="locationNo" id="locationNo" value="${vo.locationNo}">
					</form>
                    	
				</div>
                <div class="new-acc d-flex align-items-center justify-content-center">
                    <a href="<c:url value='/member/index.do' />">
                        <p class="text-center m-0">메인 화면으로</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <br><br><br>

	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/memberResources/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/memberResources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- slick Slider JS-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/memberResources/vendor/slick/slick.min.js"></script>
	<!-- Sidebar JS-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/memberResources/vendor/sidebar/hc-offcanvas-nav.js"></script>
	<!-- Custom scripts for all pages-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/memberResources/js/osahan.js"></script>
</body>

</html>