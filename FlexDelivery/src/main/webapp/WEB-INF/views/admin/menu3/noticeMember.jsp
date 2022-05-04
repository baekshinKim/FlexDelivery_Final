<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/top.jsp" %>

<script>
$(function(){
	$('#btWrite').click(function(){
		location.href="${pageContext.request.contextPath}/admin/menu3/notice/write.do";
	});
});
</script>

<!-- css start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<!-- css end -->

	<div class="container">
    	<div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">공지사항</h4>
                        <hr>
                    </div>
                    <div class="card-content">
	                    <div class="card-body" style="text-align: right;">
			                <button type="button" class="btn btn-dark round block" id="btWrite">
						     글쓰기
							</button>    
					  </div>
	                    <div class="card-body">
	                    	<c:if test="${empty list }">
		                        <table class="table">
		                        	<tr style="text-align: center;">
		                        		<th><h5>등록된 공지사항이 없습니다.</h5></th>
	                        		</tr>
		                        </table>                    		
	                    	</c:if>
	                    	<c:if test="${!empty list }">
		                        <table class="table table-hover mb-0">
									<thead>
									    <tr style="text-align: center; background-color: black; color: white;"> 
									      <th style="width: 15%;">번호(rn)</th>
									      <th style="width: 15%;">번호(no)</th>
									      <th>글제목</th>
									      <th style="width: 20%;">등록일</th>
									    </tr>
									</thead>
	                    			<c:forEach var="vo" items="${list}" varStatus="status">
										<tbody>
										    <tr>
			                                     <td style="text-align: center;">${vo.RN }</td>
			                                     <td style="text-align: center;">${vo.BOARD_NO }</td>
			                                     <td><a href="<c:url value='/admin/menu3/notice/detailMember.do?no=${vo.BOARD_NO }'/>">${vo.BOARD_TITLE }</a></td>
			                                     <td style="text-align: center;">${vo.BOARD_REGDATE }</td>
			                                </tr>
										</tbody>
		                    		</c:forEach>
								</table>
								<br><br>
	                    	</c:if>
	                    </div>
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

<%@ include file="../../adminInc/bottom.jsp" %>
