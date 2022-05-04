<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<!-- CSS start -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/oneToOne.css" />
<!-- CSS end -->

<div class="container">
	<div class="row">
		<div class="main-content container-fluid">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>나의 신청 내역</h3>
						<p class="text-subtitle text-muted">승인 신청 목록입니다.</p>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="card">
					<div class="card-header">
						<!--  -->
						${tempList }
					</div>
					<div class="card-body">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#asd">승인 신청 목록 <span class="badge bg-transparent">3</span></a></li>
						</ul>
						<div class="tab-pane fade show active" id="asd">
							<br>
							<!-- Hoverable rows start -->
							<div class="row" id="table-hover-row">
								<div class="col-12">
									<div class="card">
										<div class="card-content">
											<!-- table hover -->
											<div class="table-responsive">
												<table class="table table-hover mb-0">
													<thead>
														<tr>
															<th>번호</th>
															<th colspan="3">신청서 종류</th>
															<th></th>
															<th>신청 일시</th>
															<th>상태</th>
															<th>취소하기</th>
														</tr>
													</thead>
													<tbody>
														<!-- 반복문 시작 -->
														<c:if test="${empty tempList }">
															<tr class="align_center">
																<td colspan="4">신청 내역이 없습니다.</td>
															</tr>
															</c:if>

														<c:if test="${!empty tempList }">
															<!--반복 시작 -->
															<c:forEach var="map" items="${tempList }">
																<c:set var="i" value="${i+1 }" />
															<!-- 사업자 등록증 신청  -->
																	<c:if test="${!empty map['O_REGISTER_NO']}">
																	<tr>
																		<td class="text-bold-500">1</td>
																		<td colspan="3"><a href=""id="register">사업자등록 신청 ${map['RAGREENO']}</a></td>
																		<td></td>
																		<td><fmt:formatDate value="${map['OWNERREGISTER_REGDATE'] }" pattern="yyyy-MM-dd" /></td>
																		<td><c:if test="${map['RAGREENO'] == 1 }">
																		<span class="badge bg-light">승인대기</span>
																	</c:if>
																	 <c:if test="${map['RAGREENO'] == 2 }">
																		<span class="badge bg-danger">신청취소</span>
																	</c:if> 
																	<c:if test="${map['RAGREENO'] == 3 }">
																		<span class="badge bg-success">승인완료</span>
																	</c:if> 
																	<c:if test="${map['RAGREENO'] == 4 }">
																		<span class="badge bg-danger">승인반려</span>
																	</c:if></td>
																<td>
																<c:if test="${map['RAGREENO'] == 1 }">
																<button class="buttons badge bg-dark" name="buttons"
																	id="btRegi" onclick="bt_cancle(${map['O_REGISTER_NO'] })">cancle</button>
																	</c:if>
																</td>
															</tr>
														</c:if>
																
																<!-- 입점 신청  -->
															<c:if test="${!empty map['STORE_NO'] &&  !empty map['OWNERREGISTER_REGDATE'] && empty map['STOREAD_REGDATE']}">
																<tr>
																	<td class="text-bold-500">2</td>
																	<td colspan="3">
																	<a onclick="goDetail(${map['STORE_NO']})" href="#">
																	입점 신청 ${map['SAGREENO']}</a></td>
																	<td></td>
																	<td><fmt:formatDate value="${map['STORE_REGDATE'] }" pattern="yyyy-MM-dd" /></td>
																	<td>
																		<c:if test="${map['SAGREENO'] == 1}">
																			<span class="badge bg-light">승인대기</span>
																		</c:if> 
																		<c:if test="${ map['SAGREENO'] == 2}">
																			<span class="badge bg-danger">신청취소</span>
																		</c:if>
																		 <c:if test="${ map['SAGREENO'] == 3 }">
																			<span class="badge bg-success">승인완료</span>
																		</c:if> 
																		<c:if test="${ map['SAGREENO'] == 4 }">
																			<span class="badge bg-danger">승인반려</span>
																		</c:if>
																	</td>
																		<td>
																		<c:if test="${map['SAGREENO'] == 1}">
																			<a href="#" class="buttons badge bg-dark" id="btStores" name="buttons" onclick="bt_cancle(${map['STORE_NO'] })">cancle</a>
																		</c:if>
																	</td>
																</tr>
															</c:if>
													<!-- 광고 신청  -->
														<c:if test="${map['SAGREENO'] == 3 &&  map['RAGREENO'] == 3 && !empty map['STOREAD_NO']}">
															<tr>
																<td class="text-bold-500">3</td>
																<td colspan="3"><a href="<c:url value='owner/menu2/temporary/tempAD.do'/>">광고 신청</a></td>
																<td></td>
																<td><fmt:formatDate value="${map['STOREAD_REGDATE'] }" pattern="yyyy-MM-dd" /></td>
																<td>																
																<c:if test="${map['AD_PAY_FLAG'] == 'N'}">
																			<span class="badge bg-light">승인대기</span>
																</td>
																<td><button class="buttons badge bg-dark" name="buttons"
																	id="btAd" onclick="bt_cancle(${map['STOREAD_NO'] })">cancle</button></td>
																</c:if> 
																	<c:if test="${map['AD_PAY_FLAG'] == 'Y'}">
																	<td>
																	<span class="badge bg-success">승인완료</span>
																	</td>
																	<td></td>
															</tr>
													</c:if>
																<!--  -->	
													</c:if>
													</c:forEach>
													</c:if>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>
