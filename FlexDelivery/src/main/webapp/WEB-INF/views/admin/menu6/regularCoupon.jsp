<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../adminInc/top.jsp" %>    
	
<script>
$(function(){
	
	$('#message2').hide();
	$('#messageOk').hide();
   
	$('#regularCouponWrite').on('hidden.bs.modal', function (e) {
	    console.log('modal close');
	  $(this).find('form')[0].reset()
	  $('#message2').hide();
	  $('#message').html("할인금액과 최소 주문 금액을 입력해주세요.");
	  $('#message').show();
	  $('#messageOk').html("N");

	});
	
	$('#rCouponDc').on('keyup', function(){
		   writeFunc();  
	 });
	$('#rCouponMin').on('keyup', function(){
		   writeFunc();  
	 });
});

function chkDu(content){
	var pattern=new RegExp(/^[0-9]+$/g);
	return pattern.test(content);
}

function readyWriteSubmit(){
	writeFunc();
	var ok=$('#messageOk').html();
	
	if(ok=="Y"){
		console.log("폼 전송 성공!");
		$('form[name=frmRegularCouponWrite]').submit();
	}else if (ok=="N"){
		alert("등록 실패!");
		event.preventDefault();
		//return false;
	} else {
		alert("error!");
		event.preventDefault();
	}
}

