<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- top 시작-->
<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<!-- top 끝 -->
<br>
	
	 <!-- CSS only -->
 

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 <script type="text/javascript">
	 $(function(){
		IMP.init('imp96883620');
		
		$('.adSubmit').click(function(){
			var pay=$('input[name=advertisePrice]').val();
			var tel=$('input[name=hp]').val();
			var ownerName=$('input[name=buyer_name]').val();
			var method=$('select[name=pay_method]').val();;
			
			console.log("pay:"+pay+", tel:"+tel+", memName="+ownerName+", method:"+method);
			console.log(pay);
			IMP.request_pay({
		          pay_method: method,
		          merchant_uid: 'FD_'+new Date().getTime(),
		          name: "FLEX-DELIVERY",
		          amount: 10,//pay로 변경해야댐
		          buyer_name: ownerName,
				  buyer_tel: tel
			},function(rsp){
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        alert(msg);
			        $('form[name=adfrm]').submit();
		          } else {
		            alert('결제 실패  : ' + rsp.error_msg);
		            
		          }
			});
		});
		
	}); 


</script>


<style>
a {
 text-decoration: none;
}
</style>
	<input type="hidden" name="buyer_name" value="${oVo.ownerName }">
	<input type="hidden" name="hp" value="${hp }">
	
	<bR><br><br>
	<div></div>
	<!-- 너비 맞추기 위한 row  -->
	<div class="row">
		<div class="col-md-4 col-12"></div>
		<div class="col-md-4 col-12">
		     <div class="card">
		         <div class="card-header" style="background-color: white;">
		           		 <h4 class="card-title">광고 신청</h4>
			     </div>
			     
			     <div class="card-content">
				 	  <div class="card-body">
				 	  
				            <!-- form 시작 -->
			                <form class="form form-horizontal" method="post" name="adfrm" action="<c:url value='/owner/menu2/advertise/advertiseWrite.do'/>" >
			                <input type="hidden" name="advertiseNo" value="${vo.advertiseNo }">
			                <input type="hidden" name="storeNo" value="${storeNo }">
			                <div class="form-body">
			                    <div class="row">
				                    <div class="col-md-4">
				                        <label>광고명</label>
				                    </div>
				                    <div class="col-md-8 form-group" >
				                        <input type="text" id="advertiseName" class="form-control text-right" name="advertiseName" value="${vo.advertiseName }" readonly="readonly">
				                    </div>
				                    <div class="col-md-4">
				                        <label>가격</label>
				                    </div>
				                    <div class="col-md-8 form-group">
				                        <input type="text" id="advertisePrice" class="form-control text-right" name="advertisePrice"  placeholder="0" value="${vo.advertisePrice}" readonly="readonly">
				                        <!-- 리스트로 뽑아오기 -->
				                    </div>
				                    <div class="col-md-4">
				                        <label>결제 방식</label>
				                    </div>
				                    <div class="col-md-8 form-group">
				                        <select name="pay_method" style="width: 100%; text-align-last: center; ">
									           <option value="card" selected="selected">카드결제</option>
									           <option value="trans">실시간 계좌이체</option>
									           <option value="vbank">가상계좌</option>
									           <option value="phone">휴대폰 소액결제</option>
				                        </select>
				                    </div>
				                    <div class="col-md-4">
				                        <label>오늘 날짜</label>
				                    </div>
				                    <div class="col-md-8 form-group">
				                        <input type="text" id="today" class="form-control text-right" name="today" 
				                        	value="${today }" readonly="readonly">
				                    </div>
				                  
				                    <div class="col-sm-12 d-flex justify-content-end pt-5">
				                        <button type="button" class="btn  mr-1 mb-1 adSubmit" style="color:black; background-color:#fcbe32; border: none; ">신청</button>
				                        <button type="button" onclick="history.back()" class="btn  mr-1 mb-1" style=" background-color:#f1f3f5; color:#333; border: none;">취소</button>
				                    </div>
			                    </div>
			                </div>
			                </form>
			                
			   		   </div>
	              </div>
	         </div>
	    </div>
	    <div class="col-md-4 col-12"></div>
	</div>
<!-- bottom 시작-->
<%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>


		