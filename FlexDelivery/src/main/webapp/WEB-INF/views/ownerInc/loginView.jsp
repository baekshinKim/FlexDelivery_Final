<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript">
	function stopStatus(){
		if(confirm('임시 중지 하시겠습니까?')){
			var ownerNo = ${sessionScope.ownerNo};
			$.ajax({
				url:"<c:url value='/owner/menu2/operation/updateStatus.do'/>",
				data:"ownerNo="+ownerNo+"&sStatusNo=3", 
				success:function(res){
					if(res=="fail"){
						alert("업데이트 실패!");
					}else{
						alert('영업 임시 중지 되었습니다!');
					}
				},
				error:function(xhr,status,error){
					alert("error!!: "+error);
				}
			});
		}
	};
	
	
	$(function(){
		if(${!empty sessionScope.ownerId}){
			$.ajax({
				url:"<c:url value='/owner/checkResult.do'/>",
				success:function(res){
					if(res == ${NO_LICENSE} || res == ${LICENSE_STAY}){
						$('#noRegi').css('display','block');
						$('#noStore').css('display','none');
						$('#haveStore').css('display','none');
					}else if(res == ${NO_STORE} || res==${STORE_STAY}){
						$('#noStore').css('display','block');
						$('#noRegi').css('display','none');
						$('#haveStore').css('display','none');
					}else if(res==${HAVE_ALL} || res==${WITHDRAW_STAY}){
						$('#haveStore').css('display','block');
						$('#noStore').css('display','none');
						$('#noRegi').css('display','none');
					}
					
				},
				error:function(xhr,status,error){
					alert("error!!:"+error);
				}
			});
		}
		
	});
	
	
	

