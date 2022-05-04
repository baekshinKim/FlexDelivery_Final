<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../ownerInc/top.jsp" %>

<script type="text/javascript">
	$(function(){
		
		$('input').attr('autocomplete','off');
		
		   $('#upfile').on('change', function(){
		       readInputFile(this);
		   });
		});
		
		
		function readInputFile(input) {
		    if(input.files && input.files[0]) {
		        var reader = new FileReader();
		       reader.onload = function (e) {
		            $('#preview').html("<img src="+ e.target.result +"  style='width:50%; margin-left:20px;'>");
		        }
		        reader.readAsDataURL(input.files[0]);
		    }  
		} 
		
		
		 
		$(function(){
			$('#btnZipcode').click(function(){
				var windowW = 500;  // 창의 가로 길이
			    var windowH = 450;  // 창의 세로 길이
			    var left = Math.ceil((window.screen.width - windowW)/2);
			    var top = Math.ceil((window.screen.height - windowH)/2);
				
			    open("<c:url value='/owner/mypage/zipcode.do'/>","주소 찾기","top="+top+", left="+left+", height="+windowH+", width="+windowW+",scroll-x=no, resizable=yes");
			});
		});

		
		//유효성 검사하기!
		$(function(){
			$('form[name=temporaryfrm]').submit(function(){
				
				
				$('.tInfo').each(function(idx, item){
					if($(this).val().length<1){
						$('#'+$(this).attr('name')+'Warning').html('<small>'+$(this).attr('title')+ '을(를) 입력하세요</small>');
						$(this).focus();
						event.preventDefault();
						return false;  //each 탈출
					}
				});	
				
				if($('input[name=oRegisterNo]').val().length>0 && $('input[name=oRegisterNo]').val().length <10){
					$('#oRegisterNoWarning').html('<small>사업자 번호 숫자 10자리 입력 부탁드립니다</small>');
					$('input[name=oRegisterNo]').focus();
					event.preventDefault();
					return false;  //each 탈출
				}
				
			});
			
		});
		
		
		$(function(){
			$('input[name=oRegisterNo]').keyup(function(){
				$('#oRegisterNoLength').html("<small><b>"+$('input[name=oRegisterNo]').val().length+"/10</b></small>");
			});
		});
		
		$(function(){
			$('.tInfo').click(function(){
				$('#'+$(this).attr('name')+'Warning').html('');
			});
		});
		
		
		$(function(){
			$('.tInfo').keyup(function(){
				$('#'+$(this).attr('name')+'Warning').html('');
			});
		});
		
		
		
		
		
		
		
</script>

