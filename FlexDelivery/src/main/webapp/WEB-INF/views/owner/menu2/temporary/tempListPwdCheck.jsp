<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FLEX한 사장님을 위한 내 점포 사이트</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<script src="${pageContext.request.contextPath}/resources/ownerResources/herbJs/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
				 var success=1;
				 var fail = 3;

				var YorN = ${YorN};
				 
				 if(success==YorN) {
					 window.opener.location.href="${pageContext.request.contextPath}/owner/menu2/temporary/tempList.do";
					self.close();
				} else if(fail==YorN){
					alert("비밀번호가 틀렸습니다.");
					$('input[type=password]').focus();
				}
		});
	  	
	    $(function(){
			$('#button-addon1').click(function(){
				if($('input[type=password]').val().length<1){
					alert('비밀번호를 입력하세요');
					$('input[type=password]').focus();
					event.preventDefault();
				} else{
					$('form[name=frm1]').submit();
				} 
					
			});
		});
	
	    function bt_cancle(no){
			if(confirm('취소하시겠습니까?')){
				
				var type="";
				
				if($('.buttons').attr('id')=='btStores'){
					type="stores";
				}else if($('.buttons').attr('id')=='btAd'){
					type="adver";				
				}else if($('.buttons').attr('id')=='btRegi'){
					type="btRegi";
				}
				location.href = "<c:url value='/owner/menu2/tempDelete.do?mode="+type+"&no='/>"+no;
			} else {
				event.preventDefault();
			}
		}
	    
	</script>
</head>
<body style="overflow-x: hidden;">
	<br>
	<br>
	<section id="basic-vertical-layouts">
		<div class="row match-height">
			<div class="col-md-3 col-sm-12"></div>
			<div class="col-md-6 col-sm-12">
				<div class="card">
					<div class="card-header" style="background-color: white;">
						<h4 class="card-title">비밀번호를 입력하시면 삭제됩니다.</h4>
					</div>
					<div class="card-content">
						<div class="card-body">
							<form class="form form-vertical" method="post" action="<c:url value='/owner/menu2/temporary/tempListDelete.do'/>" name="frm1">
								<input type="text" id="type" name="type" value="${param.type }">
								<input type="text" id="no" name="no" value="${param.no }">
								<div class="form-body">
									<div class="row">
										<div class="col-12">
											<div class="form-group">
												<div class="input-group mb-4">
													<input type="password" class="form-control" aria-label="Example text with button addon" aria-describedby="button-addon1" name="ownerPwd">
													<div class="col-12 d-flex mt-3 justify-content-center">
														<button class="btn btn-primary btAdPwdCheck"
															id="button-addon1">확인</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-12"></div>
		</div>
	</section>
<!--  -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/chartjs/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/pages/dashboard.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!--  -->
</body>
</html>
