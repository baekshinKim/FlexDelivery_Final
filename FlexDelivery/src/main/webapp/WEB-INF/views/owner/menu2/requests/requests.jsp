<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../../ownerInc/top.jsp"%>
<style>
input {
	border: 1px solid rgb(212, 212, 212);
	border-radius: 5px;
	height: 35px;
}

</style>
<br>
<div class="row" id="basic-table">
	<div class="col-md-2 col-sm-12"></div>
	<div class="col-12 col-md-8">
		<div class="card" style="margin-top: 70px;">
			<br>
			<div class="card-content">
				<div class="card-body">
					<p class="card-text text-center"  style="font-size:30px; color:#333; font-weight:bold;">요청 처리 현황</p>
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					<p class="card-text text-center">승인 대기 상태일 경우 상세보기에서 확인 후 취소하실 수 있습니다.</p>
					<br> <br>
					<div class="row">
						<div class="col-md-8 col-12"></div>
						<div class="col-md-4 col-sm-12"></div>
						<div class="col-md-4 col-sm-12"></div>
					</div>
					<div class="table-responsive mb-5">
						<table class="table">
							<thead>
								<tr class="text-center" style="background-color:#004e66; color:white;">
									<th style="width: 30%;">승인 목록</th>
									<th style="width: 22%;">신청 일자</th>
									<th style="width: 22%;">승인 상태</th>
									<th style="width: 22%;">상세 보기</th>
									<th style="width: 4%;" class="pl-3"></th>
								</tr>
					</thead>
					<tbody id="optionTable">
						<input type="hidden" id="ownerNo" name="ownerNo" value="${sessionScope.ownerNo}">
							<div class="tempDiv" id="tempDiv">
							<c:if test="${!empty selectTemp }">
								<c:forEach var="tempVo" items="${selectTemp }">
									<tr class="text-center">
										<td>점포 정보 변경 신청</td>
										<td>${fn:substring(tempVo['T_REGDATE'], 0,10) }</td>
										<td class="text-bold-500">
										<c:if test="${tempVo['A_AGREE_NO'] == 1 }">
												<span class="badge bg-light">승인대기</span>
											</c:if> 
											<c:if test="${tempVo['A_AGREE_NO'] == 2 }">
												<span class="badge bg-danger text-light">신청취소</span>
											</c:if> 
											<c:if test="${tempVo['A_AGREE_NO'] == 3 }">
												<span class="badge bg-success text-light">승인완료</span>
											</c:if> 
											<c:if test="${tempVo['A_AGREE_NO']  == 4 }">
												<span class="badge bg-danger text-light">승인반려</span>
											</c:if>
											<c:if test="${tempVo['A_AGREE_NO']  == 5 }">
												<span class="badge bg-danger text-light">변경대기</span>
											</c:if>
											<c:if test="${tempVo['A_AGREE_NO']  == 6 }">
												<span class="badge bg-success text-light">변경완료</span>
											</c:if>
											<c:if test="${tempVo['A_AGREE_NO']  == 7 }">
												<span class="badge bg-danger text-light">변경반려</span>
											</c:if>
											<c:if test="${tempVo['A_AGREE_NO']  == 8 }">
												<span class="badge bg-danger text-light">변경반려</span>
											</c:if>
											</td>
										<td class="p-3">
											<button class="buttons badge bg-dark text-light" onclick="gotempVo(${tempVo['T_NO']})">상세 보기</button></td>
										<td></td>
									</tr>
								</c:forEach>
							</c:if>
							</div>
							<div class="advertise" id="advertise">
								<c:if test="${!empty selectAd }">
									<c:forEach var="adVo" items="${selectAd }">
										<tr class="text-center">
											<td>광고 신청 내역 </td>
											<td>${fn:substring(adVo['STOREAD_REGDATE'] , 0,10) }</td>
											<td class="text-bold-500">
												<c:if test="${adVo['AD_PAY_FLAG'] == 'N' }">
													<span class="badge bg-light">승인대기</span>
												</c:if> 
												<c:if test="${adVo['AD_PAY_FLAG'] == 'Y' }">
													<span class="badge bg-success text-light">승인완료</span>
												</c:if></td>
											<td class="p-3">
												<button class="buttons badge bg-dark text-light" onclick="goAD(${adVo['STOREAD_NO']})">상세 보기</button></td>
											<td></td>
										</tr>
									</c:forEach>
								</c:if>
								</div>
								<div class="store" id="store">
								<c:if test="${!empty selectStore }">
									<c:forEach var="stVo" items="${selectStore }">
										<tr class="text-center">
											<td>입점 등록 신청</td>
											<td>${fn:substring(stVo['STORE_REGDATE'] , 0,10) }</td>
											<td class="text-bold-500">
												<c:if test="${stVo['A_AGREE_NO'] == 1 }">
													<span class="badge bg-light">승인대기</span>
												</c:if>
												 <c:if test="${stVo['A_AGREE_NO']== 2 }">
													<span class="badge bg-danger text-light">신청취소</span>
												</c:if>
												 <c:if test="${stVo['A_AGREE_NO']== 3 }">
													<span class="badge bg-success text-light">승인완료</span>
												</c:if> 
												<c:if test="${stVo['A_AGREE_NO'] == 4 }">
													<span class="badge bg-danger text-light">승인반려</span>
												</c:if></td>
											<td class="p-3">
												<button class="buttons badge bg-dark text-light" onclick="goStores(${stVo['STORE_NO']})">상세 보기</button></td>
											<td></td>
										</tr>
									</c:forEach>
								</c:if>
								</div>
								<div class="register">
								<c:if test="${!empty RegiList }">
									<c:forEach var="regiVo" items="${RegiList }">
										<tr class="text-center">
											<td>사업자 등록 신청</td>
											<td>${fn:substring(regiVo['OWNERREGISTER_REGDATE'] , 0,10) }</td>
											<td class="text-bold-500">
												<c:if test="${regiVo['A_AGREE_NO'] == 1 }">
													<span class="badge bg-light">승인대기</span>
												</c:if>
												 <c:if test="${regiVo['A_AGREE_NO']== 2 }">
													<span class="badge bg-danger text-light">신청취소</span>
												</c:if>
												 <c:if test="${regiVo['A_AGREE_NO']== 3 }">
													<span class="badge bg-success text-light">승인완료</span>
												</c:if>
												 <c:if test="${regiVo['A_AGREE_NO'] == 4 }">
													<span class="badge bg-danger text-light">승인반려</span>
												</c:if></td>
											<td class="p-3">
												<button class="buttons badge bg-dark text-light" onclick="goDetail(${regiVo['O_REGISTER_NO']})">상세 보기</button></td>
											<td></td>
											</tr>
										</c:forEach>
									</c:if>
								</div>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-2 col-sm-12"></div>
