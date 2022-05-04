<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FLEX한 사장님을 위한 내 점포 사이트</title>


 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">

	  <script src="${pageContext.request.contextPath}/resources/ownerResources/herbJs/jquery-3.5.1.min.js"></script>
	


	
	<!-- 클릭시 비밀번호 유효성 검사 및 페이지 이동 -->
 
	<script type="text/javascript">

		
		 $(document).ready(function(){
				 var success=1;
				 var fail = 3;
			
				 
				var YorN = ${YorN};
				 
				 if(success==YorN) {
					 window.opener.location.href="${pageContext.request.contextPath}/owner/menu2/advertise/advertiseChoice.do";
					self.close();
				} else if(fail==YorN){
					alert("비밀번호가 틀렸습니다.");
					$('input[type=password]').focus();
				}
		});
	  
		
		
	    $(function(){
			$('#button-addon1').click(function(){
				if($('input[type=password]').val().length<1){
					alert('비밀번호를 입력하세요');
					$('input[type=password]').focus();
					event.preventDefault();
				} else{
					$('form[name=frm1]').submit();
				} 
					
			});
		});
	
	</script>
</head>
<body style="overflow-x:hidden;">
		
			 		<br>	<br>	
		<section id="basic-vertical-layouts">
		    <div class="row match-height">
		    	<div class="col-md-4 col-sm-12"></div>
		        <div class="col-md-4 col-sm-12 text-center">
	           		 <h4> 본인 인증 </h4>
	                <form class="form form-vertical" method="post" action="<c:url value='/owner/menu2/advertise/advertisePwdCheck.do'/>" name="frm1">
	                   <div class="form-body">
		                    <div class="row">
			                    <div class="col-12">
			                        <div class="form-group">
				                         <div class="input-group mb-4 ">
			                                 <input type="password" class="form-control m-5 mb-2" aria-label="Example text with button addon" aria-describedby="button-addon1" name="ownerPwd">
			                                 
			                               
			                                 <div class="col-12 d-flex mt-3 justify-content-center">
			                          		 	<button class="btn btn-primary btAdPwdCheck"  id="button-addon1" style="color:black; background-color:#fcbe32; border: none; ">확인</button>
			                         		  </div>
			                         	 </div>
			                    	</div> 
			                    </div>
		               		 </div>
	                	</div>
	                </form>
	            </div>
		        <div class="col-md-4 col-sm-12"></div>
		  	</div>
		</section>
			
			
	
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/pages/dashboard.js"></script>

    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
    
    
    
    
    
			  
			
</body>
</html>
    	