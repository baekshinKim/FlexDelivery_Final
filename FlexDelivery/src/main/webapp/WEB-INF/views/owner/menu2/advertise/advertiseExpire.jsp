
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<!-- top 끝 -->

	<script type="text/javascript">
		function pageFunc(curPage){
				$('form[name=frmPage]').find('input[name=currentPage]').val(curPage);	
				$('form[name=frmPage]').submit();
		}
		

		
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
		<bR><br><br>
		 <!-- 광고등록 탭 + 버튼-->
		  <div class="row mt-3">
		  		<div class="col-md-2 col-sm-12"></div>
		  		<div class="col-md-8 col-sm-12">
			  		<ul class="nav nav-pills" style="float: left;">
						  <li class="nav-item">
						    <a class="nav-link " aria-current="page" href="<c:url value="/owner/menu2/advertise/advertiseMain.do"/>">진행</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link active" href="<c:url value="/owner/menu2/advertise/advertiseExpire.do"/>">만료</a>
						  </li>
					</ul>
	               	 <button id="btAdRegister" class="btn btn-warning" style="float: right;">광고등록</button>
	            </div>
	                  <div class="col-md-2 col-sm-12"></div>
		  </div>
		  <br>


		<!-- 테이블 감싼 디비 시작 -->

		<div class="row" id="table-hover-row">
			  <div class="col-md-2 col-sm-12"></div>
			  
			  <div class="col-md-8 col-sm-12">
			    <div class="card">
			      <div class="card-header text-center">
			        <h4 class="card-title mt-4"  style="font-size:30px; color:#333; font-weight:bold;">만료된 광고</h4>
			      </div>
			      <div class="card-content">
			        <div class="card-body text-center">
			         
					  	
					  		<form name="frmPage" method="post" name="frm1"  action="<c:url value='/owner/menu2/advertise/advertiseExpire.do'/>" >
					  			<div class="row" >
						  			<div class="col-md-5 col-12"></div>
						  			<div class="col-md-6 col-12 ">
										 <%@include file="../../../owner/datePicker/datePicker.jsp" %>	
										<input type="hidden" name="currentPage" value="1">
									</div>
									<div class="col-md-1 col-12">
										<input type="submit" value="조회"  style=" background-color:#f1f3f5; color:#333; border:1px solid #004e66;">
									</div>
								</div>
							</form>
						
					
			
						<br>
			 
			        
					        <!-- table hover -->
					        <div class="table-responsive">
					          <table class="table table-hover mb-5">
					            <thead>
					              <tr class="text-center" style="background-color:#004e66; color:white;">
					              	<th>번호</th>
					                <th>광고번호</th>
					                <th>광고명</th>
					                <th>가격</th>
					                <th>만료일</th>
					              </tr>
					            </thead>
					            <tbody>
					            <!-- table 시작 -->
					            	<c:if test="${empty list }">
					            	<tr>
										<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
									</tr>
					            	</c:if>
					            	<c:if test="${!empty list }">
					            	<c:forEach var="vo" items="${list }">	
						              <tr  class="text-center">
						              		<td>${vo.rnum }</td>
							                <td class="text-bold-500">FDAD${vo.storeadNo }</td>
							                <td>${vo.advertiseName }</td>
							                <td>${vo.advertisePrice }</td>
							                <td>${fn:substring(vo.adValidate , 0,10) }</td>
						              </tr>
						              </c:forEach>
						           </c:if>
					            </tbody>
					          </table>
					        </div>
					        <!-- table reponsive div 끝 -->
				      </div>
				    </div>
				    <!-- 카드 컨텐츠 div 끝 -->
			 	 </div>
			  </div>
			  <div class="col-md-2 col-sm-12"></div>
		</div>
		<!-- 테이블 끝 -->
	

		<!-- 계속 페이지 첫 시작에서 문제 생김 -->
		<!-- 페이징 시작 -->
		<div class="card-body">
           <nav aria-label="Page navigation example">				<!-- 페이지 가운데 정렬은  justify-content-center-->
               <ul class="pagination pagination-primary justify-content-center">
		   <!-- 페이지 번호 추가 -->		
			<!-- 이전 블럭으로 이동 -->
		 			<c:if test="${pagingInfo.firstPage>1 }">	
						<li class="page-item">
			                   <a class="page-link" href="#" aria-label="Previous" onclick="pageFunc(${pagingInfo.firstPage-1})">
        							<span aria-hidden="true">&laquo;</span>
			                   </a>
		                   </li>
					</c:if>
		                
	              <!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
						<c:if test="${i==pagingInfo.currentPage }">
							 <li class="page-item active"><a class="page-link" href="#" >${i}</a></li>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
						    <li class="page-item"><a class="page-link" href="#" onclick="pageFunc(${i})">${i}</a></li>
						</c:if>
					</c:forEach>

				  <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">	
					<li class="page-item">
		                   <a class="page-link" href="#" aria-label="Previous"  onclick="pageFunc(${pagingInfo.lastPage+1})">
								 <span aria-hidden="true">&raquo;</span>
		                   </a>
	                   </li>
				 </c:if>
               </ul>
           </nav>
        </div> 
		
  <%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>


	