<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../adminInc/top.jsp" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/adminResources/style3.css">

<script>
	
	$(function(){
		
		$('#message2').hide();
		$('#messageOk').hide();
		$('#radioOk').hide();
		
		$('#modalEditBt1').hide();
		$('#modalDeleteBt1').hide();
		
		$('#chkEditSel').hide();
	   
		$('#faqCategoryWrite').on('hidden.bs.modal', function (e) {
		  $(this).find('form')[0].reset();
		  $('#message2').hide();
		  $('#message').html("카테고리 이름을 입력해주세요.");
		  $('#message').show();
		  $('#messageOk').html("N");
		  $('#radioOk').html("N");

		});
		
		$('#faqCategoryEditDelete').on('hidden.bs.modal', function (e) {
			$(this).find('form')[0].reset();
		})
		
		$('#faqWrite2').on('hidden.bs.modal', function (e){
			$(this).find('form')[0].reset()
		});
		
		$('#fCategoryName').on('keyup', function(){
			   writeFunc();
				  
		   });//write keyup function
		
		listForAll();
		
		$.ajax({
			type:"GET",
			url :"<c:url value='/admin/menu5/faq/category/list.do' />",
			dataType:'json',
			success: function(res){
				if (res.length > 0) {
					$('#returnCList').empty();
						var info = "<li><a onclick='listForAll()' style='cursor: pointer;' onmouseover='onMouseOver(event)' onmouseout='onMouseOut(event)'>전체보기</a></li>"; 
					$.each(res, function(idx, item) {
						info+="<li><a onclick='listForCategory("+item.fCategoryNo+")' style='cursor: pointer;' onmouseover='onMouseOver(event)' onmouseout='onMouseOut(event)'>"
							+ item.fCategoryName + "</a></li>";
					});
					$('#returnCList').append( info );
				}
			},
			error: function(xhr, status, error){
				alert(error);
			}
		});
		
		/* $('input[type=radio][name=authorityNo]').change(function(){
			writeRadio();
		}); */
		
		
		$('#frmTr').hide();
		$('#frmTr2').hide();
		
	});
	
	/* function readySubmit(){
		var num=$('#frmFAQCategoryWrite').find('input[type=radio]').val();
		if (num==0){
			alert("종류를 선택해주세요!");
			event.preventDefault();
			//return false;
		} 
	} */
	
	function chkModalOpt(){
		var inModalOpt=$('#inModalOpt').val();
		
		if (inModalOpt==0){
			$('#frmTr').hide();			
			$('#frmTr2').hide();	
			$('#modalEditBt1').hide();
			$('#modalDeleteBt1').hide();
		} else {
			$('#frmTr').show();	
			$('#frmTr2').show();	
			$('#modalEditBt1').show();
			$('#modalDeleteBt1').show();
			
			//var result=result.find('option:selected').text();
			var result=$('#inModalOpt').find('option:selected').text();
			var textVal=result;
			//alert(textVal);
			//$('#inModalOpt').text();
			$('#afterCategoryName').val(textVal);
			
			var authorityVal=$('#inModalOpt').find('option:selected').attr('title');
			//alert(authorityVal);
			
			//#frmTd2 > input[type=radio]:nth-child(1) => 회원
			//#frmTd2 > input[type=radio]:nth-child(2) => 사장님

			if (authorityVal==1){
				$('#frmTd2').find('input[type=radio]:nth-child(1)').prop('checked', true);
				$('#frmTd2').find('input[type=radio]:nth-child(2)').prop('checked', false);
				
			} else if (authorityVal==4){
				$('#frmTd2').find('input[type=radio]:nth-child(1)').prop('checked', false);
				$('#frmTd2').find('input[type=radio]:nth-child(2)').prop('checked', true);	
				
			}
			
		}
	}

	function beforeEdit(){
		var name=$('#afterCategoryName').val();
		if (name==''){
			alert("변경 후 카테고리 이름을 입력해주세요!");
			return false;
		} else {
			$('form[name=frmFAQCategorEditDelete]').submit();	
		}
	}
	
	function beforeDelete(){
		var delNo=$('#inModalOpt').find('option:selected').val();
		//alert(delNo);
		var bool=confirm("카테고리를 삭제하시겠습니까?");
		if (bool){
			location.href = "<c:url value='/admin/menu5/faq/category/delete.do?no="+ delNo +"' />";
		} else {
			return false;
		}
	}
	
	function onMouseOver(e){
		$(e.target).css("color", "white");
	}
	
	function onMouseOut(e){
		$(e.target).css("color", "#727E8C");
	}
	
	function listForAll(){
		var str="";
		
		var accordionBtn;
		var allTexts;
		var accIcon;
		
		var targetText;
  	    var targetAccIcon;
  	    var target;
		
		$.ajax({
			type:"GET",
			url :"<c:url value='/admin/menu5/faq/listAll.do' />",
			dataType:'json',
			success: function(res){
				
				
				if (res.length == 0){
					
					str+="<div class='mb-70' style='text-align: center;'>";
					str+="<p>등록된 자주 묻는 질문이 없습니다.</p>";
					str+="</div>";
				
				} else {
					str+="<section id='Awrapper'><div class='Acontainer'> <ul class='Aaccordion Aul'>";
					$.each(res, function(idx, fvo) {
						
					//console.log("번호:"+fvo.faqNo);
					str+="<li class='Aitem'>"; 	
				    str+="<h2 class='AaccordionTitle'> 🤔"+fvo.faqQ+"<span class='AaccIcon'></span></h2>";
				   
				    str+="<div class='text'>"+fvo.faqA+"</div>";
				    str+="<div class='content' style='text-align: right;'>";
				    
				    str+="<button type='button' style='border: none; outline: none; background: none; font-size: 12px;' class='comment-reply'";
				    str+="id='btFaqEdit"+fvo.faqNo+"' data-toggle='modal' data-backdrop='false' data-target='#modalFaqEdit"+fvo.faqNo+"'>수정</button>";
				    str+="<span style='font-size: 12px;'> | </span>"; 
				            
				    str+="<button type='button' style='border: none; outline: none; background: none; font-size: 12px;' class='comment-reply'"; 
				    str+="id='btFaqDelete"+fvo.faqNo+"' data-toggle='modal' data-backdrop='false' data-target='#modalFaqDelete"+fvo.faqNo+"' >삭제</button>";
				    str+="</div>"; 
				    
				    str+="</li>"; 			    
				
					});
				
				}
					
					$('#forPrint').html(str);
					 // variables
					 accordionBtn = document.querySelectorAll('.AaccordionTitle');
					 allTexts = document.querySelectorAll('.text');
					 accIcon = document.querySelectorAll('.AaccIcon');
	
					// event listener
					accordionBtn.forEach(function (el) {
					    el.addEventListener('click', toggleAccordion);
					});
					
				 function toggleAccordion(el) {
				  	   targetText = el.currentTarget.nextElementSibling.classList;
				  	   targetAccIcon = el.currentTarget.children[0];
				  	   target = el.currentTarget;
				  	   
				  	   if (targetText.contains('show')) {
				  	       targetText.remove('show');
				  	       targetAccIcon.classList.remove('anime');
				  	       target.classList.remove('AaccordionTitleActive');
				  	   } 
				  	   else {
				  	      accordionBtn.forEach(function (el) {
				  	         el.classList.remove('AaccordionTitleActive');
				  	         
				  	         allTexts.forEach(function (el) {
				  	            el.classList.remove('show');
				  	         });
				  	         
				  	         accIcon.forEach(function (el) {
				  	          el.classList.remove('anime');
				  	         }) ;
				  	         
				  	      });
				  	      
			  	         targetText.add('show');
			  	         target.classList.add('AaccordionTitleActive');
			  	         targetAccIcon.classList.add('anime');
				  	   }  
					    console.log(targetText);
					    console.log(target);
						console.log(accordionBtn);

					    
				  	}//toggleAccordion
			    
			},
			error: function(xhr, status, error){
				console.log(error);
			}
		
		}); //ajax
		

	}//listForAll
	
	function listForCategory(no){
		var categoryNo=no;
		
		var accordionBtn;
		var allTexts;
		var accIcon;
		
		var targetText;
  	    var targetAccIcon;
  	    var target;
	   
		$.ajax({
			type:"GET",
			url :"<c:url value='/admin/menu5/faq/list.do?categoryNo="+categoryNo+"' />",
			dataType:'json',
			//data: data,
			success: function(res){
				var str="";
				
				if (res.length == 0){
					
					str+="<div class='mt-50 mb-70' style='text-align: center;'>";
					str+="<p>등록된 자주 묻는 질문이 없습니다.</p>";
					
					//console.log("str="+str);
					
				} else {
											 	
					str+="<section id='Awrapper'><div class='Acontainer'> <ul class='Aaccordion Aul'>";
					$.each(res, function(idx, fvo) {
						
					//console.log("번호:"+fvo.faqNo);
					str+="<li class='Aitem'>"; 	
				    str+="<h2 class='AaccordionTitle'> 🤔"+fvo.faqQ+"<span class='AaccIcon'></span></h2>";
				   
				    str+="<div class='text'>"+fvo.faqA+"</div>";
				    str+="<div class='content' style='text-align: right;'>";
				    
				    str+="<button type='button' style='border: none; outline: none; background: none; font-size: 12px;' class='comment-reply'";
				    str+="id='btFaqEdit"+fvo.faqNo+"' data-toggle='modal' data-backdrop='false' data-target='#modalFaqEdit"+fvo.faqNo+"'>수정</button>";
				    str+="<span style='font-size: 12px;'> | </span>"; 
				            
				    str+="<button type='button' style='border: none; outline: none; background: none; font-size: 12px;' class='comment-reply'"; 
				    str+="id='btFaqDelete"+fvo.faqNo+"' data-toggle='modal' data-backdrop='false' data-target='#modalFaqDelete"+fvo.faqNo+"' >삭제</button>";
				    str+="</div>"; 
				    
				    str+="</li>"; 
				    				    
					}); //each
					
				}//else
					
				str+="</div>";
				//alert(categoryNo+":"+res.length);
				$('#forPrint').html(str);
				
				// variables
				 accordionBtn = document.querySelectorAll('.AaccordionTitle');
				 allTexts = document.querySelectorAll('.text');
				 accIcon = document.querySelectorAll('.AaccIcon');

				// event listener
				accordionBtn.forEach(function (el) {
				    el.addEventListener('click', toggleAccordion);
				});
				
			 function toggleAccordion(el) {
			  	   targetText = el.currentTarget.nextElementSibling.classList;
			  	   targetAccIcon = el.currentTarget.children[0];
			  	   target = el.currentTarget;
			  	   
			  	   if (targetText.contains('show')) {
			  	       targetText.remove('show');
			  	       targetAccIcon.classList.remove('anime');
			  	       target.classList.remove('AaccordionTitleActive');
			  	   } 
			  	   else {
			  	      accordionBtn.forEach(function (el) {
			  	         el.classList.remove('AaccordionTitleActive');
			  	         
			  	         allTexts.forEach(function (el) {
			  	            el.classList.remove('show');
			  	         });
			  	         
			  	         accIcon.forEach(function (el) {
			  	          el.classList.remove('anime');
			  	         }) ;
			  	         
			  	      });
			  	      
			  	         targetText.add('show');
			  	         target.classList.add('AaccordionTitleActive');
			  	         targetAccIcon.classList.add('anime');
			  	   }  
				    console.log(targetText);
				    console.log(target);
					console.log(accordionBtn);

				    
			  	}//toggleAccordion
				
			},
			error: function(xhr, status, error){
				console.log(error);
			}
		});
	}
	
	function chkEdit(){
		var chk=$('#selectFCategory2').val();
		var chk2=$('#chkEditSel').html();
		alert("chk="+chk+", chk2="+chk2);
		
		if (chk==0){
			$('#chkEditSel').html("N");
		} else {
			$('#chkEditSel').html("Y");
			
		}
		alert("chk="+chk+", chk2="+chk2);
	}
	
	function chkDu(content){
		var pattern=new RegExp(/^[ㄱ-ㅎ가-힣]+$/g);
		return pattern.test(content);
	}

	function readyWriteSubmit(){
		writeFunc();
		writeRadio();
		
		var ok=$('#messageOk').html();
		var ok2=$('#radioOk').html();
		//alert("ok:"+ok+", ok2:"+ok2);
		
		if(ok=="Y" && ok2=="Y"){
			//console.log("카테고리 등록 폼 전송 성공!");
			$('form[name=frmFAQCategoryWrite]').submit();
		}else if (ok=="N"){
			alert("올바른 이름을 입력해주세요!");
			event.preventDefault();
			//return false;
		} else if (ok2=="N"){
			alert("대상을 선택해주세요!");
			event.preventDefault();
		} else {
			alert("error!");
			event.preventDefault();
		}
	}

	function writeFunc(){
		
		  var name=$('#fCategoryName').val();
		  
		  if(chkDu(name) && name.length>0){
			  $.ajax({
				  type:"get",
				  url:"<c:url value='/admin/menu5/faqCategory/ajaxCheck.do' />",
				  data:"fCategoryName="+name,
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
	 
	function writeRadio(){
		var radio=$('#writeRadio').find('input[name=authorityNo]').is(':checked');
		
		//alert("자손radio="+radio);
		
		if(radio==''){
			//alert("대상을 선택해주세요!");
			$('#radioOk').html("N");
			//event.preventDefault;
		} else if (radio==1 || radio==4){
			$('#radioOk').html("Y");
		} else {
			$('#radioOk').html("N");
			//event.preventDefault();
		}
		
	}
	
	function faqWrite(){
		var fCategory=$('#selectFCategory1').val();
		var faqQ=$('#writeFaqQ').val();
		var faqA=$('#writeFaqA').val();
		
		//alert("fCategory="+fCategory+", faqQ="+faqQ+", faqA="+faqA);
		
		if (fCategory=='0'){
			alert("대분류 카테고리를 선택해주세요!");
			//event.preventDeafult();
			return false;
		}
		if (faqQ==''){
			alert("질문을 입력해주세요!");
			//event.preventDeafult();
			return false;
		}
		if (faqA==''){
			alert("답변을 입력해주세요!");
			//event.preventDeafult();
			return false;
		}
		
		$('form[name=frmFAQWrite]').submit();
	}
	
	function faqEdit(){
		var fCategory=$('#chkEditSel').html();
		var faqQ=$('#editFaqQ').val();
		var faqA=$('#editFaqA').val();
		
		alert("fCategory="+fCategory+", faqQ="+faqQ+", faqA="+faqA);
		
		if (fCategory=='N'){
			alert("대분류 카테고리를 선택해주세요!");
			//event.preventDeafult();
			return false;
		}
		if (faqQ==''){
			alert("질문을 입력해주세요!");
			//event.preventDeafult();
			return false;
		}
		if (faqA==''){
			alert("답변을 입력해주세요!");
			//event.preventDeafult();
			return false;
		}
		
		$('form[name=frmFaqEdit]').submit();
		
	}//
		
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
           
           		<div class="card-header" style="padding-bottom: 2px;">
	                <h3 class="section-title text-uppercase">자주 묻는 질문</h3>
	                <p class="text-subtitle text-muted">플렉스 딜리버리에 궁금한 점이 있으신가요?</p>
	                <hr>
                </div>
                
                <div class="card-content">
                	<div class="card-body">
	                	<!-- 모달 호출하는 버튼 -->
						<button type="button" class="btn btn-dark" id="modalCategoryWriteBt"
						   data-toggle="modal" data-backdrop="false" data-target="#faqCategoryWrite" >
						     카테고리 등록
						</button>
						<button type="button" class="btn btn-dark" id="modalCategoryEditDeleteBt"
						   data-toggle="modal" data-backdrop="false" data-target="#faqCategoryEditDelete" >
						     카테고리 수정 / 삭제
						</button>
						<button type="button" class="btn btn-dark" id="modalFaqWriteBt"
						   data-toggle="modal" data-backdrop="false" data-target="#faqWrite2" >
						     자주 하는 질문 등록
						</button>		
                	</div>
                	
					<!-- #faqCategoryWrite 모달 start -->
					<div class="modal fade text-left" id="faqCategoryWrite" tabindex="-1" 
                        role="dialog" aria-labelledby="FAQ 카테고리 등록" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                           <div class="modal-content">
								<form name="frmFAQCategoryWrite" id="frmFAQCategoryWrite" method="post" action="<c:url value='/admin/menu5/faq/category/write.do' />">
                                	<div class="modal-header" style="background-color: black;">
	                                    <h4 class="modal-title" style="color: white;" id="faqWrite">자주 하는 질문 - 카테고리 등록</h4>
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
                                                   	  	<td>카테고리 이름</td>
	                                                      <td colspan="2"  style="text-align: center;">
	                                                      	<input type="text" name="fCategoryName" id="fCategoryName">
	                                                      	<input type="hidden" name="fCategoryNo" value="1">
	                                                      	<br><span id="message" style="color: #dc3545;font-weight: bold;">카테고리 이름을 입력해주세요.</span>
	                                                         <span id="message2" style="color: #6610f2;font-weight: bold;"></span>
	                                                         <span id="messageOk"></span>
	                                                      </td>			                                                   	  	
													  </tr>
                                                   	  <tr>
                                                   	  	 <td>대상</td>
	                                                      <td colspan="2"  style="text-align: center;" id="writeRadio">
	                                                      	<!-- <input type="radio" name="authorityNo" value="0" checked>선택해주세요 -->
	                                                      	<input type="radio" name="authorityNo" value="1">회원
	                                                      	<input type="radio" name="authorityNo" value="4">사장님
	                                                      	<span id="radioOk"></span>
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
	                                     <!-- id="modalWrite" onclick="readySubmit()"> -->
	                                       <i class="bx bx-check d-block d-sm-none"></i>
	                                       <span class="d-none d-sm-block">등록</span>
	                                    </button>
	                                 </div>
                              	</form><!-- frmFaqCategoryWrite등록 폼 모달 -->
                            </div>
                         </div>
                     </div>    
					<!-- #faqCategoryWrite 모달 end -->
					
					<!-- #faqCategoryEditDelete 모달 start -->
					<div class="modal fade text-left" id="faqCategoryEditDelete" tabindex="-1" 
                        role="dialog" aria-labelledby="FAQ 카테고리 수정 및 삭제" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                           <div class="modal-content">
							<form name="frmFAQCategorEditDelete" method="post" action="<c:url value='/admin/menu5/faq/category/edit.do' />">
                               	<div class="modal-header" style="background-color: black;">
                                    <h4 class="modal-title" style="color: white;" id="faqEditAndDel">자주 하는 질문 - 카테고리 수정 / 삭제</h4>
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
                                                  	  	<td>카테고리</td>
                                                      	<td colspan="2"  style="text-align: center;">
	                                                      	<select id="inModalOpt" name="fCategoryNo" onchange="chkModalOpt()">
	                                                      		<option value="0">선택하세요</option>
		                                                      		<c:forEach var="cVo2" items="${ctList }">
		                                                      			<option value="${cVo2.fCategoryNo }" title="${cVo2.authorityNo }">${cVo2.fCategoryName }</option>
		                                                      		</c:forEach>
	                                                      	</select>
                                                       </td>			                                                   	  	
												     </tr>
												     <tr id="frmTr">
												     	<td>변경 후 카테고리 이름</td>
												     	<td colspan="2"><input type="text" id="afterCategoryName" name="fCategoryName"></td>
											     	</tr>
												     <tr id="frmTr2">
												     	<td>종류</td>
		                                              	<td colspan="2" id="frmTd2">
	                                                      	<input type="radio" name="authorityNo" value="1">회원
	                                                      	<input type="radio" name="authorityNo" value="4">사장님
	                                                      		
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
                                    <button type="button" class="btn btn-dark ml-1" name="modalEditDelete1"
                                     id="modalEditBt1" onclick="beforeEdit()">
                                       <i class="bx bx-check d-block d-sm-none"></i>
                                       <span class="d-none d-sm-block">수정</span>
                                    </button>
                                    <button type="button" class="btn btn-dark ml-1" name="modalEditDelete2"
                                     id="modalDeleteBt1" onclick="beforeDelete()">
                                       <i class="bx bx-check d-block d-sm-none"></i>
                                       <span class="d-none d-sm-block">삭제</span>
                                    </button>
                                 </div>
						     	</form>
                              </div>
                          </div>
                     </div>    
					<!-- #faqCategoryWrite 모달 end -->

                            					
					<!-- #faqWrite2 모달 start -->
					<div class="modal fade text-left" id="faqWrite2" tabindex="-1" 
                        role="dialog" aria-labelledby="FAQ 등록" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
                           <div class="modal-content">
								<form name="frmFAQWrite" method="post" action="<c:url value='/admin/menu5/faq/write.do' />">
                                	<div class="modal-header" style="background-color: black;">
	                                    <h4 class="modal-title" style="color: white;">자주 하는 질문 - 질문과 답변 등록</h4>
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
                                                   	  	<td>카테고리 종류</td>
	                                                      <td colspan="2"  style="text-align: center;">
	                                                      	<input type="hidden" name="authorityNo" value="6">
	                                                      	<select name="fCategoryNo" id="selectFCategory1">
                                                      			<option value="0">선택하세요</option>
	                                                      		<c:forEach var="cVo2" items="${ctList }">
	                                                      			<option value="${cVo2.fCategoryNo }">${cVo2.fCategoryName }</option>
	                                                      		</c:forEach>
	                                                      	</select>
	                                                      </td>			                                                   	  	
													  </tr>
                                                   	  <tr>
                                                   	  	<td>질문</td>
	                                                      <td colspan="2"  style="text-align: center;">
	                                                      	<textarea rows="3" cols="70" name="faqQ" id="writeFaqQ"></textarea>
	                                                      </td>			                                                   	  	
													  </tr>
													  <tr>
													  	<td>답변</td>
													  	<td colspan="2">
													  		<textarea rows="10" cols="70" name="faqA" id="writeFaqA"></textarea>
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
	                                    <button type="button" class="btn btn-dark ml-1" name="modalWrite2"
	                                     id="modalWrite2" onclick="faqWrite()">
	                                       <i class="bx bx-check d-block d-sm-none"></i>
	                                       <span class="d-none d-sm-block">등록</span>
	                                    </button>
	                                 </div>
                              	</form><!-- frmFAQWrite등록 폼 모달 -->
                            </div>
                         </div>
                     </div>
					<!-- #faqWrite2 모달 end -->
					
			        <div class="sidebar-widget-area" style="margin-bottom: 2px;">
			            <div class="widget-content">
			                <ul class="tags" id="returnCList">
			                	<!-- ajax -->
			                </ul>
			            </div>
			        </div>
			        
			        <div class="accordion" id="forPrint">
						<!-- 처음에는 전체보기 출력 -->
						
						<!-- 카테고리 클릭 시 list 개수 따라 다른 출력 -->
			   
					</div>
					
					    <c:forEach var="vo" items="${list }" varStatus="status">
                           <!-- FAQ 수정 start -->
							<div class="modal fade text-left" id="modalFaqEdit${vo.faqNo }" tabindex="-1" 
		                        role="dialog" aria-labelledby="FAQ 수정" aria-hidden="true">
		                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
		                           <div class="modal-content">
										<form name="frmFaqEdit" method="post" action="<c:url value='/admin/menu5/faq/edit.do' />">
		                                	<div class="modal-header" style="background-color: black;">
			                                    <h4 class="modal-title" style="color: white;">자주 하는 질문 - 질문과 답변 수정</h4>
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
		                                                   	  	<input type="hidden" name="faqNo" value="${vo.faqNo }">
		                                                   	  	<td>카테고리 종류</td>
			                                                      <td colspan="2"  style="text-align: center;">
			                                                      	<select name="fCategoryNo" id="selectFCategory">
		                                                      			<option value="0">선택하세요</option>
			                                                      		<c:forEach var="cVo2" items="${ctList }">
			                                                      			<option value="${cVo2.fCategoryNo }" title="${cVo2.authorityNo }">${cVo2.fCategoryName }</option>
			                                                      		</c:forEach>
			                                                      	</select>
			                                                      	<span id="chkEditSel"></span>
			                                                      </td>			                                                   	  	
															  </tr>
		                                                   	  <tr>
		                                                   	  	<td>질문</td>
			                                                      <td colspan="2"  style="text-align: center;">
			                                                      	<textarea rows="3" cols="70" name="faqQ" id="editFaqQ">${vo.faqQ }</textarea>
			                                                      </td>			                                                   	  	
															  </tr>
															  <tr>
															  	<td>답변</td>
															  	<td colspan="2">
															  		<textarea rows="10" cols="70" name="faqA" id="editFaqA">${vo.faqA }</textarea>
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
			                                    <button type="button" class="btn btn-dark ml-1" name="modalEdit"
			                                     id="btModalEdit" onclick="form.submit()">
			                                       <i class="bx bx-check d-block d-sm-none"></i>
			                                       <span class="d-none d-sm-block">수정</span>
			                                    </button>
			                                 </div>
		                              	</form><!-- frmFAQEdit 폼 모달 -->
		                            </div>
		                         </div>
		                     </div>
							<!-- #faqEdit모달 end -->
						    
							 <!-- FAQ 삭제 모달 -->
	                          <div class="modal fade text-left" id="modalFaqDelete${vo.faqNo }" tabindex="-1" role="dialog" 
	                              aria-labelledby="FAQ 삭제" aria-hidden="true">
	                              <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
	                                 <div class="modal-content">
	                                    <form name="frmFaqDel" id="frmFaqDel" method="post" action="<c:url value='/admin/menu5/faq/deleteFaq.do?no=${vo.faqNo }' />">
	                                       <div class="modal-header bg-danger">
	                                          <h5 class="modal-title white" id="myModalFaqEdit">자주 묻는 질문 삭제</h5>
	                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                              <i data-feather="x"></i>
	                                          </button>
	                                       </div>
	                                       <div class="modal-body">
	                                            <input type="hidden" name="faqNo" value="${vo.faqNo }" >
	                                           
	                                          	[<span style="font-weight: bolder;">${vo.faqQ}</span>] 에 대한 답변을 삭제하시겠습니까?
	                                       </div>
	                                       <div class="modal-footer">
	                                          <button type="button" class="btn btn-light-secondary" data-dismiss="modal" id="modalFaqDelCancel">
	                                             <i class="bx bx-x d-block d-sm-none"></i>
	                                             <span class="d-none d-sm-block">취소</span>
	                                          </button>
	                                          
	                                          <button type="button" class="btn btn-danger ml-1" data-dismiss="modal" id="modalFaqDelOk" onclick="form.submit()">
	                                             <i class="bx bx-check d-block d-sm-none"></i>
	                                             <span class="d-none d-sm-block">삭제</span>
	                                          </button>
	                                       </div>
	                                    </form>
	                                 </div>
	                              </div>
	                           </div> <!-- 삭제 모달 end-->
							</c:forEach>
							
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
    
<%@include file="../../adminInc/bottom.jsp" %>    