<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴수정</title>



   
  
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
 <script src="${pageContext.request.contextPath}/resources/ownerResources/herbJs/jquery-3.5.1.min.js"></script>
 

	
	<!-- 클릭시 비밀번호 유효성 검사 및 페이지 이동 -->
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<script type="text/javascript">
	$(function(){
		$('input').attr("autocomplete","off");
	});
	
	
	  $(document).ready(function(){
			 var type=1;
			var YorN = ${YorN};
			 
			 if(type==YorN) {
				opener.parent.location.reload();
				self.close();
				} 
	});
	  
	  
	    
	  $(function(){
			$('#btMenuChoiceEdit').click(function(){
			
				if($('#menuName').val().length<1){
					$('#warningName').html('<small>이름을 입력해 주세요</small><br>');
					$('#menuName').focus();
					event.preventDefault();
				}else if($('#menuPrice').val().length<1){
					$('#warningPrice').html('<small>가격을 입력해 주세요</small><br>');
					$('#menuPrice').focus();
					event.preventDefault();				
				}else if($('#menuContent').val().length<1){
					$('#warningContent').html('<small>내용을 입력해 주세요</small><br>');
					$('#menuContent').focus();
					event.preventDefault();				
				}else if(!validate_price($('#menuPrice').val())){
					$('#warningPrice').html('<small>가격은 숫자만 입력 가능합니다</small><br>');				
					$('#menuPrice').focus();
					event.preventDefault();	
				}
			});
			
		});
		
		

		$(function(){
			$('input[type=text]').change(function(){
			
				if($(this).prop('name')=='menuName'){
					$('#warningName').html('');
					event.preventDefault();
				}else if($(this).prop('name')=='menuPrice'){
					$('#warningPrice').html('');
					event.preventDefault();				
				}
			});
			
		});
		
		$(function(){
			$('textarea').change(function(){
			
				if($(this).prop('name')=='menuContent'){
					$('#warningContent').html('');
					event.preventDefault();				
				}
			});
			
		});
		
		
		$(function(){
			$('input[type=text]').click(function(){
			
				if($(this).prop('name')=='menuName'){
					$('#warningName').html('');
					event.preventDefault();
				}else if($(this).prop('name')=='menuPrice'){
					$('#warningPrice').html('');
					event.preventDefault();				
				}
			});
			
		});
		
		
		$(function(){
			$('#menuPrice').keyup(function(event){
				if(!validate_price($('#menuPrice').val())){
					$('#menuPrice').html('');
					$('#warningPrice').html('<small>가격은 숫자만 입력 가능합니다</small><br>');	
					$('#menuPrice').focus();
					event.preventDefault();	
				}else{
					$('#warningPrice').html('');	
				}
			});
	 });
	 
	 $(function(){
			$('#menuPrice').change(function(event){
				if(!validate_price($('#menuPrice').val())){
					$('#warningPrice').html('<small>가격은 숫자만 입력 가능합니다</small><br>');	
					$('#menuPrice').focus();
					event.preventDefault();	
				}else{
					$('#warningPrice').html('');	
				}
			});
	 });
	
	 
	 function validate_price(price){
			var pattern = new RegExp(/^[0-9]*$/g);
			return pattern.test(price);
		}
		
		$(function(){
			$('textarea').click(function(){
			
				if($(this).prop('name')=='menuContent'){
					$('#warningContent').html('');
					event.preventDefault();				
				}
			});
			
		});
		
		$(function(){
		   $('#upfile').on('change', function(){
		       readInputFile(this);
		   });
		});
		
		
		function readInputFile(input) {
		    if(input.files && input.files[0]) {
		        var reader = new FileReader();
		       reader.onload = function (e) {
		            $('#preview').html("<img src="+ e.target.result +"  style='width:90%; margin-left:20px;' >");
		        }
		        reader.readAsDataURL(input.files[0]);
		    }  
		} 
	</script>
	
		
