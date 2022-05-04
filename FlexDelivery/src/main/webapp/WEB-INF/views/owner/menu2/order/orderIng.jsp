<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>

   
      
<script type="text/javascript">



$(function(){
   $('.btOrderChange').click(function(){
      
      var url='<c:url value="/owner/menu2/order/orderMain.do"/>';
      
      if($(this).attr('id')=='btRequestTop'){
         url='<c:url value="/owner/menu2/order/orderMain.do"/>';
      }else if($(this).attr('id')=='btOrderTop'){
         url='<c:url value="/owner/menu2/order/orderIng.do"/>';            
      }else if($(this).attr('id')=='btOrderIngTop'){
         url='<c:url value="/owner/menu2/order/orderDeliveryIng.do"/>';
      }else if($(this).attr('id')=='btOrderSuccessTop'){
         url='<c:url value="/owner/menu2/order/orderSuccess.do"/>';
      }
      
      location.href=url;
   });
   
});  







//주문 번호 모달에게 전달하기
$(function(){
   $('.btDeliveryTime').click(function(){
      $.ajax({
         url:"<c:url value='/owner/menu2/order/goDeliveryOkModal.do'/>",
         data:"ordersNo="+$(this).val(),
         dataType:"json",
         type:"GET",
         success:function(res){
            
            
            $('.deliveryTimeOkModal').val(res);
         },
         error:function(xhr, status, error){
            alert("error!! : " + error);
         }
      }); 
   
      
   });
});



   //delivery 값 가져와서 input 에 집어넣기 update 위해서임
$(function(){
      $('.btdvtime').click(function(){
         var dvTime= $(this).val();
         $('.deliveryTimeInput').val(dvTime);
      });
});


   
//모달 누르면 update 

$(function(){
		$('.deliveryTimeOkModal').click(function(){
			
			var deliTime = $('input[class=deliveryTimeInput]').val();
			if(deliTime==1){
				$('#warningDeliveryTime').html('시간을 입력해 주세요');
				event.prventDefault();
				return false;
			}else{
				$.ajax({
					url:"<c:url value='/owner/menu2/order/orderDeliveryUpdate.do'/>",
					data:"ordersNo="+$(this).val()+"&ordersDuration="+deliTime,
					dataType:"json",
					type:"GET",
					success:function(bool){
						if(bool==true){
							location.reload();
							alert("배달 접수 하셨습니다!");
	                    }else{
	                     alert('다시 시도해주세요');
	                    }
               		},
	               error:function(xhr, status, error){
	                  alert("error!! : " + error);
	               }
            }); 
            
            
         }
         event.preventDefault();
         
      });
      
});


