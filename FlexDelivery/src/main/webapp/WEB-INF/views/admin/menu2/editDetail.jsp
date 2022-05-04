<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../adminInc/top.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<script type="text/javascript">
	$(function () {
		$('#editAgree').click(function () {
			alert("등록하시겠습니까?");
			location.href = '<c:url value="/admin/menu2/editAgree.do?no=${temporaryVo.tNo}" />';
			event.preventDefault();
		});
		
		$('#editDeny').click(function () {
			alert("반려하시겠습니까?");
			location.href = '<c:url value="/admin/menu2/editDeny.do?no=${temporaryVo.tNo}" />';
			event.preventDefault();
		});		
	
	});
</script>
<!-- main start -->
<div class="main-content container" >
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>점포 변경 세부 조회</h3>
                <p class="text-subtitle text-muted">점포 변경 요청과 관련된 세부 내역입니다.</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/main.do'/> ">Main</a></li>
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/menu2/approval.do'/> ">점포 등록/변경 승인 관리</a></li>
                        <li class="breadcrumb-item active" aria-current="page">점포 변경 세부 조회</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>

    <!-- // Basic multiple Column Form section start -->
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title" >변경 요청 내역</h4>
                        <h4 class="card-title" ><p>[변경접수번호 : ${temporaryVo.tNo }, &nbsp &nbsp &nbsp 최종처리일자: 
                        	<fmt:formatDate value="${temporaryVo.tRegdate}" pattern="yyyy년 MM월 dd일"/> ]</p></h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form id="editFrm" name="editFrm" class="form" method="post" action="<c:url value='/admin/menu2/editAgree.do'/>" >
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="lisence-no-column1" >사업자 번호</label>
                                            <input type="text" id="lisence-no-column1" class="form-control" value="${temporaryVo.oRegisterNo }"
                                                name="fname-column" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="owner-name-column1">대표자 성함</label>
                                            <input type="text" id="owner-name-column1" class="form-control" value="${temporaryVo.tOwnerName }"
                                                name="Oname-column" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="shop-name1">점포명</label>
                                            <input type="text" id="shop-name1" class="form-control" value="${temporaryVo.tStoresName }" 
                                            	name="shop-name" disabled="disabled" >
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="shop-address1">점포 주소</label>
                                            <input type="text" id="shop-address1" class="form-control" name="shop-address"
                                                value="${temporaryVo.tStoresAddress} ${temporaryVo.tStoresAddressDetail}" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="phone-number1">연락처</label>
                                            <input type="text" id="phone-number1" class="form-control" name="phone-number"
                                                value="${temporaryVo.tOwnerHp1}-${temporaryVo.tOwnerHp2}-${temporaryVo.tOwnerHp3}" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                        	<label for="appendix-file2">첨부파일</label>
												<div>								
													<span>
														<c:if test="${!empty temporaryVo.tFilename }">
															<a href
		="<c:url value='/admin/menu2/downloadEdit.do?no=${temporaryVo.tNo}&fileName=${temporaryVo.tFilename }'/>">
															 ${temporaryVo.tFilename }</a>
														</c:if>
													</span>
												</div>                                   
                                        </div>
                                    </div>
                                    <div>
                                    	<input type="hidden" name="storeNo" value="${temporaryVo.storeNo}">
                                    	<input type="hidden" name="storeNo" value="${temporaryVo.ownerNo}">
                                    </div>
                                    <br><br>
                                    <!-- 요청사항 -->
                                    <div class="row">
           								<div class="col">
                							<div class="card">
                								<div class="card-header">
                        							승인 요청 사항 :
                   								</div>
                    							<div class="card-body">
                        							<div class="form-group with-title mb-3">
                            							<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" disabled="disabled" 
                            							 >${temporaryVo.tDetail}</textarea>
                            							<label>요청 내용</label>
                        							</div>
                    							</div>
                							</div>
            							</div>
        							</div>
                                    <!-- 요청사항 끝 -->
                                    <c:if test="${temporaryVo.aAgreeNo==5 }">
                                    	<div class="col-12 d-flex justify-content-end">
                                        	<input type="submit" id="editAgree" class="btn btn-primary mr-1 mb-1" value="승인">
                                       		<button id="editDeny" class="btn btn-danger mr-1 mb-1">반려</button>
                                    	</div>
                                    </c:if>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title" >기존 등록 내역</h4>
                        <h4 class="card-title" ><p>[등록접수번호 : ${storeVo.storeNo},&nbsp &nbsp &nbsp 
                        	접수일자 : ${fn:substring(storeVo.storeRegdate,0,4)}년 ${fn:substring(storeVo.storeRegdate,5,7)}월 
                        				${fn:substring(storeVo.storeRegdate,8,10)}일]</p></h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="lisence-no-column2" >사업자 번호</label>
                                            <input type="text" id="lisence-no-column2" class="form-control" 
                                            	value="${storeVo.oRegisterNo}" name="fname-column" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="owner-name-column">대표자 성함</label>
                                            <input type="text" id="owner-name-column" class="form-control" value="${storeVo.ownerName}"
                                                name="Oname-column" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="shop-name">점포명</label>
                                            <input type="text" id="shop-name" class="form-control"  name="shop-name" 
                                           		value="${storeVo.storeName}" disabled="disabled" >
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="shop-address">점포 주소</label>
                                            <input type="text" id="shop-address" class="form-control" name="shop-address"
                                                value="${storeVo.storeAddress} ${storeVo.storeAddressDetail}" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="phone-number">연락처</label>
                                            <input type="text" id="phone-number" class="form-control" name="phone-number"
                                                value="${storeVo.ownerHp1}-${storeVo.ownerHp2}-${storeVo.ownerHp3}" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                        	<label for="appendix-file2">첨부파일</label>
												<div>								
													<span>
														<c:if test="${!empty temporaryVo.tOriginalFilename }">
															<a href
		="<c:url value='/admin/menu2/downloadEdit.do?no=${temporaryVo.tNo}&fileName=${temporaryVo.tOriginalFilename }'/>">
															 ${temporaryVo.tOriginalFilename }</a>
														</c:if>
													</span>
												</div>                                   
                                        </div>
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