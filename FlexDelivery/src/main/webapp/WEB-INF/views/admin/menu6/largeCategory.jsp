<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../adminInc/top.jsp" %>    
   
<!-- script start -->
<script>
$(function(){
	$('#message2').hide();
	$('#messageOk').hide();
	$('#emessage').hide();
    var ok=$('#messageOk').val();
	//console.log(ok);
    
    $('#largeWrite').on('hidden.bs.modal', function (e) {
	    console.log('modal close');
	  $(this).find('form')[0].reset()
	  $('#preview').html("<img src='${pageContext.request.contextPath}/resources/imgs/CommonImages/noImageDefault.png'>");
	  $('#message2').hide();
	  $('#message').html("대분류 카테고리 이름을 입력해주세요.");
	  $('#message').show();
	  $('#messageOk').html("N");

	});

   
   $('#upfile').on('change', function(){
       readInputFile(this);
   });

   
   /* $('#upfile').on('change', function(){
        if(input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
               $('#preview').html("<img src="+ e.target.result +">");
           }
           reader.readAsDataURL(input.files[0]);
       } 
       file = $('#upfile').prop("files")[0];
           blobURL = window.URL.createObjectURL(file);
           $('#upfile_preview img').attr('src', blobURL);
           $('#upfile_preview').slideDown(); //업로드한 이미지 미리보기 
           $(this).slideUp(); //파일 양식 감춤
       
      
   }); */
   
   $('#lCategoryName').on('keyup', function(){
	   writeFunc();
  
   });//write keyup function
   
/*    $('#EditlCategoryName').on('keyup', function(){
	   $('#messageOk2').show();
		 editFunc();  
   });//keyup function  */
   
   
});//readyFunction

/*    var sel_file;
       
function readInputFile(e){
   var files=e.target.files;
   var filesArr=Array/prototype.slice.call(files);
   
   filesArr.forEach(function(f){
          if (!f.type.match("image.*")){
             alert("확장자는 이미지 확장자만 가능합니다.");
             return;
          }
          
          sel_file=f;

          var reader = new FileReader();
        reader.onload = function (e) {
            $('#previewImg').attr("src", e.target.result);
        }
        
        reader.readAsDataURL(f);
      
   });
} */

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
	var pattern=new RegExp(/^[ㄱ-ㅎ가-힣/]+$/g);
	return pattern.test(content);
}

function readyWriteSubmit(){
	writeFunc();
	var ok=$('#messageOk').html();
	var img=$('#upfile').val();

	//alert("html:"+ok);
	
	if(ok=="Y" && img!=""){
		console.log("폼 전송 성공!");
		$('form[name=frmLCategoryWrite]').submit();
	}else if (img==""){
		alert("이미지를 첨부해주세요!(필수)");
		event.preventDefault();
	}else if(ok=="N"){
		alert("적합한 이름을 입력해주세요!");
		event.preventDefault();
		//return false;
	} else {
		alert("error!");
		event.preventDefault();
	}
}

/* function readyEditSubmit(){
	editFunc();
	var ok=$('#messageOk2').val();
	
	if(ok=="Y"){
		console.log("폼 전송 성공!");
		$('form[name=frmLCategoryEdit]').submit();
	}else {
		alert("등록 실패!");
		event.preventDefault;
		//return false;
	}
} */