function goDetail(ordersNo,ordersDiscount){
	$.ajax({
		url:"<c:url value='/owner/menu2/order/orderRequestResult.do'/>",
		data:"ordersNo="+ordersNo,
		dataType:"json",
		type:"GET",
		success:function(map){
			var str="";
			console.log(map);
				var message = "요청사항이 없습니다";
				if(map.oMap['ORDERS_MESSAGE']!=null){
					message = map.oMap['ORDERS_MESSAGE'];
				}
			
   				str+="<div class='text-center' style='height:15px;'><h5 style='background-color:#004e66; color:white;' class='p-2'>회원 정보</h5></div><br>";
   				str+="<table style='margin-top: 60px;'>";
   				str+="<tbody>";
   				str+="<tr><td><b class='ml-3'>회원 아이디</b></td><tr><tr><td><span  class='ml-3'>"+map.oMap['MEMBER_ID']+"</span><br><hr></td></tr>";
   				str+="<tr><td><b  class='ml-3'>회원 이름</b></td><tr><tr><td><span  class='ml-3'>"+map.oMap['MEMBER_NAME']+"</span><br><hr></td></tr>";
   				str+="<tr><td><b  class='ml-3'>회원 주소</b></td><tr><tr><td ><span  class='ml-3'>"+map.oMap['ORDERS_ADDRESS']+"</span><br><hr></td></tr>";
   				str+="<tr><td><b  class='ml-3'>회원 요청사항</b></td><tr><tr><td><span  class='ml-3'>"+message+"</span><br><hr></td></tr>";
   				str+="</tbody>";
   				str+="</table>";
   				
   				str+="<br><div class='text-center' style='height:15px;'><h5 style=' background-color:#004e66; color:white;' class='p-2'>메뉴 / 옵션</h5></div><br>";
   				
   				str+="<table style='margin-top:30px;'>";
				str+="<tbody>";
   				if(map.dList.length==0){
				   str+="<tr class='text-center'><td colspan='1'>주문 데이터가 존재하지 않습니다.</td></tr>";         		
        		}else{
        			 var price = 0;
            		$.each(map.dList, function(idx, item){
            			if(item['M_OPTION_NO']==0){
            				str+="<tr><td><span style='float:left; font-size:15px;' class='ml-3'><b>"+item['MENU_NAME']+"&nbsp;&nbsp;"+item['O_DETAIL_QTY']+"개</b></span>";
            				str+="<span style='float:right; font-size:15px;' class='mr-4'><b>"+(item['O_DETAIL_QTY']*item['MENU_PRICE'])+" 원</b></span></td>"
            				str+="<tr><td><span class='ml-3'>＊ 기본 ("+item['MENU_PRICE']+"원)</span><br><hr></td>";
            				price+=(item['O_DETAIL_QTY']*item['MENU_PRICE']);
            			}else{
            				
            				str+="<tr><td><span style='float:left; font-size:15px;' class='ml-3'><b>"+item['MENU_NAME']+"&nbsp;&nbsp;"+item['O_DETAIL_QTY']+"개</b></span>";
            				str+="<span style='float:right; font-size:15px;' class='mr-4'><b>"+((item['MENU_PRICE']+item['M_OPTION_PRICE'])*item['O_DETAIL_QTY'])+" 원</b></span></td>"
            				str+="<tr><td><span class='ml-3'>＊ 기본 ("+item['MENU_PRICE']+"원)</span><br>";
            				str+="<span class='ml-3'>＊ "+item['M_OPTION_NAME']+" ("+item['M_OPTION_PRICE']+"원)</span><br><hr></td></tr>";
            				
            				price+=(item['MENU_PRICE']+item['M_OPTION_PRICE'])*item['O_DETAIL_QTY'];
            			}
        			});
        		str+="</tbody><br></table><br>";
        		
        		str+="<div class='text-center' style='height:15px;'><h5 style=' background-color:#004e66; color:white;' class='p-2'>가격</h5></div>";
        		str+="<table style='margin-top:50px;'><br><tbody>";
        		
        		str+="<tr><td><span style='float:left; font-size:15px;' class='ml-3'><b>총 주문 금액</b></span>";
				str+="<span style='float:right; font-size:15px;' class='mr-4'><b>"+price+" 원</b></span></td></tr>"
        		
				if(ordersDiscount>0){
        			str+="<tr><td><span style='float:left; font-size:15px;' class='ml-3'><b>할인 금액</b></span>"
        			str+="<span style='float:right; font-size:15px;' class='mr-4'><b>"+ordersDiscount+" 원</b></span></td></tr>";
        		
        			price-=ordersDiscount;
        		}
				
				if(price != map.oMap['ORDERS_PRICE']){
					str+="<tr><td><span style='float:left; font-size:15px;' class='ml-3'><b>배달팁</b></span>"
            		str+="<span style='float:right; font-size:15px;' class='mr-4'><b>3000원</b></span></td></tr>";
            		price+=3000;
            		console.log(map.oMap['ORDERS_PAYMENT']);
				}
				str+="<tr><td><hr><br></td></tr>";
        		str+="<tr><td><span style='float:left; font-size:20px;' class='ml-3'><b> 총 결제금액</b></span>";
        		str+="<span style='float:right; font-size:20px;' class='mr-4'><b>"+price+" 원</b></span></td></tr>";
        		str+="</tbody></table><br><br><br>";
        		
        	}
        	$('#detailStart').html(str);
			
			
			
		},
		error:function(xhr, status, error){
			alert("error!! : " + error);
		}
	}); 
};	






