<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.6.9/core.min.js"></script>
<script src="https://kit.fontawesome.com/e42a7f130f.js"
	crossorigin="anonymous"></script>


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/operation.css" />
<link rel="stylesheet"
	href="https://ceo-cdn.baemin.com/cdn/ceo-selfservice/css/ceo-selfservice.css?ts=20210119110213">




<script type="text/javascript">
	$(function(){
		$('.change-button').click(function(){
			if($(this).attr('name')=='btTime'){
				if($('#changeTime').css("display")=="none"){
					$('#changeTime').css('display','block');
				}else if($('#changeTime').css("display")=="block"){
					$('#changeTime').css('display','none');
				}
			}else if($(this).attr('name')=='btHoliday'){
				if($('#changeHoliday').css("display")=="none"){
					$('#changeHoliday').css('display','block');
				}else if($('#changeHoliday').css("display")=="block"){
					$('#changeHoliday').css('display','none');
				}
			}else if($(this).attr('name')=='btStatus'){
				if($('#statusCard').css("display")=="none"){
					$('#statusCard').css('display','block');
				}else if($('#statusCard').css("display")=="block"){
					$('#statusCard').css('display','none');
				}
			}else if($(this).attr('name')=='btMinPrice'){
				if($('#minPriceCard').css("display")=="none"){
					$('#minPriceCard').css('display','block');
				}else if($('#minPriceCard').css("display")=="block"){
					$('#minPriceCard').css('display','none');
				}
			}
			
		});
	});
	
	
	$(function(){
		$('.btCancleChange').click(function(){
			if($(this).attr("name")=="holidayCancle"){
				$('#changeHoliday').css('display','none');
			}else if($(this).attr("name")=="timeCancle"){
				$('#changeTime').css('display','none');
			}else if($(this).attr("name")=="statusCancle"){
				$('#statusCard').css('display','none');
			}else if($(this).attr("name")=="minPriceCancle"){
				$('#minPriceCard').css('display','none');
			}
		});
	});
	
	
	function goMinPrice(){
		$.ajax({
			url:"<c:url value='/owner/menu2/operation/selectMinPrice.do'/>",
			success:function(res){
				$('.spanMinPriceText').html("<span class='text' >"+res+"원</span>");
				$('input[name=storeMinPrice]').val(res);
			},
			error:function(xhr,status,error){
				alert("error!!: "+error);
			}
		});
	}
	
		$(function(){
			
			goMinPrice();
		});
		
		
		
	$(function(){
		$('#holidayUpdate').click(function(){
			var hCategoryNo = $('select[name=hCategoryNo]').val();
			var storeNo = $('input[name=storeNo]').val();
			var ownerNo = $('input[name=ownerNo]').val();
			
			console.log(hCategoryNo);
			console.log(storeNo);
			console.log(ownerNo);
			$.ajax({
				url:"<c:url value='/owner/menu2/operation/updateHoliday.do'/>",
				data:"hCategoryNo="+hCategoryNo+"&storeNo="+storeNo+"&ownerNo="+ownerNo, 
				
				success:function(res){
					str="";
					if(res=="fail"){
						alert("업데이트 실패!");
					}else{
						if(res=="없음"){
							str+="<span class='text'>"+res+"</span>";
						}else{
							str+="<span class='text'>"+res+"요일</span>";
						}
					}
					
					$('#holidayText').html('');
					$('#holidayText').html(str);
					$('#changeHoliday').css('display','none'); 
				},
				error:function(xhr,status,error){
					alert("error!!: "+error);
				}
			});
		});
	});
	
	
	$(function(){
		$('button[name=changeStatus]').click(function(){
				var storeNo = $('input[name=storeNo]').val();
				var ownerNo = $('input[name=ownerNo]').val();
				var sStatusNo = $('select[name=sStatusNo]').val();
				
				$.ajax({
					url:"<c:url value='/owner/menu2/operation/updateStatus.do'/>",
					data:"storeNo="+storeNo+"&ownerNo="+ownerNo+"&sStatusNo="+sStatusNo, 
					success:function(res){
						str="";
						if(res=="fail"){
							alert("업데이트 실패!");
						}else{
							str+="<span class='text'>"+res+"</span>";
						}
						
						$('#statusText').html('');
						$('#statusText').html(str);
						$('#statusCard').css('display','none'); 
					},
					error:function(xhr,status,error){
						alert("error!!: "+error);
					}
				});
			
		});
	});
	
	
	$(function(){
		$('button[name=timeChange]').click(function(){
			var startHour = $('select[name=startHour]').val();
			var startMinute = $('select[name=startMinute]').val();
			var closeHour = $('select[name=closeHour]').val();
			var closeMinute = $('select[name=closeMinute]').val();
			
			var startTime= startHour+":"+startMinute;
			var closeTime= closeHour+":"+closeMinute;
			
			var storeNo = $('input[name=storeNo]').val();
			var ownerNo = $('input[name=ownerNo]').val();
			
			if(startTime==closeTime){
				alert('시간을 다시 선택해 주세요!');
			}else{
				$.ajax({
					url:"<c:url value='/owner/menu2/operation/updateTime.do'/>",
					data:"startTime="+startTime+"&closeTime="+closeTime+"&storeNo="+storeNo+"&ownerNo="+ownerNo,
					success:function(res){
						str="";
						if(res.length==0){
							alert('시간 업데이트 실패!');
						}else{
							str+="<time>"+res.start+" ~ "+res.close+"</time>";
						}
						
						$('#changeTimeText').html('');
						$('#changeTimeText').html(str);
						$('#changeTime').css('display','none');
					},
					error:function(xhr,status,error){
						alert("error:"+error);
					}
					
				});
			}
			
		});
	});
	
	
	
	$(function(){
		$('#minPriceUpdate').click(function(){
			var storeMinPrice = $('input[name=storeMinPrice]').val();
			var storeNo = $('input[name=storeNo]').val();
			var ownerNo = $('input[name=ownerNo]').val();
			
			console.log(storeMinPrice);
			console.log(storeNo);
			console.log(ownerNo);
			$.ajax({
				url:"<c:url value='/owner/menu2/operation/updateMinPrice.do'/>",
				data:"storeMinPrice="+storeMinPrice+"&storeNo="+storeNo+"&ownerNo="+ownerNo, 
				success:function(res){
					str="";
					if(res>1){
						alert("업데이트 실패!");
					}else{
						
						goMinPrice();
						$('#minPriceCard').css('display','none');
					}
				},
				error:function(xhr,status,error){
					alert("error!!: "+error);
				}
			});
		});
	});