</head>
<body style="overflow-x:hidden;">
		<br>
		<section id="basic-vertical-layouts">
		    <div class="row match-height">
		    	<div class="col-md-3 col-sm-12"></div>
		        <div class="col-md-6 col-sm-12">
		     
		            <div class="card-header" style="background-color:white;">
		            <h4 class="card-title text-center">메뉴 수정</h4>
		            </div>
		            <div class="card-content">
		            <div class="card-body">
		                <form class="form form-vertical" action="<c:url value='/owner/menu2/foodmenu/menuChoiceEdit.do'/>" method="post" enctype="multipart/form-data" >
		                	<!--  수정시 필요한 no를 hidden 필드에 넣는다-->
   							<input type="hidden" name="menuNo" value="${menuVo.menuNo}"/>
 							<input type="hidden" name="oldFileName" value="${menuVo.menuImg}"/>
 							  
		                   <div class="form-body">
		                    <div class="row">
		                    <div class="col-12">
		                    	<!-- 메뉴 그룹 -->
		                        <div class="form-group">
		                        	<span><small>메뉴 그룹</small></span>
		                        
		                     	 	<select class="form-select" id="sMGroupNo" name="sMGroupNo" style="text-align-last: right">
                                    	 	<c:forEach var="groupVo" items="${list}">
                                        		<c:set var="sMGroupNo" value="${menuVo.sMGroupNo }"></c:set>
                                        		<c:set var="listGroupNo" value="${groupVo.sMGroupNo }"></c:set>
                                        		
                                       	 		<option value="${groupVo.sMGroupNo }"
                                       	 			<c:if test="${sMGroupNo==listGroupNo}">
                                        				selected="selected"
                                        			</c:if>
                                       	 		>${groupVo.sMGroupName }</option>
                                           	 		
                                           	</c:forEach>
                                 	 </select>
		                       		<!-- 메뉴 이름 -->
		                       		<label for="first-name-vertical">메뉴 이름<span style="color:red; margin-left:4px;"><b>*</b></span></label>
		                        	<input type="text" id="menuName" class="form-control text-right" name="menuName" value="${menuVo.menuName }">
		                    	  	<div>
		                    	  		<span id="warningName" style="color:red; margin-left:210px;"></span>
		                    	    </div>
		                    	    
		                    	    <!-- 메뉴 가격 -->
		                    	    <label for="first-name-vertical">메뉴 가격<span style="color:red; margin-left:4px;"><b>*</b></span></label>
		                        	<input type="text" id="menuPrice" class="form-control text-right" name="menuPrice" value="${menuVo.menuPrice}" >
		                     		<div >
		                     			<span id="warningPrice" style="color:red; text-align: right; margin-left:210px;"></span>
		                     		</div>
		                     		
		                     		<!-- 메뉴이미지 -->
		                     		<span><small>메뉴 이미지</small></span>
		                     		 <div id="preview" class="text-center">
		                     		 <!-- 이미지 띄우기 -->
											<c:set var="type" value="${type }"></c:set> 
											<c:if test="${type=='file'}">
											<img src
													="<c:url value='/resources/imgs/MenuImages/${menuVo.menuImg}'/>" 
													alt="${menuVo.menuName }" style="height:250px; width:80%;">
											</c:if>
											<c:if test="${type=='url'}">
											      	<img src="${menuVo.menuImg}" style="height:250px; width:80%;"
													 alt="${menuVo.menuName }">
											</c:if>
		                     		 </div>
		                     		<div class="form-file text-center" >
		                     			 <input type="file" id="upfile" name="upfile" class="btn text-right" accept=".gif, .jpg, .png" />
                                         <br><span style="margin-left:60px;"><small>* 첨부파일을 새로 지정할 경우 기존파일은 삭제됩니다.</small></span>    
                                    </div>
                          		
                          		
                          			<!-- 메뉴내용 -->
                          			<c:set var="content" 
											value="${fn:replace(menuVo.menuContent, newLine,'<br>') }" />
	                          		<label for="exampleFormControlTextarea1" class="form-label">메뉴 내용<span style="color:red; margin-left:4px;"><b>*</b></span></label>
	                          		<textarea class="form-control" id="menuContent" name="menuContent" rows="3" >${content }</textarea>
	              					<span id="warningContent" style="color:red; margin-left:200px;"></span>
                      			</div>
		                      </div>
		                    </div>
		                    <div class="col-12 d-flex justify-content-end">
		                        <input type="submit" class="btn btn-outline-dark mr-1 mb-1" id="btMenuChoiceEdit" value="수정">
		                        <button type="reset" class="btn btn-light-secondary mr-1 mb-1" onclick="self.close()" style=" background-color:#f1f3f5; color:#333; border: none;">취소</button>
		                    </div>
		                    </div>
		                </form>
		            </div>
		            </div>
		     
		        </div>
		        <div class="col-md-3 col-sm-12"></div>
		    </div>
		</section>
			
			  
			  
			  	
			
		 
        <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/pages/dashboard.js"></script>

    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
    
    
    
   
	     	  
			
</body>
</html>
