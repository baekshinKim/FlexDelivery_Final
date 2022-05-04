<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../../ownerInc/jianSidebarTop.jsp"%>
     
<div class="main-content container-fluid">

	

	<!-- 카드로 공지사항 만들기 -->
	<!-- QQQ. 선택해주세요 공지사항 시안 1 ,  2 1은 일반 카드 2는 아코디언 형식 -->
	<!-- 1번 카드형식 -->


	<br>
	<br>
	
	
	
			
	<!--2번아코디언형식 -->
		 <div class="row">
		 <div class="col-12 col-md-1" ></div>
		 <div class="col-12 col-md-10" >
			  <div class="card collapse-icon accordion-icon-rotate">
                   <div class="accordion" id="cardAccordion">
                           <div class="card-header" id="headingOne" data-toggle="collapse" data-target="#collapseOne"
                               aria-expanded="false" aria-controls="collapseOne" role="button">
                              <div class="row">
	                               <div class="col-12 col-md-1" ></div>
	                               <div class="col-12 col-md-9" >
	                               		<span class="collapsed collapse-title" style="font-size:20px;">공 지 사 항</span>
	                               	</div>
	                               	<div class="col-12 col-md-2" >
	                               		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-down-short" viewBox="0 0 16 16">
	  										<path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5A.5.5 0 0 1 8 4z"/>
										</svg>
								    </div>
	                          </div>
                           </div>
                           <div id="collapseOne" class="collapse pt-1" aria-labelledby="headingOne"
                               data-parent="#cardAccordion">
                               <div class="card-body">
                                  <article id="mainNotice">
	          						 <c:import url="/owner/menu2/myStoreMainNotice.do"></c:import>
	        					   </article>
                         	  </div>
		           		</div>
		     		</div>
		     	</div>
			</div>
			<div class="col-12 col-md-1" ></div>
		</div>	
			
			
		
			<!-- 요청 처리 현황  -->
			<!--  리뷰 관리 -->
			
			
			<div class="row">
				<div class="col-12 col-md-1"></div>
               	<div class="col-12 col-md-5"> <!-- 카드 안의 전체 크기조절 -->
                    <div class="card"  style=" height:200px;" >
                        <div class="card-content">
                            <div class="card-body">
                            	<div class="row">
                            		<div class="col-12 col-md-6"  style="width:150px;  padding-left:10px;padding-right:0px;"> <!--  요청처리현황 제목 부분 크기조절 -->
                            			<a href="<c:url value='/owner/menu2/requests/requests.do'/>">
	                                		<h4 class="card-title">요청 처리 현황</h4>
	                                	</a>
	                               	</div>
	                                <div class="col-12 col-md-1" style="padding:0px;">
		                                <a href="<c:url value='/owner/menu2/requests/requests.do'/>">
			                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16">
 														<path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
											</svg>
										</a>
									</div>
									<div class="col-12 col-md-5" style="color:gray; text-align: right;"><small>최근 1개월</small></div> <!--  요청처리현황 제목 부분 크기조절  끝-->
								</div>
                                <p class="card-text">
                                
                                
                                	<br>
		                         	<div style="display: flex;  justify-content: space-around;">
		                        		<!-- 대기 , 취소, 반려, 승인 크기 조절 -->
		                         		
		                         		<div  style="text-align: center;">
		                         			<button class="btn" value="대기" 
		                         					style="width:40px; height:25px; font-size:3px; padding:0px; background-color:rgb(223,108,220); color:white; border: none;">대기</button>
		                         			<br>
		                         			<span style="font-size:25px">${totalagree1 -5}</span><small>건</small>
		                         		</div>
		                         		<div  style="text-align: center;">
		                         			<button class="btn btn-success" value="취소" 
		                         					style="width:40px; height:25px; font-size:3px; padding:0px; border: none;">취소</button>
		                         			<br>
		                         			<span style="font-size:25px">${totalagree2}</span><small>건</small>
		                         		</div>
		                         		<div style="text-align: center;">
		                         			<button class="btn btn-danger" value="반려" 
		                         					style="width:40px; height:25px; font-size:3px; padding:0px; border: none;">반려</button>
		                         			<br>
		                         			<span style="font-size:25px">${totalagree4}</span><small>건</small>
		                         		</div>
		                         		<div style="text-align: center;">
		                         			<button class="btn btn-primary" value="승인" 
		                         					style="width:40px; height:25px; font-size:3px; padding:0px; border: none;">승인</button>
		                         			<br>
		                         			<span style="font-size:25px">${totalagree3 -3}</span><small>건</small>
		                         		</div>
		                         	</div>
                          
                            </div>
                        </div>
                    </div>
                </div>
				<!-- 카드 내의 크기 조절 -->
                <div class="col-12 col-md-5">
                   <div class="card" style="  height:200px;">
                       <div class="card-content">
                           <div class="card-body">
                               <div class="row">
                            		<div class="col-12 col-md-4" style="padding-left:10px;padding-right:0px;"><!-- 제목 부분만 -->
                            			<a href="<c:url value='/owner/menu2/reviewOwner/reviewOwner.do'/>">
	                                		<h4 class="card-title">리뷰 관리</h4>
	                                	</a>
	                               	</div>
	                                <div class="col-12 col-md-1" style="padding:0px;">
		                                <a href="<c:url value='/owner/menu2/reviewOwner/reviewOwner.do'/>">
			                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16">
 														<path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
											</svg>
										</a>
									</div>
									<div class="col-12 col-md-6" style="color:gray; text-align: right;"></div>
								</div>
                               <p class="card-text">
                               	<br>
                               	<!-- 리뷰 내용 시작 -->
                               			<!-- 버튼 보여주기 -->
                               			<div style="display: flex; justify-content: space-around;">
                                			<div  style="text-align: center;">
			                         			<button class="btn btn-warning" value="전체" 
			                         					style="width:40px; height:25px; font-size:3px; padding:0px; border: none;" >전체</button>
			                         			<br>
			                         			<span style="font-size:25px">${fn:length(allList)}</span><small>건</small>
			                         		</div>
			                         		<div style="text-align: center;">
			                         			<button class="btn btn-success" value="미답변" 
			                         					style="width:40px; height:25px; font-size:3px; padding:0px; background-color:rgb(223,108,220); color:white; border: none;">미답변</button>
			                         			<br>
			                         			<span style="font-size:25px">${totalnocmt}</span><small>건</small>
			                         		</div>
			                         		<div style="text-align: center;">
			                         			<button class="btn btn-danger" value="차단" 
			                         					style="width:40px; height:25px; font-size:3px; padding:0px; border: none;">차단</button>
			                         			<br>
			                         			<span style="font-size:25px">${totalblockcmt}</span><small>건</small>
			                         		</div>
		                         		</div>
                         			  </div>
                       		</div>
	                    </div>
	                    </div>
 							<div class="col-12 col-md-1"></div>
 		      			  </div>
 		        		 
 		     	
			
			
			
				         
      <!-- 지안 -->   
                        
             <div class="row">
                <div class="col-12 col-md-1" ></div>
                <div class="col-12 col-md-10" >
                  <div class="card">
                        <div class="card-header  text-center">
                            <div class="card-body">
                             <div class="row">
                                   <div class="col-12 col-md-1"></div>
                                       <div class="col-12 col-md-2" style="padding-left:10px;padding-right:0px;"> <!--  요청처리현황 제목 부분 크기조절 -->
                                          <a href="<c:url value='/owner/menu2/order/orderList.do'/>">
                                            <h6 class="card-title">주간 매출</h6>
                                         </a>
                                        </div>
                                      <div class="col-12 col-md-1" style="padding:0px;">
                                         <a href="<c:url value='/owner/menu2/temporary/tempList.do'/>">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
                                    </svg>
                                 </a>
                              </div>
                              <div class="col-12 col-md-8"></div>
                           </div>
                                    
                               <div class="ml-5 mr-5 mt-5">
                                 <%@include file="charts/mainChartLine.jsp"%>
                           </div>
                            </div>
                        </div>
                     </div>
               </div>
               <div class="col-12 col-md-1" ></div>
            </div>
               
         
          
             <div class="row">
                <div class="col-12 col-md-1"></div>
                <div class="col-12 col-md-5">
                  <div class="card">
                        <div class="card-header  text-center">
                            <div class="card-body pb-4">
                                  <div class="row">
                                       <div class="col-12 col-md-5" style="padding-left:10px;padding-right:0px;"> <!--  요청처리현황 제목 부분 크기조절 -->
                                          <a href="<c:url value='/owner/menu2/order/orderMain.do'/>">
                                            <h6 class="card-title">주문현황</h6>
                                         </a>
                                        </div>
                                      <div class="col-12 col-md-1" style="padding:0px;">
                                         <a href="<c:url value='/owner/menu2/temporary/tempList.do'/>">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
                                   			 </svg>
                                		 </a>
	                              	  </div>
	                              	  <div class="col-12 col-md-6"></div>
                           		 
	                                  <span><small>현재 주문건에 대한 주문 상태 비교입니다</small></span>
	                                   <div class=" mt-3">
	                                  	  <%@include file="charts/mainChartDonut2.jsp"%>
	                           		   </div>
                           		 </div>  
                            </div>
                        </div>
                     </div>
               </div>
               <div class="col-12 col-md-5">
                  <div class="card">
                        <div class="card-header  text-center">
                            <div class="card-body pb-4">
                               <div class="row">
                                       <div class="col-12 col-md-4" style="padding-left:10px;padding-right:0px;"><!-- 제목 부분만 -->
                                          <a href="<c:url value='/owner/menu2/foodmenu/menuMain.do'/>">
                                              <h6 class="card-title">인기 메뉴 </h6>
                                           </a>
                                          </div>
                                        <div class="col-12 col-md-1" style="padding:0px;">
                                           <a href="<c:url value='/owner/menu2/reviewOwner/reviewOwner.do'/>">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
                                      		  </svg>
	                                   		 </a>
	                                	 </div>
                              			 <div class="col-12 col-md-7"></div>
	                          
	                              		<span ><small style="float:center;" >인기 메뉴 TOP 5 입니다</small></span>
	                               		<div class="  mt-3">
	                              			 <%@include file="charts/mainChartDonut.jsp"%>
	                           	 		 </div>
                                </div>
                           </div>
                        </div>
                     </div>
               </div>
               <div class="col-12 col-md-1"></div>
            </div>
            
            
             <div class="row">
                <div class="col-12 col-md-1" ></div>
                <div class="col-12 col-md-10" >
                  <div class="card">
                        <div class="card-header  text-center">
                            <div class="card-body">
                             <div class="row">
                                   <div class="col-12 col-md-1"></div>
                                       <div class="col-12 col-md-2" style="padding-left:10px;padding-right:0px;"> <!--  요청처리현황 제목 부분 크기조절 -->
                                          <a href="<c:url value='/owner/menu2/order/orderList.do'/>">
                                            <h6 class="card-title">주간 주문수</h6>
                                         </a>
                                        </div>
                                      <div class="col-12 col-md-1" style="padding:0px;">
                                         <a href="<c:url value='/owner/menu2/temporary/tempList.do'/>">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
                                    </svg>
                                 </a>
                              </div>
                              <div class="col-12 col-md-8"></div>
                           </div>
                                    
                               <div class="ml-5 mr-5 mt-5">
                                 <%@include file="charts/mainChartBar.jsp"%>
                           </div>
                            </div>
                        </div>
                     </div>
               </div>
               <div class="col-12 col-md-1" ></div>
            </div>
               <Br>
                <Br>
                 <Br>
                 
         
     
      
   <!-- 지안 끝 -->
			

<%@include file="../../ownerInc/jianSidebarBottom.jsp"%>