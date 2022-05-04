<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp"%>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function(){
		var cList=new Array();
		IMP.init('imp06881014');
		
		$('div #giftBox').hide();
		$('div #eCouponBox').hide();
		
		$('input[name=options]').click(function(){
			if($(this).val()==1){
				$('div #giftBox').hide();
				$('div #eCouponBox').hide();
				$('div #couponBox').show();
			}else if($(this).val()==2){
				$('div #couponBox').hide();
				$('div #eCouponBox').hide();
				$('div #giftBox').show();
			}else if($(this).val()==3){
				$('div #giftBox').hide();
				$('div #couponBox').hide();
				$('div #eCouponBox').show();
			}
		});
		
		
	});
	
	function change(e,totalPrice){
		var dc=e.target.options[e.target.selectedIndex].title;
		if(dc>totalPrice){
			dc=totalPrice;
		}
		
		if(e.target.name=='giftSelect'){
			$('div #couponBox').find('select option:eq(0)').prop('selected','selected');
			$('div #eCouponBox').find('select option:eq(0)').prop('selected','selected');
		}else if(e.target.name=='couponSelect'){
			$('div #eCouponBox').find('select option:eq(0)').prop('selected','selected');
			$('div #giftBox').find('select option:eq(0)').prop('selected','selected');
		}else if(e.target.name=='eCouponSelect'){
			$('div #couponBox').find('select option:eq(0)').prop('selected','selected');
			$('div #giftBox').find('select option:eq(0)').prop('selected','selected');
		}
		
		$('#discountPrice').html(dc+' 원');
		$('#orderPrice').html((totalPrice-dc)+' 원');
		$('#orderButton').html('PAY '+(totalPrice-dc)+'원<i class="feather-arrow-right"></i>')
		$('#ordersPrice').val(totalPrice-dc);
		$('#ordersDiscount').val(dc);
	};
	
	function pay(){
		var pay=$('input[name=ordersPrice]').val();
		var tel=$('input[name=ordersHp]').val();
		var address=$('input[name=ordersAddress]').val();
		var memName=$('input[name=memberName]').val();
		var method=$('input[name=ordersPayment]:checked').val();
		var merchant=${today};
		console.log("pay:"+pay+", tel:"+tel+", address:"+address+", memName="+memName+", method:"+method+", merchant:"+merchant);
		console.log(pay);
		IMP.request_pay({
          pay_method: method,
          merchant_uid: 'FD_'+merchant,
          name: "FLEX-DELIVERY",
          amount: pay,//pay로 변경해야댐
          buyer_name: memName,
          buyer_tel: tel,
          buyer_addr: address
		},function(rsp){
			if (rsp.success) {
				$('form[name=orderForm]').submit();
	          } else {
	            alert('결제 실패  : ' + rsp.error_msg);
	            
	          }
		});
	};
</script>

