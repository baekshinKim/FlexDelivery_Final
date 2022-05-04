<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../ownerInc/top.jsp" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



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
		
	a.detail{
		color:black;	
	}
	
	a.detail:hover{
		color: rgb(182,73,197);
		text-decoration: none;
	}
	
	a.page-link {
		color:rgb(182,73,197);
	}
	
	#noticeSearch {
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
	<div class="col-12 col-md-2  mb-5"></div>
	<div class="col-12 col-md-8 text-center mb-5" >
	 <h3>공 지 사 항</h3>
	</div>
	<div class="col-12 col-md-2 mb-5"></div>
	

	
		<!-- 페이지 이동시 필요한 form -->	
		<form name="frmPage" method="post" style="float:right;"
			action="<c:url value='/owner/menu3/board/notice.do'/>">
			<input type="hidden" name="currentPage">
			<input type="hidden" name="searchCondition" 
				value="${param.searchCondition }">
			<input type="hidden" name="searchKeyword"
				value="${param.searchKeyword }">	
		</form>
			
			
		<!-- 검색 시 필요한 form -->	 
		<div class="col-12 col-md-2"></div>	 
		<div class="col-12 col-md-8 text-right" >
		<form name="frmSearch" method="post" 
   			action="<c:url value='/owner/menu3/board/notice.do'/>">
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
			<input type="submit" id="noticeSearch" value="검색">
		 </form>
		</div>
		<div class="col-12 col-md-2"></div>
	
		
			
			

		
		
	<br>
	<br>
	<!-- 테이블 시작 -->
	<div class="col-12 col-md-2"></div>
	<div class="col-12 col-md-8">
		<table class="table table">
		  <thead>
		    <tr class="text-center">
		      <th scope="col" style="width:30%;">번호</th>
		      <th scope="col" style="width:40%;">제목</th>
		
		      <th scope="col" style="width:30%;">등록일</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:if test="${empty list }">
		  		<tr class="text-center">
		     	 	<th colspan="3">공지사항이 없습니다</th>
		    	</tr>
		  	</c:if>
		  	<c:if test="${!empty list }">
			  	<c:forEach var="vo" items="${list}">
				    <tr class="text-center">
				      <th scope="row">${vo.RNUM }</th>
				      <td><a class="detail" href="${pageContext.request.contextPath}/owner/menu3/board/boardDetail.do?boardNo=${vo.boardNo}&boardHead=${vo.boardHead}">
								<!-- 제목이 긴 경우 일부만 보여주기 -->
								<c:if test="${fn:length(vo.boardTitle)>=30}">
									${fn:substring(vo.boardTitle, 0,30) } ...
								</c:if>
								<c:if test="${fn:length(vo.boardTitle)<30}">						
									${vo.boardTitle}
								</c:if>
								<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->					
								<c:if test="${vo.newImgTerm<24 }">
									<img src="<c:url value='/resources/imgs/new.gif'/>" 
										alt="new 이미지">
								</c:if>
							 </a>
				        </td>
				      <td>${fn:substring(vo.boardRegdate, 0,10) }</td>
				    </tr>
				</c:forEach>
			</c:if>
		  </tbody>
		</table>
	</div>
	<div class="col-12 col-md-2"></div>
</div>



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
		<br>
		
       
    	
<%@ include file="../../../ownerInc/bottom.jsp" %>
