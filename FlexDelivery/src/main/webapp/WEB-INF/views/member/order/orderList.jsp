<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">


function detail(ordersNo){
	var data="ordersNo="+ordersNo;
	$.ajax({
		url:"<c:url value='/member/order/orderDetailAjax.do'/>",
		type:"get",
		data: data,
		success:function(vo){
			console.log(vo);
			var str="<div class='p-3 border-bottom'>";
			str+="<h5 class='font-weight-bold'>"+vo.orderVo.storeName+"</h5></div>";
			str+="<div class='p-3 status-order bg-white border-bottom d-flex align-items-center'>";
			str+="<p class='m-0'><i class='feather-calendar text-primary'></i>"+formatDate(vo.orderVo.ordersPayEndDate)+"</p></div>";
			str+="<div class='p-3 border-bottom'>";
			$.each(vo.orderDetailList,function(idx,item){
				str+="<div class='gold-members d-flex align-items-center justify-content-between px-3 py-2'>";
				str+="<div class='media align-items-center'>";
				str+="<div class='media-body'>";
				str+="<p class='m-0 h6'>"+item.menuName;
				if(item.mOptionNo>0){
					str+="<span class='font-monospace text-muted'><small><br>"+item.mOptionName+"</small></span>";
				}else{
					str+="<span class='font-monospace text-muted'><small><br>선택없음</small></span>";
				}
				str+="</p></div></div>";
				str+="<div class='d-flex align-items-center'>";
				str+="<p class='text-gray mb-0 float-right text-muted small'>"+(item.menuPrice+item.mOptionPrice)+"원 x "+item.oDetailQty+"</p>";
				str+="</div></div>";
			});
			str+="</div>";
			str+="<div class='p-3 bg-white border-bottom'>";
			str+="<div class='d-flex align-items-center mb-2'>";
			str+="<h6 class='font-weight-bold mb-1'>총 주문금액</h6>";
			str+="<h6 class='font-weight-bold ml-auto mb-1'>"+(vo.orderVo.ordersPrice+vo.orderVo.ordersDiscount)+"원</h6></div>";
			str+="<div class='d-flex align-items-center mb-2'>";
			str+="<h6 class='font-weight-bold mb-1'>할인금액</h6>";
			str+="<h6 class='font-weight-bold ml-auto'> - "+vo.orderVo.ordersDiscount+"원</h6></div></div>";
			str+="<div class='p-3 bg-white border-bottom'>";
			str+="<div class='d-flex align-items-center mb-2'>";
			str+="<h6 class='font-weight-bold mb-1'>총 결제금액</h6>";
			str+="<h6 class='font-weight-bold ml-auto mb-1'>"+vo.orderVo.ordersPrice+"원</h6></div>";
			str+="<div class='d-flex align-items-center mb-2'>";
			str+="<h6 class='font-weight-bold mb-1'>결제수단</h6>";
			if(vo.orderVo.ordersPayment=='card'){
				str+="<h6 class='font-weight-bold ml-auto mb-1'>카드</h6>";
			}else if(vo.orderVo.ordersPayment=='trans'){
				str+="<h6 class='font-weight-bold ml-auto mb-1'>계좌이체</h6>";
			}else if(vo.orderVo.ordersPayment=='vbank'){
				str+="<h6 class='font-weight-bold ml-auto mb-1'>가상계좌</h6>";
			}else if(vo.orderVo.ordersPayment=='phone'){
				str+="<h6 class='font-weight-bold ml-auto mb-1'>휴대폰 소액결제</h6>";
			}
			str+="</div></div>";
			str+="<div class='p-3 border-bottom bg-white'>";
			str+="<h6 class='font-weight-bold'>주문시 요청사항</h6>";
			if(vo.orderVo.ordersMessage!=null){
				str+="<p class='m-0 small'>"+vo.orderVo.ordersMessage+"</p></div>";
			}else{
				str+="<p class='m-0 small'>입력 없음</p></div>";
			}
			str+="<div class='p-3 border-bottom bg-white'>";
			str+="<h6 class='font-weight-bold'>배달주소</h6>";
			str+="<p class='m-0 small'>"+vo.orderVo.ordersAddress+"</p></div>";
			str+="<div class='p-3 border-bottom bg-white'>";
			str+="<h6 class='font-weight-bold'>전화번호</h6>";
			str+="<p class='m-0 small'>"+vo.orderVo.ordersHp+"</p></div>";
			
			$('#ajaxDiv').html(str);
		},
		error:function(error){
			alert("error! : " + error);
		}
	});
};

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();
    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
};