<div class="osahan-checkout">
    <div class="d-none">
        <div class="bg-primary border-bottom p-3 d-flex align-items-center">
            <a class="toggle togglew toggle-2" href="#"><span></span></a>
            <h4 class="font-weight-bold m-0 text-white">주문하기</h4>
        </div>
    </div>
    <!-- checkout -->
	
    <div class="container position-relative">
        <div class="py-5 row">
            <div class="col-md-12 mb-3">
			    <form name="orderForm" id="orderForm" method="post" action="<c:url value='/member/order/orderSuccess.do'/>">
				<input type="hidden" name="memberNo" value="${memVo.memberNo}">
				<input type="hidden" name="memberName" value="${memVo.memberName}">
				<input type="hidden" name="storeNo" value="${cartList[0].storeNo}">
                <div class="osahan-cart-item mb-3 rounded shadow-sm bg-white overflow-hidden">
                    <div class="osahan-cart-item-profile bg-white p-3">
                        <div class="d-flex flex-column">
                            <h6 class="mb-3 font-weight-bold">배달정보</h6>
                            <div class="row">
                                <div class="custom-control col-lg-12 custom-radio mb-3 position-relative border-custom-radio">
                                    <input type="radio" id="customRadioInline1" class="custom-control-input" checked>
                                    <label class="custom-control-label w-100" for="customRadioInline1">
	                                 	<div>
		                                    <div class="p-3 bg-white rounded shadow-sm w-100">
		                                       <div class="d-flex align-items-center mb-2">
		                                          <h6 class="mb-0" id="bodyAddress">${memVo.memberAddress}</h6>
		                                       </div>
		                                       <p class="small text-muted m-0" id="bodyAddressDetail">${memVo.memberAddressDetail}</p>
	                                           <input type="hidden" name="ordersAddress" id="ordersAddress" value="${memVo.memberAddress} ${memVo.memberAddressDetail}"> 
	                                    	   <input type="hidden" name="ordersHp" value="${memVo.memberHp1}-${memVo.memberHp2}-${memVo.memberHp3}">
		                                    </div>
		                                </div>
	                                </label>
                                </div>
                            </div>
                            <a class="btn btn-primary" href="#" data-toggle="modal" data-target="#addressModal"> 주소 수정 </a>
                        </div>
                    </div>
                </div>
                <div class="osahan-cart-item rounded rounded shadow-sm overflow-hidden bg-white mb-3">
					<c:set var="buyPrice" value="0" />
					<c:set var="totalPrice" value="0" />
					<c:set var="delivery" value="0" />
				    <div class="bg-white border-bottom py-2">
				   		<c:forEach var="cVo" items="${cartList}" varStatus="i" >
				    		<c:set var="sum" value="${(cVo.menuPrice+cVo.mOptionPrice)*cVo.cartQty}" />
				   			<c:set var="buyPrice" value="${buyPrice+sum}" />
					        <div class="gold-members d-flex align-items-center justify-content-between px-3 py-2">
					            <div class="media align-items-center">
					                <div class="media-body">
					                    <p class="m-0">${cVo.menuName}
					                    <span class="font-monospace text-dark"><small><br>${cVo.mOptionName}</small></span>
					                    </p>
					                </div>
					            </div>
					            <div class="d-flex align-items-center">
						            <p class="text-gray mb-0 float-right text-muted small">${cVo.menuPrice+cVo.mOptionPrice}원 x ${cVo.cartQty}</p>
					            </div>
					        </div>
				   		</c:forEach>
				   	</div>
				    <c:if test="${buyPrice<storeMinPrice}">
				    	<c:set var="delivery" value="3000" />
				    </c:if>
				    <c:set var="totalPrice" value="${buyPrice+delivery}" />
				</div>
                <div class="accordion mb-3 rounded shadow-sm bg-white overflow-hidden" id="accordionExample">
                    <div class="osahan-card bg-white border-bottom overflow-hidden">
                        <div class="osahan-card-header" id="headingOne">
                            <h2 class="mb-0">
                                <button class="d-flex p-3 align-items-center btn btn-link w-100" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						 <i class="feather-globe mr-3"></i>주문 시 요청사항
                         <i class="feather-chevron-down ml-auto"></i>
                         </button>
                            </h2>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <div class="osahan-card-body border-top p-3">
                                <h6 class="m-0">사장님께</h6>
                                <p class="small">100자 까지 입력 가능</p>
                                <div class="form-row">
                                    <div class="col-md-12 form-group">
                                        <div class="input-group">
                                            <input placeholder="일회용품 안 주셔도 돼요" type="text" name="ordersMessage" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="osahan-card bg-white border-bottom overflow-hidden">
                        <div class="osahan-card-header" id="headingTwo">
                            <h2 class="mb-0">
                                <button class="d-flex p-3 align-items-center btn btn-link w-100" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                         <i class="feather-dollar-sign mr-3"></i>할인수단
                         <i class="feather-chevron-down ml-auto"></i>
                         </button>
                            </h2>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                            <div class="osahan-card-body border-top p-3">
	                          	<div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
	                              <label class="btn btn-outline-secondary active">
	                              	<input type="radio" name="options" id="option1" value="1" checked> 점포쿠폰
	                              </label>
	                              <label class="btn btn-outline-secondary">
	                              	<input type="radio" name="options" id="option3" value="3"> 이벤트쿠폰
	                              </label>
	                              <label class="btn btn-outline-secondary">
	                              	<input type="radio" name="options" id="option2" value="2"> 선물함
	                              </label>
	                           </div>
                               <hr>
                               <div class="form-row" id="couponBox">
                                   <div class="col-md-12 form-group mb-0 discountDiv">
		                               	<label class="form-label small font-weight-bold">점포쿠폰 선택</label><br>
		                               	<c:if test="${!empty coupList}">
			                            	<select class="custom-select form-control" name="couponSelect" id="couponSelect" onchange="change(event,${totalPrice})">
				                             	 <option value="0" title="0" selected>선택 없음
			                            	 <c:forEach items="${coupList}" var="cVo">
			                            	 	<c:if test="${cVo.rCouponMin<=buyPrice}">
					                             <option value="${cVo.sCBoxNo}" title="${cVo.rCouponDc}"><fmt:formatNumber value="${cVo.rCouponDc}" pattern="#,###원" /> 할인 - <fmt:formatNumber value="${cVo.rCouponMin}" pattern="#,###원" />부터 사용가능</option>
			                            	 	</c:if>
			                            	 </c:forEach>
				                           	</select>
				                        </c:if>
			                           	<c:if test="${empty coupList}">
		                               		<select class="custom-select form-control" name="couponSelect" id="couponSelect" disabled>
		                               			<option value="0" title="0" selected>선택가능한 쿠폰이 없습니다</option>
		                               		</select> 
		                               	</c:if>
                                   </div>
                               </div>
                               <div class="form-row" id="giftBox">
                                   <div class="col-md-12 form-group mb-0 discountDiv">
		                               	<label class="form-label small font-weight-bold">상품권 선택</label><br>
		                               	<c:if test="${!empty giftList}">
			                            	<select class="custom-select form-control" name="giftSelect" id="giftSelect" onchange="change(event,${totalPrice})">
				                             	 <option value="0" title="0" selected>선택 없음</option>
			                            	 <c:forEach items="${giftList}" var="gVo">
					                             <option value="${gVo.giftNo}" title="${gVo.gPTypePrice}"><fmt:formatNumber value="${gVo.gPTypePrice}" pattern="#,###원" /> 상품권 </option>
			                            	 </c:forEach>
				                           	</select>
		                               	</c:if>
		                               	<c:if test="${empty giftList}">
		                               		<select class="custom-select form-control" name="giftSelect" id="giftSelect" disabled>
		                               			<option value="0" title="0" selected>선택가능한 상품권이 없습니다</option>
		                               		</select>
		                               	</c:if>
                                   </div>
                               </div>
                               <div class="form-row" id="eCouponBox">
                                   <div class="col-md-12 form-group mb-0 discountDiv">
		                               	<label class="form-label small font-weight-bold">이벤트쿠폰 선택</label><br>
		                               	<c:if test="${!empty eCoupList}">
			                            	<select class="custom-select form-control" name="eCouponSelect" id="eCouponSelect" onchange="change(event,${totalPrice})">
				                             	 <option value="0" title="0" selected>선택 없음
			                            	 <c:forEach items="${eCoupList}" var="eVo">
			                            	 	<c:if test="${eVo.eCouponMin<=buyPrice}">
					                             <option value="${eVo.eCouponNo}" title="${eVo.eCouponDc}">${eVo.eCouponName} - <fmt:formatNumber value="${eVo.eCouponDc}" pattern="#,###원" /> 할인 (<fmt:formatNumber value="${eVo.eCouponMin}" pattern="#,###원" />부터 사용가능)</option>
			                            	 	</c:if>
			                            	 </c:forEach>
				                           	</select>
				                        </c:if>
			                           	<c:if test="${empty eCoupList}">
		                               		<select class="custom-select form-control" name="eCouponSelect" id="eCouponSelect" disabled>
		                               			<option value="0" title="0" selected>선택가능한 쿠폰이 없습니다</option>
		                               		</select> 
		                               	</c:if>
                                   </div>
                               </div>
                            </div>
                        </div>
                    </div>
                    <div class="osahan-card bg-white overflow-hidden">
                        <div class="osahan-card-header" id="headingThree">
                            <h2 class="mb-0">
                                <button class="d-flex p-3 align-items-center btn btn-link w-100" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
			                         <i class="feather-credit-card mr-3"></i> 결제수단
			                         <i class="feather-chevron-down ml-auto"></i>
		                         </button>
                            </h2>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                            <div class="card-body border-top">
                            	<div class="row">
	                                <div class="custom-control col-lg-6 custom-radio mb-3 position-relative border-custom-radio">
	                                    <input type="radio" name="ordersPayment" value="card" id="paymentRadio1" class="custom-control-input" checked>
	                                    <label class="custom-control-label w-100" for="paymentRadio1">
		                                 	<div>
			                                    <div class="p-3 bg-white rounded shadow-sm w-100">
			                                       <div class="d-flex align-items-center mb-2">
			                                          <h6 class="mb-0">카드결제</h6>
			                                          &nbsp;&nbsp;<p class="small text-muted m-0"> 네이버페이 / 카카오페이 / 페이코</p>
			                                       </div>
			                                    </div>
			                                </div>
		                                </label>
		                            </div>    
	                                <div class="custom-control col-lg-6 custom-radio mb-3 position-relative border-custom-radio">
	                                    <input type="radio" name="ordersPayment" value="trans" id="paymentRadio2" class="custom-control-input">
	                                    <label class="custom-control-label w-100" for="paymentRadio2">
		                                 	<div>
			                                    <div class="p-3 bg-white rounded shadow-sm w-100">
			                                       <div class="d-flex align-items-center mb-2">
			                                          <h6 class="mb-0">실시간 계좌이체</h6>
			                                       </div>
			                                    </div>
			                                </div>
		                                </label>
	                                </div>
	                                <div class="custom-control col-lg-6 custom-radio mb-3 position-relative border-custom-radio">
	                                    <input type="radio" name="ordersPayment" value="vbank" id="paymentRadio3" class="custom-control-input">
	                                    <label class="custom-control-label w-100" for="paymentRadio3">
		                                 	<div>
			                                    <div class="p-3 bg-white rounded shadow-sm w-100">
			                                       <div class="d-flex align-items-center mb-2">
			                                          <h6 class="mb-0">가상계좌</h6>
			                                       </div>
			                                    </div>
			                                </div>
		                                </label>
	                                </div>
	                                <div class="custom-control col-lg-6 custom-radio mb-3 position-relative border-custom-radio">
	                                    <input type="radio" name="ordersPayment" value="phone" id="paymentRadio4" class="custom-control-input">
	                                    <label class="custom-control-label w-100" for="paymentRadio4">
		                                 	<div>
			                                    <div class="p-3 bg-white rounded shadow-sm w-100">
			                                       <div class="d-flex align-items-center mb-2">
			                                          <h6 class="mb-0">휴대폰 소액결제</h6>
			                                       </div>
			                                    </div>
			                                </div>
		                                </label>
	                                </div>
                            	</div>
                            </div>
                        </div>
                    </div>
                </div>
		        <div class="bg-white p-3 border-bottom">
			       <p class="mb-1">TOTAL <span class="float-right text-dark" id="cartTotalPrice">${buyPrice} 원</span></p>
			       <p class="mb-1">할인 <span class="float-right text-dark" id="discountPrice">0 원</span></p>
			       <input type="hidden" name="ordersDiscount" id="ordersDiscount" value="0">
			       <p class="mb-1">배달팁<span class="text-info ml-1"><i class="feather-info"></i></span><span class="float-right text-dark">${delivery} 원</span></p>
			       <hr>
			       <h6 class="font-weight-bold mb-0">TO PAY <span class="float-right" id="orderPrice">${totalPrice}원</span></h6>
			       <input type="hidden" id="ordersPrice" name="ordersPrice" value="${totalPrice}">
		   		</div>
			    </form>
			    <div class="p-3">
			        <button class="btn btn-primary btn-block btn-lg" type="submit" id="orderButton" onclick="pay()">PAY ${totalPrice}원<i class="feather-arrow-right"></i></button>
			   	</div>
            </div>
        </div>
    </div>
</div>
<%@include file="../../memInc/orderBottom.jsp"%>