<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../adminInc/top.jsp" %>    

<!-- CSS start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<!-- CSS end -->    

<div class="container">
	<div class="row">
			<div class="col-12">
                <div class="card mt-70 mb-70">
                    <div class="card-header mt-50">
                        <h4 class="card-title">마이페이지</h4>
                        <!-- <a href="#" class="btn btn-dark round">등록</a> -->
                    </div>
                    <div class="card-body">
	                    <form name="frmAdminMypage" id="frmAdminMypage" action="<c:url value='/admin/myPage/myPageConfirm.do' />" method="post">
		                    <div style="display: flex;">
		                    	<div style="text-align: left; width: 60%;">
									<div class="group col-9" style="text-align: center;">
									    <input type="hidden" name="adminPwd" id="adminPwd" value="${vo.adminPwd }">
									    <input type="hidden" name="adminNo" id="adminNo" value="${sessionScope.adminNo }">
									    <input type="password" name="pwd" id="pwdConfirm" required>
									    <span class="highlight"></span>
									    <span class="bar"></span>
									    <label>비밀번호를 입력해주세요</label>
									    <br><br>
										<div class="col-6">
										     <button type="submit" class="btn original-btn">다음</button>
										</div>
									</div>
		                    	</div>
		                    	<div style="text-align: right;">
		                    		<img src="${pageContext.request.contextPath}/resources/imgs/CommonImages/pwdChk.png">
		                    	</div>
							</div>
							
	                    
						</form>
                    </div>
                </div>                
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