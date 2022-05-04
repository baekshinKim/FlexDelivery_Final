<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.6.9/core.min.js"></script>
<script src="https://kit.fontawesome.com/e42a7f130f.js"crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9cc0c63f366c2fc01061c22802cf0ee&libraries=services"></script>
	
<script type="text/javascript">
	$(function() {
		$('.change-button').click(function(){
			if($(this).attr('name')=='btText'){
				if($('#changeText').css("display")=="none"){
					$('#changeText').css('display','block');
				}else if($('#changeText').css("display")=="block"){
					$('#changeText').css('display','none');
				}
			}
		});
	});
	

	$(function(){
		$('.btCancleChange').click(function(){
			if($(this).attr("name")=="textCancle"){
				$('#changeText').css('display','none');
			}else if($(this).attr("name")=="textChange"){
				$('#changeText').css('display','none');
			}
		});
	});
	
	//파일 업로드 
	$(function(){
		   $('#upfile').on('change', function(){
		       readInputFile(this);
		   });
		});
		
		
		function readInputFile(input) {
		    if(input.files && input.files[0]) {
		        var reader = new FileReader();
		       reader.onload = function (e) {
		            $('#preview').html("<img src="+ e.target.result +"  style='width:90%; margin-left:20px;' >");
		        }
		        reader.readAsDataURL(input.files[0]);
		    }  
		} 
		//파일업로드 끝
		
		<% 
         pageContext.setAttribute("newLine","\r\n"); 
      %>
      <c:set var="content" 
         value="${fn:replace(vo.storeContent, newLine,'<br>') }" />
</script> 	
<!-- <script type="text/javascript">		
		$(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var mapcode="";
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${vo.storeAddress}', function(result,status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				mapcode=coords
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		    
		     var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">클릭하여 큰 지도로 보기</div>'
		       });
		    
		  	// 마커에 마우스오버 이벤트를 등록합니다
		     kakao.maps.event.addListener(marker, 'mouseover', function() {
		       // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		         infowindow.open(map, marker);
		     });

		     // 마커에 마우스아웃 이벤트를 등록합니다
		     kakao.maps.event.addListener(marker, 'mouseout', function() {
		         // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		         infowindow.close();
		     });
		     
		  	// 마커에 클릭이벤트를 등록합니다
		     kakao.maps.event.addListener(marker, 'click', function() {
		    	 if(clickCount==1){
			    	 resizeMap1();
			    	 map.relayout();
			    	 map.panTo(mapcode);
			    	 clickCount=2;
		    	 }else if(clickCount==2){
		    		 resizeMap2();
		    		 map.relayout();
		    		 map.panTo(mapcode);
		    		 clickCount=1;
		    	 }
		     });
		  	
		  	// 지도 확대 레벨 변화 이벤트를 등록한다
			kakao.maps.event.addListener(map, 'zoom_changed', function () {
				map.panTo(mapcode);
			});
		}); 

