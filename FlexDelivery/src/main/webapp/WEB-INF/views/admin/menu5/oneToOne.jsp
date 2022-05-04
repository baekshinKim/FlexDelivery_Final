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
			<div class="card">
				<div class="card-header" style="padding-bottom: 2px;">
					 <h3 class="section-title text-uppercase">1:1 문의내역 조회</h3>
					 <p class="text-subtitle text-muted">글번호, 제목, 아이디, 회원종류, 답변여부에 따른 정렬이 가능합니다.</p>
					 <hr>
				</div>
	    		<section class="section">
	       			<div class="card-header"></div>
		            <div class="card-body">
		                <table class='table table-striped' id="table1">
		                <c:if test="${empty list }">
		                	<tr>
		                		<td style="text-align: center;">작성된 1:1 문의글이 없습니다.</td>
		                	</tr>
		                </c:if>
		                <c:if test="${!empty list }">
		                    <thead>
		                        <tr style="background-color: black;color: white;">
		                            <th style="text-align: center;">글번호</th>
		                            <th style="text-align: center;">회원종류</th>
		                            <th style="width: 30%;text-align: center;">제목</th>
		                            <th style="text-align: center;">아이디</th>
		                            <th style="text-align: center;">답변여부</th>
		                            <th style="text-align: center;">등록일</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <c:forEach var="vo" items="${list}" varStatus="status">
		                        	<tr style="text-align: center;">
		                        		<td>${vo.askNo }</td>
		                        		<td>
		                        			<c:if test="${vo.authorityNo==1 }"><span class="badge" style="background-color: #DBC2D4;">회원</span></c:if>
		                        			<c:if test="${vo.authorityNo==4 }"><span class="badge" style="background-color: #B29EBA;">점포</span></c:if>
		                        			<c:if test="${vo.authorityNo==5 }"><span class="badge" style="background-color: #B29EBA;">점포</span></c:if>
		                        		</td>
		                        		<td style="text-align: left;"><a href="<c:url value='/admin/menu5/oneToOne/detail.do?no=${vo.askNo }'/>" style="text-decoration: none;color:grey; font-weight: 600;">${vo.askTitle }</a></td>
		                        		<td>${vo.askId }</td>
		                        		<td>
		                        			<c:if test="${vo.askReplyFlag=='Y' }"><span class="badge bg-success">답변완료</span></c:if>
		                        			<c:if test="${vo.askReplyFlag=='N' }"><span class="badge bg-danger">미답변</span></c:if>
		                        		</td>
		                        		<td>${vo.askRegdate }</td>
		                        	</tr>
		                        </c:forEach>
		                    </tbody>
       		                </c:if>
		                </table>
					</div>
				</section>
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