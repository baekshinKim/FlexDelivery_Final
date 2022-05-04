<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@include file="../../adminInc/top.jsp" %>    
	
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
    var ok=$('#messageOk').html();
	console.log(ok);
    
    $('#mediumCategoryWrite').on('hidden.bs.modal', function (e) {
	    console.log('modal close');
	  $(this).find('form')[0].reset()
	  $('#message2').hide();
	  $('#message').html("중분류 카테고리 이름을 입력해주세요.");
	  $('#message').show();
	  $('#messageOk').html("N");

	});
    
    $('#mCategoryName').on('keyup', function(){
 	   writeFunc();
   
    });
});

function chkDu(content){
	var pattern=new RegExp(/^[ㄱ-ㅎ가-힣]+$/g);
	return pattern.test(content);
}

function readyWriteSubmit(){
	writeFunc();
	
	var lCategory=$('#lCategoryNo').val();
	var wSel=$('#weatherNo').val();
	var ok=$('#messageOk').html();
	//alert("lCategory:"+lCategory+", wSel:"+wSel+", ok:"+ok);
	//alert("html:"+ok);
	
	if(ok=="Y" && lCategory!="0" && wSel!="0"){
		console.log("폼 전송 성공!");
		$('form[name=frmMediumCategoryWrite]').submit();
	} else if (lCategory=="0"){
		alert("대분류 카테고리를 선택해주세요!");
		event.preventDefault();
	} else if(ok=="N"){
		alert("올바른 이름을 입력해주세요!");
		event.preventDefault;
		//return false;
	} else if (wSel=="0"){
		alert("날씨 카테고리를 선택해주세요!");
		event.preventDefault();
	} else {
		alert("error!");
		event.preventDefault();
	}
}