</script>     <!-- Widget Area -->
                        <div class="sidebar-widget-area text-center" style="padding-top:40px; margin-bottom:30px;" >
                        	 <div >
                       		 	<hr style="border: 1px 1solid; border-color: gray;" >
                        	 </div> 
                        	<br>
                        	<div  >
	                        	<c:set  var="noLicense" value="${NO_LICENSE}"/> <!-- 라이센스 없는경우  승인번호 2,4-->
	                        	<c:set  var="noStore" value="${NO_STORE}"/> <!-- 점포 없는경우 승인번호 2,4 -->
	                        	<c:set  var="haveAll" value="${HAVE_ALL}"/>	<!-- 점포 있음 -->
	                        	<c:set  var="licenseStay" value="${LICENSE_STAY}"/> <!-- 라이센스 없는 경우 승인번호 1 -->
	                        	<c:set  var="storeStay" value="${STORE_STAY}"/> <!-- 점포 없는 경우 승인번호 1 -->
	                        	
	                        	
	                            <!-- 사장님이 로그인 안했을 경우  -->
		                    	<c:if test="${empty sessionScope.ownerId}">
		                    		<div style="margin-top:-15px;">
	                        			 <small style="color:gray;">반갑습니다. FLEX DELIVERY 입니다</small>
			                    		<h2 class="title subscribe-title"><b>사장님, <span style="color:rgb(223,108,220);">로그인 </span>부탁드려요</b></h2>
			                            <div class="widget-content">
			                                <form action="<c:url value='/owner/login/login.do'/>">
			                                    <button type="submit" class="btn original-btn text-white " style="background-color: rgb(223,108,220); width:250px; height:50px;">로 그 인</button>
			                                </form>
			                            </div>
									</div>
		                        </c:if>
		                        <!-- 사장님이 로그인했는데 사업자 등록증이 없을때 -->
		         
		                           <div style="display :none;" id="noRegi">
			                        	<small style="color:gray;">반갑습니다. FLEX DELIVERY 입니다</small>
			                       	    <h6 class="title mb-3"  ><b><span style="color:rgb(223,108,220); font-size:25px; ">${sessionScope.ownerId}</span> 사장님 <br> 어서오세요</b></h6>
			                       		<div class="widget-content">
			                                <form action="<c:url value='/owner/menu1/launch/launch.do'/>">
			                            		<button type="submit" class="btn original-btn" style="background-color: rgb(223,108,220); color: white;">입 점 신 청</button>
			                            	</form>
			                            </div>
		                            </div>
	                    
		                        <!-- 사장님이 점포가없을때 -->
		                        	 <div style="display :none;" id="noStore">
			                       	      <small style="color:gray;">반갑습니다. FLEX DELIVERY 입니다</small>
			                       		  <h6 class="title mb-3"><b><span style="color:rgb(223,108,220); font-size:25px; ">${sessionScope.ownerId}</span> 사장님 <br> 어서오세요 </h6></b>
			                       		  <div class="widget-content">
			                                <form action="<c:url value='/owner/menu1/launch/launch.do'/>">
			                            		<button type="submit" class="btn original-btn" style="background-color: rgb(223,108,220); color: white;">입 점 신 청</button>
			                            	</form>
			                               </div>
			                           </div>
	                       		 <!-- 사장님 사업자등록도 점포도 다있어서 내가게가 잇을때-->
	                   
	                       		  <div style="display:none;" id="haveStore">
				                       	<small style="color:gray;">반갑습니다. FLEX DELIVERY 입니다</small>
				                       	 <h6 class="title mb-3"><b><span style="color:rgb(223,108,220); font-size:25px; ">${sessionScope.ownerId}</span> 사장님 <br> 어서오세요</b> </h6>
					                     	  <div style="text-align: center;">	
					                       		  	<div  style="display: flex; justify-content: space-between; width:80%; margin-left:10%;">
					                       		  		<div>
					                       		  			<!-- 리뷰관리 이미지 -->
					                       		  			<a href="<c:url value='/owner/menu2/reviewOwner/reviewOwner.do'/>" class="login">
						                       		  			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
				  													<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
				  													<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
																</svg>
																<br>
																<span style="font-size:2px;">리뷰관리</span>
															</a>
														</div>
														<div >
														<!-- 메뉴관리 이미지 -->
															<a href="<c:url value='/owner/menu2/foodmenu/menuMain.do'/>" class="login">
																<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-grid" viewBox="0 0 16 16">
				  														<path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
																</svg>
																<br>
																<span style="font-size:2px;">메뉴관리</span>
															</a>
														</div>
														<div >
															<!-- 임시중지 이미지 -->
															<a href="#" onclick="stopStatus()" class="login">
																<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-pause-circle" viewBox="0 0 16 16">
				  													<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				  													<path d="M5 6.25a1.25 1.25 0 1 1 2.5 0v3.5a1.25 1.25 0 1 1-2.5 0v-3.5zm3.5 0a1.25 1.25 0 1 1 2.5 0v3.5a1.25 1.25 0 1 1-2.5 0v-3.5z"/>
																</svg>
																<br>
																<span style="font-size:2px;">임시중지</span>
															</a>
														</div>
														<div >
															<!-- 현재 주문 현황 -->
															<a href="<c:url value='/owner/menu2/order/orderMain.do'/>" class="login">
																<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
				  													<path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
															   </svg>
														   </a>
														   <br>
														   <span style="font-size:2px;">주문현황</span>
														</div>
					                       		  	</div>
					                       		  </div>
				                       		  	<br>
				                       		
				                       		  <div class="widget-content">
				                                <form action="<c:url value='/owner/menu2/myStoreIndex.do'/>">
				                            		<button type="submit" class="btn original-btn" style="background-color: rgb(223,108,220); color: white;">내 점 포</button>
				                            	</form>
				                            </div>
		                            	</div>
	          
                       		 </div>
                       		 <br>
                       		 <div >
                       		 	<hr style="border: 1px 1solid; border-color: gray;" >
                        	 </div>
                        </div>
                       