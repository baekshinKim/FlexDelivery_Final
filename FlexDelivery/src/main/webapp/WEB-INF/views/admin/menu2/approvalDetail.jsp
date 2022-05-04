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
			alert("가입 등록하시겠습니까?");
			location.href = '<c:url value="/admin/menu2/approvalAgree.do?no=${vo.storeNo}" />';
			event.preventDefault();
		});
		
		$('#approvalDeny').click(function () {
			alert("가입 반려하시겠습니까?");
			location.href = '<c:url value="/admin/menu2/approvalDeny.do?no=${vo.storeNo}" />';
			event.preventDefault();
		});
		
		$('#outAgree').click(function () {
			alert("탈퇴 등록하시겠습니까?");
			location.href = '<c:url value="/admin/menu2/outAgree.do?no=${vo.storeNo}" />';
			event.preventDefault();
		});
		
		$('#outDeny').click(function () {
			alert("탈퇴 반려하시겠습니까?");
			location.href = '<c:url value="/admin/menu2/outDeny.do?no=${vo.storeNo}" />';
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
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/menu2/approvalList.do'/> ">점포 등록/변경 승인 관리</a></li>
                        <li class="breadcrumb-item active" aria-current="page">점포 등록 세부 조회</li>
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
                        <h4 class="card-title" ><p>[접수번호 : ${vo.storeNo},&nbsp &nbsp &nbsp 최종처리일자: 
                        	<fmt:formatDate value="${vo.storeRegdate}" pattern="yyyy년 MM월 dd일"/> ]</p></h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column" >사업자 번호</label>
                                            <input type="text" id="lisence-no-column" class="form-control" value="${vo.oRegisterNo }"
                                                name="fname-column" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="owner-name-column">대표자 성함</label>
                                            <input type="text" id="owner-name-column" class="form-control" value="${vo.ownerName }"
                                                name="Oname-column" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="shop-name">점포명</label>
                                            <input type="text" id="shop-name" class="form-control" value="${vo.storeName }" name="shop-name"
                                            	disabled="disabled" >
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="shop-address">점포 주소</label>
                                            <input type="text" id="shop-address" class="form-control" name="shop-address"
                                                value="${vo.storeAddress} ${vo.storeAddressDetail}" disabled="disabled">
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
                                            <label for="appendix-file">첨부파일</label>
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
                                    <!-- 요청사항 -->
                                    <br><br>                                    
                                    <div class="row">
           								<div class="col">
                							<div class="card">
                								<div class="card-header">
                        							승인 요청 사항 :
                   								</div>
                    							<div class="card-body">
                        							<div class="form-group with-title mb-3">
                            							<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" disabled="disabled" 
                            							 >${vo.storeContent}</textarea>
                            							<label>요청 내용</label>
                        							</div>
                    							</div>
                							</div>
            							</div>
        							</div>
                                    <!-- 요청사항 끝 -->
                                    <div class="col-12 d-flex justify-content-end">
                                    	<c:if test="${vo.aAgreeNo == 1}">
                                        	<button id="approvalAgree"  class="btn btn-primary mr-1 mb-1">가입승인</button>
                                        	<button id="approvalDeny"  class="btn btn-danger mr-1 mb-1">가입반려</button>
                                        </c:if>
                                        <c:if test="${vo.aAgreeNo == 8}">
                                        	<button id="outAgree"  class="btn btn-primary mr-1 mb-1">탈퇴승인</button>
                                        	<button id="outDeny"  class="btn btn-danger mr-1 mb-1">탈퇴반려</button>
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