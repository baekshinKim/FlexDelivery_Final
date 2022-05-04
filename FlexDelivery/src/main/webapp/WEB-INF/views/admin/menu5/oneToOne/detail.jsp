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
	var bool=false;
	$('#editReplyDiv').hide();
	
	$('#detailReplyEdit').click(function(){
		
		//alert("수정 클릭! bool="+bool);
		bool=!bool;
		//alert("수정 클릭2! bool="+bool);
		if(bool){
			$('#editReplyDiv').show();
		}else if (!bool){
			$('#editReplyDiv').hide();
		}
		
	});
	
	/* $('#detailReplyDelete').click(function(){
		$('#modalReplylDelete').modal('show');
	}); */
	
	/* $('#btReplyWriteSubmit').click(function(){
		var content=$('#replyAskContent').val();
		if (content.length==0){
			alert("내용을 입력해주세요!");
			prevent.eventDefault();
		}
	}); */
	
	
	$('#detailList').click(function(){
		location.href="${pageContext.request.contextPath}/admin/menu5/oneToOne.do";
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
					                            <a class="post-tag" style="font-size:1em;">${vo.askNo }번째 문의</a>
					                            <h4><a class="post-headline mb-0">${vo.askTitle }</a></h4>
					                            <div class="post-meta mb-50">
					                                <p style="font-size:1em;"> ${vo.askRegdate }, By <a style="font-size:1em;">${vo.askId }</a></p>
					                                <hr>
					                            </div>
					                            <div class="text-left">
					                            	<br><br><br>
						                            <p>${vo.askContent }</p>
					                            </div>
											</div>
					                    </div>
										<div class="text-center" style="text-center">
											<br><br>
											<button type="button" class="btn round block btn-dark" id="detailList">목록</button>
										</div>
				                    </div><!-- 본문 내용 col-12 -->
				                    
									<div class="col-12 mt-50">
										<hr>
										<c:if test="${empty rVo}">
										
											<p class="mt-50 mb-50" style="font-weight: bolder; text-align: center;">등록된 답변이 없습니다.</p>
											<hr>
	                                       <div class="post-a-comment-area mt-70">
						                        <!-- <h5 style="text-algin: left;">답변</h5> -->
						                        <div class="card-body">
							                        <!-- Reply Form -->
							                        <form name="frmReplyWrite" action="<c:url value='/admin/menu5/oneToOne/writeReply.do' />" method="post">
							                            <div class="row">
							                                <div class="col-12 col-md-6">
							                                    <div class="group">
							                                    	<input type="hidden" name="askNo" value="${vo.askNo }">
							                                    	<input type="hidden" name="askId" value="admin">
							                                    	<input type="hidden" name="askGroupNo" value="${vo.askNo }">
							                                    	<input type="hidden" name="askStep" value="${vo.askStep +1}">
							                                    	<input type="hidden" name="authorityNo" value="6">
							                                        <input style="text-align: right;" type="text" name="askId" id="replyAskId" 
							                                        	value="플렉스 딜리버리" readonly required disabled>
							                                        <span class="highlight"></span>
							                                        <span class="bar"></span>
							                                        <label>작성자</label>
							                                    </div>
							                                </div>
							                                <div class="col-12 col-md-6">
							                                    <div class="group">
							                                        <input style="text-align: right;" type="text" name="askTitle" id="replyAskTitle" 
							                                        	value="RE:${vo.askTitle }" readonly required>
							                                        <span class="highlight"></span>
							                                        <span class="bar"></span>
							                                        <label>제목</label>
							                                    </div>
							                                </div>
							                                <div class="col-12">
							                                    <div class="group">
							                                        <textarea name="askContent" id="replyAskContent" required></textarea>
							                                        <span class="highlight"></span>
							                                        <span class="bar"></span>
							                                        <label>답변내용</label>
							                                    </div>
							                                </div>
		<!-- 					                                <div class="col-12">
							                                    <div class="group">
							                                        <span class="highlight"></span>
							                                        <span class="bar"></span>
							                                        <label>Comment</label>
							                                    </div>
							                                </div>
		 -->					                                <div class="col-12">
							                                    <button type="submit" id="btReplyWriteSubmit" class="btn original-btn block btn-secondary" style="background-color: black;">답변 등록</button>
							                                </div>
							                            </div>
							                        </form>
						                        </div>
						                    </div>
                  
										</c:if>
	                                    
										<c:if test="${!empty rVo}">
	                                      <!-- Comment Area Start -->
					                    <div class="comment_area clearfix mt-70">
					                        <h5 class="title">답변</h5>
					
					                        <ol>
					                            <!-- Single Comment Area -->
					                            <li class="single_comment_area">
					                                <!-- Comment Content -->
					                                <div class="comment-content d-flex">
					                                    <!-- Comment Meta -->
					                                    <div class="comment-meta">
					                                    	<c:if test="${rVo.askId=='admin' }">
						                                        <a class="post-date" style="font-size:0.9em;">플렉스 딜리버리 | ${rVo.askRegdate }</a>					                                    	
					                                    	</c:if>
					                                    	<c:if test="${rVo.askId!='admin' }">
						                                        <a class="post-date" style="font-size:0.9em;">${rVo.askId } | ${rVo.askRegdate }</a>
					                                    	</c:if>
					                                        <p style="font-weight: 600;">${rVo.askTitle }</p>
					                                        <hr>
					                                        <p>${rVo.askContent }</p>
					                                        <button type="button" style="border: none; outline: none; background: none;" class="comment-reply" 
					                                        	id="detailReplyEdit">수정</button> | 
					                                       <button type="button" style="border: none; outline: none; background: none;" class="comment-reply" 
					                                       		id="detailReplyDelete" data-toggle="modal" 
																data-backdrop="false" data-target="#modalReplylDelete" >삭제</button>
					                                    </div>
					                                </div>
					                            </li>
					                        </ol>
					                    </div><!-- 답변 내용 출력 -->
					                    
					                    <!-- 수정 버튼 누를 경우 수정 폼 뜨기 -->
					                    <div class="post-a-comment-area mt-70" id="editReplyDiv">
						                        <!-- <h5 style="text-algin: left;">답변</h5> -->
						                        <div class="card-body">
							                        <!-- Reply Form -->
							                        <form name="frmReplyEdit" action="<c:url value='/admin/menu5/oneToOne/editReply.do' />" method="post">
							                            <div class="row">
							                                <div class="col-12 col-md-6">
							                                    <div class="group">
							                                    	<input type="hidden" name="askNo" value="${rVo.askNo }">
							                                    	<input type="hidden" name="askId" value="admin">
							                                    	<input type="hidden" name="askGroupNo" value="${rVo.askGroupNo }">
							                                    	<input type="hidden" name="askStep" value="${rVo.askStep}">
							                                    	<input type="hidden" name="authorityNo" value="6">
							                                        <input style="text-align: right;" type="text" name="askId" id="replyAskId" 
							                                        	value="플렉스 딜리버리" disabled required>
							                                        <span class="highlight"></span>
							                                        <span class="bar"></span>
							                                        <label>작성자</label>
							                                    </div>
							                                </div>
							                                <div class="col-12 col-md-6">
							                                    <div class="group">
							                                        <input style="text-align: right;" type="text" name="askTitle" id="replyAskTitle" 
							                                        	value="${rVo.askTitle }" readonly required>
							                                        <span class="highlight"></span>
							                                        <span class="bar"></span>
							                                        <label>제목</label>
							                                    </div>
							                                </div>
							                                <div class="col-12">
							                                    <div class="group">
							                                        <textarea name="askContent" id="replyAskContent" required>${rVo.askContent }</textarea>
							                                        <span class="highlight"></span>
							                                        <span class="bar"></span>
							                                        <label>답변내용</label>
							                                    </div>
							                                </div>
							                                <div class="col-12">
							                                    <button type="submit" id="btReplyEditSubmit" style="background-color: black;" class="btn round block btn-secondary">답변 수정</button>
							                                </div>
							                            </div>
							                        </form>
						                        </div>
						                    </div>
						                    
					                    </c:if>
	                                   
                    					 <!-- 삭제 모달 -->
	                                       <div class="modal fade text-left" id="modalReplylDelete" tabindex="-1" role="dialog" 
	                                          aria-labelledby="답변 삭제" aria-hidden="true">
	                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
	                                             <div class="modal-content">
	                                                <form name="frmReplyDel" id="frmReplyDel" method="post" action="<c:url value='/admin/menu5/oneToOne/deleteReply.do?no=${rVo.askNo }' />">
	                                                   <div class="modal-header bg-danger">
	                                                      <h5 class="modal-title white" id="myModalLabel170">1:1문의 답변 삭제</h5>
	                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                                          <i data-feather="x"></i>
	                                                      </button>
	                                                   </div>
	                                                   <div class="modal-body">
	                                                        <input type="hidden" name="askGroupNo" value="${rVo.askGroupNo }" >
	                                                       
	                                                      	[<span style="font-weight: bolder;">${vo.askNo}번 게시글: ${vo.askTitle }</span>] 의 답변을 삭제하시겠습니까?
	                                                   </div>
	                                                   <div class="modal-footer">
	                                                      <button type="button" class="btn btn-light-secondary" data-dismiss="modal" id="modalDelCancel">
	                                                         <i class="bx bx-x d-block d-sm-none"></i>
	                                                         <span class="d-none d-sm-block">취소</span>
	                                                      </button>
	                                                      
	                                                      <button type="button" class="btn btn-danger ml-1" data-dismiss="modal" id="modalDelOk" onclick="form.submit()">
	                                                         <i class="bx bx-check d-block d-sm-none"></i>
	                                                         <span class="d-none d-sm-block">삭제</span>
	                                                      </button>
	                                                   </div>
	                                                </form>
	                                             </div>
	                                          </div>
	                                       </div> <!-- 삭제 모달 end-->
	                                       
										</div>       
					                </div><!-- col-12 -->
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
