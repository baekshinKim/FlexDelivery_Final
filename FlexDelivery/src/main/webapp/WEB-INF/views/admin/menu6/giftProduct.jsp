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

<!-- script start -->
<script>
$(function(){
	$('#message2').hide();
	$('#messageOk').hide();
    
    $('#giftProductWrite').on('hidden.bs.modal', function (e) {
	    console.log('modal close');
	  $(this).find('form')[0].reset()
	  $('#preview').html("<img src='${pageContext.request.contextPath}/resources/imgs/CommonImages/noImageDefault.png'>");
	  $('#message2').hide();
	  $('#message').html("상품 이름을 입력해주세요.");
	  $('#message').show();
	  $('#messageOk').html("N");

	});
    
    $('#gProductName').on('keyup', function(){
 	   writeFunc();
   
    });
    
	 $('#upfile').on('change', function(){
	       readInputFile(this);
	   });

	 listForAll();
	 
	 $.ajax({
		type:"GET",
		url: "<c:url value='/admin/menu6/gProduct/category/list.do' />",
		dataType: 'json',
		success: function(res){
			var info="";
            	//<a href="#" class="btn btn-outline-dark">${cVo.gCategoryName }</a>
			if (res.length > 0){
				info+="<li><a onclick='listForAll()' style='cursor: pointer;' onmouseover='onMouseOver(event)' onmouseout='onMouseOut(event)'>전체보기</a></li>";
				$.each(res, function(idx, item){
					info+="<li>"+"<a onclick='listForCategory("+item.gCategoryNo+")' style='cursor: pointer;' onmouseover='onMouseOver(event)' onmouseout='onMouseOut(event)'>"
					+ item.gCategoryName + "</a>"+"</li>";;
					
				});
			} 
			
			$('#forPrintCategory').html(info);
		},
		error: function(xhr, status, error){
			console.log(error);
		}
	 });//ajax
});

function readInputFile(input) {
    if(input.files && input.files[0]) {
        var reader = new FileReader();
       reader.onload = function (e) {
            $('#preview').html("<img src="+ e.target.result +">");
        }
        reader.readAsDataURL(input.files[0]);
    }  
} 

function chkDu(content){
	var pattern=new RegExp(/^[ㄱ-ㅎ가-힣\s]+$/g);
	return pattern.test(content);
}

function readyWriteSubmit(){
	writeFunc();	//이름 중복검사
	var img=$('#upfile').val();	//이미지 파일 첨부 여부 검사
	var sel=$('#writeSelect').val();//셀렉트 체크 여부 검사
	var ok=$('#messageOk').html();
	//alert("html:"+ok+", sel:"+sel);
	
	if(ok=="Y" && img!='' && sel!='0'){
		console.log("폼 전송 성공!");
		$('form[name=frmGiftProductWrite]').submit();
	}else if (img=='') {
		alert("이미지를 첨부하세요!(필수)");
		event.preventDefault();
	}else if (sel=='0'){
		alert("선물 카테고리를 선택해주세요!");
		event.preventDefault();
	}else if(ok=="N"){
		alert("올바른 상품 이름을 입력해주세요!");
		event.preventDefault;
		//return false;
	} else {
		alert("error!");
		event.preventDefault();
	}
}

/*function readyEditSubmit(){
	
	var img=$('form[name=frmGiftProductEdit]').find('#upfile').val();	//이미지 파일 첨부 여부 검사
	var select=$('#gCategoryNoEdit').val();//셀렉트 체크 여부 검사
	var name=$('#gNameEdit').val();
	//alert("img:"+img+", name:"+name+", select:"+sel);
	console.log("img:"+img+", name:"+name+", select:"+select);
	
	if(img=='' && name!=''){
		var bool=confirm("기존 이미지를 사용하시겠습니까?");
		if (bool){
			console.log("폼 전송 성공!");
			$('form[name=frmGiftProductEdit]').submit();			
		} else {
			event.preventDefault();
		}

	/* else if (select=='0'){
		alert("선물 카테고리를 선택해주세요!");
		event.preventDefault();
	} 
	else if(name==''){
		alert("상품 이름을 입력해주세요!");
		event.preventDefault;
		//return false;
	} else {
		alert("error!");
		event.preventDefault();
	}
	
}*/

