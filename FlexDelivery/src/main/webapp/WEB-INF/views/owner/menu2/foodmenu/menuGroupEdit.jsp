<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴그룹수정</title>
	  
	  
	  
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
 <script src="${pageContext.request.contextPath}/resources/ownerResources/herbJs/jquery-3.5.1.min.js"></script>

    
	<script type="text/javascript">
	$(function(){
		$('input').attr("autocomplete","off");
	});
	
		var type="1";
		var YorN = ${YorN};
		if(type==YorN){
			opener.parent.location.reload();
			self.close();
		}

		
	
	</script>

</head>
<body style="overflow-x:hidden;">
		<br>	<br>	
		
		
		<section id="basic-vertical-layouts">
		    <div class="row match-height">
		    	<div class="col-md-3 col-sm-12"></div>
		        <div class="col-md-6 col-sm-12">
		     
		            <div class="card-header" style="background-color:white;">
		            <h4 class="card-title text-center">메뉴 그룹 수정</h4>
		            </div>
		            <div class="card-content">
		            <div class="card-body">
		                <form class="form form-vertical" name="frm123" method="post" action='<c:url value="/owner/menu2/foodmenu/menuGroupEdit.do"/>'>
		                   <div class="form-body">
		                    <div class="row">
		                    <div class="col-12">
		                        <div class="form-group">
		                       		<label for="first-name-vertical">메뉴 그룹 번호</label>
		                        	<input type="text" id="sMGroupNo" class="form-control" name="sMGroupNo" value="${param.sMGroupNo}" readonly="readonly">
		                       		<label for="first-name-vertical">메뉴 그룹 이름</label>
		                        	<input type="text" id="sMGroupName" class="form-control" name="sMGroupName" value="${vo.sMGroupName }">
		                        	<input type="hidden" name="storeNo" value="${vo.storeNo }">
		                    	 </div>
		                      </div>
		                    </div>
		                    <div class="col-12 d-flex justify-content-center">
		                        <input type="submit" class="btn btn-outline-dark mr-1 mb-1" id="btMenuGroupEdit" value="수정">
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