</script>




<input type="hidden" name="storeNo" value="${map['STORE_NO'] }">
<input type="hidden" name="ownerNo" value="${map['OWNER_NO'] }">
<div class="frame-wrap">
	<div class="frame-body">
		<button class="top-button  hide">
			<i class="icon icon-top"></i>
		</button>
		<div>
			<div class="ShopSelect mb-4 mb-sm-0">
				<section class="title">
					<h3>
						${map['STORE_NAME'] } 
					</h3>
					<p class="text-sub mt-1">FLEX DELIVERY</p>
				</section>
			</div>
			<div>
				<div class="tabs TabNav">
					<ul>
						<li><a href="<c:url value='/owner/menu2/basic/basic.do'/>">기본정보</a></li>
						<li><a aria-current="page" class="active"
							href="<c:url value='/owner/menu2/operation/operation.do'/>">운영정보</a></li>
					</ul>
				</div>
				<form class="form-card">
					<div>
						<div class="Card ">
							<div class="card-header">
								<h3>영업시간</h3>
								<div class="card-menu " style="opacity: 0.99;">
									<button type="button" class="button change-button medium text" name="btTime">
										<i class="fas fa-pencil-alt"></i> 변경
									</button>
								</div>
							</div>
							<div class="form-group ">
								<h5 class="form-label">매일</h5>
								<div class="inline-values flex-1 " id="changeTimeText">
									<c:if test="${map['STORE_OPEN_TIME']!='' and map['STORE_CLOSE_TIME']!='' }">
										<time>${map['STORE_OPEN_TIME'] } ~ ${map['STORE_CLOSE_TIME'] }</time>
									</c:if>
									<c:if test="${map['STORE_OPEN_TIME']=='' and map['STORE_CLOSE_TIME']=='' }">
										<span>영업 시간을 입력해 주세요</span>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</form>

				<form class="form-card form-card-active">
					<div>
						<div class="Card " id="changeTime" style="display:none; ">
							<div class="card-header">
								<h3>영업시간</h3>
								<div class="card-menu " style="opacity: 1;">
									<button type="button" class="button small primary" name="timeChange">적용</button>
									<button type="button" class="button mr-1 small secondary btCancleChange" name="timeCancle">닫기</button>
								</div>
							</div>
							
							<div class="form-group ">
								<div class="form-control-wrap">
									<div class="form-control ">
										<h5 class="form-label">매일</h5>
									</div>
								</div>
								<div class="card-columns ">
									<div class="form-control-wrap">
										<div class="form-control ">
											<h5 class="form-label form-sub-label">시작</h5>
											<select class="_31CECf9nJyK91ez9apcKQB" name="startHour">
												<option value="00" selected="selected">밤 12시</option>
												<option value="01">오전 1시</option>
												<option value="02">오전 2시</option>
												<option value="03">오전 3시</option>
												<option value="04">오전 4시</option>
												<option value="05">오전 5시</option>
												<option value="06">오전 6시</option>
												<option value="07">오전 7시</option>
												<option value="08">오전 8시</option>
												<option value="09">오전 9시</option>
												<option value="10">오전 10시</option>
												<option value="11">오전 11시</option>
												<option value="12">낮 12시</option>
												<option value="13">오후 1시</option>
												<option value="14">오후 2시</option>
												<option value="15">오후 3시</option>
												<option value="16">오후 4시</option>
												<option value="17">오후 5시</option>
												<option value="18">오후 6시</option>
												<option value="19">오후 7시</option>
												<option value="20">오후 8시</option>
												<option value="21">오후 9시</option>
												<option value="22">오후 10시</option>
												<option value="23">오후 11시</option>
											</select>
											<select	class="_1HdZOQKzdMFA822bBz8vnt" name="startMinute">
												<option value="00" selected="selected">0분</option>
												<option value="05">5분</option>
												<option value="10">10분</option>
												<option value="15">15분</option>
												<option value="20">20분</option>
												<option value="25">25분</option>
												<option value="30">30분</option>
												<option value="35">35분</option>
												<option value="40">40분</option>
												<option value="45">45분</option>
												<option value="50">50분</option>
												<option value="55">55분</option>
										   </select>
										</div>
									</div>
									<div class="form-control-wrap">
										<div class="form-control ">
											<h5 class="form-label form-sub-label">종료</h5>
											<select class="_31CECf9nJyK91ez9apcKQB" name="closeHour">
												<option	value="12" selected="selected">낮 12시</option>
												<option value="13">오후 1시</option>
												<option value="14">오후 2시</option>
												<option value="15">오후 3시</option>
												<option value="16">오후 4시</option>
												<option value="17">오후 5시</option>
												<option value="18">오후 6시</option>
												<option value="19">오후 7시</option>
												<option value="20">오후 8시</option>
												<option value="21">오후 9시</option>
												<option value="22">오후 10시</option>
												<option value="23">오후 11시</option>
												<option value="24">밤 12시 (다음 날)</option>
												<option value="25">오전 1시 (다음 날)</option>
												<option value="26">오전 2시 (다음 날)</option>
												<option value="27">오전 3시 (다음 날)</option>
												<option value="28">오전 4시 (다음 날)</option>
												<option value="29">오전 5시 (다음 날)</option>
												<option value="30">오전 6시 (다음 날)</option>
												<option value="31">오전 7시 (다음 날)</option>
												<option value="32">오전 8시 (다음 날)</option>
												<option value="33">오전 9시 (다음 날)</option>
												<option value="34">오전 10시 (다음 날)</option>
												<option value="35">오전 11시 (다음 날)</option>
											</select>
											<select	class="_1HdZOQKzdMFA822bBz8vnt" name="closeMinute">
												<option value="00" selected="selected">0분</option>
												<option value="05">5분</option>
												<option value="10">10분</option>
												<option value="15">15분</option>
												<option value="20">20분</option>
												<option value="25">25분</option>
												<option value="30">30분</option>
												<option value="35">35분</option>
												<option value="40">40분</option>
												<option value="45">45분</option>
												<option value="50">50분</option>
												<option value="55">55분</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<form class="form-card">
					<div>
						<div class="Card ">
							<div class="card-header">
								<h3>휴무일 안내</h3>
								<div class="card-menu " style="opacity: 0.99;">
									<button type="button" class="button change-button medium text" name="btHoliday">
										<i class="fas fa-pencil-alt"></i> 변경
									</button>
								</div>
							</div>
							<div class="form-group no-divider">
								<div class="form-control-wrap form-control-inline">
									<div class="form-control ">
										<div class="inline-values flex-1 ">
											<span class="inline-value " id="holidayText">
												<c:if test="${ map['H_CATEGORY_NAME']!='없음'}">
													<span class="text" >${map['H_CATEGORY_NAME'] }요일</span>
												</c:if>
												<c:if test="${ map['H_CATEGORY_NAME']=='없음'}">
													<span class="text">${map['H_CATEGORY_NAME'] }</span>
												</c:if>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
					<form class="form-card">
					<div>
						<div class="Card " id="changeHoliday" style="display:none;">
							<div class="card-header">
								<h3>휴 무 일</h3>
								<div class="card-menu " style="opacity: 1;">
									<button type="button" class="button small primary" id="holidayUpdate">적용</button>
									<button type="button" class="button mr-1 small secondary btCancleChange" name="holidayCancle">닫기</button>
								</div>
							</div>
							<div class="form-group no-divider" style="min-height: auto;">
								<div class="form-control-wrap">
									<div class="form-control ">
										<select name="hCategoryNo">
											<option value="7" selected="selected">선택안함</option>
											<option value="1">월요일</option>
											<option value="2">화요일</option>
											<option value="3">수요일</option>
											<option value="4">목요일</option>
											<option value="5">금요일</option>
											<option value="6">토요일</option>
											<option value="0">일요일</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<form class="form-card">
					<div>
						<div class="Card ">
							<div class="card-header">
								<h3>최소 주문 금액</h3>
								<div class="card-menu " style="opacity: 0.99;">
									<button type="button" class="button change-button medium text"  name="btMinPrice">
										<i class="fas fa-pencil-alt"></i> 변경
									</button>
								</div>
							</div>
							<div class="form-group no-divider">
								<div class="form-control-wrap form-control-inline">
									<div class="form-control ">
										<div class="inline-values flex-1 ">
											<span class="inline-value  spanMinPriceText" >
													
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
					<form class="form-card">
					<div>
						<div class="Card " id="minPriceCard" style="display:none;">
							<div class="card-header">
								<h3>최소 주문 금액</h3>
								<div class="card-menu " style="opacity: 1;">
									<button type="button" class="button small primary" id="minPriceUpdate">적용</button>
									<button type="button" class="button mr-1 small secondary btCancleChange" name="minPriceCancle" >닫기</button>
								</div>
							</div>
							<div class="form-group no-divider" style="min-height: auto;">
								<div class="form-control-wrap">
									<div class="form-control only-one-input justify-content-start">
										<div class="input-label-container" style="width: inherit;">
											<div class="input-container right">
												<input type="number" required="required" pattern="[0-9]" name="storeMinPrice" placeholder="숫자만 입력" inputmode="numeric" value="">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<form class="form-card mt-4">
					<div>
						<div class="Card ">
							<div class="card-header">
								<h3>영업상태</h3>
								<div class="card-menu " style="opacity: 0.99;">
									<button type="button" class="button change-button medium text" name="btStatus">
										<i class="fas fa-pencil-alt"></i> 변경
									</button>
								</div>
							</div>
							<div class="form-group ">
								<div class="form-control-wrap">
									<div class="form-control ">
										<div class="inline-values flex-1 " id="statusText">
											<span class="text">${map['S_STATUS_NAME'] }</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<form class="form-card" id="statusCard"  style="display:none; ">
					<div>
						<div class="Card ">
							<div class="card-header">
								<h3>영업 상태 변경</h3>
								<div class="card-menu " style="opacity: 1;">
									<button type="button" class="button small primary" name="changeStatus">적용</button>
									<button type="button" class="button mr-1 small secondary btCancleChange" name="statusCancle">닫기</button>
								</div>
							</div>
							<div class="form-group no-divider" style="min-height: auto;">
								<div class="form-control-wrap">
									<div class="form-control ">
										<select name="sStatusNo">
											<c:if test="${empty list }">
												<option value="1" selected="selected">상태가 없습니다</option>
											</c:if>
											<c:if test="${!empty list }">
												<c:forEach var="map2" items="${list}">
													<c:if test="${map['S_STATUS_NO']==map2['S_STATUS_NO'] }">
														<option value="${map2['S_STATUS_NO']}" selected="selected">${map2['S_STATUS_NAME'] }</option>
													</c:if>
													<c:if test="${map['S_STATUS_NO']!=map2['S_STATUS_NO']  }">
														<option value="${map2['S_STATUS_NO']}" >${map2['S_STATUS_NAME'] }</option>
													</c:if>
												</c:forEach>
											</c:if>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				
				
			</div>
		</div>
	</div>
	<div class="frame-promo">
		<div class="tip-container"></div>
	</div>
</div>
<br><br><br>

<%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>
