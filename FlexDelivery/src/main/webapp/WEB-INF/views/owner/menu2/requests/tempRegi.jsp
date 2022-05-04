<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사업자 등록증 등록 신청 상세 보기 </title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
	  <script src="${pageContext.request.contextPath}/resources/ownerResources/herbJs/jquery-3.5.1.min.js"></script>
	<style type="text/css">
		html {overflow-x:hidden;}
		.btn-dark {
	    color: #fff;
	    background-color: #222f3e;
	    border-color: #222f3e;
	}
	</style>

</head>	
		<!-- 메뉴 컨텐츠 내용 br 바꾸기 -->
		<div></div>
		<br>
		<br>
		<br>
		<div class="row">
				<div class="col-md-3 col-sm-12"></div>
				<div class="col-md-6 col-sm-12">
				      		<div class="text-center">
				       			<h4> 사업자 정보 상세보기  </h4>
				       	   	 </div>
				       	   		<div class="row" id="basic-table">
						          <!-- Table with outer spacing -->
						          <div class="table-responsive"  style="overflow-x: hidden;">
						            <table class="table table-striped">
						              <tbody>
						                <tr>
						                	<td colspan="4" class="text-center">
						                	<c:if test="${fn:substring(rgVo.oRegisterFileName, 0,4)=='http' }">
											<img src="${rgVo.oRegisterFileName}" class="card-img-top"  alt ="${rgVo.oRegisterNo}"  style="height:150px;">
										</c:if>
										<c:if test="${fn:substring(rgVo.oRegisterFileName, 0,4)!='http' and (!empty rgVo.oRegisterFileName) }">
											<img src
												="<c:url value='/resources/imgs/OwnerRegisterImages/${rgVo.oRegisterFileName}'/>"  class="card-img-top" alt ="${rgVo.oRegisterNo}"style="height:150px;">
										</c:if>	
						                	
				                			</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500" >사업자 등록 번호  </th>
							                  <td>${rgVo.oRegisterNo}</td>
						                </tr>
						                <tr class="text-center">
							                  <th class="text-bold-500"  >신청일  </th>
							                  <td>${rgVo.ownerregisterRegdate}</td>
						                </tr>
						              </tbody>
						            </table>
						          </div>
						       </div>
				       	   <!-- 끝  -->
				       	   <div class="text-center" style="margin-top:14px;">
				       	   	 <button class="btn btn-dark block" id="btclose"  name="btclose">확인</button>
				       	   	 <c:if test="${rgVo.aAgreeNo == 1}">
				       	   	  <button class="btn btn-dark block"  id="btclose2"  name="btclose2" 
				       	   	   data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">신청 취소</button>
				       	   	 </c:if>
				       	   </div>
				       </div>
				   </div>
				<div class="col-md-3 col-sm-12"></div>
<!--비밀 번호 확인 모달  -->			
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
      <div class="text-right">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="text-left">
        <h4 class="modal-title" id="exampleModalLabel">본인 확인 </h4>
      </div>
      </div>
        <form name="frmDelete" method="post"  action="<c:url value='/owner/menu2/requests/deleteRegi.do'/>" >
        <input type="hidden" id="no" name="no" value="${rgVo.oRegisterNo}">
      <div class="modal-body">
          <div class="form-group">
            <label for="recipient-name" class="control-label">비밀번호를 입력하세요. </label>
            <input type="password" class="form-control" id="pwd"name="pwd"/>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
        <input type="submit" class="btn btn-primary" value="확인 ">
      </div>
        </form>
    </div>
  </div>
</div>	
 <script src="${pageContext.request.contextPath}/resources/adminResources/js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
    $(function(){
		$('#btclose').click(function(){
				self.close();
		});
	});
    $(function(){
		$('form[name=frmDelete]').submit(function(){
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}else if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
			}
		});
	});	
    
	</script>
	<!--  -->			
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/pages/dashboard.js"></script>
    <script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
</body>
</html>
    	