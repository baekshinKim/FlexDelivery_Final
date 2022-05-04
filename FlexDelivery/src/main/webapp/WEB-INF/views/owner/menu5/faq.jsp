<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../ownerInc/top.jsp"%>
<style>
.page-item.active .page-link {
	background-color: #007bff;
	border-color: #007bff;
}

button.btn.btn-link {
	color: #333;
	text-decoration: none;
}

.dropdown-item {
	color: black;
	text-decoration: none;
}

#noticeSearch {
	background-color: #007bff;
	border-radius: 2px;
	width: 55px;
}
button.shadow-none.btn.btn-block.d-flex.justify-content-between.card-btn.collapsed.p-3 {
    background: white;
}
</style>
<br>
<br>
<br>
<div class="row">
	<div class="col-12 col-md-2"></div>
	<div class="col-12 col-md-8 text-center">
		<h3>자주하는 질문</h3>
	</div>
	<div class="col-12 col-md-2"></div>
	<!-- 페이지 이동시 필요한 form -->
	<form name="frmPage" method="post" style="float: right;" action="<c:url value='/owner/menu5/faq.do'/>">
		<input type="hidden" name="currentPage"> 
		<input type="hidden" name="fCategoryNo" value="${param.fCategoryNo }">
	</form>
	<div class="col-12 col-md-2"></div>
	<div class="col-12 col-md-8 text-right">
		<form name="frmSearch" method="post" action="<c:url value='/owner/menu5/faqDetail.do'/>">
			<input type="hidden" value="${cgVo.fCategoryNo}">
			<div class="row">
				<div class="col-md-9 col-12"></div>
				<div class="col-md-3 col-sm-12">
					<select class="form-control input-lg groupChoice p-2" name="fCategoryNo"
						id="fCategoryNo" style="overflow: auto;">
						<option class="m-3 text-center" style="font-size: 17px;" selected value="0">카테고리 선택 </option>
						<c:forEach var="cgVo" items="${cgList }">
							<option value="${cgVo.fCategoryNo}" <c:if test="${cgVo.fCategoryNo == param.fCategoryNo}"> selected="selected"</c:if>>${cgVo.fCategoryName }</option>
						</c:forEach>
					</select> <br>
				</div>
				<div class="col-md-4 col-sm-12"></div>
			</div>
		</form>
	</div>
	<div class="col-12 col-md-2"></div>
	<br> <br>
	<div class="col-12 col-md-2"></div>
	<div class="col-12 col-md-8">
		<table class="table table">
			<thead>
				<tr class="text-center">
					<th scope="col" style="width: 5%;">번호</th>
					<th scope="col" style="width: 20%;">카테고리</th>
					<th scope="col" style="width: 75%;">제목</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
					<tr class="text-center">
						<th colspan="3">해당하는 질문이 없습니다.</th>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="vo" items="${list}">
						<div class="bg-white mb-2 rounded shadow-sm overflow-hidden">
							<div id="accountHeading${vo.faqNo }">
								<tr class="text-center">
									<th scope="row">
										<div style="display: block; padding: 10px;">${vo.faqNo }</div>
									</th>
									<td class="">
										<div style="display: block; padding: 10px;">${vo.fCategoryName }</div>
									</td>
									<td class="text-left">
										<button style="border: none;"
											class="shadow-none btn btn-block d-flex justify-content-between card-btn collapsed p-3"
											data-toggle="collapse"
											data-target="#accountCollapse${vo.faqNo}"
											aria-expanded="false"
											aria-controls="accountCollapse${vo.faqNo}">${vo.faqQ}
											<span class="card-btn-arrow"> <span
												class="feather-chevron-down"> </span>
											</span>
										</button>
									</td>
								</tr>
							</div>
							<tr class="text-center">
								<th scope="row"></th>
								<td></td>
								<td class="text-left">
									<div id="accountCollapse${vo.faqNo}" class="collapse"
										aria-labelledby="accountHeading${vo.faqNo}"
										data-parent="#Accordion">
										<div class="card-body  text-muted">${vo.faqA }</div>
									</div>
								</td>
							</tr>
						</div>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div class="col-12 col-md-2"></div>
</div>
<div class="card-body">
	<nav aria-label="Page navigation example">
		<ul class="pagination pagination-primary justify-content-center">
			<c:if test="${pagingInfo.firstPage>1 }">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous" onclick="pageFunc(${pagingInfo.firstPage-1})">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<c:forEach var="i" begin="${pagingInfo.firstPage}"
				end="${pagingInfo.lastPage}">
				<c:if test="${i==pagingInfo.currentPage }">
					<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<li class="page-item"><a class="page-link" href="#"
						onclick="pageFunc(${i})">${i}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous" onclick="pageFunc(${pagingInfo.lastPage+1})">
						<span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
</div>
<br>
<br>
<br>
<script type="text/javascript">
	function pageFunc(curPage){
		var num=$('input[name=fCategoryNo]').val();
		if(num == null || num== 0 ){
			$('form[name=frmPage]').find('input[name=fCategoryNo]').val(0);	
		}
		$('form[name=frmPage]').find('input[name=currentPage]').val(curPage);	
		$('form[name=frmPage]').submit();
	}
	
$(function(){
	$('#collapseTwo').hide();
	$('#cgName').on('click',function(idx,item){
		$('#collapseTwo').child().show();
	});
	
	$('#fCategoryNo').change(function(){
		$('form[name=frmSearch]').submit();
	});
});
</script>
<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->
<%@ include file="../../ownerInc/bottom.jsp"%>
