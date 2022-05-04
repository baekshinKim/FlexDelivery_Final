
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<br>
<div class="row mt-3">
	<div class="col-md-2 col-sm-12"></div>
	<div class="col-md-9 col-sm-12">
		<div class="text-right">
			<button id="btAll" class="btn" style="color:black; background-color:#fcbe32; border: none;">사용중인 쿠폰</button>
			<button id="btExpire" class="btn btn-outline-warning"style="color:black; border:1px solid #fcbe32;">쿠폰 발급 내역</button>
			<button id="btRegi" class="btn" style="color:black; background-color:#fcbe32; border: none; ">쿠폰 신청</button>
		</div>
	</div>
</div>
<br>
<div class="row" id="table-hover-row">
	<div class="col-md-1  col-sm-12"></div>
	<div class="col-md-10 col-12">
		<div class="card">
			<br><br><br>
			<div class="card-content">
				<div class="card-body">
					<p class="card-text text-center"style="font-size:30px; color:#333; font-weight:bold;">쿠폰 발급 내역</p>
					<p class="card-text text-center">전체 발급되었던 쿠폰 내역입니다.</p>
					<br> <br> 
					<form name="frmPage" method="post" name="frm1"action="<c:url value='/owner/menu2/couponused/couponExpireSearch.do'/>">
						<div class="row">
						<div class="col-md-6 col-12"></div>
							<div class="col-md-5 col-12 ">
								<%@include file="../../../owner/datePicker/datePicker.jsp"%>
								<input type="hidden" name="currentPage" value="1">
							</div>
							<div class="col-md-1 col-12">
							<input type="submit"style="color:black; background-color:#fcbe32; border: none;" value="조회" id="searchDate">
						</div>
						<br> <br>
					</div>
				</form>
				<div class="col-md-4 col-12"></div>
				<div class="table-responsive delck">
					<table class="table table-hover mb-5 deltable">
						<colgroup>
							<col style="width: 15%" />
							<col style="width: 15%" />
							<col style="width: 15%" />
							<col style="width: 20%" />
							<col style="width: 20%" />
							<col style="width: 20%" />
						</colgroup>
						<thead>
							<tr class="text-center" style="background-color:#004e66; color:white;">
							<th scope="col">쿠폰 번호 </th>
								<th scope="col">최소 금액</th>
								<th scope="col">할인 금액</th>
								<th scope="col">시작일</th>
								<th scope="col">종료일</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<div class="AllList" id="AllList">
								<c:if test="${empty exList }">
									<tr>
										<td colspan="6" class="text-center">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty exList }">
									<c:forEach var="map" items="${exList}">
										<tr class="text-center">
											<td>${map['S_C_BOX_NO'] }</td>
											<td>${map['R_COUPON_MIN'] }</td>
											<td>${map['R_COUPON_DC'] }</td>
											<td>${map['S_C_START_DATE'] }</td>
											<td>${map['S_C_END_DATE'] }</td>
											<td><span class="badge bg-light">만료 </span></td>
										</tr>
									</c:forEach>
								</c:if>
							</div>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-sm-12"></div>
	</div>
</div>
</div>
<br> <br> <br>
	<script type="text/javascript">
	$(function(){
		$('#btRegi').click(function(){
			location.href='<c:url value="/owner/menu2/couponused/couponRegi.do"/>';
		});
		$('#btExpire').click(function(){
			location.href='<c:url value="/owner/menu2/couponused/couponExpire.do"/>';
		});
		$('#btAll').click(function(){
			location.href='<c:url value="/owner/menu2/couponused/couponUsed.do"/>';
		});
	});
	function pageFunc(curPage){
		$('form[name=frmDate]').find('input[name=currentPage]').val(curPage);	
		$('form[name=frmDate]').submit();
	}
	
</script>

	<%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>