</script>   -->


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/basic.css" />
<link rel="stylesheet"
	href="https://ceo-cdn.baemin.com/cdn/ceo-selfservice/css/ceo-selfservice.css?ts=20210119110213">
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/e42a7f130f.js"
	crossorigin="anonymous"></script>

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
						${vo.storeName} 
					</h3>
					<p class="text-sub mt-1">FLEX DELIVERY</p>
				</section>
			</div>
			<div>
				<div class="tabs TabNav">
					<ul>
						<li><a aria-current="page" class="active"
							href="<c:url value='/owner/menu2/basic/basic.do'/>">기본정보</a></li>
						<li><a
							href="<c:url value='/owner/menu2/operation/operation.do'/>">운영정보</a></li>
					</ul>
				</div>
				<form class="form-card">
					<div>
						<div class="Card ">
							<div class="card-header">
								<h3>가게 정보</h3>
							</div>
							<div class="form-group ">
								<h5 class="form-label">로고</h5>
								<div class="card-columns ">
									<div class="mr-2 mb-2 shop-logo">
										<img alt="" src="<c:url value='/resources/imgs/StoresImages/${vo.storeLogo}'/>">
									</div>
									<div class="box-wrapper flex-1 small">
										로고 변경은
										<button type="button" class="button p-0 text text" id="open">
											가게로고변경</button>
										에서 하실 수 있습니다.
										<ul class="bullet-ul small muted">
											<li>변경 즉시 FLEX DELIVERY에 반영됩니다.</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="form-group ">
								<h5 class="form-label">가게 이름</h5>
								<div class="inline-values flex-1 mb-1">${vo.storeName}</div>
								<ul class="bullet-ul small muted">
									<li>변경이 필요한 경우 <a  
										href="<c:url value='/owner/mypage/mypageEdit.do'/>"
										style="font-weight: bold;">내 정보 수정</a>에서 가능합니다.</li>
								</ul>
							</div>
							<div class="form-group ">
								<h5 class="form-label">가게 번호</h5>
								<div class="inline-values flex-1 ">FD${vo.storeNo}</div>
							</div>
							<div class="form-group ">
								<h5 class="form-label">실제 위치</h5>
								<div class="inline-values flex-1 mb-1">${vo.storeAddress}</div>
								<div class="inline-values flex-1 mb-1">${vo.storeAddressDetail}</div>
								
								<ul class="bullet-ul mt-0 small muted">
									
								</ul>
								
							<!-- MAP 
                			<div class="shadow-sm rounded bg-white mb-3 p-3 overflow-hidden" >
                			<h6 class="mb-3">점포 위치</h6>
                			<div id="map" style="min-height:300px"></div>
                			</div>
                			<!-- /MAP -->
								
								<button type="button" class="button mt-2 p-0 text text" onclick="location.href = '/fd/owner/mypage/mypageEdit.do'"/>노출위치
									변경</button>
							</div>
						</div>
					</div>
				</form>

				<form class="form-card">
					<div>
						<div class="Card ">
							<div class="card-header">
								<h3>가게 소개</h3>
								<div class="card-menu " style="opacity: 0.99;">
									<button type="button" class="button change-button medium text" name="btText">
										<i class="fas fa-pencil-alt"></i> 변경
									</button>
								</div>
							</div>
							<div class="form-group no-divider" style="min-height: auto;">
								<div class="form-control-wrap form-control-inline">
									<div class="form-control ">
										<div class="inline-values flex-1 ">
											<span class="inline-value " >${vo.storeContent}
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>


				<form class="form-card form-card-active" name="frmEdit" method="post" 
						action="<c:url value='/owner/updateContent.do'/>"> 
						<input type="hidden" name="storeNo" value="${vo.storeNo}">
					<div>
						<div class="Card" id="changeText" style="display:none;" >  
							<div class="card-header">
								<h3>가게 소개</h3>
								<div class="card-menu " style="opacity: 1;">
									<button type="submit" class="button small primary" name="textChange" >적용</button>
									<button type="button" class="button mr-1 small secondary btCancleChange" name="textCancle" >닫기</button>
								</div>
							</div>
							<div class="form-group no-divider" style="min-height: auto;">
								<div class="form-control-wrap">
									<div class="form-control ">
										<div class="textarea-container ">
											<textarea data-component="[object Object]" class="" rows="13"
												maxlength="500" placeholder="" name="storeContent" >${content}</textarea> 
											<span class="text-count">118</span>
										</div>
									</div>
								</div>
								<ul class="bullet-ul small muted">
									<li>가게소개는 변경 즉시 FLEX DELIVERY에 반영됩니다. 정보 수정 시 주의 하시기 바랍니다.</li>
									<li>FLEX DELIVERY는 플랫폼 서비스로서, 공정한 경쟁을 해치거나 고객의 선택에 혼선을 주는 키워드와 문구를
										입력할 수 없도록 합니다. 게시 목적에 맞게 활용해 주시길 바랍니다.</li>
								</ul>
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

<div>
<div class="modal-wrapper" style="display: none;">
	<div class="Dialog     on  " >
		<form novalidate="" class="dialog on lg " name="logoForm" 
		action="<c:url value='/owner/menu2/basic/basic.do'/>" 
		method="post" enctype="multipart/form-data">
			<div class="header">
				<div class="header-close">
					<button id="close" type="button"> 나가기</button>
				</div>
				<div class="header-title">
					<h3>가게 로고 변경</h3>
				</div>
				<div class="header-hint"></div>
			</div>
			<div class="wrap">
				<a class="content-begin"></a>
				<div class="content">
					<div class="form-group ">
						<h5 class="form-label">로고 이미지</h5>
						<div class="uploader-wrapper ">
						<span>
							<!-- <input type="file" id="upfile" multiple="" accept=".jpg, .jpeg, .png, .pdf, .zip" 
							style="position: absolute; left: -1000px; visibility: hidden;"> -->
								<span>
								
								<button type="button" class="button uploader-btn  small text">
								<div id="preview" class="text-center">
								<label for="upfile" style="cursor: pointer;" color= "#1a7cff">
									<i class="icon icon-plus"></i>
									<div>이미지 </div></label>
									</div></button>
									<input type="file" id="upfile" name="upfile" class="btn text-right" 
 									accept=".gif, .jpg, .png" style="visibility: hidden;">
									</span></span>
						</div>
						<ul class="bullet-ul small muted">
                             <br><span style="margin-left:60px;"></span> 
							<li>15MB 이하, JPG, PNG, ZIP, PDF 형식의 파일만 등록할 수 있습니다.</li>
						</ul>
					</div>
					
				</div>
			</div>
			<div class="footer">
				<button type="submit" class="button popup primary">변경</button>
			</div>
		</form>
	</div>
</div>
</div>
<script type="text/javascript">
const open = document.getElementById("open");
const close = document.getElementById("close");
const modal = document.querySelector(".modal-wrapper");
open.onclick = () => {
  modal.style.display = "flex";
};
close.onclick = () => {
  modal.style.display = "none";
};
</script>

<script src="https://ceo-cdn.baemin.com/cdn/ceo-selfservice/js/venders.js?ts=20210202090306"></script>
<script src="https://ceo-cdn.baemin.com/cdn/ceo-selfservice/js/ceo-selfservice.js?ts=20210202090306"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDJxgOJrxP4BZILYKGwScHT1_9ionLH7qg&amp;language=ko&amp;libraries=geometry&amp;callback=__gmapLoaded"></script>

<%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>
