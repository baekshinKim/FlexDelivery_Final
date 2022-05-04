<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대표 메뉴 수정</title>

  
  
  	
   
    
    <!-- CSS only -->
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">

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
 
	
	
	

		
	
	</script>
	
		
</head>
<body style="overflow-x:hidden;">
		<br>
		<section id="basic-vertical-layouts">
		    <div class="row match-height">
		    	<div class="col-md-2 col-sm-12"></div>
		        <div class="col-md-8 col-sm-12">
		
		            <div class="card-header" style="background-color:white;">
		            <h4 class="card-title text-center mt-5">대표 메뉴 등록</h4>
		            </div>
		            <div class="card-content">
		            <div class="card-body">
		                <form class="form form-vertical" action="<c:url value='/owner/menu2/foodmenu/signatureMenuEdit.do'/>" name="frm" method="post" >
		                   <div class="form-body">
		                    <div class="row">
	                        	<input type="hidden" name="storeNo" value="${storeNo }">
	                        	<div class="col-12 col-md-1"></div>
	                        	<div class="col-12 col-md-5 text-center" >
		                        	<span><small>메뉴 중분류카테고리</small></span>
		                        	<br>
		                     	 	<select class="form-select mt-2" id="mCategoryNo" name="mCategoryNo" style="text-align-last: center">
                                        <c:if test="${empty cList }">
                                        	<option value="0"  selected="selected"  >중분류</option>
                                        </c:if>
                                        <c:if test="${!empty cList }">
                                        	<c:forEach var="cVo" items="${cList }" varStatus="status">
                                        		<c:if test="${cVo.mCategoryNo==mainVo.mCategoryNo }">
                                        			<option value="${cVo.mCategoryNo }" selected="selected" >${cVo.mCategoryName }</option>
                                        		</c:if>
                                        		<c:if test="${cVo.mCategoryNo !=mainVo.mCategoryNo  }">
                                        			<option value="${cVo.mCategoryNo }">${cVo.mCategoryName }</option>
                                        		</c:if>
                                        	</c:forEach>
                                        </c:if>
                                    </select>
                                   </div>
                                   <div class="col-12 col-md-5 text-center">
                                   	<span><small>메뉴</small></span>
                                    <select class="form-select mt-2" id="menuNo" name="menuNo" style="text-align-last: center">
										<c:if test="${empty mList }">
                                        	<option value="0">메뉴</option>
                                        </c:if>
                                        <c:if test="${!empty mList }">
                                        	<c:forEach var="mVo" items="${mList }" varStatus="status">
                                        		<c:if test="${mVo.menuNo==mainVo.menuNo }">
                                        			<option value="${mVo.menuNo }" selected="selected" >${mVo.menuName }</option>
                                        		</c:if>
                                        		<c:if test="${mVo.menuNo !=mainVo.menuNo }">
                                        			<option value="${mVo.menuNo }">${mVo.menuName  }</option>
                                        		</c:if>
                                        	</c:forEach>
                                        </c:if>
                                    </select>
	                       		</div>
		                    	<div class="col-12 col-md-1"></div>
		                    </div>
		                    
		                    <Br>
		                    <br>
		                    <div class="col-12 d-flex justify-content-center">
		                        <input type="submit" class="btn btn-outline-dark mr-1 mb-1" id="btMenuEdit" name="btMainEdit" value="수정">
		                        <button type="reset" class="btn btn-outline-primary mr-1 mb-1" onclick="self.close()"style=" background-color:#f1f3f5; color:#333; border: none;" >취소</button>
		                    </div>
		                    <Br>
		                    </div>
		                </form>
		            </div>
		            </div>

		        </div>
		        <div class="col-md-2 col-sm-12"></div>
		    </div>
		</section>
			
			  
			  
			  	
			
		 
        <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>

     <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/pages/dashboard.js"></script>

    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
    
    
    
   
	     	  
			
</body>
</html>
