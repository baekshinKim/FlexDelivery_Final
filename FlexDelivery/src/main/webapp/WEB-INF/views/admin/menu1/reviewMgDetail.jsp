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
		$('#reviewAgree').click(function () {
			alert("삭제 처리 하시겠습니까?");
			location.href = '<c:url value="/admin/menu1/reviewMgAgree.do?no=${vo.reviewNo}" />';
			event.preventDefault();
		});
		
		$('#reviewDeny').click(function () {
			alert("반려하시겠습니까?");
			location.href = '<c:url value="/admin/menu1/reviewMgDeny.do?no=${vo.reviewNo}" />';
			event.preventDefault();
		});
	});
</script>
<!-- main start -->

<div class="main-content container" style="width: 75%">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>리뷰 신고 세부 조회</h3>
                <p class="text-subtitle text-muted">리뷰 신고 처리와 관련된 세부 내역입니다.</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/index.do'/> ">Main</a></li>
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/menu1/reviewMgList.do'/> ">리뷰 신고 목록</a></li>
                        <li class="breadcrumb-item active" aria-current="page">리뷰 신고 처리 세부 조회</li>
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
                        <h4 class="card-title" >리뷰 신고 내역</h4>
                        <h4 class="card-title" ><p>[접수번호 : ${vo.reviewNo},&nbsp &nbsp &nbsp 최종처리일자: 
                        	<fmt:formatDate value="${vo.reviewRegdate}" pattern="yyyy년 MM월 dd일"/> ]</p></h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="reviewWriter" >리뷰 작성자</label>
                                            <input type="text" id="reviewWriter" class="form-control" value="${vo.memberId }"
                                                name="reviewWriter" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="storeName">가맹점명</label>
                                            <input type="text" id="storeName" class="form-control" value="${vo.storeName }"
                                                name="storeName" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="shop-address">가맹점 주소</label>
                                            <input type="text" id="shop-address" class="form-control" name="shop-address"
                                                value="${vo.storeAddress} ${vo.storeAddressDetail}" disabled="disabled">
                                        </div>
                                    </div>                                    
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="appendix-file">첨부파일</label>
												<div>								
													<span>
														<c:if test="${!empty vo.reviewFilename }">
															<a href
		="<c:url value='/admin/menu1/downloadReview.do?no=${vo.reviewNo }&fileName=${vo.reviewFilename }'/>">
															 ${vo.reviewFilename }</a>
														</c:if>
													</span>
												</div>                                        
										</div>
                                    </div>
                                    <!-- 리뷰내용 -->
                                    <br><br>                                    
                                    <div class="row">
           								<div class="col">
                							<div class="card">
                								<div class="card-header">
                        							리뷰 내용 :
                   								</div>
                    							<div class="card-body">
                        							<div class="form-group with-title mb-3">
                            							<textarea class="form-control" id="reviewContent" rows="3" disabled="disabled" 
                            							 >${vo.reviewContent}</textarea>
                            							<label>리뷰 내용</label>
                        							</div>
                    							</div>
                							</div>
            							</div>
        							</div>
                                    <!-- 요청사항 끝 -->
                                    <div class="col-12 d-flex justify-content-end">
                                    	<c:if test="${vo.reviewDelFlag == 'N'}">
                                        	<button id="reviewAgree"  class="btn btn-primary mr-1 mb-1">삭제</button>
                                        	<button id="reviewDeny"  class="btn btn-danger mr-1 mb-1">신고반려</button>
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