<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../adminInc/top.jsp" %>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<!-- css start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<!-- css end -->

<script>
$(function(){
	
	$('#message2').hide();
	$('#messageOk').hide();
   
	$('#eventCouponWrite').on('hidden.bs.modal', function (e) {
	  $(this).find('form')[0].reset()
	  $('#message2').hide();
	  $('#message').html("쿠폰 이름을 입력해주세요.");
	  $('#message').show();
	  $('#messageOk').html("N");

	});
	
	$('#eCouponName').on('keyup', function(){
		   writeFunc();
			  
	   });//write keyup function
	   
	$('#startDateSelect').change(function(){
		if($(this).val()=='etc'){
			$('#startDate').val('');
			$('#startDate').css('visibility','visible');
			$('#startDate').focus();				
		}else{
			var s=$(this).val()
			$('#startDate').css('visibility','hidden');
			$('#startDate').val(s);
		}	
	}); 
	   
	$('#endDateSelect').change(function(){
		if($(this).val()=='etc'){
			$('#endDate').val('');
			$('#endDate').css('visibility','visible');
			$('#endDate').focus();				
		}else{
			var s=$(this).val()
			$('#endDate').css('visibility','hidden');
			$('#endDate').val(s);
		}	
	}); 
	   
	$('#editStartDateSelect').change(function(){
		if($(this).val()=='etc'){
			$('#editStartDate').val('');
			$('#editStartDate').css('visibility','visible');
			$('#editStartDate').focus();				
		}else{
			var s=$(this).val()
			$('#editStartDate').css('visibility','hidden');
			$('#editStartDate').val(s);
		}	
	});   
	   
	$('#editEndDateSelect').change(function(){
		if($(this).val()=='etc'){
			$('#editEndDate').val('');
			$('#editEndDate').css('visibility','visible');
			$('#editEndDate').focus();				
		}else{
			var s=$(this).val()
			$('#editEndDate').css('visibility','hidden');
			$('#editEndDate').val(s);
		}	
	});   
});

function chkDu(content){
	var pattern=new RegExp(/^[ㄱ-ㅎ가-힣0-9!a-zA-Z\s]+$/g);
	return pattern.test(content);
}

function readyWriteSubmit(){
	writeFunc();
	var ok=$('#messageOk').html();
	var name=$('#eCouponName').val();
	var min=$('#eCouponMinWrite').val();
	var dc=$('#eCouponDcWrite').val();
	
	//alert("ok:"+ok+", name:"+name+", min:"+min+", dc:"+dc);
	
	if(ok=="Y" && name!='' && dc!='' && min!=''){
		console.log("폼 전송 성공!");
		$('form[name=frmEventCouponWrite]').submit();
	} else if (name==''){
		alert("이름을 입력해주세요!");
		event.preventDefault();
	} else if (ok=="N"){
		alert("올바른 이름을 입력해주세요!");
		event.preventDefault();
	}else if (dc==''){
		alert("할인금액을 입력해주세요!");
		event.preventDefault();
	}else if (min==''){
		alert("최소주문금액을 입력해주세요!");
		event.preventDefault();
	} else {
		alert("error!");
		event.preventDefault();
	}
}

function writeFunc(){
	
	  var name=$('#eCouponName').val();
	  
	  if(chkDu(name) && name.length>0){
		  $.ajax({
			  type:"get",
			  url:"<c:url value='/admin/menu6/eCoupon/ajaxCheck.do' />",
			  data:"eCouponName="+name,
			  dataType:"json",
			  success: function (bool) {
				  if(bool){
					  result = "사용 가능한 이름입니다.";
					  $('#message').hide();
					  $('#message2').show();
					  $('#message2').html(result);
					  $('#messageOk').html("Y");
					  
				  }else{
					  result = "이미 등록된 이름입니다.";
					  $('#message2').hide();
					  $('#message').show();
					  $('#message').html(result);
					  $('#messageOk').html("N");
					  
				  }
				
			}//success

		  }); //ajax
	  }else if (name.length<1){
		  $('#message2').hide();
		  $('#message').show();
		  $('#message').html("이름을 입력해주세요.");
		  $('#messageOk').html("N");

	  	
 	  }else if(!chkDu(name)){
		  $('#message2').hide();
		  $('#message').show();
		  $('#message').html("한글만 사용 가능합니다.");
		  $('#messageOk').html("N");

	  }
}
</script>