</script>
<div class="d-none">
    <div class="bg-primary border-bottom p-3 d-flex align-items-center">
        <a class="toggle togglew toggle-2" href="#"><span></span></a>
        <h4 class="font-weight-bold m-0 text-white">My Order</h4>
    </div>
</div>
<section class="py-4 osahan-main-body">
    <div class="container">
        <div class="row">
            <div class="col-md-3 mb-3">
                <ul class="nav nav-tabsa custom-tabsa border-0 flex-column bg-white rounded overflow-hidden shadow-sm p-2 c-t-order" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link border-0 text-dark py-3 active" id="completed-tab" data-toggle="tab" href="#completed" role="tab" aria-controls="completed" aria-selected="true">
                            <i class="feather-check mr-2 text-success mb-0"></i>배달완료</a>
                    </li>
                    <li class="nav-item border-top" role="presentation">
                        <a class="nav-link border-0 text-dark py-3" id="progress-tab" data-toggle="tab" href="#progress" role="tab" aria-controls="progress" aria-selected="false">
                            <i class="feather-clock mr-2 text-warning mb-0"></i>진행중</a>
                    </li>
                    <li class="nav-item border-top" role="presentation">
                        <a class="nav-link border-0 text-dark py-3" id="canceled-tab" data-toggle="tab" href="#canceled" role="tab" aria-controls="canceled" aria-selected="false">
                            <i class="feather-x-circle mr-2 text-danger mb-0"></i>주문취소</a>
                    </li>
                </ul>
            </div>
            <div class="tab-content col-md-9" id="myTabContent">
                <div class="tab-pane fade show active" id="completed" role="tabpanel" aria-labelledby="completed-tab">
                    <div class="order-body">
                    	<c:if test="${empty oklist}">
                    		<div class="pb-3 text-center">
                    			<div class="p-3 rounded shadow-sm bg-white">
                    				<img alt="" class="img-fluid" style="inline-size:45em;" src="<c:url value='/resources/imgs/noOrderDefault.png'/>" >
                    			</div>
                    		</div>
                    	</c:if>
                    	<c:if test="${!empty oklist}">
	                    	<c:forEach var="vo" items="${oklist}">
		                        <div class="pb-3">
		                            <div class="p-3 rounded shadow-sm bg-white">
		                                <div class="d-flex border-bottom pb-3 container">
		                                    <div class="text-left col-md-2 col-2">
		                                        <img alt="#" src="<c:url value='/resources/imgs/StoresImages/${vo.orderVo.storeLogo}'/>" class="img-fluid order_img rounded">
		                                    </div>
		                                    <div class="col-md-8 col-6">
		                                        <p class="mb-0 font-weight-bold">${vo.orderVo.storeName}</p>
		                                        <p class="mb-0">${vo.orderVo.storeAddress} ${vo.orderVo.storeAddressDetail}</p>
		                                        <p class="mb-0 small"><a href="<c:url value='/member/store/storeDetail.do?storeNo=${vo.orderVo.storeNo}'/>">리뷰작성하기</a></p>
		                                    </div>
		                                    <div class="ml-3 col-md-2 col-4" style="text-align: center">
		                                        <p class="bg-success text-white py-1 px-2 rounded small mb-1 text-center">배달완료</p>
		                                        <p class="small font-weight-bold text-center"><i class="feather-clock"></i> <fmt:formatDate value="${vo.orderVo.ordersPayEndDate}" pattern="yyyy-MM-dd"/> </p>
		                                    	<p class="text-muted small">Total : <span class="text-dark font-weight-bold"><fmt:formatNumber value="${vo.orderVo.ordersPrice}" pattern="#,###원" /></span></p>
		                                    </div>
		                                </div>
		                                <div class="d-flex pt-3 container">
		                                    <div class="small col-md-8 col-8">
		                                    	<c:forEach var="odVo" items="${vo.orderDetailList}">
			                                        <p class="font-weight-bold mb-0">${odVo.menuName} 
			                                        <c:if test="${odVo.mOptionNo!=0 }">
			                                        	<span class="text-muted ml-2">${odVo.mOptionName}</span>
			                                        </c:if>
			                                        <c:if test="${odVo.mOptionNo==0 }">
			                                        	<span class="text-muted ml-2">기본 (선택 없음)</span>
			                                        </c:if> x ${odVo.oDetailQty}</p>
		                                    	</c:forEach>
		                                    </div>
		                                    <div class="col-md-4 col-4" style="text-align: end">
		                                        <a href="" class="btn btn-primary px-2 my-1" onclick="detail(${vo.orderVo.ordersNo})" data-toggle="modal" data-target="#detailModal">주문 상세</a>
		                                        <a href="<c:url value='/member/store/storeDetail.do?storeNo=${vo.orderVo.storeNo}'/>" class="btn btn-outline-primary px-2 my-1">점포 방문</a>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
	                    	</c:forEach>
                    	</c:if>
                    </div>
                </div>
                <div class="tab-pane fade" id="progress" role="tabpanel" aria-labelledby="progress-tab">
                    <div class="order-body">
                    	<c:if test="${empty ingList}">
                    		<div class="pb-3 text-center">
                    			<div class="p-3 rounded shadow-sm bg-white">
                    				<img alt="" class="img-fluid" style="inline-size:45em;" src="<c:url value='/resources/imgs/noOrderDefault.png'/>" >
                    			</div>
                    		</div>
                    	</c:if>
                    	<c:if test="${!empty ingList}">
	                    	<c:forEach var="vo" items="${ingList}">
		                        <div class="pb-3">
		                            <div class="p-3 rounded shadow-sm bg-white">
		                                <div class="d-flex border-bottom pb-3 container">
		                                    <div class="text-left col-md-2 col-2">
		                                        <img alt="#" src="<c:url value='/resources/imgs/StoresImages/${vo.orderVo.storeLogo}'/>" class="img-fluid order_img rounded">
		                                    </div>
		                                    <div class="col-md-8 col-6">
		                                        <p class="mb-0 font-weight-bold">${vo.orderVo.storeName}</p>
		                                        <p class="mb-0">${vo.orderVo.storeAddress} ${vo.orderVo.storeAddressDetail }</p>
		                                    </div>
		                                    <div class="ml-3 col-md-2 col-4" style="text-align: center;">
		                                    	<c:if test="${vo.orderVo.oStatusNo==1}">
			                                        <p class="bg-warning text-white py-1 px-2 rounded small mb-1 text-center">주문요청</p>
		                                    	</c:if>
		                                    	<c:if test="${vo.orderVo.oStatusNo==2}">
			                                        <p class="bg-primary text-white py-1 px-2 rounded small mb-1 text-center">조리중</p>
		                                    	</c:if>
		                                    	<c:if test="${vo.orderVo.oStatusNo==3}">
			                                        <p class="bg-light text-dark py-1 px-2 rounded small mb-1 text-center">배달중</p>
		                                    	</c:if>
		                                        <p class="small font-weight-bold text-center"><i class="feather-clock"></i> <fmt:formatDate value="${vo.orderVo.ordersPayEndDate}" pattern="yyyy-MM-dd"/></p>
		                                        <p class="text-muted small">Total : <span class="text-dark font-weight-bold"><fmt:formatNumber value="${vo.orderVo.ordersPrice}" pattern="#,###원" /></span></p>
		                                    </div>
		                                </div>
		                                <div class="d-flex pt-3 container">
		                                    <div class="small col-md-8 col-8">
		                                        <c:forEach var="odVo" items="${vo.orderDetailList}">
			                                        <p class="font-weight-bold mb-0">${odVo.menuName} 
			                                        <c:if test="${odVo.mOptionNo!=0 }">
			                                        	<span class="text-muted ml-2">${odVo.mOptionName}</span>
			                                        </c:if>
			                                        <c:if test="${odVo.mOptionNo==0 }">
			                                        	<span class="text-muted ml-2">기본(선택 없음)</span>
			                                        </c:if> x ${odVo.oDetailQty}</p>
		                                    	</c:forEach>
		                                    </div>
		                                    <div class="col-md-4 col-4" style="text-align: end">
		                                        <a href="" class="btn btn-primary px-2 my-1" onclick="detail(${vo.orderVo.ordersNo})" data-toggle="modal" data-target="#detailModal">주문 상세</a>
		                                        <a href="<c:url value='/member/store/storeDetail.do?storeNo=${vo.orderVo.storeNo}'/>" class="btn btn-outline-primary px-2 my-1">점포 방문</a>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
							</c:forEach>
	                    </c:if>
                    </div>
                </div>
                <div class="tab-pane fade" id="canceled" role="tabpanel" aria-labelledby="canceled-tab">
                    <div class="order-body">
                    	<c:if test="${empty ccList}">
                    		<div class="pb-3 text-center">
                    			<div class="p-3 rounded shadow-sm bg-white">
                    				<img alt="" class="img-fluid" style="inline-size:45em;" src="<c:url value='/resources/imgs/noOrderDefault.png'/>" >
                    			</div>
                    		</div>
                    	</c:if>
                    	<c:if test="${!empty ccList}">
	                    	<c:forEach var="vo" items="${ccList}">
		                        <div class="pb-3">
		                            <div class="p-3 rounded shadow-sm bg-white">
		                                <div class="d-flex border-bottom pb-3 container">
		                                    <div class="text-left col-md-2 col-2">
		                                        <img alt="#" src="<c:url value='/resources/imgs/StoresImages/${vo.orderVo.storeLogo}'/>"  class="img-fluid order_img rounded">
		                                    </div>
		                                    <div class="col-md-8 col-6">
		                                        <p class="mb-0 font-weight-bold">${vo.orderVo.storeName}</p>
		                                        <p class="mb-0">${vo.orderVo.storeAddress} ${vo.orderVo.storeAddressDetail }</p>
		                                    </div>
		                                    <div class="ml-3 col-md-2 col-4" style="text-align:center">
		                                        <p class="bg-danger text-white py-1 px-2 rounded small mb-1 text-center">주문취소</p>
		                                        <p class="small font-weight-bold text-center"><i class="feather-clock"></i> <fmt:formatDate value="${vo.orderVo.ordersPayEndDate}" pattern="yyyy-MM-dd"/></p>
		                                    	<p class="text-muted small">Total : <span class="text-dark font-weight-bold"><fmt:formatNumber value="${vo.orderVo.ordersPrice}" pattern="#,###원" /></span></p>
		                                    </div>
		                                </div>
		                                <div class="d-flex pt-3 container">
		                                    <div class="small col-md-8 col-8">
		                                        <c:forEach var="odVo" items="${vo.orderDetailList}">
			                                        <p class="font-weight-bold mb-0">${odVo.menuName} 
			                                        <c:if test="${odVo.mOptionNo!=0 }">
			                                        	<span class="text-muted ml-2">${odVo.mOptionName}</span>
			                                        </c:if>
			                                        <c:if test="${odVo.mOptionNo==0 }">
			                                        	<span class="text-muted ml-2">기본(선택 없음)</span>
			                                        </c:if> x ${odVo.oDetailQty}</p>
		                                    	</c:forEach>
		                                    </div>
		                                    <div class="col-md-4 col-4" style="text-align: end">
		                                        <a href="<c:url value='/member/store/storeDetail.do?storeNo=${vo.orderVo.storeNo}'/>" class="btn btn-outline-primary px-3">점포 이동</a>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
	                        </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	        <div class="modal-header">
	            <h5 class="modal-title">주문 상세</h5>
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
            <div class="modal-body p-0">
                <div class="osahan-filter">
                    <div class="filter">
				        <section class="bg-white osahan-main-body rounded shadow-sm overflow-hidden">
	                        <div class="container p-0">
	                            <div class="row">
	                                <div class="col-lg-12">
	                                    <div class="osahan-status" id="ajaxDiv">
	                                    	<!-- 모달 ajax로 html() 이용 -->
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </section>
                    </div>
                </div>
            </div>
            <div class="modal-footer p-0 border-0">
                <div class="col-12 m-0 p-0">
                    <button type="button" class="btn btn-primary btn-lg btn-block"data-dismiss="modal">Close</button>
                </div>
            </div>
	    </div>
	</div>
</div>
<%@include file="../../memInc/bottom.jsp"%>