</div>
<br>
<br>
<script type="text/javascript">

function goDetail(no){
	var windowW = 500;  // 창의 가로 길이
    var windowH = 500;  // 창의 세로 길이
    var left = Math.ceil((window.screen.width - windowW)/2);
    var top = Math.ceil((window.screen.height - windowH)/2);
    
   
$(function(){
  var url="<c:url value='/owner/menu2/requests/tempRegi.do?no='/>"+no;
  
	window.open(url,"승인 목록 상세 정보","l top="+top+", left="+left+", height="+windowH+", width="+windowW,"scroll-x="+no);
	event.preventDefault();
	
});
}//detail
function goStores(no){
	var windowW = 500;  // 창의 가로 길이
    var windowH = 600;  // 창의 세로 길이
    var left = Math.ceil((window.screen.width - windowW)/2);
    var top = Math.ceil((window.screen.height - windowH)/2);
    
    // 정상 작동이프 제거하면 됨 
$(function(){
  	  var url="<c:url value='/owner/menu2/requests/Store.do?no='/>"+no;
	window.open(url,"승인 목록 상세 정보","l top="+top+", left="+left+", height="+windowH+", width="+windowW,"scroll-x="+no);
	event.preventDefault();
	
});
}//detail

function gotempVo(no){
	var windowW = 500;  // 창의 가로 길이
    var windowH = 500;  // 창의 세로 길이
    var left = Math.ceil((window.screen.width - windowW)/2);
    var top = Math.ceil((window.screen.height - windowH)/2);
    
    // 정상 작동이프 제거하면 됨 
$(function(){
  	  var url="<c:url value='/owner/menu2/requests/tempStore.do?no='/>"+no;
	window.open(url,"승인 목록 상세 정보","l top="+top+", left="+left+", height="+windowH+", width="+windowW,"scroll-x="+no);
	event.preventDefault();
	
});
}//detail

function goAD(no){
	var windowW = 500;  // 창의 가로 길이
    var windowH = 400;  // 창의 세로 길이
    var left = Math.ceil((window.screen.width - windowW)/2);
    var top = Math.ceil((window.screen.height - windowH)/2);
    
    // 정상 작동이프 제거하면 됨 
$(function(){
  	  var url="<c:url value='/owner/menu2/requests/tempAD.do?no='/>"+no;
	window.open(url,"승인 목록 상세 정보","l top="+top+", left="+left+", height="+windowH+", width="+windowW,"scroll-x="+no);
	event.preventDefault();
	
});
}//detail
//result 에 따라서 hide show하고 싶은데 안돼여 ㅡㅡ help ! 
$(function(){
	
		$('#choice').on('change',function(){
			var result=$('select[name=choice]').val();
			alert(result);
			if(result==1){
			$.ajax({
				url:"<c:url value='/owner/menu2/requests/selectRegi.do'/>",
				type:"GET",
				data: "ownerNo="+$('#ownerNo').val(), 
				dataType:"json",
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success:function(res){
					//alert(res);
					$('.store').replaceWith('');
					},
					error:function(xhr, status, error){
						alert("error! : " + error);
					}				
				});//ajax
			}else if(result==0){
				$.ajax({
					url:"<c:url value='/owner/menu2/requests/requests.do'/>",
					type:"POST",
					data: "ownerNo="+$('#ownerNo').val(), 
					dataType:"json",
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success:function(res){
						alert(res);
						//$('#store').empty();
						},
						error:function(xhr, status, error){
							alert("error! : " + error);
						}				
					});//ajax
			}
		});
});
	
</script>
<%@include file="../../../ownerInc/bottom.jsp"%>

