<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../adminInc/top.jsp" %>

<!-- css start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<!-- css end -->

<script>
$(function(){
	$('#detailEdit').click(function(){
		location.href="${pageContext.request.contextPath}/admin/menu3/honeytip/edit.do?no="+${vo.honeytipNo};
	});
	

	
	$('#detailList').click(function(){
		location.href="${pageContext.request.contextPath}/admin/menu3/honeytip.do";
	});
});
</script>

<div class="container">
	<div class="row">
	    <div class="col-12">
           <div class="card">

				<div class="card-content"> 
		           <div class="card-body">
						<div class="main-content container-fluid">
			                <div class="col-12">
			                    <div class="single-blog-area blog-style-2 mb-100">
		                       <!-- ##### Post Content Area ##### -->
					                <div class="col-12">
					                    <!-- Single Blog Area  -->
					                    <div class="single-blog-area blog-style-2 mb-50">
					                        <!-- Blog Content -->
					                        <div class="single-blog-content">
					                            <div class="line"></div>
					                            <a class="post-tag">${vo.honeytipNo }번째 꿀팁</a>
					                            <h4><a class="post-headline mb-0">${vo.honeytipTitle }</a></h4>
					                            <div class="post-meta mb-50">
					                                <p>${vo.honeytipRegdate },		By <a>플렉스 딜리버리</a></p>
					                                <hr>
					                                <div style="display: flex; ">
					                                	<div class="col-6" style="text-align: left;">
					                                		<button type="button" class="btn round block btn-dark" id="detailEdit">수정</button>
															<button type="button" class="btn round block btn-danger" id="modalDeleteBt" data-toggle="modal" 
																data-backdrop="false" data-target="#honeytipDetailDelete" >삭제</button>
														</div>
					                                	<div class="col-6" style="text-align: right;">
					                                		<button type="button" class="btn round block btn-dark" id="detailList">목록</button>
														</div>
					                                </div>
					                                <hr>
					                            </div>
					                            <div class="text-center">
					                            	<img src="${pageContext.request.contextPath}/resources/imgs/HoneytipImages/${vo.honeytipThumbnail}">
					                            	<br><br><br>
						                            <p>${vo.honeytipContent }</p>
					                            </div>
											</div>
					                    </div>
					
					                    <!-- About Author -->
					                    <div class="blog-post-author mt-100 d-flex">
					                        <div class="author-thumbnail">
					                            <img src="${pageContext.request.contextPath}/resources/imgs/CommonImages/fdMemberLineTp.png" alt="플렉스딜리버리"
					                            	>
					                        </div>
					                        <div class="author-info">
					                            <div class="line"></div>
					                            <span class="author-role">Author</span>
					                            <h4><a class="author-name">플렉스 딜리버리</a></h4>
					                            <p><span>여러분께 행복을 선물해드리고 싶은 플렉스 딜리버리입니다.</span></p>
					                       </div>	
					                    </div>
										<div class="text-center" style="text-center">
											<!-- <br><br>
											<button type="button" class="btn round block btn-primary" id="detailEdit">수정</button>
											<button type="button" class="btn round block btn-danger" id="modalDeleteBt" data-toggle="modal" 
												data-backdrop="false" data-target="#honeytipDetailDelete" >삭제</button>
											<button type="button" class="btn round block btn-dark" id="detailList">목록</button>
											 -->
											<!-- #honeytipDetailDelete 삭제 모달 -->
	                                       <div class="modal fade text-left" id="honeytipDetailDelete" tabindex="-1" role="dialog"
	                                          aria-labelledby="사장님꿀팁 삭제" aria-hidden="true">
	                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
	                                             <div class="modal-content">
	                                                <form name="frmHoneytipDel" id="frmHoneytipDel" method="post" action="<c:url value='/admin/menu3/honeytip/delete.do?no=${vo.honeytipNo }' />">
	                                                   <div class="modal-header bg-danger">
	                                                      <h5 class="modal-title white" id="myModalLabel140">사장님꿀팁 삭제</h5>
	                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                                          <i data-feather="x"></i>
	                                                      </button>
	                                                   </div>
	                                                   <div class="modal-body">
	                                                      <input type="hidden" name="honeytipNo" value="${vo.honeytipNo }">
	                                                      <input type="hidden" name="honeytipTitle" value="${vo.honeytipTitle }">
	                                                      <input type="hidden" name="honeytipContent" value="${vo.honeytipContent }">
	                                                      <input type="hidden" name="oldFileName" value="${vo.honeytipThumbnail }">
	                                                      	[<span style="font-weight: bolder;">${vo.honeytipNo}번 게시글: ${vo.honeytipTitle }</span>] 을 삭제하시겠습니까?
	                                                   </div>
	                                                   <div class="modal-footer">
	                                                      <button type="button" class="btn btn-light-secondary" data-dismiss="modal" id="modalDelCancel">
	                                                         <i class="bx bx-x d-block d-sm-none"></i>
	                                                         <span class="d-none d-sm-block">취소</span>
	                                                      </button>
	                                                      
	                                                      <button type="button" class="btn btn-danger ml-1" data-dismiss="modal" id="modalDel" onclick="form.submit()">
	                                                         <i class="bx bx-check d-block d-sm-none"></i>
	                                                         <span class="d-none d-sm-block">삭제</span>
	                                                      </button>
	                                                   </div>
	                                                </form>
	                                             </div>
	                                          </div>
	                                       </div> <!-- #honeytipDetailDelete 삭제 모달 end-->
	                                       
										</div>       
					                </div><!-- col-12 -->
				                </div>
				            </div>
				        </div>
    				</div>
   				</div>
	    		
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

    
<%@ include file="../../../adminInc/bottom.jsp" %>
