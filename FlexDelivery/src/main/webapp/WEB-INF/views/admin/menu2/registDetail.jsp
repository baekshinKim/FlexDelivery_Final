<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInc/top.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<!-- <script src="${pageContext.request.contextPath}/resources/memberResources/js/jquery/jquery-3.5.1.min.js"></script> -->
<script type="text/javascript">
	$(function () {
		$('#approvalAgree').click(function () {
			alert("변경하시겠습니까?");
			location.href = '<c:url value="/admin/menu2/registApproval.do?registerNo=${vo.oRegisterNo}&ownerNo=${vo.ownerNo}" />';
			event.preventDefault();
		});
		
		$('#approvalDeny').click(function () {
			alert("반려하시겠습니까?");
			location.href = '<c:url value="/admin/menu2/registDeny.do?registerNo=${vo.oRegisterNo}" />';
			event.preventDefault();
		});
			
	
	});
</script>
<!-- main start -->

<div class="main-content container" style="width: 75%">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>점포 등록 세부 조회</h3>
                <p class="text-subtitle text-muted">점포 승인 요청과 관련된 세부 내역입니다.</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/index.do'/> ">Main</a></li>
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/menu2/approvalList.do'/> ">사업자등록증 등록 관리</a></li>
                        <li class="breadcrumb-item active" aria-current="page">사업자등록증 등록 세부 조회</li>
                    </ol>
                </nav>
            </div>
        </div>

    </div>

    <!-- // Basic multiple Column Form section start -->
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title" >승인 요청 내역</h4>
                        <h4 class="card-title" ><p>[점주번호 : ${vo.ownerNo},&nbsp &nbsp &nbsp 최종처리일자: 
                        	<fmt:formatDate value="${vo.ownerregisterRegdate}" pattern="yyyy년 MM월 dd일"/> ]</p></h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="lisence-no-column" >사업자 등록 번호</label>
                                            <input type="text" id="lisence-no-column" class="form-control" value="${vo.oRegisterNo }"
                                                name="lisence-no-column" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="owner-name-column">점포주 성함</label>
                                            <input type="text" id="owner-name-column" class="form-control" value="${vo.ownerName }"
                                                name="Oname-column" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="phone-number">연락처</label>
                                            <input type="text" id="phone-number" class="form-control" name="phone-number"
                                                value="${vo.ownerHp1}-${vo.ownerHp2}-${vo.ownerHp3}" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="ownerRegdate">점포주 등록일</label>
                                            <input type="text" id="ownerRegdate" class="form-control" 
                                            	value="<fmt:formatDate value="${vo.ownerRegdate}" pattern="yyyy년 MM월 dd일"/>" 
                                            	name="ownerRegdate" disabled="disabled" >
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="ownerAuth">점포주 현황</label>
                                            <input type="text" id="ownerAuth" class="form-control" name="ownerAuth" 
                                            	<c:if test="${vo.authorityNo == 4}">
                                                	value="점포미소유" disabled="disabled"
                                                </c:if>
                                                <c:if test="${vo.authorityNo == 5}">
                                                	value="점포소유" disabled="disabled"
                                                </c:if>
                                             >
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                        	<label for="appendix-file2">첨부파일</label>
												<div>								
													<span>
														<c:if test="${!empty vo.oRegisterFilename }">
															<a href
		="<c:url value='/admin/menu2/downloadEdit.do?no=${vo.oRegisterNo}&fileName=${vo.oRegisterFilename }'/>">
															 ${vo.oRegisterOriginalFilename }</a>
														</c:if>
													</span>
												</div>                                   
                                        </div>
                                    </div>
                                    <div class="col-12 d-flex justify-content-end">
                                    	<c:if test="${vo.aAgreeNo == 1}">
                                        	<button id="approvalAgree"  class="btn btn-primary mr-1 mb-1">승인</button>
                                        	<button id="approvalDeny"  class="btn btn-danger mr-1 mb-1">반려</button>
                                        </c:if>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- // Basic multiple Column Form section end -->
</div>

<!-- main end -->

<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>   
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->
<%@ include file="../../adminInc/bottom.jsp" %>