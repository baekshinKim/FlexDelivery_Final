<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp" %>       
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<div class="d-none">
    <div class="bg-primary border-bottom p-3 d-flex align-items-center">
        <a class="toggle togglew toggle-2" href="#"><span></span></a>
        <h4 class="font-weight-bold m-0 text-white">My Gift</h4>
    </div>
</div>
<section class="py-4 osahan-main-body">
    <div class="container">
        <div class="row">
            <div class="col-md-12 mb-3">
                <ul class="nav nav-tabsa custom-tabsa border-0 bg-white rounded justify-content-center nav-pills nav-fill overflow-hidden shadow-sm p-2 c-t-order" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link border-0 text-dark py-3 active" style="justify-content: center" id="completed-tab" data-toggle="tab" href="#completed" role="tab" aria-controls="completed" aria-selected="true">
                            <i class="feather-gift mr-2 text-success mb-0"></i>받은선물함</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link border-0 text-dark py-3" style="justify-content: center" id="progress-tab" data-toggle="tab" href="#progress" role="tab" aria-controls="progress" aria-selected="false">
                            <i class="feather-gift mr-2 text-danger mb-0"></i>보낸선물함</a>
                    </li>
                </ul>
            </div>
            <div class="tab-content col-md-12" id="myTabContent">
                <div class="tab-pane fade show active" id="completed" role="tabpanel" aria-labelledby="completed-tab">
                    <div class="order-body">
                    	<c:if test="${empty takeList}">
	              			<div class="pb-3 text-center col-md-12 col-12">
	                 			<div class="p-3 rounded shadow-sm bg-white">
	                 				<img alt="" class="img-fluid" style="inline-size:45em;" src="<c:url value='/resources/imgs/noListDefault.png'/>" >
	                 			</div>
	                 		</div>
              			</c:if>
                    	<c:if test="${!empty takeList}">
                    		<div class="row">
                    		<c:forEach var="vo" items="${takeList}">
                          <div class="pb-3 col-md-6 col-12">
                              <div class="p-3 rounded shadow-sm bg-white">
                                  <div class="d-flex border-bottom pb-3">
                                      <div class="text-muted mr-3">
                                          <img alt="#" src="<c:url value='/resources/imgs/GiftProductImages/${vo.gProductFilename}'/>" class="img-fluid order_img rounded">
                                      </div>
                                      <div>
                                          <p class="mb-0 font-weight-bold text-dark">${vo.gProductName}</p>
                                      </div>
                                      <div class="ml-auto">
                                      	<c:choose>
                                      		<c:when test="${vo.giftUse=='Y'}">
                                            <p class="bg-dark text-white py-1 px-3 rounded small mb-1">사용완료</p>
                                      			<c:set var="valChk" value="1" />
                                      		</c:when>
                                      		<c:otherwise>
                                            <p class="bg-success text-white py-1 px-3 rounded small mb-1">사용가능</p>
                                      		</c:otherwise>
                                      	</c:choose>
                                      </div>
                                  </div>
                                  <div class="d-flex pt-3">
                                      <div class="text-muted m-0 ml-auto mr-3 small">보내신 분<br>
                                          <span class="text-dark font-weight-bold">${vo.giftGiveMemberName}</span>
                                      </div>
                                      <div class="text-muted m-0 ml-auto mr-3 small">금액<br>
                                          <span class="text-dark font-weight-bold"><fmt:formatNumber value="${vo.gPTypePrice}" pattern="#,###원"/></span>
                                      </div>
                                  </div>
                              </div>
                          </div>
                         </c:forEach>
                         </div>
                        </c:if>
                    </div>
                    <a href="<c:url value='/member/addOn/addOn.do'/>" class="btn btn-primary btn-block my-2">보답하러가기<i class="feather-arrow-right"></i></a>
                </div>
                
                <div class="tab-pane fade" id="progress" role="tabpanel" aria-labelledby="progress-tab">
                    <div class="order-body">
                    	<c:if test="${empty giveList}">
                    		<div class="pb-3 text-center com-md-12 col-12">
                 			<div class="p-3 rounded shadow-sm bg-white">
                 				<img alt="" class="img-fluid" style="inline-size:45em;" src="<c:url value='/resources/imgs/noListDefault.png'/>" >
                 			</div>
                 		</div>
                    	</c:if>
                    	<c:if test="${!empty giveList}">
                    		<div class="row">
                    		<c:forEach var="vo" items="${giveList}">
	                          <div class="pb-3 col-md-6 col-12">
	                              <div class="p-3 rounded shadow-sm bg-white">
	                                  <div class="d-flex border-bottom pb-3">
	                                      <div class="text-muted mr-3">
	                                          <img alt="#" src="<c:url value='/resources/imgs/GiftProductImages/${vo.gProductFilename}'/>" class="img-fluid order_img rounded">
	                                      </div>
	                                      <div>
	                                          <p class="mb-0 font-weight-bold text-dark">${vo.gProductName}</p>
	                                      </div>
	                                      <div class="ml-auto">
	                                      	<c:choose>
	                                      		<c:when test="${vo.giftUse=='Y'}">
	                                            <p class="bg-dark text-white py-1 px-3 rounded small mb-1">사용완료</p>
	                                      			<c:set var="valChk" value="1" />
	                                      		</c:when>
	                                      		<c:otherwise>
	                                            <p class="bg-success text-white py-1 px-3 rounded small mb-1">미사용</p>
	                                      		</c:otherwise>
	                                      	</c:choose>
	                                      </div>
	                                  </div>
	                                  <div class="d-flex pt-3">
	                                      <div class="text-muted m-0 ml-auto mr-3 small">${vo.giftTakeMemberName}님께 보낸선물<br>
	                                          <span class="text-dark font-weight-bold"></span>
	                                      </div>
	                                      <div class="text-muted m-0 ml-auto mr-3 small">금액<br>
	                                          <span class="text-dark font-weight-bold"><fmt:formatNumber value="${vo.gPTypePrice}" pattern="#,###원"/></span>
	                                      </div>
	                                  </div>
	                              </div>
	                          </div>
	                         </c:forEach>
	                         </div>
                         </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="../../memInc/bottom.jsp" %>      