<div class="row" >

	<div class="col-12 col-md-3 pt-3"></div>
	<div class="col-12 col-md-6 text-center pt-3" >
		 <h3>내 정보 수정</h3>
	</div>
	<div class="col-12 col-md-3 pt-3"></div>
		<br><br><Br>
	<div class="col-12 col-md-3"></div>
	<div class="col-12 col-md-6 text-center" >
		<form class="form form-horizontal" name="temporaryfrm" action="<c:url value='/owner/mypage/mypageEdit.do'/>" 
				method="POST"  enctype="multipart/form-data" >
			  <input type="hidden" name="storeNo" value="${map['STORE_NO'] }">
			  <input type="hidden" name="locationNo" value="${map['LOCATION_NO'] }">
			  <input type="hidden" name="ownerno" value="${map['OWNER_NO'] }">
			  <input type="hidden" name="tOriginalFileName" value="${map['O_REGISTER_FILENAME'] }">
			  
              <div class="form-body">
                  <div class="row">
	                  <div class="col-12 text-center mb-5 mt-5">
	                  	<h4 style="display: inline;">점 포</h4>
	                  </div>
	                  <div class="col-md-4">
	                      <label>점포명</label>
	                  </div>
	                  <div class="col-md-7 form-group">
	                      <input type="text"  class="form-control tInfo" name="tStoreName" title="점포명" value="${map['STORE_NAME'] }" >
	                      <span id="tStoreNameWarning" style="color:red;"></span>
	                  </div>
	                    <div class="col-md-1"></div>
	                   <div class="col-md-4">
	                      <label>점포주소</label>
	                  </div>
	                  <div class="col-md-7 form-group">
	                      <input type="text"  class="form-control tInfo" name="tStoreAddress" title="주소" value="${map['STORE_ADDRESS'] }">
	                   	   <span id="tStoreAddressWarning" style="color:red;"></span>
	                   </div>
	                   <div class="col-md-1 form-group p-0 ">
	                  	  <input type="Button"  value="주소 찾기" id="btnZipcode" title="새창열림" style="background-color: rgb(237,242,13); height:37px;">
	                  </div>
	                  
	                  <div class="col-md-4">
	                      <label>점포상세주소</label>
	                  </div>
	                  <div class="col-md-7 form-group">
	                      <input type="text" class="form-control tInfo" name="tStoreAddressDetail" title="주소" value="${map['STORE_ADDRESS_DETAIL'] }" >
	                  	  <span id="tStoreAddressDetailWarning" style="color:red;"></span>
	                  </div>
	                  <div class="col-md-1"></div>
	                 <div class="col-12">
	                 	<hr>
	                 </div>
	                  <div class="col-12 text-center mb-5 mt-5">
	                  	<h4 style="display: inline;">사업자 등록증</h4>
	                  </div>
	                   <div class="col-md-4 mb-5">
	                      <label>사업자 등록증 번호</label>
	                  </div>
	                  <div class="col-md-7 form-group mb-5">
	                      <input type="text"  class="form-control tInfo" name="oRegisterNo" title="사엄자 등록증 번호" value="${map['O_REGISTER_NO'] }" maxlength="10">
	                      <span id="oRegisterNoWarning" style="color:red;"></span>
	                      <span id="oRegisterNoLength" style="color:red;"></span>
	                  </div>
	                 
	                 <!--  <span><small>사업자 등록증 파일</small></span> -->
	                 <div class="col-12 text-center ">
				          <div id="preview" class="text-center form-group">
				        	  <c:if test="${fn:substring(map['O_REGISTER_FILENAME'], 0,4)=='http' }">
									<img src="${map['O_REGISTER_FILENAME']}" class="card-img-top"  alt ="${map['O_REGISTER_NO'] }"  style="size: fit-content; width:70%;">
								</c:if>
								<c:if test="${fn:substring(map['O_REGISTER_FILENAME'], 0,4)!='http' and (!empty map['O_REGISTER_FILENAME']) }">
									<c:set var="oRegiFile" value="${map['O_REGISTER_FILENAME']}"></c:set>
									<img src
										="<c:url value='/resources/imgs/OwnerRegisterImages/${oRegiFile }'/>"  class="card-img-top" alt ="${map['O_REGISTER_NO'] }" style="size: fit-content; width:70%;">
								</c:if>
				          </div>
				          <div class="form-file form-group">
				               <input type="file" id="upfile" name="upfile" class="btn"  accept=".gif, .jpg, .png" style="padding-left:30px;"/>
				                <br>
				                <span style="margin-left:60px;"><small>* 첨부파일을 새로 지정할 경우 기존파일은 삭제됩니다.</small></span>    
		                  </div>
		            </div>
		           
	                 <div class="col-12">
	                 	<hr>
	                 </div>     		
	                 <div class="col-12 text-center mb-5 mt-5">
	                  	<h4 style="display: inline;">점 주</h4>
	                  </div>
	                  <div class="col-md-4">
	                      <label>이름</label>
	                  </div>
	                  <div class="col-md-7 form-group">
	                      <input type="text"  class="form-control tInfo" name="tOwnerName" title="사장님 성함" value="${map['OWNER_NAME'] }" >
	                  	  <span id="tOwnerNameWarning" style="color:red;"></span>
	                  </div>
	                  <div class="col-md-1"></div>
	                  <div class="col-md-4">
	                      <label>전화번호</label>
	                  </div>
	                  <div class="col-md-7 form-group" style="display: flex; justify-content: space-around;">
                           
                                    <select name="tOwnerHp1" class="form-control"  style="text-align-last:center; ">
                                        <option value="010"
							            	<c:if test="${map['OWNER_HP1'] =='010'}">
							            		selected="selected"
							            	</c:if>
							            >010</option>
							            <option value="011"
							            	<c:if test="${map['OWNER_HP1'] =='011'}">
							            		selected="selected"
							            	</c:if>
							            >011</option>
							            <option value="016"
							            	<c:if test="${map['OWNER_HP1'] =='016'}">
							            		selected="selected"
							            	</c:if>
							            >016</option>
                                    </select>
                                    <div class="select-dropdown"></div>
                            
                           
                          
               
                           	<div class="input-group" >
                           		&nbsp;&nbsp;-&nbsp;&nbsp; <input  type="text" class="form-control" name="tOwnerHp2"  maxlength="4" required="required" id="ownerHp2" value="${map['OWNER_HP2'] }" style="text-align:center; " >
                           	</div>
                    
                       
                     
                           	<div class="input-group">
                           		&nbsp;&nbsp;-&nbsp;&nbsp; <input type="text" class="form-control" name="tOwnerHp3" maxlength="4" required="required" id="ownerHp3" value="${map['OWNER_HP3'] }" style="text-align:center;">
                           	</div>
	                  </div> 
	                  <div class="col-md-1"></div> 
	                   <div class="col-12">
	                 		<hr>
	               	   </div>       
	                   <div class="col-12 text-center">
	               		  <label>요 청 사 항</label>
	                   </div>
	                 	<div class="col-12 text-center mt-2">
	               		  <textarea rows="5" cols="70" name="tDetail" class="tInfo" title="요청사항"></textarea>
	               		  <br>
	                   	  <span id="tDetailWarning" style="color:red;"></span>
	                   </div>
	                  <div class="col-12">
	                 	  <hr>
	               	  </div>
	              </div>
                  <div class="col-sm-12 mt-3 d-flex justify-content-center">
                      <button type="submit" class="btn btn-primary mr-1 mb-1" style="background-color:rgb(223,108,220); border-color: rgb(223,108,220);">수정</button>
                      <button type="button" class="btn btn-light-secondary mr-1 mb-1" onclick="history.back()">취소</button>
                  </div>
               </div>
          </form>
      </div>
	  <div class="col-12 col-md-3"></div>
</div>
<br><br><Br>
<%@ include file="../../ownerInc/bottom.jsp" %>