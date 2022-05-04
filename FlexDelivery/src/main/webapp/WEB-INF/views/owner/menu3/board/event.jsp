<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../ownerInc/top.jsp" %>




<script type="text/javascript">
	function pageFunc(curPage){
		$('form[name=frmPage]').find('input[name=currentPage]').val(curPage);	
		$('form[name=frmPage]').submit();
	}
</script>


<style>
	.page-item.active .page-link{
		background-color: rgb(182,73,197);
		border-color: rgb(182,73,197);
	}
		
	a.event{
		color:black;	
	}
	
	a.event:hover{
		color: rgb(182,73,197);
		text-decoration: none;
	}
	
	a.page-link {
		color:rgb(182,73,197);
	}
	
	#eventSearch {
		background-color:  rgb(237,242,13);

		border-radius: 2px;
		width: 55px;
		
	}
	
</style>




	<br>
	<br>
	<br>
<div class="row">

	<!-- 헤드 시작 -->
	<div class="col-12 col-md-2"></div>
	<div class="col-12 col-md-8 text-center" >
	 <h3>이 벤 트</h3>
	</div>
	<div class="col-12 col-md-2"></div>
	
		<br>
		<br>
		<Br>
	
		<br>
		
	
	
	
		<!-- 페이지 이동시 필요한 form -->	
		<form name="frmPage" method="post" style="float:right;"
			action="<c:url value='/owner/menu3/board/event.do'/>">
			<input type="hidden" name="currentPage">
			<input type="hidden" name="searchCondition" 
				value="${param.searchCondition }">
			<input type="hidden" name="searchKeyword"
				value="${param.searchKeyword }">	
		</form>
			
			
		<!-- 검색 시 필요한 form -->	 
		<div class="col-12 col-md-3"></div>	 
		<div class="col-12 col-md-6 text-right" >
		<form name="frmSearch" method="post" 
   			action="<c:url value='/owner/menu3/board/event.do'/>">
			<select name="searchCondition">
		            <option value="board_title" 
		            	<c:if test="${param.searchCondition == 'board_title'}">
		            		selected="selected"
		            	</c:if>
		            >제목</option>
		            <option value="board_content"
		            	<c:if test="${param.searchCondition == 'board_content'}">
		            		selected="selected"
		            	</c:if>
		            >내용</option>
       		</select> 
      	   	<input type="text" name="searchKeyword" title="검색어 입력"
        		value="${param.searchKeyword}">   
			<input type="submit" id="eventSearch" value="검색">
		 </form>
		</div>
		<div class="col-12 col-md-3"></div>
	
		<br>
		<br>
		<Br>
	
	
		<!-- 이벤트 내용 시작 -->
		<div class="col-12 col-md-3"></div>
		<div class="col-12 col-md-6 text-center" >
			<c:if test="${empty list}">
				<div class="card">
		  			<div class="card-body">
		 				이벤트 준비 중 입니다.
		  			</div>
				</div>
			</c:if>
			<div class="row">
				<c:if test="${!empty list }">
					<c:forEach var="vo" items="${list}" varStatus="status">
							<div class="col-12 col-md-4 p-4">
						  	  	<div class="card h-100" >
							      <!-- 이미지 띄우기 -->
								   <!-- 나중에 파일 업로드 후에 아래 주석을 풀어주세요.. 지금은 이미지 확인차.. -->
								   
								   		<c:if test="${fn:substring(vo.boardThumbnail, 0,4)=='http' }">
											<img src="${vo.boardThumbnail}" class="card-img-top"  alt ="${vo.boardTitle }"  style="height:150px;">
										</c:if>
										<c:if test="${fn:substring(vo.boardThumbnail, 0,4)!='http' and (!empty vo.boardThumbnail) }">
											<img src
												="<c:url value='/resources/imgs/NoticeEventImages/${vo.boardThumbnail}'/>" 
												alt="${vo.boardTitle }" class="card-img-top"style="height:150px;">
										</c:if>
								        <!-- 내용띄우기 -->
								     	<div class="card-body">
								       		 <h5 class="card-title">
							       		 		<a class="event" href="<c:url value='/owner/menu3/board/boardDetail.do?boardNo=${vo.boardNo }&boardHead=${vo.boardHead }'/>" >
								       		 		<c:if test="${fn:length(vo.boardTitle)>=10}">
														${fn:substring(vo.boardTitle, 0,10) } ..
													</c:if>
													<c:if test="${fn:length(vo.boardTitle)<10}">				
														${vo.boardTitle}
													</c:if>
																		<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->					
													<c:if test="${vo.newImgTerm<24 }">
														<img src="<c:url value='/resources/imgs/new.gif'/>" 
															alt="new 이미지">
													</c:if>
												</a>
											</h5>
								        	<p class="card-text"><span><small>${fn:substring(vo.boardRegdate, 0,10) }</small></span></p>
								     	</div>
								    </div>
						     
								 </div>
					 </c:forEach>
				  </c:if>
			   </div>
		</div>

		<div class="col-12 col-md-3"></div>
			
		
		
		
		
		
		
		
		
		
	
<!-- 페이지 시작-->
		<div class="card-body">
           <nav aria-label="Page navigation example">				
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
        
        <br>
		<br>
	
</div>


		 
        <br>
		<br>
		<br>
		

<%@ include file="../../../ownerInc/bottom.jsp" %>