function writeFunc(){
	  var name=$('#lCategoryName').val();
	  
	  if(chkDu(name) && name.length>0){
		  $.ajax({
			  type:"get",
			  url:"<c:url value='/admin/menu6/lCategory/ajaxCheck.do' />",
			  data:"lCategoryName="+name,
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
		  $('#message').html("대분류 카테고리 이름을 입력해주세요.");
		  $('#messageOk').html("N");

	  	
   	  }else if(!chkDu(name)){
		  $('#message2').hide();
		  $('#message').show();
		  $('#message').html("한글만 사용 가능합니다.");
		  $('#messageOk').html("N");

	  }
}
 
/*  function editFunc(){
	  var name=$('#EditlCategoryName').val();
	  
	  if(chkDu(name) && name.length>0){
		  $.ajax({
			  type:"get",
			  url:"<c:url value='/admin/menu6/lCategory/ajaxCheck.do' />",
			  data:"name="+name,
			  dataType:"json",
			  success: function (bool) {
				  if(bool){
					  result = "사용 가능한 카테고리 이름입니다.";
					  $('#emessage').hide();
					  $('#emessage2').html(result);
					  $('#emessage2').show();
					  $('#messageOk2').html("Y");

				  }else{
					  result = "이미 등록된 카테고리 이름입니다.";
					  $('#emessage2').hide();
					  $('#emessage').html(result);
					  $('#emessage').show();
					  $('#messageOk2').html("N");

				  }
					
			}//success

		  }); //ajax
	  }else if (name.length<1){
		  $('#emessage2').hide();
		  $('#emessage').html("대분류 카테고리 이름을 입력해주세요.");
		  $('#emessage').show();
		  $('#messageOk2').html("N");

	  	
   	  }else if(!chkDu(name)){
		  $('#emessage2').hide();
		  $('#emessage').html("한글만 사용 가능합니다.");
		  $('#emessage').show();
		  $('#messageOk2').html("N");
		
	  }
}//editFunc */

/* function readyEdit(){
	var img=$('#upfile').val();
	console.log("img:"+img);
	
	
	if (img==""){
		var bool=confirm("기존 이미지 파일을 계속 사용하시겠습니까?");
		if (bool){
			$('form[name=frmLCategoryEdit]').submit();
		} else {
			event.preventDefault();
		}
	}
	
} */

function readyDel(no){
	console.log("no:"+no);
	if (no!=0){
		alert("하위 카테고리가 등록된 대분류 카테고리는 삭제할 수 없습니다!");
		event.preventDefault();
	} else if (no=="0"){
		$('form[name=frmLCategoryDel]').submit();
		console.log("삭제 폼 전송!");
	}
	
}

</script>
<!-- script end -->
   
<!-- css start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">  
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<!-- css end -->

<div class="container">
   <div class="row">
      <!-- Hoverable rows start -->
      <div class="row" id="table-hover-row">
         <div class="col-12">
            <div class="card">
               <div class="card-header">
                  <h3 class="card-title">음식메뉴 - 대분류 카테고리 관리</h3>
                  <hr>
               </div>
               <div class="card-content"> 
                  <!-- modal start -->
                  <div class="card-body" style="text-align: right;">
                     <!-- Button trigger for Disabled Backdrop -->
                     <button type="button" class="btn btn-dark round block" id="modalWriteBt"
                        data-toggle="modal" data-backdrop="false" data-target="#largeWrite" >
                         등록
                     </button>
                     <!--Disabled Backdrop Modal -->
                     <div class="modal fade text-left" id="largeWrite" tabindex="-1" 
                        role="dialog" aria-labelledby="대분류 카테고리 등록" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                           <div class="modal-content">
               <!-- 등록폼+등록모달 --><form name="frmLCategoryWrite" method="post" action="<c:url value='/admin/menu6/largeCategory.do' />" enctype="multipart/form-data">
                                 <div class="modal-header" style="background-color: black;">
                                    <h4 class="modal-title" style="color: white;" id="largeWrite">음식메뉴 - 대분류 카테고리 등록</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                       <i data-feather="x"></i>
                                    </button>
                                 </div>
                                 <div class="modal-body">                                 
                                    <!-- Hoverable rows start -->
                                    <div class="row" id="table-hover-row">
                                       <div class="col-12">   
                                          <!-- table head dark -->
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
                                                            <input type="file" id="upfile" name="upfile" class="btn btn-outline-light" 
                                                            	style=" width: 100%;" accept=".gif, .jpg, .png" required />             
                                                         </div>
                                                      </td>
                                                   </tr>
                                                   <tr>
                                                      <td colspan="1"><span>대분류 이름</span></td>
                                                      <td colspan="2">
                                                         <input type="text" name="lCategoryName" id="lCategoryName" placeholder="이름을 입력하세요"
                                                          	style="margin-bottom: 12px;">
                                                         <br><span id="message" style="color: #dc3545;font-weight: bold;">대분류 카테고리 이름을 입력해주세요.</span>
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
                                    <button type="button" class="btn btn-outline-dark" data-dismiss="modal" id="modalCancelEvent">
                                       <i class="bx bx-x d-block d-sm-none"></i>
                                       <span class="d-none d-sm-block">닫기</span>
                                    </button>
                                    <button type="button" class="btn btn-dark ml-1" name="modalWrite" id="modalWrite" onclick="readyWriteSubmit()">
                                       <i class="bx bx-check d-block d-sm-none"></i>
                                       <span class="d-none d-sm-block">등록</span>
                                    </button>
                                 </div>
                              </form><!-- frmLCategoryWrite등록 폼 모달 -->
                           </div>
                        </div>
                     </div>
                  <!-- modal end -->
                

                  <c:if test="${empty list }">
                     <div class="row">
                        <div class="col-12">
                           <div class="card text-center bg-lighten-2">
                              <div class="card-content d-flex">
                                 <div class="card-body">
                                    <h2 class="card-title white">등록된 대분류 카테고리가 없습니다.</h2>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </c:if>                
                  <c:if test="${!empty list }">
                     <div class="row">                  
                         <c:forEach var="vo" items="${list}" varStatus="status">
                           <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-12">
                              <div class="card text-center bg-lighten-2">
                                 <div class="card-content d-flex">
                                    <div class="card-body">
                                       <img src="<c:url value='/resources/imgs/LargeCategoryImages/${vo.lCategoryFilename}' />" alt="${vo.lCategoryFilename}" style="height: 120px" class="mb-1">
                                       <p class="card-text white">${vo.lCategoryNo }</p>
                                       <h4 class="card-title white">${vo.lCategoryName }</h4>
                                       <p class="card-text white">하위 메뉴 : ${vo.lCCount } 개</p>
                                       <button type="button" class="btn btn-dark round btEdit" id="modalEditBt${vo.lCategoryNo}"
                                       	  data-toggle="modal" data-backdrop="false" data-target="#largeEdit${vo.lCategoryNo}">수정</button>
                                       <button type="button" class="round btn btn-danger" data-toggle="modal" data-backdrop="false" 
                                          data-target="#largeDelete${vo.lCategoryNo}" id="modalDeleteBt${vo.lCategoryNo}">삭제</button>
                        
                                       <!--warning theme Modal -->
                                       <div class="modal fade text-left" id="largeDelete${vo.lCategoryNo}" tabindex="-1" role="dialog"
                                          aria-labelledby="대분류 카테고리 삭제" aria-hidden="true">
                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                             <div class="modal-content">
                                                <form name="frmLCategoryDel" id="frmLCategoryDel" method="post" action="<c:url value='/admin/menu6/largeCategory/delete.do' />">
                                                   <div class="modal-header bg-danger">
                                                      <h5 class="modal-title white" id="myModalLabel140">음식메뉴 - 대분류 카테고리 삭제</h5>
                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                          <i data-feather="x"></i>
                                                      </button>
                                                   </div>
                                                   <div class="modal-body">
                                                      <input type="hidden" name="lCategoryNo" value="${vo.lCategoryNo }">
                                                      <input type="hidden" name="lCategoryName" value="${vo.lCategoryName }">
                                                      <input type="hidden" name="lCategoryFilename" value="${vo.lCategoryFilename }">
                                                      <input type="hidden" name="oldFileName" value="${vo.lCategoryFilename }">
                                                      대분류 카테고리 [<span style="font-weight: bolder;">${vo.lCategoryName }</span>] 를 삭제하시겠습니까?
                                                   </div>
                                                   <div class="modal-footer">
                                                      <button type="button" class="btn btn-light-secondary" data-dismiss="modal" id="modalDelCancel">
                                                         <i class="bx bx-x d-block d-sm-none"></i>
                                                         <span class="d-none d-sm-block">취소</span>
                                                      </button>
                                                      
                                                      <button type="button" class="btn btn-danger ml-1" data-dismiss="modal" id="modalDel" onclick="readyDel(${vo.lCCount})">
                                                         <i class="bx bx-check d-block d-sm-none"></i>
                                                         <span class="d-none d-sm-block">삭제</span>
                                                      </button>
                                                   </div>
                                                </form>
                                             </div>
                                          </div>
                                       </div> <!-- warning theme Modal -->
                                       
                                       <div class="modal fade text-left" id="largeEdit${vo.lCategoryNo}" tabindex="-1" 
                                          role="dialog" aria-labelledby="대분류 카테고리 수정" aria-hidden="true">
                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                             <div class="modal-content">
                                    <!-- 수정 모달  --><form name="frmLCategoryEdit" method="post" action="<c:url value='/admin/menu6/largeCategory/edit.do' />" enctype="multipart/form-data">
                                                   <div class="modal-header" style="background-color: black;">
                                                      <h4 class="modal-title" id="myModalLargeEdit" style="color: white;">음식메뉴 - 대분류 카테고리 수정</h4>
                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                         <i data-feather="x"></i>
                                                      </button>
                                                   </div>
                                                   <div class="modal-body">
                                                   <!-- Hoverable rows start -->
                                                      <div class="row" id="table-hover-row">
                                                         <div class="col-12">   
                                                            <!-- table head dark -->
                                                            <div class="table-responsive" style="text-align: center;">
                                                               <table class="table mb-0">
                                                                  <tbody>
                                                                     <tr>
                                                                        <td colspan="3"  style="text-align: center;">
                                                                           <div id="preview"><img src="<c:url value='/resources/imgs/LargeCategoryImages/${vo.lCategoryFilename }' />" id="previewImg"/></div>
                                                                        </td>
                                                                     </tr>
                                                                     <tr>
                                                                        <td colspan="3"  style="text-align: center;">
                                                                           <div>
                                                                              <input type="file" id="upfile" name="upfile" class="btn btn-outline-light" 
                                                                              	style=" width: 100%;" accept=".gif, .jpg, .png" value="${vo.lCategoryFilename }" />
                                                                              <br><span>* 첨부파일을 새로 지정할 경우 기존파일은 삭제됩니다.</span>             
                                                                           </div>
                                                                        </td>
                                                                     </tr>
                                                                     <tr>
                                                                        <td colspan="1"><span>대분류 이름</span></td>
                                                                        <td colspan="2">
                                                                           <input type="text" name="lCategoryName" id="EditlCategoryName" placeholder="이름을 입력하세요" 
                                                                           		style="margin-bottom: 12px;" value="${vo.lCategoryName }">
                                                                           <input type="hidden" name="lCategoryNo" id="EditlCategoryNo" value="${vo.lCategoryNo }">
                                                                           <input type="hidden" name="oldFileName" id="EditoldFileName" value="${vo.lCategoryFilename }">
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
                                                      <button type="button" class="btn btn-dark ml-1" name="modalEdit" id="modalEdit" onclick="form.submit()">
                                                         <i class="bx bx-check d-block d-sm-none"></i>
                                                         <span class="d-none d-sm-block">수정</span>
                                                      </button>
                                                   </div>
                                                </form>
                                             </div>
                                          </div>
                                       </div>
                                    </div><!-- card-body  -->
                                    <!-- modal end -->
                                    <!-- <button class="btn btn-danger round white" id="lcategoryDel" name="lcategoryDel">삭제</button> -->
                                    
                                 </div><!--CARD CONTENT -->
                              </div>
                           </div>
                         </c:forEach>
                     </div> <!-- row -->
                  </c:if>                  
                  </div><!-- card-body  -->
               </div><!-- card-content end -->
            </div> <!-- card -->
         </div> <!-- col-12 -->
      </div> 
      <!-- Hoverable rows end -->
   </div> <!-- row -->
</div> <!-- container -->

            

<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->

<%@include file="../../adminInc/bottom.jsp" %>    
    