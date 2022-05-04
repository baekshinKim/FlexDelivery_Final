
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- top 시작-->





<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<!-- top 끝 -->
	<style>
	.nav-pills .nav-link.active, .nav-pills .show > .nav-link {
	    color: white;
	    background-color: #fcbe32;
	}
	
	a.nav-link:hover {
   		 color: gray;
	}
	
	a.nav-link{
		 color: #004e66;
	}
	</style>

	<script type="text/javascript">
			$(function(){
				$('#btAdRegister').on('click', function(){
					window.screen.width //현재 윈도우창의 가로크기를 가져옴
					window.screen.height //세로크기 가져옴
					
					var popupWidth = 500; //띄울 창 가로크기
					var popupHeight = 300;
					
					var popupX = (window.screen.width / 2) - (popupWidth /2);
					var popupY = (window.screen.height / 2) - (popupHeight /2);
					
					window.open(
						"${pageContext.request.contextPath}/owner/menu2/advertise/advertisePwdCheck.do", 
						"pwdCheck", 
						'toolbar=no, menubar=no, height='+popupHeight+', width='+ popupWidth +', left='+popupX+', top='+popupY);
				});
			
			
			});
			
			

			  
		
		</script>
		<bR><br><br>
		<section id="content-types">
		
			 <!-- 광고등록 탭 + 버튼-->
			  <div class="row mt-3">
			  		<div class="col-md-2 col-sm-12"></div>
			  		<div class="col-md-8 col-sm-12">
				  		<ul class="nav nav-pills" style="float: left;">
							  <li class="nav-item">
							    <a class="nav-link active" aria-current="page" href="<c:url value="/owner/menu2/advertise/advertiseMain.do"/>" >진행</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link" href="<c:url value="/owner/menu2/advertise/advertiseExpire.do"/>">만료</a>
							  </li>
						</ul>
	                	 <button id="btAdRegister" class="btn btn-warning" style="float: right;">광고등록</button>
		            </div>
                    <div class="col-md-2 col-sm-12"></div>
			  </div>
			  <br>
			  
			  
			  <!-- 현재 진행중인 광고 -->
      	
      		  
      				 <div class="row">
	      		  		<c:if test="${empty list }">
		      		  		<div class="col-md-2 col-sm-12"></div>
						 	<div class="col-md-8 col-sm-12">
			      		  			<div class="card">
					                    <div class="card-content">
					                        <div class="card-body">
					                            <h4 class="card-title">현재 등록하신 광고가 없습니다.</h4>
					                            <p class="card-text">
					                            </p>
					                            <small class="text-muted">광고 등록을 원하시면 오른쪽 위의 등록버튼을 눌러주세요</small>
					                        </div>
					                        <img class="card-img-bottom img-fluid h-12" src="<c:url value='/resources/imgs/CommonImages/index7.jpg'/>"
					                            alt="Card image cap" style="height:500px;">
					                     </div>
					                 </div>
							  </div>
				 			 <div class="col-md-2 col-sm-12"></div>
	 					</c:if>
	 					
	 					 <!-- 플렉스한광고 -->
	 					<c:if test="${!empty list}">
	 						<c:forEach var="vo" items="${list}">
		      		  		<div class="col-md-2 col-sm-12"></div>
						 	<div class="col-md-8 col-sm-12">
			      		  			<div class="card">
					                    <div class="card-content">
					                        <div class="card-body">
					                            <h4 class="card-title">현재 걸려있는 광고입니다</h4>
					                            <p class="card-text">
								                	<span>광고명 : ${vo.advertiseName } </span><br>
								                	<span style="color:purple;">광고번호 : ${vo.advertiseNo } </span><br>
								                	<span>광고가격 : ${vo.advertisePrice} </span><br>
								                	<span>만료일 : ${fn:substring(vo.adValidate, 0,10) }	</span> 
					                            </p>
					                            <small class="text-muted">언제나 감사합니다 플렉스한 하루 되세요</small>
					                        </div>
					                         <c:if test="${vo.advertiseNo==1 }">
						      					 <img class="card-img-top img-fluid" style="height:300px;" src="<c:url value='/resources/imgs/todayBg1.png'/>" alt="Card image cap">
						     				 </c:if>
						    				  <c:if test="${vo.advertiseNo==2 }">
						      						<img class="card-img-top img-fluid"  style="height:300px;"  src="<c:url value='/resources/imgs/todayBg3.png'/>"  alt="Card image cap">
						     				 </c:if>
					                     </div>
					                 </div>
							  </div>
				 			 <div class="col-md-2 col-sm-12"></div>
				 			 </c:forEach>
	 					</c:if>
					 </div>
			   	
			  
		 </section>
			 
		
		
<!--  bottom  -->
  <%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>

		