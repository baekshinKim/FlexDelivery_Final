<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/loginTop.jsp" %>


<body>

<!-- Admin Login Form start -->
<div class="blog-wrapper clearfix" style="background-color: white;">
	<div class="container" style="padding-top: 35px; padding-bottom: 35px;" >
		<form name="frmAdminLogin" id="frmAdminLogin" action="<c:url value='/login.do' />" method="post">
			<div class="row justify-content-center">
				<div class="col-12 col-lg-3 col-md-4 col-sm-6 mb-20">
					<div class="mt-70">
					    <div class="group">
					        <input type="text" name="userid" id="adminId" required>
					        <span class="highlight"></span>
					        <span class="bar"></span>
					        <label>id</label>
					    </div>
					</div>
					<div>
						<div class="group">
						    <input type="password" name="pwd" id="adminPwd" required>
						    <span class="highlight"></span>
						    <span class="bar"></span>
						    <label>pwd</label>
						</div>
					</div>
	
					<div class="col-12" style="text-align: center;">
						<input type="hidden" name="idx" value="3">
					     <button type="submit" class="btn original-btn">로그인</button>
					</div>
				</div>
			</div>
		</form>
	</div>       	
</div>
<!-- Admin Login Form end -->
</body>
<%@ include file="../../adminInc/bottom.jsp" %>
                        