function writeFunc(){
	
	  var dc=$('#rCouponDc').val();
	  var min=$('#rCouponMin').val();
	  
	  if(chkDu(dc) && dc.length>0 && chkDu(min) && min.length>0 && dc < min){
		  $.ajax({
			  type:"get",
			  url:"<c:url value='/admin/menu6/rCoupon/ajaxCheck.do' />",
			  data:"rCouponDc="+dc+"&rCouponMin="+min,
			  dataType:"json",
			  success: function (bool) {
				  if(bool){
					  result = "사용 가능한 금액입니다.";
					  $('#message').hide();
					  $('#message2').show();
					  $('#message2').html(result);
					  $('#messageOk').html("Y");
					  
				  }else{
					  result = "이미 등록된 금액입니다.";
					  $('#message2').hide();
					  $('#message').show();
					  $('#message').html(result);
					  $('#messageOk').html("N");
					  
				  }
				
			}//success

		  }); //ajax
	  }else if (dc.length<1){
		  $('#message2').hide();
		  $('#message').show();
		  $('#message').html("할인 금액을 입력해주세요.");
		  $('#messageOk').html("N");

		  
	  }else if (min.length<1){
		  $('#message2').hide();
		  $('#message').show();
		  $('#message').html("최소 주문 금액을 입력해주세요.");
		  $('#messageOk').html("N");

	  	
 	  }else if(!chkDu(dc) || !(chkDu(min))){
		  $('#message2').hide();
		  $('#message').show();
		  $('#message').html("숫자만 사용 가능합니다.");
		  $('#messageOk').html("N");

	  } else if (min < dc) {
		  $('#message2').hide();
		  $('#message').show();
		  $('#message').html("할인 금액은 최소 주문 금액보다 클 수 없습니다.");
		  $('#messageOk').html("N");
	  }
}
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
					<h4 class="card-title">쿠폰 관리 - 정기 쿠폰</h4>
					<hr>
		    	</div>
		    	<div class="card-content">
		      		<div class="card-body" style="text-align: right;">
		        		<!-- 등록모달 호출하는 등록버튼 -->
						<button type="button" class="btn btn-dark round block" id="modalWriteBt"
						   data-toggle="modal" data-backdrop="false" data-target="#regularCouponWrite" >
						     등록
						</button>						
						<!-- #regularCouponWrite 모달 start -->
						<div class="modal fade text-left" id="regularCouponWrite" tabindex="-1" 
	                        role="dialog" aria-labelledby="정기 쿠폰등록" aria-hidden="true">
	                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
	                           <div class="modal-content">
									<form name="frmRegularCouponWrite" method="post" action="<c:url value='/admin/menu6/regularCoupon/write.do' />">
	                                	<div class="modal-header" style="background-color: black;">
		                                    <h4 class="modal-title" style="color: white;" id="gpWrite">정기쿠폰 - 등록</h4>
		                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                                       <i data-feather="x"></i>
		                                    </button>
		                                </div>
		                                <div class="modal-body">                                 
		                                    <div class="row">
		                                       <div class="col-12">   
		                                          <div class="table-responsive" style="text-align: center;">
		                                             <table class="table mb-0">
														<!-- <thead>
															<tr>
																<th>번호</th>
																<th colspan="3">할인금액</th>
																<th>최소주문금액</th>
															</tr>
														</thead> -->
		                                                <tbody   style="text-align: center;">
                                                   	  	  <input type="hidden" name="rCouponNo" value="0" readonly>
		                                                   	 
	                                                   	  <tr>
	                                                   	  	 <td>할인금액</td>
		                                                      <td colspan="2">
		                                                      	  <input type="text" name="rCouponDc" id="rCouponDc">
		                                                      </td>
	                                                      </tr>
	                                                      <tr>
	                                                      	  <td>최소 주문 금액</td>
		                                                      <td colspan="2">
		                                    	               	<input type="text" name="rCouponMin" id="rCouponMin">
		                                                      </td>
		                                                   </tr>
		                                                   <tr>
		                                                   		<td colspan="3">
		                                                   			 <span id="message" style="color: #dc3545;font-weight: bold;">할인금액과 최소 주문 금액을 입력해주세요.</span>
			                                                         <span id="message2" style="color: #6610f2;font-weight: bold;"></span>
			                                                         <span id="messageOk"></span>
		                                                   		</td>
		                                                   </tr>
		                                                </tbody>
		                                             </table>                      
		                                          </div>
		                                       </div>
		                                    </div>        
		                                 </div>
		                                 <div class="modal-footer">
		                                    <button type="button" class="btn btn-outline-dark" data-dismiss="modal">
		                                       <i class="bx bx-x d-block d-sm-none"></i>
		                                       <span class="d-none d-sm-block">닫기</span>
		                                    </button>
		                                    <button type="button" class="btn btn-dark ml-1" name="modalWrite" 
		                                    	id="modalWrite" onclick="readyWriteSubmit()">
		                                       <i class="bx bx-check d-block d-sm-none"></i>
		                                       <span class="d-none d-sm-block">등록</span>
		                                    </button>
										</div>
									</form><!-- frmRegularCouponWrite등록 폼 모달 -->
								</div>
							</div>
						</div>
					</div><!-- card-body  -->
					<!-- #regularCouponWrite 모달 end -->

			       <div class="card-body">
			  			<div class="row" id="table-hover-row">
							<!-- table hover -->
						    <div class="table-responsive">
						    	<table class="table table-hover mb-0" style="text-align: center;">
						            <thead>
						              <tr style="background-color: black; color:white;">
						                <th>번호</th>
						                <th colspan="3">할인 가격</th>
						                <th colspan="3">최소주문금액</th>
						                <th style="width: 20em;">비고</th>
						              </tr>
						            </thead>
						           <tbody >
							           <c:if test="${empty list }">
							              <tr>
							                <td colspan="8" class="text-bold-500" style="text-align: center;">등록된 데이터가 없습니다.</td>
							              </tr>
							           	</c:if>
							           	<c:if test="${!empty list }">
							          		<c:forEach var="vo" items="${list }" varStatus="status" >
								            <tr>
								               <td class="text-bold-500">${vo.rCouponNo }</td>
								               <td colspan="3">${vo.rCouponDc }</td>
								               <td colspan="3">${vo.rCouponMin }</td>
								               <td>
								               		<button type="button" class="btn btn-dark round btEdit" id="modalEditBt${vo.rCouponNo}"
				                                       data-toggle="modal" data-backdrop="false" data-target="#regularCouponEdit${vo.rCouponNo}">
				                                       	수정</button>					                                       
			                                        <button type="button" class="round btn btn-danger" data-toggle="modal" data-backdrop="false" 
			                                          data-target="#regularCouponDelete${vo.rCouponNo}" id="modalDeleteBt${vo.rCouponNo}">
			                                          	삭제</button>
			                                          	
		                                       		<!-- #regularCouponDelete 삭제 모달 -->
			                                       <div class="modal fade text-left" id="regularCouponDelete${vo.rCouponNo}" tabindex="-1" role="dialog"
			                                          aria-labelledby="정기 쿠폰 삭제" aria-hidden="true">
			                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
			                                             <div class="modal-content">
			                                                <form name="frmRegularCouponDel" id="frmRegularCouponDel" method="post" action="<c:url value='/admin/menu6/regularCoupon/delete.do' />">
			                                                   <div class="modal-header bg-danger" >
			                                                      <h5 class="modal-title white" id="myModalLabel140">정기 쿠폰 삭제</h5>
			                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                                                          <i data-feather="x"></i>
			                                                      </button>
			                                                   </div>
			                                                   <div class="modal-body">
			                                                      <input type="hidden" name="rCouponNo" value="${vo.rCouponNo }">
			                                                      <input type="hidden" name="rCouponDc" value="${vo.rCouponDc }">
			                                                      <input type="hidden" name="rCouponMin" value="${vo.rCouponMin }">
			                                                      [<span style="font-weight: bolder;">${vo.rCouponMin}</span>] 원 주문 시 
			                                                      [<span style="font-weight: bolder;">${vo.rCouponDc }</span>] 할인권을 삭제하시겠습니까?
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
			                                       </div> <!-- #regularCouponDelete 삭제 모달 end-->
			                                       
			                                       <!-- #regularCouponEdit 수정 모달 -->
			                                       <div class="modal fade text-left" id="regularCouponEdit${vo.rCouponNo}" tabindex="-1" 
			                                          role="dialog" aria-labelledby="정기 쿠폰 수정" aria-hidden="true">
			                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
			                                             <div class="modal-content">
			                                    			<form name="frmRegularCouponEdit" method="post" action="<c:url value='/admin/menu6/regularCoupon/edit.do' />">
			                                                   <div class="modal-header" style="background-color: black;">
			                                                      <h4 class="modal-title" style="color: white;" id="myModalRegularCouponEdit">정기쿠폰 - 수정</h4>
			                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                                                         <i data-feather="x"></i>
			                                                      </button>
			                                                   </div>
			                                                   <div class="modal-body">
			                                                   <!-- Hoverable rows start -->
			                                                      <div class="row" id="table-hover-row">
			                                                         <div class="col-12">   
			                                                            <div class="table-responsive" style="text-align: center;">
			                                                               <table class="table mb-0">
			                                                                  <tbody style="text-align: center;">
		                                                                         <tr>
		                                                                           	<input type="hidden" name="rCouponNo" id="regularCouponNo" value="${vo.rCouponNo }" readonly>
		                                                                         	 <td>할인 금액</td>
																					 <td colspan="2">
			                                                                           <input type="text" name="rCouponDc" id="regularCouponDc" value="${vo.rCouponDc }">
			                                                                         </td>
		                                                                         </tr>
		                                                                         <tr>
		                                                                         	<td>최소 주문 금액</td>
			                                                                         <td colspan="2">
			                                                                           <input type="text" name="rCouponMin" id="regularCouponMin" value="${vo.rCouponMin }">
																					 </td>					                                                                    
			                                                                     </tr>                                                                 
			                                                                  </tbody>
			                                                               </table>                      
			                                                            </div>
			                                                         </div>
			                                                      </div>
			                                                   </div><!--modal body end-->
			                                                   <div class="modal-footer">
			                                                      <button type="button" class="btn btn-outline-dark" data-dismiss="modal">
			                                                         <i class="bx bx-x d-block d-sm-none"></i>
			                                                         <span class="d-none d-sm-block">닫기</span>
			                                                      </button>
			                                                      <button type="button" class="btn btn-dark ml-1" data-dismiss="modal" name="modalEdit" id="modalEdit" onclick="form.submit()">
			                                                         <i class="bx bx-check d-block d-sm-none"></i>
			                                                         <span class="d-none d-sm-block">수정</span>
			                                                      </button>
			                                                   </div>
			                                                </form>
			                                             </div>
			                                          </div>
			                                       </div> <!-- #rCouponEdit 수정 모달 -->
											   </td>
								            </tr>
								           </c:forEach>
					              		</c:if>
				              		</tbody>
				        		</table>
				      		</div>
				      	</div>
			    	</div>
			    </div>
			</div><!--card end-->
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

<%@include file="../../adminInc/bottom.jsp" %> 
    