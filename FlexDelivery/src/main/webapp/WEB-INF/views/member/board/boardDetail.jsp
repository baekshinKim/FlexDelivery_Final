<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp" %>
<div class="d-none">
    <div class="bg-primary p-3 d-flex align-items-center">
        <a class="toggle togglew toggle-2" href="#"><span></span></a>
        <h4 class="font-weight-bold m-0 text-white">DETAIL</h4>
    </div>
</div>
<section class="py-4 osahan-main-body">
    <div class="container">
        <div class="row">
            <!-- <div class="col-md-3">
                <ul class="nav nav-tabsa custom-tabsa border-0 flex-column bg-white rounded overflow-hidden shadow-sm p-2 c-t-order" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link border-0 text-dark py-3 active" href="my_order.html">
                            <i class="feather-check mr-2 text-success mb-0"></i> Completed</a>
                    </li>
                    <li class="nav-item border-top" role="presentation">
                        <a class="nav-link border-0 text-dark py-3" href="my_order.html">
                            <i class="feather-clock mr-2 text-warning mb-0"></i> On Progress</a>
                    </li>
                    <li class="nav-item border-top" role="presentation">
                        <a class="nav-link border-0 text-dark py-3" href="my_order.html">
                            <i class="feather-x-circle mr-2 text-danger mb-0"></i> Canceled</a>
                    </li>
                </ul>
            </div> -->
            <div class="col-md-12">
                <!-- body -->
                <section class="bg-white osahan-main-body rounded shadow-sm overflow-hidden">
                    <div class="container p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="osahan-status">
                                    <!-- status complete -->
                                    <div class="p-3 border-bottom">
                                        <div class="p-2">
                                            <h6 class="font-weight-bold" style="text-align: center">${vo.boardTitle}</h6>
                                            <span class="m-0 small" style="float:right;">${vo.boardHead}</span>
                                        </div>
                                    </div>
                                    <div class="p-3 status-order border-bottom bg-white">
                                        <p class="small m-0" style="text-align: end"><i class="feather-calendar text-primary"></i>&nbsp;<fmt:formatDate value="${vo.boardRegdate}" pattern="yyyy-MM-dd HH:mm E요일"/></p>
                                    </div>
                                    <div class="p-3 border-bottom text-center">
                                        <img alt="#" src="
                                        <c:if test="${!empty vo.boardThumbnail }">
                                        	<c:url value='/resources/imgs/NoticeEventImages/${vo.boardThumbnail}'/>
                                        </c:if>
                                        <c:if test="${empty vo.boardThumbnail }">
                                        	<c:url value='/resources/imgs/NoticeEventImages/noticeDefault.jpg'/>
                                        </c:if>
                                        " 
                                        class="img-fluid mx-auto" style="inline-size:30em">
                                    </div>
                                    <!-- total price -->
                                    <!-- Destination -->
                                    <div class="p-3 border-bottom bg-white">
                                        <div class="d-flex align-items-center mb-2 justify-content-center">
                                            <h6 class="font-weight-bold mb-1">내용</h6>
                                        </div>
                                        <p class="m-0 small text-muted">${vo.boardContent}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
						<a href="<c:url value='/member/board/board.do' />" class="btn btn-lg btn-primary btn-block my-2">목록으로<i class="feather-arrow-right"></i></a> 
                    </div>
                </section>
            </div>
        </div>
    </div>
</section>
<%@include file="../../memInc/bottom.jsp" %>