</script>

<br><br><br>
    <div class="row">
        <div class="col-md-1 col-sm-12"></div>
        <div class="col-md-10 col-sm-12">
            <div class="text-right">
                  <button id="btRequestTop" class="btn btOrderChange" style=" background-color:#fcbe32; color:#333; border: none; font-size: 15px; font-weight: bold;" >주문신청</button>
               	 <button id="btOrderTop" class="btn  btOrderChange"   style="border:1px solid #fcbe32; color:#333;  font-size: 15px; font-weight: bold;">조리중</button>
               	 <button id="btOrderIngTop" class="btn  btOrderChange " style=" background-color:#fcbe32; color:#333; border: none; font-size: 15px; font-weight: bold;">배달중</button>
               	 <button id="btOrderSuccessTop" class="btn btOrderChange"  style=" background-color:#fcbe32; color:#333; border: none; font-size: 15px; font-weight: bold;" >배달완료</button>
            </div>
         </div>
        <div class="col-md-1 col-sm-12"></div>
     </div>
     
     
   
   <div class="row ml-5 mr-5 mt-3">
        
         <div class="card">
               <div class="card-header  text-center">
                  <br>
                  <br>
                  <br>
                   <p class="card-title mb-5 mt-3" style="font-size:30px; color:#333; font-weight:bold;"><b>👨 🍳조리중👨 🍳</b></p>
               </div>
               <div class="card-body">
                   <div class="row">
                       
                       
                     <form name="frmOrderIng" method="post"   action="<c:url value='/owner/menu2/order/orderIng.do'/>" >
                        <input type="hidden" name="currentPage" value="1">
                     </form>
                                             
                                             
                                              <!-- table hover -->
                             <div class="table-responsive">
                               <table class="table table mb-5">
                                 <thead>
                                   <tr class="text-center" style="background-color:#004e66; color:white;">
                                      <th style="width:10%;">번호</th>
                                      <th style="width:10%;">회원</th>
                                     <!-- 다급한거 이미지 -->
                                     <th style="width:30%;">주문내역</th>
                                     <th style="width:20%;">접수일자</th>
                                     <th style="width:15%;">결제금액</th>
                                     <th style="width:10%;">배달</th>
                                    
                                   </tr>
                                 </thead>
                                 <tbody>
                                 <!-- table 시작 -->
                                    <c:if test="${empty list }">
                                         <tr class="text-center">
                                       <td colspan="6" class="align_center">데이터가 존재하지 않습니다.</td>
                                    </tr>
                                    </c:if>
                                    <c:if test="${!empty list }">
                                       <c:forEach var="map" items="${list }">   
                                         <tr  class="text-center">
                                               <td>${map['RNUM'] }</td>
                                              <td>${map['MEMBER_ID'] }</td>
                                                 <c:import url="/owner/menu2/order/orderTd.do">
                                                     <c:param name="ordersNo" value = "${map['ORDERS_NO'] }"/>
                                                     <c:param name="ordersDiscount" value = "${map['ORDERS_DISCOUNT'] }"/>
                                                    </c:import>
                                                   
                                              <td class="text-bold-500">${map['ORDERS_DATE']}</td>
                                              <td>${map['ORDERS_PRICE'] }</td>
                                              <td>
                                                 <button class="btn btDeliveryTime" value="${map['ORDERS_NO'] }" style="width:40px; height:25px; font-size:3px; padding:0px; border: none; background-color:#fcbe32; color:#333;"
                                                          data-toggle="modal" data-target="#deliveryTime">배달</button>
                                              </td>
                                        </tr>
                                        </c:forEach>
                                   </c:if>
                                  
                                 </tbody>
                               </table>
                               </div>
                               
                                
                           
                      </div>
               </div>
                </div>
             </div>
          
          
             
                
              
                    <div class="modal fade" id="orderDetail" tabindex="-1" role="dialog" aria-labelledby="orderDetailTitle" aria-hidden="true">
                       <div class="modal-dialog" role="document">
                           <div class="modal-content">
                              <div class="modal-header">
                                  <h5 class="modal-title" id="orderDetailTitle">주문 상세 내역</h5>
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                  </button>
                              </div>
                              <div class="modal-body">
                                  <div class="row" id="detailStart" >
                                       
                           </div>  
                              </div>
                                <div class="modal-footer justify-content-center mt-3">
                                    <button type="button" class="btn btn-primary ml-1" data-dismiss="modal" style="color:black; background-color:#fcbe32; border: none; ">
                                           <i class="bx bx-check d-block d-sm-none"></i>
                                           <span class="d-none d-sm-block">확인</span>
                                     </button>
                             </div>
                           </div>
                       </div>
                    </div>
              
              
              
          
          
          
          
          
            <!-- 배달할건지 묻는 모달-->
                    
                    <div class="modal fade" id="deliveryTime" tabindex="-1" aria-labelledby="deliveryTimeTitle" aria-hidden="true" style="display: none;">
	                    <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable" role="document">
	                        <div class="modal-content">
	                        <div class="modal-header">
	                            <h5 class="modal-title" id="deliveryTimeTitle">배달</h5>
	                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
	                            </button>
	                        </div>
	                        <div class="modal-body deliveryTimeText">
	                        	<div class="row">
	                        		<div class="col-12 col-md-1"></div>
	                        			<input class="deliveryTimeInput" type="hidden" value="1">
	                        			<div class="col-12 col-md-10 text-center">
	                        				<button class="btn btn-outline-warning p-0 m-1 btdvtime" style="width:70px; height:40px;" value="0">PICK UP</button>
	                        				<br>
		                        			<button class="btn btn-warning p-0 m-1 btdvtime" style="width:70px; height:40px;" value="20">20분</button>
		                        			<button class="btn btn-warning p-0 m-1 btdvtime" style="width:70px; height:40px;" value="30">30분</button>
		                        			<button class="btn btn-warning p-0 m-1 btdvtime" style="width:70px; height:40px;" value="40">40분</button>
		                        			<button class="btn btn-warning p-0 m-1 btdvtime" style="width:70px; height:40px;" value="50">50분</button>
		                        			<br>
		                        			<button class="btn btn-warning p-0 m-1 btdvtime" style="width:70px; height:40px;" value="60">60분</button>
		                        			<button class="btn btn-warning p-0 m-1 btdvtime" style="width:70px; height:40px;" value="70">70분</button>
		                        			<button class="btn btn-warning p-0 m-1 btdvtime" style="width:70px; height:40px;" value="80">80분</button>
		                        			<button class="btn btn-warning p-0 m-1 btdvtime" style="width:70px; height:40px;" value="90">90분</button>
	                        			<br>
	                        			<span id="warningDeliveryTime" style="color:red;"></span>
			                         	</div>
									<div class="col-12 col-md-1"></div>
								</div>
	                        </div>
	                        <div class="modal-footer">
	                            <button type="button" class="btn btn-primary ml-1 deliveryTimeOkModal" value="${ordersNo }" data-dismiss="modal" style="color:black; background-color:#fcbe32; border: none; ">
	                            	<i class="bx bx-check d-block d-sm-none"></i>
	                           		<span class="d-none d-sm-block">확인</span>
	                            </button>
	                             <button type="button" class="btn btn-light-secondary" data-dismiss="modal" style=" background-color:#f1f3f5; color:#333; border: none;">
	                           		<i class="bx bx-x d-block d-sm-none"></i>
	                            	<span class="d-none d-sm-block">취소</span>
	                            </button>
	                        </div>
	                        </div>
	                    </div>
       				</div>
          
 <%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>