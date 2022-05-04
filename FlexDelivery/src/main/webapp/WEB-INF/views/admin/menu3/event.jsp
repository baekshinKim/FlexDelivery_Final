<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/top.jsp" %>

<script>
$(function(){
	$('#btWrite').click(function(){
		location.href="${pageContext.request.contextPath}/admin/menu3/event/write.do";
	});
});
</script>

<!-- css start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<!-- css end -->

<div class="container">
	<div class="row">
	    <div class="col-12">
           <div class="card">
              <div class="card-header">
                <h3 class="section-title text-uppercase">이벤트</h3>
                <p class="text-subtitle text-muted">여러분을 위해 준비한 플렉스 딜리버리의 이벤트.</p>
                <hr>
              </div>
		<!-- 	<div class="page-title">
		        <div class="row">
		        </div>
		            <div class="col-12 col-md-6 order-md-1 order-last">
		    </div>
		    </div> -->
		    
				<div class="card-content"> 
		           <!-- modal start -->
		           <div class="card-body" style="text-align: right;">
		                <button type="button" class="btn btn-dark round block" id="btWrite"
		                 >
					     글쓰기
						</button>    
				  </div>
				  <div class="card-body">
		            	<c:if test="${empty list }">
				            <h3 class="card-title white text-center">등록된 이벤트 게시글이 없습니다.</h3>
				            <br><br>
		            	</c:if>
		            	<div class="row">

		            	<c:if test="${!empty list }">                  
                        	<c:forEach var="vo" items="${list}" varStatus="status">
				                <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-12">
				                    <div class="single-blog-area blog-style-2 mb-100">
				                        <div class="single-blog-thumbnail">
				                            <img src="${pageContext.request.contextPath}/resources/imgs/NoticeEventImages/${vo.boardThumbnail}" 
				                            	alt="글 ${vo.boardTitle }의 이미지">
				                            <div class="post-date">
				                                <a href="<c:url value='/admin/menu3/event/detail.do?no=${vo.boardNo }'/>"
				                                 	style="text-decoration: none;">${vo.boardNo } </a><br><span>${vo.authorityName }</span>
				                            </div>
				                        </div>
				                        <div class="single-blog-content mt-50">
				                            <div class="line"></div>
				                            <a class="post-tag">${vo.boardRegdate }</a>
				                            <h4><a href="<c:url value='/admin/menu3/event/detail.do?no=${vo.boardNo }'/>" 
				                            	class="post-headline" style="text-decoration: none;">${vo.boardTitle }</a></h4>
				                        </div>
				                    </div>
				                </div>
		            		</c:forEach>
	            		</c:if>
     				    </div>
		    		</div><!-- card-body -->
	    		</div><!-- card-content -->
		    </div><!-- card -->
	    </div>
    </div>
</div>
    
<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>  
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->
    
<%@ include file="../../adminInc/bottom.jsp" %>