<c:url value='owner/menu2/temporary/tempStores.do?storeNo='/>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/memberResources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
 function bt_cancle(no){
	 var type=$(this).attr('id');
	 alert('type='+type);
	 window.screen.width //현재 윈도우창의 가로크기를 가져옴
		window.screen.height //세로크기 가져옴
		
		var popupWidth = 500; //띄울 창 가로크기
		var popupHeight = 300;
		
		var popupX = (window.screen.width / 2) - (popupWidth /2);
		var popupY = (window.screen.height / 2) - (popupHeight /2);
		
		window.open(
			"${pageContext.request.contextPath}/owner/menu2/temporary/tempListPwdCheck.do?no="+no+"type="+type, 
			"pwdCheck", 
			'toolbar=no, menubar=no, height='+popupHeight+', width='+ popupWidth +', left='+popupX+', top='+popupY);
 }
	
/*
function goDetail(no){
	var windowW = 500;  // 창의 가로 길이
    var windowH = 700;  // 창의 세로 길이
    var left = Math.ceil((window.screen.width - windowW)/2);
    var top = Math.ceil((window.screen.height - windowH)/2);
    
  
    var url="${pageContext.request.contextPath}/owner/menu2/temporary/tempDetail.do?ownerNo="+no;
    
	window.open(url,"승인 목록 상세 정보","l top="+top+", left="+left+", height="+windowH+", width="+windowW,"scroll-x="+no);
	event.preventDefault();
}

 * 
 */
/*
// 유형을 누르면 모달 창 
	$(function(){
	$('#register').click(function(){
				$.ajax({
					url:"<c:url value='owner/menu2/temporary/templicense.do'/>",
					data:"sMGroupNo=" + $('.groupChoice').val() +"&menuNo="+$('.menuSelect').val(), 
					dataType:"json",
					type:"GET",
					success:function(res){
						//alert(res);
						//alert(res.length);
						
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
								str2+="<option value='"+item.oRankNo+"'>"+item.oRankName+"</option><br>";
							});
							
							$('.menuOptionSelect').html(str2);
						} 
					},
					error:function(xhr, status, error){
						alert("error!! : " + error);
					}
				});
				event.preventDefault();
	});
});
*/
</script>
<!-- script start -->
<script
	src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->
<%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>