<div class="container">
	<div class="row">
		<div class="row" id="table-hover-row">
			<div class="col-12">
			 	<div class="card">
			 	
			  		<div class="card-header">
						<h4 class="card-title">쿠폰 관리 - 이벤트 쿠폰</h4>
						<hr>
			    	</div>
			    	<div class="card-content">
						<div class="card-body" style="text-align: right;">
			        		<p>
			        		<!-- 등록모달 호출하는 등록버튼 -->
							<button type="button" class="btn btn-dark round block" id="modalWriteBt"
							   data-toggle="modal" data-backdrop="false" data-target="#eventCouponWrite" >
							     등록
							</button>	</p>					
							<!-- #eventCouponWrite 모달 start -->
							<div class="modal fade text-left" id="eventCouponWrite" tabindex="-1" 
		                        role="dialog" aria-labelledby="이벤트 쿠폰 등록" aria-hidden="true">
		                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
		                           <div class="modal-content">
										<form name="frmEventCouponWrite" method="post" action="<c:url value='/admin/menu6/eventCoupon/write.do' />">
		                                	<div class="modal-header" style="background-color: black;">
			                                    <h4 class="modal-title" style="color: white;" id="gpWrite">이벤트쿠폰 - 등록</h4>
			                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                                       <i data-feather="x"></i>
			                                    </button>
			                                </div>
			                                <div class="modal-body">                                 
			                                    <div class="row">
			                                       <div class="col-12">   
			                                          <div class="table-responsive" style="text-align: center;">
			                                             <table class="table mb-0" >
															<!-- <thead style="text-align: center;">
																<tr>
																	<th>번호</th>
																	<th colspan="3">쿠폰이름</th>
																	<th>시작일</th>
																	<th>만료일</th>
																	<th>할인가격</th>
													                <th>최소주문금액</th>
																</tr>
															</thead> -->
			                                                <tbody style="text-align: center;">
			                                                	<tr>
			                                                		<td>쿠폰 이름</td>
			                                                		<td colspan="2">
			                                                			<input type="text" name="eCouponName" id="eCouponName">
			                                                			<br><span id="message" style="color: #dc3545;font-weight: bold;">쿠폰 이름을 입력해주세요.</span>
				                                                         <span id="message2" style="color: #6610f2;font-weight: bold;"></span>
				                                                         <span id="messageOk"></span>
			                                                		</td>
			                                                	</tr>
			                                                   <tr>
			                                                   	  <td>
			                                                   	  	  <input type="hidden" name="eCouponNo" value="123" readonly>
			                                                   	  	  쿠폰 적용 시작일
			                                                      </td>
			                                                      <td colspan="2">
			                                                      	<select class="form-select mb-3" aria-label="Default select example" id="startDateSelect">
																	  <option selected value="0">바로 적용</option>
																	  <option value="3">3일 후</option>
																	  <option value="7">7일 후</option>
																	  <option value="14">14일 후</option>
																	  <option value="etc">직접입력 (n일 후, 숫자만 입력)</option>
																	</select>
			                                    	               	<input type="text" name="startDate" id="startDate" value="0" style="visibility: hidden">
			                                                      </td>
		                                                      </tr>
		                                                      <tr>
		                                                      	  <td>쿠폰 적용 만료일</td>
			                                                      <td colspan="2">
			                                                      	<select class="form-select mb-3" aria-label="Default select example" id="endDateSelect">
																	  <option selected value="15">보름 후</option>
																	  <option value="30">1개월 후</option>
																	  <option value="60">2개월 후</option>
																	  <option value="etc">직접입력 (n개월 후, 숫자만 입력)</option>
																	</select>
			                                    	               	<input type="text" name="endDate" id="endDate" value="15" style="visibility: hidden">
			                                                      </td>
		                                                      </tr>
		                                                      <tr>
		                                                      	  <td>할인가격</td>
			                                                      <td colspan="2">
			                                    	               	<input type="text" name="eCouponDc" id="eCouponDcWrite">
			                                                      </td>
		                                                      </tr>
		                                                      <tr>
		                                                      	  <td>최소주문금액</td>
			                                                      <td colspan="2">
			                                    	               	<input type="text" name="eCouponMin" id="eCouponMinWrite">
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
			                                    <button type="button" class="btn btn-dark ml-1" name="modalWrite" id="modalWrite" onclick="readyWriteSubmit()">
			                                       <i class="bx bx-check d-block d-sm-none"></i>
			                                       <span class="d-none d-sm-block">등록</span>
			                                    </button>
											</div>
										</form><!-- frmEventCouponWrite등록 폼 모달 -->
									</div>
								</div>
							</div>
						
							<!-- #regularCouponWrite 모달 end -->			    	
						    <div class="table-responsive">
						    	<table class="table table-hover mb-0" style="text-align: center;">
						            <thead>
						              <tr style="background-color: black; color:white;">
						                <th>번호</th>
						                <th colspan="3">쿠폰 이름</th>
										<th>시작일</th>
										<th>만료일</th>
										<th>할인가격</th>
						                <th>최소주문금액</th>
						                <th>비고</th>
						              </tr>
						            </thead>
						            <c:if test="${empty list }">
						              <tr>
						                <td colspan="9" class="text-bold-500" style="text-align: center;">등록된 데이터가 없습니다.</td>
						              </tr>
						           	</c:if>
						           	<c:if test="${!empty list }">
						          		<c:forEach var="vo" items="${list }" varStatus="status" >
						            <tbody>
						              <tr>
						                 <td class="text-bold-500">${vo.eCouponNo }</td>
						                 <td colspan="3">${vo.eCouponName }</td>
						                 <td>${fn:substring(vo.eCouponStartDate, 0,10)}</td>
						                 <td>${fn:substring(vo.eCouponEndDate, 0,10)}</td>
						                 
						                 <td><fmt:formatNumber value="${vo.eCouponDc}" pattern="#,###원" /></td>
						                 <td><fmt:formatNumber value="${vo.eCouponMin }" pattern="#,###원" /></td>
						                 <td>
						                 	<button type="button" class="btn btn-dark round btEdit" id="modalEditBt${vo.eCouponNo}"
		                                       data-toggle="modal" data-backdrop="false" data-target="#eventCouponEdit${vo.eCouponNo}">
		                                       	수정</button>					                                       
	                                        <button type="button" class="round btn btn-danger" data-toggle="modal" data-backdrop="false" 
	                                          data-target="#eventCouponDelete${vo.eCouponNo}" id="modalDeleteBt${vo.eCouponNo}">
	                                          	삭제</button>
	                                          	
                                       		<!-- #eventCouponDelete 삭제 모달 -->
	                                       <div class="modal fade text-left" id="eventCouponDelete${vo.eCouponNo}" tabindex="-1" role="dialog"
	                                          aria-labelledby="이벤트 쿠폰 삭제" aria-hidden="true">
	                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
	                                             <div class="modal-content">
	                                                <form name="frmEventCouponDel" id="frmEventCouponDel" method="post" action="<c:url value='/admin/menu6/eventCoupon/delete.do' />">
	                                                   <div class="modal-header bg-danger">
	                                                      <h5 class="modal-title white" id="myModalLabel140"> 이벤트 쿠폰 삭제</h5>
	                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                                          <i data-feather="x"></i>
	                                                      </button>
	                                                   </div>
	                                                   <div class="modal-body">
	                                                      <input type="hidden" name="eCouponNo" value="${vo.eCouponNo }">
	                                                      <input type="hidden" name="eCouponName" value="${vo.eCouponName }">
	                                                      <input type="hidden" name="eCouponStartDate" value="${vo.eCouponStartDate }">
	                                                      <input type="hidden" name="eCouponEndDate" value="${vo.eCouponEndDate }">
	                                                      <input type="hidden" name="eCouponDc" value="${vo.eCouponDc }">
	                                                      <input type="hidden" name="eCouponMin" value="${vo.eCouponMin }">
	                                                      [<span style="font-weight: bolder;">${vo.eCouponName}</span>] 쿠폰을 삭제하시겠습니까?
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
	                                       </div> <!-- #eventCouponDelete 삭제 모달 end-->
	                                       
	                                       <!-- #eventCouponEdit 수정 모달 -->
	                                       <div class="modal fade text-left" id="eventCouponEdit${vo.eCouponNo}" tabindex="-1" 
	                                          role="dialog" aria-labelledby="이벤트 쿠폰 수정" aria-hidden="true">
	                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
	                                             <div class="modal-content">
	                                    			<form name="frmEventCouponEdit" method="post" action="<c:url value='/admin/menu6/eventCoupon/edit.do' />">
	                                                   <div class="modal-header" style="background-color: black;">
	                                                      <h4 class="modal-title" style="color: white;" id="myModalEventCouponEdit">이벤트쿠폰 - 수정</h4>
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
		                                                               <!-- <thead>
															              <tr>
															                <th>번호</th>
															                <th colspan="3">쿠폰 이름</th>
																			<th>시작일</th>
																			<th>만료일</th>
																			<th>할인가격</th>
															                <th>최소주문금액</th>
															              </tr>
															            </thead> -->
		                                                                <tbody>
		                                                                    <tr>
		                                                                    	<td>쿠폰 번호</td>
			                                                                     <td class="text-bold-500"colspane="2" >
		                                                                         	<input type="text" name="eCouponNo" id="eventCouponNo" value="${vo.eCouponNo }" readonly>						                                                                     
			                                                                     </td>
		                                                                     </tr>
		                                                                     <tr>
		                                                                     	<td>쿠폰 이름</td>
																			  	 <td colspan="2">
		                                                                        	 <input type="text" name="eCouponName" id="eventCouponDc" value="${vo.eCouponName }">
		                                                                         </td>
	                                                                         </tr>
	                                                                         <tr>
	                                                                         	<td>쿠폰 적용 시작일</td>
			                                                                     <td colspan="2">
			                                                                     	<select class="form-select mb-3" aria-label="Default select example" id="editStartDateSelect">
																					  <option selected value="0">변경없음 (기존 : ${fn:substring(vo.eCouponStartDate, 0,10)})</option>
																					  <option value="3">3일 후</option>
																					  <option value="7">7일 후</option>
																					  <option value="14">14일 후</option>
																					  <option value="etc">직접입력 (숫자만 입력)</option>
																					</select>
							                                    	               	<input type="text" name="startDate" id="editStartDate" value="0" style="visibility: hidden">
			                                                                     </td>
		                                                                     </tr>
		                                                                     <tr>
	                                                                         	<td>쿠폰 적용 만료일</td>
			                                                                     <td colspan="2">
			                                                                     	<select class="form-select mb-3" aria-label="Default select example" id="editEndDateSelect">
																					  <option selected value="0">변경없음 (기존 : ${fn:substring(vo.eCouponEndDate, 0,10)})</option>
																					  <option value="30">1개월 후</option>
																					  <option value="60">2개월 후</option>
																					  <option value="etc">직접입력 (숫자만 입력)</option>
																					</select>
							                                    	               	<input type="text" name="endDate" id="editEndDate" value="0" style="visibility: hidden">
			                                                                     </td>
		                                                                     </tr>
		                                                                     <tr>
		                                                                     	<td>할인 가격</td>
		                                                                         <td colspan="2">
		                                                                        	<input type="text" name="eCouponDc" id="eventCouponDc" value="${vo.eCouponDc }">
																			 	</td>
																	 		</tr>
																	 		<tr>             
																	 			<td>최소 주문 금액</td>
		                                                                         <td colspan="2">
		                                                                        	<input type="text" name="eCouponMin" id="eventCouponMin" value="${vo.eCouponMin }">
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
	                                       </div> <!-- #eventCouponEdit 수정 모달 -->
						                 </td>
						               </tr>
					              
									</tbody>
									</c:forEach>
									</c:if>
								</table>
							</div><!--table-responsive-->
						</div><!--card-body-->
					</div><!--card-content-->
				</div><!--card-->
			</div>
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
    
    