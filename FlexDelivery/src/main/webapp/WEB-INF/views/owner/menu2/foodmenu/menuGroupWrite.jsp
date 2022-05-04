<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!-- 나중에 storeNo 수정필요 -->
<!DOCTYPE html>
<html lang="ko">
<head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴그룹사이트</title>
 
 
 
 
 
<%--   
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon"> --%>

   <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">



    <script src="${pageContext.request.contextPath}/resources/ownerResources/herbJs/jquery-3.5.1.min.js"></script>
   <!-- 클릭시 비밀번호 유효성 검사 및 페이지 이동 -->
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
   <script type="text/javascript">

     $(document).ready(function(){
          var type=1;
         var YorN = ${YorN};
          
          if(type==YorN) {
            opener.parent.location.reload();
            self.close();
            } 
        });
      
     
     
     //버튼 눌렀을때
     $(function(){
         $('#groupBT').click(function(){
            if($('input[id=sMGroupName]').val().length<1){
               alert('그룹명을 입력해 주세요');
               $('input[name=sMGroupName]').focus();
               event.preventDefault();
               return false;
            }
            
            
         $.ajax({
            url:"<c:url value='/owner/menu2/foodmenu/checkDupGroupName.do'/>",
            data:"sMGroupName=" + $('#sMGroupName').val(),
            dataType:"json",
            type:"GET",
            success:function(res){
               //alert(res);
               if(res==true){
                  $('.checkDup').html("<small>중복된 이름이 존재합니다.</small>");
                  $('input[name=sMGroupName]').focus();
                  event.preventDefault();
                  return false;
               }else{
                  $('form[name=frm]').submit();
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
         $(document).keyup(function(){
           /*  if(event.key==="Enter"){ */
	               
		               $.ajax({
		                  url:"<c:url value='/owner/menu2/foodmenu/checkDupGroupName.do'/>",
		                  data:"sMGroupName=" + $('#sMGroupName').val(),
		                  dataType:"json",
		                  type:"GET",
		                  success:function(res){
		                     //alert(res);
		                     if(res==true){
		                        $('.checkDup').html("<small>중복된 이름이 존재합니다.</small>");
		                        $('input[name=sMGroupName]').focus();
		                        event.preventDefault();
		                        return false;
		                     }else{
		                    	 $('.checkDup').html('');
		                     }
		                  },
		                  error:function(xhr, status, error){
		                     alert("error!! : " + error);
		                  }
		               });
	              
           /*  } */
            event.preventDefault();
         });
  
      });    
     
     
     //input 에 값입력했을때
     $(function(){
         $('input[type=text]').change(function(){
         
            if($(this).prop('name')=='sMGroupName'){
               $.ajax({
                  url:"<c:url value='/owner/menu2/foodmenu/checkDupGroupName.do'/>",
                  data:"sMGroupName=" + $('#sMGroupName').val(),
                  dataType:"json",
                  type:"GET",
                  success:function(res){
                     //alert(res);
                     if(res==true){
                        $('.checkDup').html("<small>중복된 이름이 존재합니다.</small>");
                        $('input[name=sMGroupName]').focus();
                        event.preventDefault();
                     }
                  },
                  error:function(xhr, status, error){
                     alert("error!! : " + error);
                  }
               });
            }
         });
         
      });
   
     
   </script>
</head>
<body style="overflow-x:hidden;">   
      <br>   <br>   
      <section id="basic-vertical-layouts">
          <div class="row match-height">
             <div class="col-md-4 col-12"></div>
              <div class="col-md-4 col-12 text-center">
                  <h4 class="card-title">메뉴 그룹 등록</h4>
                      <form class="form form-vertical" name="frm" method="post" action='<c:url value="/owner/menu2/foodmenu/menuGroupWrite.do"/>'>
                         <div class="form-body">
                          <div class="row">
                          <div class="col-12">
                              <div class="form-group m-3 text-center">
	                              <label for="first-name-vertical" class="mb-2">메뉴 그룹 이름</label>
	                              <input type="text" id="sMGroupName" class="form-control" name="sMGroupName" style="width:80%; display:inline; text-align:right;">
	                              <span class="checkDup" style="color:red; float:right; width:60%;"></span>
	                              <input type="hidden" name="storeNo" value="${storeNo}"> 
	                              <!-- 나중에 storeNo 수정필요 -->
                              </div>
                          </div>
                          <div class="col-12 d-flex justify-content-center mt-3">
                              <input type="button" class="btn  mr-1 mb-1"  id="groupBT" value="등록" style="color:black; background-color:#fcbe32; border: none; ">
                              <button type="reset" class="btn btn-light-secondary mr-1 mb-1" onclick="self.close()"  style=" background-color:#f1f3f5; color:#333; border: none;" >취소</button>
                          </div>
                          </div>
                      </div>
                      </form>
             	 </div>
              <div class="col-md-4 col-12"></div>
          </div>
      </section>
         
           
               
        <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
    

    
    <%-- 
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/pages/dashboard.js"></script>

    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
    
     --%>
    
   
         
</body>
</html>
       