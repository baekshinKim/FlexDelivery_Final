
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<!-- top 끝 -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>

	<style>
		#oStatusNo{
			border:1px solid gray;
			border-radius: 3px;
		}
	</style>

	<script type="text/javascript">
	
	$(function(){
		
		var startDay = $('input[name=startDay]').val();
		var endDay = $('input[name=endDay]').val();
		var oStatusNo = $('#oStatusNo').val();
		console.log(oStatusNo);
		$.ajax({
			url:"<c:url value='/owner/menu2/charts/ordersListChart.do'/>",
			data:"startDay="+startDay+"&endDay="+endDay,
			success:function(res){
				var result = 0;
				var type="";
				var resultValue=0;
				var label = [];
				var total = 0;
				
				$.each(res, function(idx,items){
					label.push(items['ORDERSCOUNT']);
					if(items['OSTATUSNO']==4 || items['OSTATUSNO']==5 ){
						total+=items['ORDERSCOUNT'];
					}
				});
				
				console.log(oStatusNo);
				
				if(oStatusNo == 4){
					result = label[3]/total*100;
					resultValue=label[3];
					type="주문완료";
				}else if(oStatusNo==5){
					result  = label[4]/total*100;
					resultValue=label[4];
					type="주문취소";
				}
				
				$('.type').html(type);
				$('#num').html('<b>'+total+'</b>');
				$('#typeOfnum').html('<b>'+resultValue+'</b>');
				
				
				//gauge 차트 시작
				var chart = c3.generate({
					bindto:"#chart",
				    data: {
				        columns: [
				            [type, result]
				        ],
				        type: 'gauge',
				        onclick: function (d, i) { console.log("onclick", d, i); },
				        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
				        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
				    },
				    gauge: {

				    },
				    color: {
				        pattern: ['#FF0000', '#F97600', '#F6C600', '#60B044'], // the three color levels for the percentage values.
				        threshold: {
//				            unit: 'value', // percentage is default
//				            max: 200, // 100 is default
				            values: [30, 60, 90, 100]
				        }
				    },
				    size: {
				        height: 180
				    },
				    tooltip: {
	                    format: {
	                        title: function (d) { return type; },
	                        value: function (value, ratio, id) {
	                        	value=resultValue+"건";
	                            return value;
	                        }
	                    }
	                }
				});
				
				//gauge 차트끝
				
				//도넛 chart 시작
			
				//끝
			},
			error:function(xhr,status,error){
				
			}
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




	
		function pageFunc(curPage){
				$('form[name=frmPage]').find('input[name=currentPage]').val(curPage);	
				$('form[name=frmPage]').submit();
		}
		

		
		
		
		 
	</script>
	

  <br>          
  
	
<div class="m-5 mb-0">
	<div class=" collapse-icon accordion-icon-rotate m-2 mr-0">
         <div class="accordion" id="cardAccordion">
                 <div class="header text-center pb-3"  data-toggle="collapse" data-target="#collapseOne"
                     aria-expanded="false" aria-controls="collapseOne" role="button">
                    <div>
                    	<div>
                      		<span class="collapsed collapse-title" style="font-size:20px;">전체 주문량에 대한 <span class="type" style="font-size: 25px; font-weight: bold;"></span> 퍼센트</span>
                      		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-down-short" viewBox="0 0 16 16" style="float:right;">
								<path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5A.5.5 0 0 1 8 4z"/>
							</svg>
  						</div>
                 	</div>
                 </div>
                 <div id="collapseOne" class="collapse pt-1 show " aria-labelledby="headingOne"
                     data-parent="#cardAccordion">
                     <div class="card-body p-0 pb-4">
	 						<div class="text-center" >
    			 				 <span style="font-size:15px;"><span class="type"></span> : <span class="mr-1" style="font-size:20px;" id="typeOfnum"></span> 건</span>
    							  <br><span style="font-size:15px;">총  주문건수 : <span class="mr-1" style="font-size:20px;" id="num"></span> 건</span> 
     						</div> 
     						<div class="text-center mt-3 ">
        						<div id="chart"></div>
   							</div>
   							<div class="text-center">
   								<small >* 총 주문 건수에 주문 취소 및 주문 완료만 포함되어 있습니다.</small>
                 	  		</div>
                 	  </div>
     		</div>
	</div>
</div>
 </div>
			
	<div class="row m-5 mt-0 mb-0">
	  	
			<div class="card m-2">
				 <br>
	            <br>
	             <br>
	            <div class="card-header  text-center">
	                <h4 class="card-title" style="font-size:30px; color:#333; font-weight:bold;">주문내역</h4>
	            </div>
	         	  
	            	<br>
	            <div class="card-body">
	                <div class="row">
					  		<c:set var="buyPrice" value="0"/>
					  		<form name="frmPage" method="post"   action="<c:url value='/owner/menu2/order/orderList.do'/>" >
					  			<div class="row" >
					  				<div class="col-md-4 col-12">
		            					<h6 style="margin-left:50px; margin-top:10px;" id="totalPrice"></h6>
					  				</div>
						  			<div class="col-md-2 col-12 text-right">
						  				<select id="oStatusNo" name="oStatusNo" style="height:30px;">
						  					<option value="4"
						  					<c:if test="${oStatusNo== 4}">
						  							selected="selected"
		            						</c:if>
						  					>주문완료</option>
						  					<option value="5"
						  					<c:if test="${oStatusNo==5}">
						  							selected="selected"
		            						</c:if>
						  					>주문취소</option>
						  					
		            		
						  				</select>
						  			</div>
						  			<div class="col-md-5 col-12 ">
						  				
										 <%@include file="../../../owner/datePicker/datePicker.jsp" %>	
										<input type="hidden" name="currentPage" value="1">
									</div>
									<div class="col-md-1 col-12">
										<input type="submit" value="조회" style="color:black; background-color:#fcbe32; border: none; ">
									</div>
								</div>
							</form>
								 <br>
	            					<br>
	            					<br>
					
			
								 <div class="table-responsive" >
							          <table class="table table mb-5">
							            <thead>
							              <tr class="text-center"  style="background-color:#004e66; color:white;">
							              	<th style="width:15%;">번호</th>
							              	<th style="width:20%;">회원</th>
							                <!-- 다급한거 이미지 -->
							                <th style="width:30%;">주문내역</th>
							                <th style="width:20%;">주문시각</th>
							                <th style="width:15%;">결제금액</th>
							               
							              </tr>
							            </thead>
							            <tbody>
							           
							            <!-- table 시작 -->
							            	<c:if test="${empty list }">
						            			<tr class="text-center">
													<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
												</tr>
							            	</c:if>
							            	<c:if test="${!empty list }">
							            		
								            	<c:forEach var="map" items="${list }">
								            	<c:set var="sum" value="${map['ORDERS_PRICE']}"/>
												<c:set var="buyPrice" value="${buyPrice + sum }"/>	
									              <tr  class="text-center">
									              		<td>${map['RNUM'] }</td>
										                <td>${map['MEMBER_ID'] }</td>
										                	<c:import url="/owner/menu2/order/orderTd.do">
										                	 	<c:param name="ordersNo" value = "${map['ORDERS_NO'] }"/>
										                	 	<c:param name="ordersDiscount" value = "${map['ORDERS_DISCOUNT'] }"/>
										               		 </c:import>
										               	<c:if test="${map['O_STATUS_NO']==4}">
										                	<td class="text-bold-500">${map['DELIVERYSUCCESS']}</td>
										                </c:if>	 
										               	<c:if test="${map['O_STATUS_NO']==5 }">
										                	<td class="text-bold-500">${map['ORDERS_PAY_END_DATE']}</td>
										                </c:if>
										                <td>${sum }원</td>
									             </tr>
									             </c:forEach>
								           </c:if>
							            </tbody>
							          </table>
							        </div>
							        
							        
							        <script type="text/javascript">
							        	$('#totalPrice').html('총 금액 :'+${buyPrice}+'원');
							        	
							        </script>
							
										<!-- 페이징 시작 -->
										<div class="card-body">
								           <nav aria-label="Page navigation example">				<!-- 페이지 가운데 정렬은  justify-content-center-->
								               <ul class="pagination pagination-primary justify-content-center">
										   <!-- 페이지 번호 추가 -->		
											<!-- 이전 블럭으로 이동 -->
										 			<c:if test="${pagingInfo.firstPage>1 }">	
														<li class="page-item">
											                   <a class="page-link" href="#" aria-label="Previous" onclick="pageFunc(${pagingInfo.firstPage-1})">
								        							<span aria-hidden="true">&laquo;</span>
											                   </a>
										                   </li>
													</c:if>
										                
									              <!-- [1][2][3][4][5][6][7][8][9][10] -->
													<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
														<c:if test="${i==pagingInfo.currentPage }">
															 <li class="page-item active"><a class="page-link" href="#" >${i}</a></li>
														</c:if>
														<c:if test="${i!=pagingInfo.currentPage }">
														    <li class="page-item"><a class="page-link" href="#" onclick="pageFunc(${i})">${i}</a></li>
														</c:if>
													</c:forEach>
								
												  <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">	
													<li class="page-item">
										                   <a class="page-link" href="#" aria-label="Previous"  onclick="pageFunc(${pagingInfo.lastPage+1})">
																 <span aria-hidden="true">&raquo;</span>
										                   </a>
									                   </li>
												 </c:if>
								               </ul>
								           </nav>
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
              
      

 <br>
  <br>
   <br>

  <%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>


	