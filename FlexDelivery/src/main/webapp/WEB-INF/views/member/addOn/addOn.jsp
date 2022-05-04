<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp"%>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function(){
		IMP.init('imp06881014');
		
		$('#search').click(function(){
			if($('#memberName').val().length<1 || $('#memberHp3').val().length<4){
				$('#inputCorrect').prop("hidden",false);
				return false;
			}
			var data=$('#frmGift').serializeArray();
			$.ajax({
				url:"<c:url value='/member/memberGiftChk.do'/>",
				type:"post",
				data:data,
				dataType:"json",
				success:function(bool){
					console.log(bool);
					if(bool){
						$('#none').prop("hidden","hidden");
						$('#inputCorrect').prop("hidden","hidden");
						$('#exist').prop("hidden",false);
						$('#chkFlag').val('Y');
						$('#memberName').prop("readonly",true);
						$('#memberHp3').prop("readonly",true);
					}else{
						$('#inputCorrect').prop("hidden","hidden");
						$('#none').prop("hidden",false);
						return false;
					}
				},error:function(error){
					alert("error : "+error);
				}
			});
		});
		
	});
	
	function pay(){
		
		if($('#chkFlag').val()=='N'){
			alert('보내실분의 정보를 확인해주세요');
			event.preventDefault();
			return false;
		}
		var price=$('#price').val();
		console.log(pay);
		IMP.request_pay({
          pay_method: "card",
          merchant_uid: 'FD_'+new Date().getTime(),
          name: "FLEX-DELIVERY 상품권",
          amount: price,//pay로 변경해야댐
          buyer_email:""
		},function(rsp){
			if (rsp.success) {
				$('form[name=frmGift]').submit();
	          } else {
	            alert('결제 실패  : ' + rsp.error_msg);
	            
	          }
		});
	};
	
	function change(e){
		var price=e.target.options[e.target.selectedIndex].title;
		$('#price').val(price);
	}
	
	function hideSlide(){
		$("div.cat-slider").css("visibility","hidden");
	}
	function showSlide(){
		$("div.cat-slider").css("visibility","visible");
	}
</script>
	<style type="text/css">
		.text-end{
			text-align: end;
		}
	</style>
	
	<div class="d-none">
	   <div class="bg-primary p-3 d-flex align-items-center">
	       <a class="toggle togglew toggle-2" href="#"><span></span></a>
	       <h4 class="font-weight-bold m-0 text-white">Offers</h4>
	   </div>
	</div>
	<div class="offer-section">
	    <div class="container">
	        <div class="py-5 d-flex align-items-center">
	            <div>
	                <h2 class="text-white">FLEX-OFFERS!</h2>
	                <p class="h6 text-white mt-1">FLEX-DELIVERY만의 특별한 할인쿠폰과 선물상품입니다.</p>
	            </div>
	            <div class="ml-auto"><img alt="#" src="<c:url value='/resources/memberResources/img/offers.png' />" class="img-fluid offers_img"></div>
	        </div>
	    </div>
	</div>
	
   <!-- Tabs 버튼 -->
   <div class="bg-white shadow-sm">
       <div class="container">
           <div class="bg-white">
               <ul class="nav nav-tabs" id="myTab" role="tablist">
                   <li class="nav-item" role="presentation">
                       <a class="px-0 py-3 nav-link text-dark h6 border-0 mb-0 active" id="profile-tab" data-toggle="tab" href="#eventCoupon" role="tab" aria-controls="profile" aria-selected="false" onclick="hideSlide()">Coupons Offers</a>
                   </li>
                   <li class="nav-item bottom-tab" role="presentation">
                       <a class="px-0 py-3 nav-link text-dark h6 border-0 mb-0 ml-3" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true" onclick="showSlide()">Gift Offers</a>
                   </li>
               </ul>
           </div>
       </div>
   </div>
   
   
   
   
   <c:import url="/member/gift/giftCategorySlider.do" />
   
   <!-- 이벤트쿠폰 탭 div -->
<div class="container">
   <div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active py-4" id="eventCoupon" role="tabpanel" aria-labelledby="profile-tab">
		    <h5 class="mb-3 mt-0">발급가능 쿠폰</h5>
	     	<div class="row">
	     	<!-- 이벤트 쿠폰 div -->
	     		<c:import url="/member/coupon/eventCouponList.do"></c:import>
	     	</div>
		</div>
	<!-- /이벤트쿠폰 탭 -->
    
		<!-- 선물하기 탭 div -->
		<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
			<c:import url="/member/gift/giftProductList.do" /> 
		</div>
		<!-- 선물하기탭 끝 -->
		   		
	</div>
</div>

<div class="modal fade" id="giftModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">선물하기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
              </button>
            </div>
	            <div class="modal-body p-0">
	                <div class="osahan-filter">
	                    <div class="filter col-lg-10 mx-auto">
						<br>
							<form name="frmGift" id="frmGift" method="post" action="<c:url value='/member/gift/giftSend.do' />">
							<input type="hidden" name="gProductNo" id="gProductNo"/>
							<input type="hidden" name="giftGiveMemberNo" id="giftGiveMemberNo" value="${sessionScope.memberNo}"/>
							<input type="hidden" id="chkFlag" value="N">
							<input type="hidden" id="price" value="5000">
							
							<p class="mb-3" style="font-weight: bold">가격을 선택하세요</p>
							<select class="custom-select form-control" name="gPTypeNo" onchange="change(event)">
								<c:forEach items="${plist}" var="map">
									<option value="${map['G_P_TYPE_NO']}" title="${map['G_P_TYPE_PRICE']}"><fmt:formatNumber value="${map['G_P_TYPE_PRICE']}" pattern="#,###" />원</option>
								</c:forEach>
							</select>
							<p class="my-3" style="font-weight: bold">선물하실 분의 이름과 전화번호 뒤 4자리를 입력해주세요</p>
							
							<label for="memberName" class="blue text-muted">이름</label> 
							<div class="input-group mb-3">
								<input type="text" name="memberName" id="memberName" style="ime-mode: active" class="form-control" placeholder="보내시는 분의 이름을 입력하세요"> 
								<span class="input-group-btn">
							        <button class="btn btn-default" type="button" id="search">검색</button>
							    </span>
						    </div>
							<p class="blue text-muted addressSelected">전화번호 (뒤 4자리) <span class="blue text-muted addressSelected" id="selectAddress"></span></p>
							<input type="text" id="memberHp3" name="memberHp3" class="form-control" placeholder="핸드폰번호를 입력하세요">
							<br>
				            <span class="blue" id="none" style="color: red" hidden="hidden">존재하지 않는 회원입니다!</span>
				            <span class="blue" id="inputCorrect" style="color: red" hidden="hidden">회원정보를 입력하세요!</span>
				            <span class="blue" id="exist" style="color: green" hidden="hidden">FLEX-DELIVERY의 회원입니다. 선물하기 버튼을 클릭해주세요!</span>
				            <br><br>
							</form>
			            </div>
	                </div>
	            </div>
	            <div class="modal-footer p-0 border-0">
	                <div class="col-6 m-0 p-0">
	                    <button type="button" class="btn btn-primary border-top btn-lg btn-block" onclick="pay()">선물하기</button>
	                </div>
	                <div class="col-6 m-0 p-0">
	                    <button type="button" class="btn btn-light border-top btn-lg btn-block" data-dismiss="modal">Close</button>
	                </div>
	            </div>
        </div>
    </div>
</div>	   	
	   		
	   		
	   		
	   		
	   		
	   		
	   		
	   		
	   		
		
<%@include file="../../memInc/bottom.jsp"%>	