function writeFunc(){
	  var name=$('#mCategoryName').val();
	  
	  if(chkDu(name) && name.length>0){
		  $.ajax({
			  type:"get",
			  url:"<c:url value='/admin/menu6/mCategory/ajaxCheck.do' />",
			  data:"mCategoryName="+name,
			  dataType:"json",
			  success: function (bool) {
				  if(bool){
					  result = "사용 가능한 카테고리 이름입니다.";
					  $('#message').hide();
					  $('#message2').show();
					  $('#message2').html(result);
					  $('#messageOk').html("Y");
				  }else{
					  result = "이미 등록된 카테고리 이름입니다.";
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
		  $('#message').html("중분류 카테고리 이름을 입력해주세요.");
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
		<!-- Hoverable rows start -->
		<div class="row" id="table-hover-row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">음식메뉴- 중분류 카테고리 </h4>
						<hr>
					</div>
					<div class="card-content" style="text-align: right;">
						<div class="card-body" style="text-align: right;">
							<!-- 등록모달 호출하는 등록버튼 -->
							<button type="button" class="btn btn-dark round block" id="modalWriteBt"
							   data-toggle="modal" data-backdrop="false" data-target="#mediumCategoryWrite" >
							     등록
							</button>						
								<!-- #weatherWrite 모달 start -->
								<div class="modal fade text-left" id="mediumCategoryWrite" tabindex="-1" 
			                        role="dialog" aria-labelledby="중분류 카테고리 등록" aria-hidden="true">
			                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
			                           <div class="modal-content">
											<form name="frmMediumCategoryWrite" method="post" action="<c:url value='/admin/menu6/mediumCategory/write.do' />">
			                                	<div class="modal-header" style="background-color: black;">
				                                    <h4 class="modal-title" style="color: white;" id="mediumWrite">음식메뉴 - 중분류 카테고리 등록</h4>
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
																		<th colspan="2">대분류</th>
																		<th colspan="2">중분류 이름</th>
																		<th>추천 날씨</th>
																	</tr>
																</thead> -->
				                                                <tbody>
				                                                   <!-- <tr>
				                                                   	  <td>
				                                                   	  	  <input type="text" name="mCategoryNo" value="123" readonly>
				                                                   	  </td>
			                                                   	  </tr> -->
			                                                   	  <tr>
			                                                   	  	<td>대분류 카테고리</td>
				                                                      <td colspan="2"  style="text-align: center;">
				                                                      	<select name="lCategoryNo" id="lCategoryNo">
				                                                      		<option value="0">선택하세요</option>
				                                                      		<c:forEach var="lCVo" items="${lCList }">
																				<option value="${lCVo.lCategoryNo}">${lCVo.lCategoryName }</option>
																			</c:forEach> 
				                                                      	</select>
				                                                      </td>			                                                   	  	
																  </tr>
																  <tr>
																  	<td>중분류 카테고리 이름</td>
				                                                      <td colspan="2"  style="text-align: center;">
				                                                      	  <input type="text" name="mCategoryName" id="mCategoryName">
				                                                      	  <br><span id="message" style="color: #dc3545;font-weight: bold;">중분류 카테고리 이름을 입력해주세요.</span>
				                                                         <span id="message2" style="color: #6610f2;font-weight: bold;"></span>
				                                                         <span id="messageOk">N</span>
				                                                      </td>
			                                                      </tr>
			                                                      <tr>
			                                                      	<td>추천 날씨</td>
				                                                      <td colspan="2">
				                                                      	<select name="weatherNo" id="weatherNo">
				                                                      		<option value="0">선택하세요</option>
				                                                      		<c:forEach var="wVo" items="${wList }">
																				<option value="${wVo.weatherNo}">${wVo.weatherName }</option>
																			</c:forEach> 
				                                                      	</select>
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
			                              	</form><!-- frmMediumCategoryrWrite등록 폼 모달 -->
			                            </div>
			                         </div>
			                     </div>            
								<!-- #mediumCategoryWrite 모달 end -->

							<div class="card-body">
							<c:if test="${empty list }">
			                     <div class="row">
			                        <div class="col-12">
			                           <div class="table-responsive">
											<table class="table table-hover mb-0" style="text-align: center;">
												<thead>
													<tr>
														<th>번호</th>
														<th colspan="2">대분류</th>
														<th colspan="2">중분류 이름</th>
														<th>추천 날씨</th>
														<th>등록 메뉴 수</th>
														<th>비고</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td colspan="8">등록된 중분류 카테고리가 없습니다.</td>
													</tr>
												</tbody>
											</table>
										</div>
			                        </div>
			                     </div>
		                 	 </c:if> 		
		                 	 <c:if test="${!empty list }">
		                 	 	<div class="row">	                 
									<div class="table-responsive">
										<table class="table table-hover mb-0" style="text-align: center;">
											<thead>
												<tr>
													<th>번호</th>
													<th colspan="2">대분류</th>
													<th colspan="2">중분류 이름</th>
													<th>추천 날씨</th>
													<!-- <th>등록 메뉴 수 </th> -->
													<th>비고</th>
												</tr>
											</thead>
											<c:forEach var="vo" items="${list}" varStatus="status">
											
												<tbody>
													<tr>
														<td class="text-bold-500">${vo.mCategoryNo }</td>
														<td colspan="2">${vo.lCategoryName }</td>
														<td colspan="2">${vo.mCategoryName }</td>
														<td>${vo.weatherName }</td>
														<%-- <td>${vo.lCCount }</td> --%>
														<td>
															<button type="button" class="btn btn-dark round btEdit" id="modalEditBt${vo.mCategoryNo}"
						                                       data-toggle="modal" data-backdrop="false" data-target="#mediumCategoryEdit${vo.mCategoryNo}">
						                                       	수정</button>					                                       
					                                        <button type="button" class="round btn btn-danger" data-toggle="modal" data-backdrop="false" 
					                                          data-target="#mediumCategoryDelete${vo.mCategoryNo}" id="modalDeleteBt${vo.mCategoryNo}">
					                                          	삭제</button>
														
															<!-- #mediumCategoryDelete 삭제 모달 -->
					                                       <div class="modal fade text-left" id="mediumCategoryDelete${vo.mCategoryNo}" tabindex="-1" role="dialog"
					                                          aria-labelledby="중분류 카테고리 삭제" aria-hidden="true">
					                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
					                                             <div class="modal-content">
					                                                <form name="frmMediumCategoryDel" id="frmMCategoryDel" method="post" action="<c:url value='/admin/menu6/mediumCategory/delete.do' />">
					                                                   <div class="modal-header bg-danger">
					                                                      <h5 class="modal-title white" id="myModalLabel140">중분류 카테고리 삭제</h5>
					                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                                                          <i data-feather="x"></i>
					                                                      </button>
					                                                   </div>
					                                                   <div class="modal-body">
					                                                      <input type="hidden" name="mCategoryNo" value="${vo.mCategoryNo }">
					                                                      <input type="hidden" name="mCategoryNo" value="${vo.mCategoryName }">
					                                                      <input type="hidden" name="lCategoryNo" value="${vo.lCategoryNo }">
					                                                      <input type="hidden" name="weatherNo" value="${vo.weatherNo }">
					                                                      	중분류 카테고리 [<span style="font-weight: bolder;">${vo.mCategoryName }</span>] 를 삭제하시겠습니까?
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
					                                       </div> <!-- #mediumCategoryDelete 삭제 모달 end-->
					                                       
					                                       <!-- #mediumCategoryEdit 수정 모달 -->
					                                       <div class="modal fade text-left" id="mediumCategoryEdit${vo.mCategoryNo}" tabindex="-1" 
					                                          role="dialog" aria-labelledby="중분류 카테고리 수정" aria-hidden="true">
					                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
					                                             <div class="modal-content">
					                                    			<form name="frmMediumCategoryEdit" method="post" action="<c:url value='/admin/menu6/mediumCategory/edit.do' />">
					                                                   <div class="modal-header" style="background-color: black;">
					                                                      <h4 class="modal-title" style="color: white;" id="myModalMediumCategoryEdit">음식메뉴 - 중분류 카테고리 수정</h4>
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
					                                                                  <tbody>
					                                                                     <tr>
						                                                                     <td class="text-bold-500">
					                                                                           <input type="hidden" name="mCategoryNo" id="EditMCategoryNo" value="${vo.mCategoryNo }" readonly>
					                                                                           	대분류 카테고리	 
						                                                                     </td>
																							 <td colspan="2">
					                                                                            <select name="lCategoryNo" id="lCategoryNo">
										                                                      		<option value="0">선택하세요</option>
										                                                      		<c:forEach var="lCVo" items="${lCList }">
										                                                      		<%-- <option value="NEW" <c:if test="${eventProductVO.eventName=='NEW' }">selected</c:if>>신상품</option> --%>
																										<option value="${lCVo.lCategoryNo}" <c:if test="${lCVo.lCategoryNo}=${vo.lCategoryNo }"> selected</c:if>>${lCVo.lCategoryName }</option>
																									</c:forEach> 
										                                                      	</select>
																							 </td>
																						 </tr>
																						 <tr>
																						 	<td>중분류 카테고리 이름</td>					                                                                    
																							 <td colspan="2">
					                                                                           <input type="text" name="mCategoryName" id="EditMCategoryName" value="${vo.mCategoryName }">
																							 </td>				
																						 </tr>
																						 <tr>	           
																						 	<td>추천 날씨</td>                                                    
																							 <td colspan="2">
																								<select name="weatherNo" id="weatherNo">
										                                                      		<option value="0">선택하세요</option>
										                                                      		<c:forEach var="wVo" items="${wList }">
																										<option value="${wVo.weatherNo}" <c:if test="${wVo.weatherNo}=${vo.weatherNo }"> selected</c:if>>${wVo.weatherName }</option>
																									</c:forEach> 
										                                                      	</select>			
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
					                                       </div> <!-- #mediumCategoryEdit 수정 모달 -->
														</td>
													</tr>
												</tbody>
											</c:forEach>
										</table>
									</div> <!--table responsive end-->
								</div><!-- row -->
							</c:if>
							</div>
						</div><!-- card-body  -->
					</div><!--card content end-->
				</div><!--card end-->
			</div> <!-- col-12 -->
		</div><!-- Hoverable rows end -->
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
    