function writeFunc(){
	  var name=$('#gProductName').val();
	  
	  if(chkDu(name) && name.length>0){
		  $.ajax({
			  type:"get",
			  url:"<c:url value='/admin/menu6/gProduct/ajaxCheck.do' />",
			  data:"gProductName="+name,
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
		  $('#message').html("상품 이름을 입력해주세요.");
		  $('#messageOk').html("N");

	  	
 	  }else if(!chkDu(name)){
		  $('#message2').hide();
		  $('#message').show();
		  $('#message').html("한글만 사용 가능합니다.");
		  $('#messageOk').html("N");

	  }
}

function onMouseOver(e){
	$(e.target).css("color", "white");
}

function onMouseOut(e){
	$(e.target).css("color", "#727E8C");
}

function listForAll() {
	var str="";
	
	$.ajax({
		type: "GET",
		url: "<c:url value='/admin/menu6/gProduct/listAll.do' />",
		dataType:'json',
		success: function(res){
			if (res.length == 0){
				str+="<div class='col-12'>";
				str+="<div class='text-center bg-lighten-2 mt-70 mb-70'>";
				//str+="<div class='card-content d-flex'>";
				//str+="<div class='card-body'>";
				str+="<h2 class='card-title white'>등록된 선물 상품이 없습니다.</h2>";
                str+="</div></div>";
                //</div></div>";
                
			} else {
				$.each(res, function(idx, gvo) {
					str+="<div class='col-xl-3 col-lg-4 col-md-4 col-sm-6 col-12'>";
					str+="<div class='card text-center bg-lighten-2'>";
					str+="<div class='card-content d-flex'>";
					str+="<div class='card-body'>";
					str+="<img class='card-img-top mb-1' src='${pageContext.request.contextPath}/resources/imgs/GiftProductImages/"+gvo.gProductFilename+"' alt='"+gvo.gProductFilename+"' style='height: 120px'>";
					if (gvo.gCategoryNo==1){
						str+="<span class='badge bg-danger'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==2) {
						str+="<span class='badge' style='background-color: #D7F205; color: black;'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==3) {
						str+="<span class='badge bg-success'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==4) {
						str+="<span class='badge bg-secondary'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==5) {
						str+="<span class='badge bg-warning'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==6) {
						str+="<span class='badge bg-info'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==7) {
						str+="<span class='badge' style='background-color: #F25CA2;'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==8) {
						str+="<span class='badge' style='background-color: #008080;'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==9) {
						str+="<span class='badge' style='background-color: #AB05F2;'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==10) {
						str+="<span class='badge bg-primary'>"+gvo.gCategoryName+"</span>";						
					} else {
						str+="<span class='badge bg-light'>"+gvo.gCategoryName+"</span>";						
					}
					console.log(gvo.gCategoryNo+", "+gvo.gCategoryName);
					str+="<p class='card-text white'>"+gvo.gProductNo+"</p>";
					str+="<h4 class='card-title'>"+gvo.gProductName+"</h4>";
					str+="<button type='button' class='round btn btn-dark' id='modalEditBt"+gvo.gProductNo+"'";
					str+=" data-toggle='modal' data-backdrop='false' data-target='#giftProductEdit"+gvo.gProductNo+"'>수정</button>";
					str+="<button type='button' class='round btn btn-danger' data-toggle='modal' data-backdrop='false' ";
					str+="data-target='#giftProductDelete"+gvo.gProductNo+"' id='modalDeleteBt'"+gvo.gProductNo+"'>삭제</button>";
					str+="</div></div></div></div>";
					
				})
				str+="";
			}
			
			$('#forPrint').html(str);
		},
		error: function(xhr, status, error){
			console.log(error);
		}
	}); //ajax
	
}//listForAll

function listForCategory(no){
	var categoryNo=no;
	
	$.ajax({
		type:"GET",
		url :"<c:url value='/admin/menu6/gProduct/list.do?categoryNo="+categoryNo+"' />",
		dataType:'json',
		success: function(res){
			var str="";
			
			if (res.length==0){
				str+="<div class='col-12'>";
				str+="<div class='text-center bg-lighten-2 mt-70 mb-70'>";
				//str+="<div class='card-content d-flex'>";
				//str+="<div class='card-body'>";
				str+="<h2 class='card-title white'>등록된 선물 상품이 없습니다.</h2>";
                str+="</div></div>";
                //</div></div>";
				
			} else {
				$.each(res, function(idx, gvo){
					str+="<div class='col-xl-3 col-lg-4 col-md-4 col-sm-6 col-12'>";
					str+="<div class='card text-center bg-lighten-2'>";
					str+="<div class='card-content d-flex'>";
					str+="<div class='card-body'>";
					str+="<img class='card-img-top mb-1' src='${pageContext.request.contextPath}/resources/imgs/GiftProductImages/"+gvo.gProductFilename+"' alt='"+gvo.gProductFilename+"' style='height: 120px'>";
					if (gvo.gCategoryNo==1){
						str+="<span class='badge bg-danger'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==2) {
						str+="<span class='badge' style='background-color: #D7F205; color: black;'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==3) {
						str+="<span class='badge bg-success'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==4) {
						str+="<span class='badge bg-secondary'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==5) {
						str+="<span class='badge bg-warning'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==6) {
						str+="<span class='badge bg-info'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==7) {
						str+="<span class='badge' style='background-color: #F25CA2;'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==8) {
						str+="<span class='badge' style='background-color: #d185e6;'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==9) {
						str+="<span class='badge' style='background-color: #5af2d1;'>"+gvo.gCategoryName+"</span>";						
					} else if (gvo.gCategoryNo==10) {
						str+="<span class='badge bg-primary'>"+gvo.gCategoryName+"</span>";						
					} else {
						str+="<span class='badge bg-light'>"+gvo.gCategoryName+"</span>";						
					}
					str+="<p class='card-text white'>"+gvo.gProductNo+"</p>";
					str+="<h4 class='card-title'>"+gvo.gProductName+"</h4>";
					str+="<button type='button' class='round btn btn-dark' id='modalEditBt"+gvo.gProductNo+"'";
					str+=" data-toggle='modal' data-backdrop='false' data-target='#giftProductEdit"+gvo.gProductNo+"'>수정</button>";
					str+="<button type='button' class='round btn btn-danger' data-toggle='modal' data-backdrop='false' ";
					str+="data-target='#giftProductDelete"+gvo.gProductNo+"' id='modalDeleteBt'"+gvo.gProductNo+"'>삭제</button>";
					str+="</div></div></div></div>";
				});//each
			}//else
			
			$('#forPrint').html(str);
		},
		error: function(xhr, status, error){
			console.log(error);
		}
	});//ajax
}

</script>
<!-- script end -->


<div class="container">
	<div class="row">
		<div class="col-12 ">
            <div class="card">
                <div class="card-header">
	                <h4 class="section-title text-uppercase">선물하기 - 상품 목록</h4><hr>
                </div>
                <div class="card-body" style="text-align: right;">
                     <!-- 등록모달 호출하는 등록버튼 -->
					<button type="button" class="btn btn-dark round block" id="modalWriteBt"
					   data-toggle="modal" data-backdrop="false" data-target="#giftProductWrite" >
					     등록
					</button>						
					<!-- #giftProductWrite 모달 start -->
					<div class="modal fade text-left" id="giftProductWrite" tabindex="-1" 
                        role="dialog" aria-labelledby="선물 상품 등록" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                           <div class="modal-content">
								<form name="frmGiftProductWrite" method="post" action="<c:url value='/admin/menu6/giftProduct/write.do' />" enctype="multipart/form-data">
                                	<div class="modal-header" style="background-color: black;">
	                                    <h4 class="modal-title" style="color: white;">선물 - 상품 등록</h4>
	                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                       <i data-feather="x"></i>
	                                    </button>
	                                </div>
                                	<div class="modal-body">                                 
	                                    <div class="row">
	                                       <div class="col-12">   
	                                          <div class="table-responsive" style="text-align: center;">
	                                         
	                                             <table class="table mb-0">
													<tbody>
														<tr>
	                                                      <td colspan="3"  style="text-align: center;">
	                                                         <div id="preview"><img src="${pageContext.request.contextPath}/resources/imgs/CommonImages/noImageDefault.png" id="previewImg"/></div>
	                                                      </td>
														</tr>
														<tr>
	                                                      <td colspan="3"  style="text-align: center;">
	                                                         <div>
	                                                            <input type="file" id="upfile" name="upfile" class="btn btn-outline-light" accept=".gif, .jpg, .png" />             
	                                                         </div>
	                                                      </td>
	                                                   </tr>
														<tr>
															<td colspan="1">선물 카테고리</td>
															<td colspan="2">
																<select name="gCategoryNo" id="writeSelect">
																	<option value="0">선택하세요</option>
																	<c:forEach var="cVo" items="${cList }">
																		<option value="${cVo.gCategoryNo }">${cVo.gCategoryName }</option>
																	</c:forEach>
																</select>
															</td>
														</tr>
														<tr>
															<td colspan="1">상품 이름</td>
															<td colspan="2">
															<input type="text" name="gProductName" id="gProductName">
															<br><span id="message" style="color: #dc3545;font-weight: bold;">상품 이름을 입력해주세요.</span>
	                                                         <span id="message2" style="color: #6610f2;font-weight: bold;"></span>
	                                                         <span id="messageOk">N</span>
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
                              	</form><!-- frmGiftProductWrite등록 폼 모달 -->
                            </div>
                         </div>
                     </div>            
					<!-- #giftProductWrite 모달 end -->
                </div><!--card-body-->
                <div class="card-content">
					<div class="sidebar-widget-area" style="margin-bottom: 2px; margin-left: 3%;">
			            <div class="widget-content">
					        <div class="row match-height">
					        	<ul class="tags" id="forPrintCategory">   
		                        	<!-- ajax -->                  
					        	</ul>
					       </div>
				       </div>
					</div>
					
                <div class="card-body">
					<div class="row" id="forPrint">
					</div>
		                  <c:forEach var="vo" items="${list }" varStatus="status">
		                  
								<!-- #giftProductDelete 삭제 모달 -->
                              <div class="modal fade text-left" id="giftProductDelete${vo.gProductNo}" tabindex="-1" role="dialog"
                                 aria-labelledby="선물 상품 삭제" aria-hidden="true">
                                 <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                    <div class="modal-content">
                                       <form name="frmGiftProductDel" id="frmgProductDel" method="post" action="<c:url value='/admin/menu6/giftProduct/delete.do' />">
                                          <div class="modal-header bg-danger">
                                             <h5 class="modal-title white" id="myModalLabel140">선물 상품 삭제</h5>
                                             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                 <i data-feather="x"></i>
                                             </button>
                                          </div>
                                          <div class="modal-body">
                                             <input type="hidden" name="gProductNo" value="${vo.gProductNo }">
                                             <input type="hidden" name="gProductName" value="${vo.gProductName }">
                                             <input type="hidden" name="gProductFilename" value="${vo.gProductFilename }">
                                             <input type="hidden" name="gCategoryNo" value="${vo.gCategoryNo }">
                                             	[<span style="font-weight: bolder;">${vo.gProductName }</span>] 상품을 삭제하시겠습니까?
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
                              </div> <!-- #giftProductDelete 삭제 모달 end-->
                              
                              <!-- #giftProductEdit 수정 모달 -->
                              <div class="modal fade text-left" id="giftProductEdit${vo.gProductNo}" tabindex="-1" 
                                 role="dialog" aria-labelledby="선물 상품 수정" aria-hidden="true">
                                 <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                    <div class="modal-content">
                           			<form name="frmGiftProductEdit" method="post" action="<c:url value='/admin/menu6/giftProduct/edit.do' />" enctype="multipart/form-data">
                                          <div class="modal-header" style="background-color: black;">
                                             <h4 class="modal-title" style="color: white;" id="myModalGiftProductEdit">선물 상품 수정</h4>
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
				                                                 <td colspan="3"  style="text-align: center;">
                                                                   <input type="hidden" name="gProductNo" value="${vo.gProductNo }" readonly>	 
				                                                    <div id="preview"><img src="${pageContext.request.contextPath}/resources/imgs/GiftProductImages/${vo.gProductFilename}" id="previewImg"/></div>
				                                                 </td>
															</tr>
															<tr>
				                                                 <td colspan="3"  style="text-align: center;">
				                                                    <div>
				                                                    	<input type="hidden" name="oldFileName" value="${vo.gProductFilename }">
				                                                       <input type="file" id="upfile" name="upfile" class="btn btn-outline-light" accept=".gif, .jpg, .png" />             
				                                                    </div>
				                                                 </td>
				                                              </tr>
	                                                          <tr>
																 <td colspan="1">선물 카테고리</td>
		                                                       	 <td colspan="2">
	                                                                  <select name="gCategoryNo" id="gCategoryNoEdit">
				                                                 		<option value="0">선택하세요</option>
				                                                 		<c:forEach var="cVo" items="${cList }">
																			<option value="${cVo.gCategoryNo}">${cVo.gCategoryName }</option>
																		</c:forEach> 
				                                                 	</select>
																 </td>  
                                                             </tr>
															   <tr>
																 <td colspan="1">상품 이름</td>
															 	 <td colspan="2"><input type="text" name="gProductName" value="${vo.gProductName }" id="gNameEdit"></td>
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
                                             <button type="button" class="btn btn-dark ml-1" name="modalEdit" id="modalEdit" onclick="form.submit()">
                                                <i class="bx bx-check d-block d-sm-none"></i>
                                                <span class="d-none d-sm-block">수정</span>
                                             </button>
                                          </div>
                                       </form>
                                    </div>
                                 </div>
                              </div> <!-- #giftProductEdit 수정 모달 -->
                              
	         							
						</c:forEach> 
					</div><!--row-match-height-->
				</div><!-- card-body -->
			</div><!-- card -->
		</div><!--col-12-->
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
    