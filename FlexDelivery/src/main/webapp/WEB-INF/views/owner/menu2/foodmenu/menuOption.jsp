
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>

<style>
	input{
		border: 1px solid rgb(212,212,212);
		border-radius: 5px;
		height:35px;
	}

</style>

<script type="text/javascript">
			
			function goDetail(no){
				var windowW = 650;  // 창의 가로 길이
		        var windowH = 700;  // 창의 세로 길이
		        var left = Math.ceil((window.screen.width - windowW)/2);
		        var top = Math.ceil((window.screen.height - windowH)/2);
		        
		        var url="${pageContext.request.contextPath}/owner/menu2/foodmenu/menuDetail.do?menuNo="+no;
		        
				window.open(url,"메뉴 상세 정보","l top="+top+", left="+left+", height="+windowH+", width="+windowW,"scroll-x="+no);
				event.preventDefault();
			}
			
			$(function(){
				$('.btMainMenuChange').click(function(){
					
					var url='<c:url value="/owner/menu2/foodmenu/menuMain.do"/>';
					
					if($(this).attr('id')=='btNowMenu'){
						url='<c:url value="/owner/menu2/foodmenu/menuMain.do"/>';
					}else if($(this).attr('id')=='btMenuChange'){
						url='<c:url value="/owner/menu2/foodmenu/menuGroup.do"/>';				
					}else if($(this).attr('id')=='btOptionChange'){
						url='<c:url value="/owner/menu2/foodmenu/menuOption.do"/>';
					}else if($(this).attr('id')=='btMainMenu'){
						url='<c:url value="/owner/menu2/foodmenu/signatureMenu.do"/>';
					}
					
					location.href=url;
				});
				
			});  
		
			
			
			
			
			 $(function(){
					$('.groupChoice').click(function(){
						
						
						$('#optionTable').html('');
						$('#oRankSelect').find('option:first').prop('selected', true);
						$('#btOptionWrite').prop('disabled',true);
						$('#optionTable').html("<tr class='text-center'><td colspan='5'>옵션 선택을 위해 메뉴 그룹을 클릭해 주세요</td></tr>");
						
						$.ajax({
							url:"<c:url value='/owner/menu2/foodmenu/selectAllByGroupNo.do'/>",
							data:"sMGroupNo=" + $(this).val(),
							dataType:"json",
							type:"GET",
							success:function(res){
								//alert(res);
								//alert(res.length);
								if(res.length>0){
									var str="";
										str+="<option value='0'>메뉴 선택</option><br>";
									$.each(res, function(idx, item){
										str+="<option value='"+item.menuNo+"' class='menuClick'>"+ item.menuName+"</option><br>";
									});
									
									$('#menuSelect').html(str);
								}else{
									$('#menuSelect').html('<option class="m-3 text-center" style="font-size:17px;" selected value="0" >메뉴 선택</option>');
								}
							},
							error:function(xhr, status, error){
								alert("error!! : " + error);
							}
						});
						
					});
					
				});
				
			

			 
		
			$(function(){
				$('#menuSelect').change(function(){
					$.optionSelectFunction();
					$('#oRankSelect').find('option:first').prop('selected', true);
					$('#btOptionWrite').prop('disabled',false);
				});
			});

		 	//메뉴를 클릭하면 옵션 테이블이 보인다.
		 	$(function(){
				$('.menuSelect').click(function(){
					$.optionSelectFunction();
					$('#btOptionWrite').prop('disabled',false);
					
				});
			});
			
			//메뉴 순위 선택하면 옵션 테이블이 보인다.
		 	$(function(){
				$('#oRankSelect').click(function(){
					$.optionSelectFunction();
				});
			});
			
		 	
			//메뉴와 순위를 받아서 옵션 테이블 보여주는 에이젝스
		 	$.optionSelectFunction=function(){
			 	$.ajax({
					url:"<c:url value='/owner/menu2/foodmenu/selectOptionByMenuNo.do'/>",
					data:"menuNo=" + $('.menuSelect').val()+"&oRankNo="+$('#oRankSelect').val(),
					dataType:"json",
					type:"GET",
					success:function(res){
						//alert(res);
						//alert(res.length);
						if(res.length>0){
							var str="";
							$.each(res, function(idx, item){
								str+="<tr class='text-center'><br><td>"+item.oRankNo+"순위</td><br>";
								str+="<td class='text-bold-500'><strong>"+item.mOptionName+"</strong></td><br>";
								str+="<td>"+item.mOptionPrice+"원</td><br>";
								str+="<td class='p-0'><button class='btn btn-outline-dark p-2 btmenuEdit' data-toggle='modal' data-target='#inlineForm2'  value='"+item.mOptionNo+"' name='menuEdit' >수정</button>";
			                  	str+="<button class='btn btn-outline-dark p-2 btmenuDelete' value='"+item.mOptionNo+"' name='menuDelete' style='background-color:#f1f3f5; color:#333; border: none;'>삭제</button><br></td>";	
								str+=" <td></td><br></tr>";
							});
							
							$('#optionTable').html(str);
							
							$.optionEditFunction();
							$.optionDeleteFunction();
						}else{
							var str="";
							str+="<tr class='text-center'><td colspan='5' style='font-size:15px;' >등록된 옵션이 없습니다</td><tr>"
								$('#optionTable').html(str);
						}
					},
					error:function(xhr, status, error){
						alert("error!! : " + error);
					}
				});
		 	};
			
			
		
		 	
		 	
		 	
		 	
		 	
		 	
		 	
		 	//등록 시작 
			
			//메뉴 등록을 누르면 모달창이 뜬다.
		 	$(function(){
				$('#btOptionWrite').click(function(){
					var oRankSelect = $('#oRankSelect').val();
					
					if($('#menuGroupSelect').val()==0 || $('#menuSelect').val()==0){
						alert("유효하지 않은 선택입니다");
						$('#inlineForm').modal('hide');
						
					
					}else if($('#menuGroupSelect').val()!=0 && $('#menuSelect').val()!=0){
							$.ajax({
								url:"<c:url value='/owner/menu2/foodmenu/inputGroupNoMenuNoToOption.do'/>",
								data:"sMGroupNo=" + $('.groupChoice').val() +"&menuNo="+$('.menuSelect').val(), 
								dataType:"json",
								type:"GET",
								success:function(res){
									//alert(res);
									//alert(res.length);
									
									$('#warningOptionName').html('');
									$('#warningOptionPrice').html('');
									
									$('#mOptionName').val('');
									$('#mOptionPrice').val('');
									
							
									var str = "";
									str+="<label>그룹이름</label>&nbsp;";
									str+="<input type='hidden'name='sMGroupNo' value='"+res.sMGroupNo+"'>";
									str+="<input type='text' readonly='readonly' class='form-control text-right' name='sMGroupName' value='"+res.sMGroupName+"'>&nbsp;&nbsp;";
									str+="<label>메뉴 이름</label>&nbsp;";
									str+="<input type='hidden'name='menuNo' id='menuNo' value='"+res.menuNo+"'>";
									str+="<input type='text' readonly='readonly' class='form-control text-right' name='menuName' value='"+res.menuName+"'>";
									
									$('.groupMenuInput').html(str);
									
									
									if(res.list.length>0){
										var str2="";
								
										$.each(res.list, function(idx, item){
											str2+="<option value='"+item.oRankNo+"'";
											if(item.oRankNo==oRankSelect){
												str2+="selected='selected'";
											}
											str2+=">"+item.oRankName+"</option><br>";
										});
										$('.menuOptionSelect').html(str2);
									}
									
									
									
									
								},
								error:function(xhr, status, error){
									alert("error!! : " + error);
								}
							});
							
							
					}
				
					event.preventDefault();
				
					
				});
				
			});
		 	
		 	
		 	 
		 
		///input 클릭시 유효성 검사 span 사라지게 하기
	 	$(function(){
			$('input[type=text]').click(function(){
				if($(this).prop('name')=='mOptionName'){
					$('#warningOptionName').html('');
					event.preventDefault();
				}else if($(this).prop('name')=='mOptionPrice'){
					$('#warningOptionPrice').html('');
					event.preventDefault();
				}
			});
			
		});
		 	 
		
		//input 에 값 입력시 중복 값 있는지 확인하기 1) input 값 change 될때 2)엔터 누를때
	 	$(function(){
			$('input[name=mOptionName]').change(function(){
			
				if($(this).prop('name')=='mOptionName'){
					$('#warningOptionName').html('');
					
					
					$.ajax({
						url:"<c:url value='/owner/menu2/foodmenu/checkOptionName.do'/>",
						data:"menuNo=" + $('#menuNo').val()+"&oRankNo="+$('#oRankNo').val()+"&mOptionName="+$('#mOptionName').val(),
						dataType:"json",
						type:"GET",
						success:function(res){
							//alert(res);
							if(res==true){
								$('#warningOptionName').html("<small>중복된 이름이 존재합니다. 다른 이름을 입력해 주세요</small>");
								$('input[name=mOptionName]').focus();
								event.preventDefault();
							}
						},
						error:function(xhr, status, error){
							alert("error!! : " + error);
						}
					});
					event.preventDefault();
					
				}else if($(this).prop('name')=='mOptionPrice'){
					$('#warningOptionPrice').html('');
					event.preventDefault();				
				}
			});
			
		});
		
	 	$(function(){
			$('input[name=mOptionName]').keyup(function(){
				$.ajax({
					url:"<c:url value='/owner/menu2/foodmenu/checkOptionName.do'/>",
					data:"menuNo=" + $('#menuNo').val()+"&oRankNo="+$('#oRankNo').val()+"&mOptionName="+$('#mOptionName').val(),
					dataType:"json",
					type:"GET",
					success:function(res){
						//alert(res);
						if(res==true){
							$('#warningOptionName').html("<small>중복된 이름이 존재합니다. 다른 이름을 입력해 주세요</small>");
							$('input[name=mOptionName]').focus();
							event.preventDefault();
						}else{
							$('#warningOptionName').html('');
						}
					},
					error:function(xhr, status, error){
						alert("error!! : " + error);
					}
				});
			});
			
		});
		
		
		//서브밋 클릭할때 유효성 검사
		 $(function(){
			  $('.submitWriteOption').click(function(){
				  
				  if($('#mOptionName').val().length<1){
						$('#warningOptionName').html('<small>이름을 입력해 주세요</small><br>');
						$('#mOptionName').focus();
						event.preventDefault();
						return false;
					}else if($('#mOptionPrice').val().length<1){
						$('#warningOptionPrice').html('<small>가격을 입력해 주세요</small><br>');
						$('#mOptionPrice').focus();
						event.preventDefault();
						return false;
					}else if(!validate_price($('#mOptionPrice').val())){
						$('#warningOptionPrice').html('<small>가격은 숫자만 입력 가능합니다</small><br>');				
						$('#mOptionPrice').focus();
						event.preventDefault();	
						return false;
					}
			  
				  
				  $.ajax({
						url:"<c:url value='/owner/menu2/foodmenu/checkOptionName.do'/>",
						data:"menuNo=" + $('#menuNo').val()+"&oRankNo="+$('#oRankNo').val()+"&mOptionName="+$('#mOptionName').val(),
						dataType:"json",
						type:"GET",
						success:function(res){
							//alert(res);
							if(res==true){
								$('#warningOptionName').html("<small>중복된 이름이 존재합니다. 다른 이름을 입력해 주세요</small>");
								$('input[name=mOptionName]').focus();
								event.preventDefault();
								return false;
							}else{
								
								/* $('form[name=frm123]').submit(); */
								$.ajax({
									url:"<c:url value='/owner/menu2/foodmenu/insertOption.do'/>",
									type:"post",
									data:$('form[name=frm123]').serializeArray(), 
									dataType:"json",
									success:function(res){
										//alert(res);
										if(res>0){
											$("#inlineForm").modal("hide");
											$.optionSelectFunction();
										}
									},
									error:function(xhr, status, error){
										alert("error! : " + error);
									}				
								});
							}
						},
						error:function(xhr, status, error){
							alert("error!! : " + error);
						}
					});
				
					
					event.preventDefault(); 
				});
		 	
		 });
		 	
		 
		
		 $(function(){
				$('#mOptionPrice').keyup(function(){
					if(!validate_price($('#mOptionPrice').val())){
						$('#mOptionPrice').html('');
						$('#warningOptionPrice').html('<small>가격은 숫자만 입력 가능합니다</small><br>');	
						$('#mOptionPrice').focus();
						event.preventDefault();	
					}else{
						$('#warningOptionPrice').html('');	
					}
				});
		 });
		 
		 $(function(){
				$('#mOptionPrice').change(function(){
					if(!validate_price($('#mOptionPrice').val())){
						$('#warningOptionPrice').html('<small>가격은 숫자만 입력 가능합니다</small><br>');	
						$('#mOptionPrice').focus();
						event.preventDefault();	
					}else{
						$('#warningOptionPrice').html('');	
					}
				});
		 });
		
		 
		 function validate_price(price){
				var pattern = new RegExp(/^[0-9]*$/g);
				return pattern.test(price);
			}
			
		
	
		 	
			//등록끝
			
			
			//수정 버튼 누르면 그 번호에 대한 값을 가져와서 집어넣기
		 	$.optionEditFunction=function(){
				$(".btmenuEdit").click(function(){
			
			 		$.ajax({
						url:"<c:url value='/owner/menu2/foodmenu/optionSelectOne.do'/>",
						data:"mOptionNo="+$(this).val()+"&menuNo="+$('.menuSelect').val(),
						dataType:"json",
						type:"GET",
						success:function(optionReVo){
							
							var str ="";
							var str2="";
							var str3="";
							str+="<label>그룹이름</label>&nbsp;";
							str+="<input type='hidden'name='sMGroupNo' value='"+optionReVo.sMGroupNo+"'>";
							str+="<input type='text' readonly='readonly' class='form-control text-right' name='sMGroupName' value='"+optionReVo.sMGroupName+"'>&nbsp;&nbsp;";
							str+="<label>메뉴 이름</label>&nbsp;";
							str+="<input type='hidden' name='menuNo' value='"+optionReVo.menuNo+"'>";
							str+="<input type='text' readonly='readonly' class='form-control text-right' name='menuName'  value='"+optionReVo.menuName+"'>";
							str+="<input type='hidden'   name='mOptionNo'  value='"+optionReVo.optionVo.mOptionNo+"'><br>";
							
							
							
							str2+="<input type='text'  class='form-control text-right'  name='mOptionName' id='optionName2' value='"+optionReVo.optionVo.mOptionName+"' style='width:100%;'><br>"
							str3+="<input type='text'  class='form-control text-right'  name='mOptionPrice' id='optionPrice2' value='"+optionReVo.optionVo.mOptionPrice+"' style='width:100%;'><br>";
	
							var str4="";
							if(optionReVo.list.length>0){
								$.each(optionReVo.list, function(idx, item){
									if(item.oRankNo==optionReVo.optionVo.oRankNo){
										str4+="<option value='"+item.oRankNo+"' selected='selected'>"+item.oRankName+"</option><br>";
									}else{
										str4+="<option value='"+item.oRankNo+"'>"+item.oRankName+"</option><br>";
									}
									
								});
							}
								
								$('.groupMenuInputInput').html(str);
							
							    $('.optionNameInputInput').html(str2);
							    $('.optionPriceInputInput').html(str3);
								$('.menuOptionSelectSelect').html(str4);
								
								
								
								
						},
						error:function(xhr, status, error){
							alert("error!! : " + error);
						}
					});
			 		
			 		event.preventDefault(); 
			});
		};
		  

	
		$(function(){
			  $('.submitEditOption').click(function(){
				  $.ajax({
						url:"<c:url value='/owner/menu2/foodmenu/optionUpdate.do'/>",
						type:"post",
						data:$('form[name=frm12345]').serializeArray(), 
						dataType:"json",
						success:function(res){
							//alert(res);
							if(res>0){
							
								$('#inlineForm2').modal("hide");
								$.optionSelectFunction();
							}else{
								alert('실패');
							}
						},
						error:function(xhr, status, error){
							alert("error! : " + error);
						}				
					});
				  event.preventDefault();
			  });
		 });
				  
	
	
	

	
		//에이젝스로 삭제하기
 	$.optionDeleteFunction=function(){
		$(".btmenuDelete").click(function(){
			if(confirm($(this).val()+'번 옵션을 삭제하시겠습니까?')){
		 		$.ajax({
					url:"<c:url value='/owner/menu2/foodmenu/optionDelete.do'/>",
					data:"mOptionNo="+$(this).val(),
					dataType:"json",
					type:"GET",
					success:function(optionReVo){
							alert('삭제완료!');
							$.optionSelectFunction();
					},
					error:function(xhr, status, error){
						alert("error!! : " + error);
					}
				});
	 		
	 			event.preventDefault(); 
			}
	});
		
		
	
		
};
  
		
	  
			
		</script>
		<!-- 메뉴 버튼 -->
		<br><br><br><br><br>
			 <div class="row mt-3 mb-2">
			  		<div class="col-md-2 col-12"></div>
			  		<div class="col-md-8 col-12">
				  		 <div class="text-right">
		                	  <button id="btNowMenu" class="btn btn-primary btMainMenuChange"   style=" background-color:#fcbe32; color:#333;  border: none; font-size: 15px;  font-weight: bold;">현재메뉴</button>
		                	 <button id="btMenuChange" class="btn btn-primary btMainMenuChange"   style=" background-color:#fcbe32; color:#333;  border: none; font-size: 15px;  font-weight: bold;"  >메뉴편집</button>
		                	 <button id="btOptionChange" class="btn  btMainMenuChange "  style="border:1px solid #fcbe32; color:#333;  font-size: 15px; font-weight: bold;">옵션편집</button>
		                	 <button id="btMainMenu" class="btn btn-primary btMainMenuChange" style=" background-color:#fcbe32; color:#333;  border: none; font-size: 15px;  font-weight: bold;" >대표메뉴</button> 
		           		</div>
		            </div>
                    <div class="col-md-2 col-12"></div>
			  </div>
	
	
		
			 
			 <br>
			 

		
	
		
			
		
		<!-- 셀렉 옵션 선택 내용 -->
		<div class="row" id="basic-table">
					  <div class="col-md-2 col-12"></div>
					  <div class="col-12 col-md-8">
					    <div class="card" >
					      <br>
					      <!-- <div class="card-header">
					        <h4 class="card-title text-center" >메뉴</h4>
					      </div> -->
					      <div class="card-content">
					        <div class="card-body">
					          <p class="card-text text-center mb-3 mt-3" style="font-size:30px; color:#333; font-weight:bold;"><b>📋메뉴 옵션📋</b></p>
					          <p class="card-text text-center">메뉴 옵션 수정 및 삭제 및 등록 해주세요</p>
					          <br>
					          <br>
					          <div class="row">
						          <div class="col-md-4 col-12"></div>
								  <div class="col-md-4 col-12">
								  		
										<select class="form-select groupChoice p-2 " name="menuGroup" id="menuGroupSelect" style="overflow : auto; ">
												<option class="m-3 text-center" style="font-size:17px;" selected value="0" >메뉴 그룹 선택</option>
												<c:if test="${!empty list }">
												  <c:forEach var="vo" items="${list }">
												  		<option value="${vo.sMGroupNo }" >${vo.sMGroupName }</option>
												  </c:forEach>
												</c:if>
										</select>
										<br>
								 	</div>
								 	<div class="col-md-4 col-sm-12">
								 		
										<select class="form-select menuSelect p-2" name="menu" id="menuSelect" style="overflow : auto; ">
												<option class="m-3 text-center" style="font-size:17px;" selected value="0" >메뉴 선택</option>
										</select>
										<br>
								 	</div>
							  </div>
					          <div class="table-responsive">
					            <table class="table">
					              <thead>
					                <tr class="text-center" style="background-color:#004e66; color:white;" >
					                  <th style="width:25%;"class="p-2" >
											<select class="form-select menuSelect " name="oRankNo" id="oRankSelect" style="overflow : auto; ">
												<c:if test="${!empty oList }">
													<c:forEach var="vo" items="${oList }">
														<option value="${vo.oRankNo }">${vo.oRankName }</option>
													</c:forEach>
												</c:if>
											</select>
								      </th>
					                  <th style="width:20%;" class="p-2">메뉴 옵션</th>
					                  <th style="width:20%;" class="p-2">가격</th>
					                  <th style="width:20%;" class="p-2">수정/삭제</th>
					                  <th style="width:15%;" class="p-2 pl-3 ">
					                  		<button class="btn btn-warning p-2 mr-3" data-toggle="modal" data-target="#inlineForm" 
					                  			id="btOptionWrite" style="color:black; background-color:#fcbe32; border: none; " disabled="disabled">등록</button>
					                  </th>
					                </tr>
					              </thead>
					              <tbody id="optionTable">
					               		<tr class="text-center">
					               			<td colspan="5">옵션 선택을 위해 메뉴 그룹을 클릭해 주세요</td>
					               		</tr>
					              </tbody>
					            </table>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
				   <div class="col-md-2 col-12"></div>
			 </div> 
			 
			 
			
			 <div class="modal fade text-left" id="inlineForm" tabindex="-1" aria-labelledby="myModalLabel33" style="display: none;" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel33">옵션 등록</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                            </button>
                            </div>
                            <form  name="frm123" >
	                            <div class="modal-body">
	                               	 <div class="form-group groupMenuInput">
	                                </div>
	                                <div class="form-group">
	                                	<label>옵션 순위 선택</label>
		                                <select class="form-select menuOptionSelect p-2" name="oRankNo" id="oRankNo" style="overflow : auto; text-align-last:center;">
										</select>
	                                </div>
	                                <label>옵션 이름<span style="color:red; margin-left:4px;"><b>*</b></span></label>
	                                 <div class="form-group optionNameInput" >
	                               		 <input type="text"  class="form-control text-right" id="mOptionName" name="mOptionName"  style="width:100%;">
	                                </div>
	                                <div style="text-align: right;">
		                    	  		<span id="warningOptionName" style="color:red; "></span>
		                    	    </div>
		                    	    <label>옵션  가격<span style="color:red; margin-left:4px;"><b>*</b></span></label>
	                                 <div class="form-group optionPriceInput" >
	                               		 <input type="text"  class="form-control text-right" id="mOptionPrice" name="mOptionPrice"  style="width:100%;">
	                                </div>
	                                <div style="text-align: right;">
		                    	  		<span id="warningOptionPrice" style="color:red; "></span>
		                    	    </div>
	                            </div>
	                            <div class="modal-footer">
	                                <button type="button" class="btn btn-light-secondary submitWriteOption" style="color:black; background-color:#fcbe32; border: none; ">  
	                                	<i class="bx bx-x d-block d-sm-none "></i>
	                                	<span class="d-none d-sm-block">등록</span>
	                                </button>
	                                <button type="button" class="btn btn-primary ml-1" data-dismiss="modal" style=" background-color:#f1f3f5; color:#333; border: none;">
	                               		<i class="bx bx-check d-block d-sm-none"></i>
	                                	<span class="d-none d-sm-block">취소</span>
	                                </button>
	                            </div>
                            </form>
                        </div>
                        </div>
                    </div>
				   	<br>
				   	 
				   	
				   	
				   	<!-- 수정 모달! -->
			 <div class="modal fade text-left" id="inlineForm2" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">옵션 수정</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                            </button>
                            </div>
                            <form  name="frm12345" >
	                            <div class="modal-body">
	                               	 <div class="form-group groupMenuInputInput">
	                                </div>
	                                <div class="form-group">
	                                	<label>옵션 순위 선택</label>
		                                <select class="form-select menuOptionSelectSelect p-2" name="oRankNo" id="RankNo" style="overflow : auto; text-align-last:center;">
										</select>
	                                </div>
	                                <label>옵션 이름<span style="color:red; margin-left:4px;"><b>*</b></span></label>
	                                 <div class="form-group optionNameInputInput" >
	                                </div>
	                                
	                               
		                    	    <label>옵션  가격<span style="color:red; margin-left:4px;"><b>*</b></span></label>
	                                 <div class="form-group optionPriceInputInput" >
	                                </div>
	                                
	                              
	                            </div>
	                            <div class="modal-footer">
	                                <button type="button" class="btn btn-outline-dark submitEditOption">  
	                                	<i class="bx bx-x d-block d-sm-none "></i>
	                                	<span class="d-none d-sm-block">수정</span>
	                                </button>
	                                <button type="button" class="btn btn-primary ml-1" data-dismiss="modal" style=" background-color:#f1f3f5; color:#333; border: none;">
	                               		<i class="bx bx-check d-block d-sm-none"></i>
	                                	<span class="d-none d-sm-block">취소</span>
	                                </button>
	                            </div>
                            </form>
                        </div>
                        </div>
                    </div>
				   	<br>
		<br>
		<br>
				   
 <%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>

	