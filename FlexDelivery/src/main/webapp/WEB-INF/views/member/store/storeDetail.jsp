<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9cc0c63f366c2fc01061c22802cf0ee&libraries=services"></script>
<script type="text/javascript">
	function cartList(){
		var data="memberNo="+${sessionScope.memberNo};
		
		$.ajax({
			url:"<c:url value='/member/cart/cartList.do'/>",
			type:"get",
			data:data,
			success:function(map){
				var str="<div class='osahan-cart-item rounded rounded shadow-sm overflow-hidden bg-white sticky_sidebar'>";
				if(map.list.length>0){
				    str+="<div class='d-flex border-bottom osahan-cart-item-profile bg-white p-3'>";
				    str+="<a href='<c:url value='/member/store/storeDetail.do?storeNo="+map.vo.storeNo+"'/>'><img alt='logo' src='<c:url value='/resources/imgs/StoresImages/"+map.vo.storeLogo+"'/>' class='mr-3 rounded-circle img-fluid' style='max-width: 41px;max-height: 41px;'></a>";
				    str+="<div class='d-flex flex-column'>";
				    str+="<h6 class='mb-1 font-weight-bold'>"+map.vo.storeName+"</h6>";
				    str+="<p class='mb-0 small text-muted'><i class='feather-map-pin'></i>"+map.vo.storeAddress+" "+map.vo.storeAddressDetail+"</p></div></div>";
				}
		   		var buyPrice=0;
		   		var totalPrice=0;
		   		var delivery=0;
				if(map.list.length<1){
		    		str+="<div class='gold-members d-flex align-items-center justify-content-between px-3 py-2 border-bottom'>";
	    			str+="<img class='img-fluid mx-auto' alt='장바구니 상품 없음' style='inline-size:40em' src='<c:url value='/resources/imgs/TUNG.png'/>'>";
		    		str+="</div>";
		    	}else{
			    	str+="<div class='bg-white border-bottom py-2 cartDiv'>";
		    		for (var i = 0; i < map.list.length; i++) {
		    			var sum=(map.list[i].menuPrice+map.list[i].mOptionPrice)*map.list[i].cartQty;
		    			buyPrice=buyPrice+sum;
				        str+="<div class='gold-members d-flex align-items-center justify-content-between px-3 py-2 border-bottom'>";
				        str+="<div class='media align-items-center'>";
				        str+="<div class='mr-3 text-danger' style='font-size:18px'><a href='' onclick='deletecart("+map.list[i].cartNo+")'>&times;</a></div>";
				        str+="<input type='hidden' value='"+map.list[i].cartNo+"' name='cartNoHidden'>";
				        str+="<div class='media-body'>";
				        str+="<p class='m-0'>"+map.list[i].menuName+"<span class='font-monospace text-dark'><small><br>"+map.list[i].mOptionName+"</small></span></p></div></div>";
				        str+="<div class='d-flex align-items-center'>";
				        str+="<p class='text-gray mb-0 float-right mr-3 text-muted small'>"+(map.list[i].menuPrice+map.list[i].mOptionPrice)*map.list[i].cartQty+"원</p>";
				        str+="<span class='count-number float-right'>";
				        str+="<button type='button' class='btn-sm left dec btn btn-outline-secondary' onclick='minus("+map.list[i].cartNo+","+map.list[i].cartQty+")'> <i class='feather-minus'></i> </button>";
				        str+="<input class='count-number-input' type='text' readonly value='"+map.list[i].cartQty+"'>";
				        str+="<button type='button' class='btn-sm right inc btn btn-outline-secondary' onclick='plus("+map.list[i].cartNo+","+map.list[i].cartQty+")'> <i class='feather-plus'></i> </button></span>";
				        str+="</div></div>";
					}
			    	str+="</div>";
				    if(buyPrice <= map.vo.storeMinPrice){
				    	delivery=3000;
				    }
				    totalPrice=buyPrice+delivery;
				    str+="<div class='bg-white p-3 clearfix border-bottom'>";
				    str+="<p class='mb-1'>총액 <span class='float-right text-dark' id='cartTotalPrice'>"+buyPrice+"원</span></p>";
				    str+="<p class='mb-1'>배달팁<span class='text-info ml-1'><i class='feather-info'></i></span><span class='float-right text-dark'>"+delivery+"원</span></p><hr>";
				    str+="<h6 class='font-weight-bold mb-0'>TO PAY <span class='float-right'>"+totalPrice+"원</span></h6></div>";
		    	}
			    str+="<div class='p-3'>";
			    
				if(map.list.length<1){
					    str+="<a class='btn btn-dark btn-block btn-lg disabled' href='#' >장바구니에 상품이없어요</a>";
			   	}else{
			   		if (map.vo.sStatusNo==2){
			   			if(map.vo.hCategoryNo==map.today){
			   				str+="<a class='btn btn-dark btn-block btn-lg disabled' href='#' >오늘은 휴업이에요</a>";
			   			}else{
							str+="<a class='btn btn-success btn-block btn-lg' href='<c:url value='/member/order/orderSheet.do'/>'>ORDER "+totalPrice+"원<i class='feather-arrow-right'></i></a>";
			   			}
			   		}else if(map.vo.sStatusNo==1 || map.vo.sStatusNo==3){
				    	str+="<a class='btn btn-dark btn-block btn-lg disabled' href='#' >지금은 준비중이에요</a>";
			   		}
			   	}
			    str+="</div></div>";
			    
			    $('#cartDiv').html(str);
			},
			error:function(){
				alert("error!");
			}
		})
	};
	
	
	
	
	function couponBox(){
		var memberNo=${sessionScope.memberNo};
		var storeNo=${storeNo};
		var data="storeNo="+storeNo+"&memberNo="+memberNo;
		$.ajax({
			url:"<c:url value='/member/coupon/storeCouponBox.do'/>",
			type:"get",
			data:data,
			success:function(list){
				var str="<div class='osahan-filter'>";
				str+="<div class='filter'>";
				str+="<div class='p-3 bg-light border-bottom'>";
				str+="<h6 class='m-0'>쿠폰선택</h6></div>";
				var i=0;
				str+="<input type='hidden' name='memberNo' value='"+${sessionScope.memberNo}+"'>";
				$.each(list,function(idx,coupVo){
					str+="<div class='custom-control custom-radio border-bottom py-2'>";
                    if(coupVo.dupChk==0){
                    	str+="<input type='radio' class='custom-control-input' id='couponRadio"+coupVo.sCBoxNo+"' name='sCBoxNo' value='"+coupVo.sCBoxNo+"' checked='checked'>";
                        str+="<label class='custom-control-label py-3 w-100 px-3' for='couponRadio"+coupVo.sCBoxNo+"'>"+coupVo.rCouponDc.toLocaleString("ko-KR")+"원";
                        str+="<p class='text-muted mb-0'>최소주문금액 - "+coupVo.rCouponMin.toLocaleString("ko-KR")+"원</p></label>";
                        i++;
                    }
                    if(coupVo.dupChk>0){
                    	if(coupVo.rCBoxUse=='Y'){
                           	str+="<p class='text-muted mb-0'><strong>이미 사용한 쿠폰입니다</strong></p>";
                            str+="<input type='radio' class='custom-control-input' id='existCouponRadio"+coupVo.sCBoxNo+"' disabled='disabled' >";
                            str+="<label class='custom-control-label py-3 w-100 px-3' for='existCouponRadio"+coupVo.sCBoxNo+"'>"+coupVo.rCouponDc.toLocaleString("ko-KR")+"원";
                           	str+="<p class='text-muted mb-0'>최소주문금액 - "+coupVo.rCouponMin.toLocaleString("ko-KR")+"</p></label>";
                    	}else{
                    		str+="<p class='text-muted mb-0'><strong>이미 발급한 쿠폰입니다</strong></p>";
                            str+="<input type='radio' class='custom-control-input' id='existCouponRadio"+coupVo.sCBoxNo+"' disabled='disabled' >";
                            str+="<label class='custom-control-label py-3 w-100 px-3' for='existCouponRadio"+coupVo.sCBoxNo+"'>"+coupVo.rCouponDc.toLocaleString("ko-KR")+"원";
                           	str+="<p class='text-muted mb-0'>최소주문금액 - "+coupVo.rCouponMin.toLocaleString("ko-KR")+"</p></label>";
                    	}
                    }
                    str+="</div>";
				})//each
			    str+="</div></div></div>";
			    str+="<div class='modal-footer p-0 border-0'>";
	            str+="<div class='col-6 m-0 p-0'>";
	            if(i>0){
	            	str+="<button type='submit' class='btn btn-primary btn-lg btn-block'>해당쿠폰 발급받기</button>";
	            }else{
	            	str+="<button type='button' class='btn btn-primary btn-lg btn-block disabled'>발급가능한 쿠폰이 없습니다</button>";
	            }
	            str+="</div>";
	            str+="<div class='col-6 m-0 p-0'><button type='button' class='btn border-top btn-lg btn-block' id='modalCloseBt' data-dismiss='modal'>닫기</button></div>";
	            
	            $('form[name=couponForm]').html(str);
			},error:function(error){
				alert("error : "+error);
			}
		});        
	};
	
	function resizeMap1() {
	    var mapContainer = document.getElementById('map');
	    mapContainer.style.height = '600px'; 
	}
	
	function resizeMap2() {
	    var mapContainer = document.getElementById('map');
	    mapContainer.style.height = '300px'; 
	}
	
	
	$(function(){
		cartList();
		couponBox();
		var bool = ${cartChk};
		var clickCount=1;
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
		
   		$('form[name=couponForm]').submit(function(){
   			var dataForm=$(this).serializeArray();
   			console.log(dataForm);
   			$.ajax({
   				url:"<c:url value='/member/coupon/addCoupon.do'/>",
   				type:"post",
   				data:dataForm,
   				dataType:"json",
   				success:function(bool){
   					if(bool){
   						alert('쿠폰발급 되었습니다');
   						couponBox();
   					}else{
   						alert('쿠폰발급실패');
   						couponBox();
   					}
   				},error:function(error){
   					alert("error : "+error);
					couponBox();
   				}
   			});
   			event.preventDefault();
   		});
		
		$('form[name=cartForm]').submit(function(){
			if($(this).find('input[type=radio]:checked').length==0){
				alert('먼저 상품을 선택해야합니다!');
				return false;
			}
			var storeNo=${vo.storeNo};
			var data="storeNo="+storeNo+"&memberNo="+${sessionScope.memberNo};
			var cartFo=$(this).serializeArray();
			console.log(cartFo);
			$.ajax({
				url:"<c:url value='/member/cart/cartChk.do'/>",
				type:"get",
				data:data,
				success:function(chk){
					if(chk){
						var result=confirm('다른 점포의 메뉴가 담겨 있어요. 기존 상품을 삭제하고 담으시겠어요?');
						if(result){
							var tqtq="memberNo="+${sessionScope.memberNo};
							console.log(cartFo);
							$.ajax({
								url:"<c:url value='/member/cart/deleteOtherStore.do'/>",
								type:"get",
								data:tqtq,
								success:function(delChk){
									if(delChk){
										$.ajax({
											url:"<c:url value='/member/cart/addCart.do'/>",
											type:"post",
											data:cartFo,
											dataType:"json",
											success:function(addChk){
												if(addChk){
													cartList();
													alert('장바구니에 상품을 담았습니다');
													$('.closeBt').click();
												}else{
													cartList();
													alert('장바구니 담기 실패ㅠㅠ');
													$('.closeBt').click();
												}
											},
											error:function(error){
												alert("error : "+error);
											}
										});
										event.preventDefault();
									}else{
										cartList();
										alert('장바구니 삭제 실패ㅠㅠ');
										$('.closeBt').click();
									}
								},
								error:function(xhr,request,errorThrown){
									alert("code = "+ request.status + " message = " + request.responseText + " error = " + error+"cnt="+cnt);
								}
							});
							event.preventDefault();
						}else{
							event.preventDefault();
						}
					}else{
						$.ajax({
							url:"<c:url value='/member/cart/addCart.do'/>",
							type:"post",
							data:cartFo,
							dataType:"json",
							success:function(addCheck){
								if(addCheck){
									cartList();
									alert('장바구니에 상품을 담았습니다');
									$('.closeBt').click();
								}else{
									cartList();
									alert('장바구니 담기 실패ㅠㅠ');
									$('.closeBt').click();
								}
							},
							error:function(error){
								alert("error : "+error);
							}
						});
						event.preventDefault();
					}
				},error:function(error){
					alert("error:"+error);
				}
				
			});
			event.preventDefault();
		
		});
		
		
		$('.modal').on('hidden.bs.modal',function(){
			$(this).find('input[name=cartQty]').val(1);
			$(this).find('input[type=radio]:eq(0)').prop('checked',true);
		});
		
		$('.modal').on('shown.bs.modal',function(){
			var price=$(this).find('input[type=radio]:checked').next('input[type=hidden]').val();
			$(this).find('.totalPrice').html(price+'원');
		});
		
		$('.minusBt').click(function(){
			if(parseInt($(this).next('.count-number-input').val())<2){
				event.preventDefault();
				return false;
			}
			var s=parseInt($(this).next('input[name=cartQty]').val());
			$(this).next('input[name=cartQty]').val(s-1);
			var price=$(this).parent().parent().parent().prev('.modal-body').find('input[type=radio]:checked').next('input[type=hidden]').val();
			$('.totalPrice').html(price*(s-1)+'원');
		});
		
		$('.plusBt').click(function(){
			if(parseInt($(this).prev('.count-number-input').val())>9){
				event.preventDefault();
				return false;
			}
			var s=parseInt($(this).prev('input[name=cartQty]').val());
			$(this).prev('input[name=cartQty]').val(s+1);
			var price=$(this).parent().parent().parent().parent().find('input[type=radio]:checked').next('input[type=hidden]').val();
			$('.totalPrice').html(price*(s+1)+'원');
		});
		
		$('input[type=radio]').change(function(){
			$(this).parent().parent().parent().parent().parent().find('input[name=cartQty]').val(1);
			var price=$(this).next('input[type=hidden]').val();
			$('.totalPrice').html(price+'원');
		});
		
	});//$(function)
	
	function minus(no,qty){
		if(qty<2){
			event.preventDefault();
			return false;
		}
		var data="cartNo="+no; 
		$.ajax({
			url:"<c:url value='/member/cart/minusCart.do'/>",
			type:"get",
			data:data,
			success:function(bool){
				if(bool){
					cartList();
				}else{
					alert('미션 실패!');
				}
			},
			error:function(){
				alert('도전 실패!');
			}
		});
	};
	
	function plus(no,qty){
		if(qty>9){
			event.preventDefault();
			return false;
		}
		var data="cartNo="+no;
		$.ajax({
			url:"<c:url value='/member/cart/plusCart.do'/>",
			type:"get",
			data:data,
			success:function(bool){
				if(bool){
					cartList();
				}else{
					alert('미션 실패!');
				}
			},
			error:function(){
				alert('도전 실패!');
			}
		});
	};
	
	function deletecart(cartNo){
		if(confirm('장바구니 항목을 삭제하시겠습니까?')){
			var data="cartNo="+cartNo;
			$.ajax({
				url:"<c:url value='/member/cart/deleteCart.do'/>",
				type:"get",
				data:data,
				success:function(bool){
					if(bool){
						cartList();
					}else{
						cartList();
						alert('미션 실패!');
					}
				},
				error:function(){
					alert('도전 실패!');
				}
			});
			event.preventDefault();
		}
	};
</script>
    <div class="d-none">
        <div class="bg-primary p-3 d-flex align-items-center">
            <a class="toggle togglew toggle-2" href="#"><span></span></a>
            <h4 class="font-weight-bold m-0 text-white">FLEX-DELIVERY</h4>
        </div>
    </div>	
    <div class="offer-section py-4">
        <div class="container position-relative">
           	<img alt="#" src="<c:url value="/resources/imgs/StoresImages/${vo.storeLogo}"/>" class="restaurant-pic">
            <div class="pt-3 text-white">
                <h2 class="font-weight-bold" id="tqtq">${vo.storeName}</h2>
                <p class="text-white m-0">${vo.storeAddress} ${vo.storeAddressDetail}</p>
                <div class="rating-wrap d-flex align-items-center mt-2">
                    <ul class="rating-stars list-unstyled">
                        <li>
	                    	<c:forEach var="i" begin="1" end="5">
	                    		<c:if test="${vo.reviewRating>=i}">
	                        		<i class="feather-star star_active"></i>
	                    		</c:if>
	                    		<c:if test="${vo.reviewRating<i}">
	                    			<i class="feather-star"></i>
	                    		</c:if>
	                    	</c:forEach>
	                    </li>
                    </ul>
                    <p class="label-rating text-white ml-2 small"> (${vo.reviewCount} 리뷰)</p>
                </div>
            </div>
            <div class="pb-4">
                <div class="row">
                    <div class="col-6 col-md-2">
                        <p class="text-white-50 font-weight-bold m-0 small">최소주문금액</p>
                        <p class="text-white m-0">~<fmt:formatNumber value="${vo.storeMinPrice}" pattern="#,###원"/></p>
                    </div>
                    <div class="col-6 col-md-2">
                        <p class="text-white-50 font-weight-bold m-0 small">영업 시간</p>
                        <p class="text-white m-0">${vo.storeOpenTime} ~ ${vo.storeCloseTime}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="p-3 bg-primary bg-primary mt-n3 rounded position-relative">
            <div class="d-flex align-items-center">
            	<c:if test="${likeChk}">
	                <div class="feather_icon">
	                    <a href="<c:url value='/member/store/likeControll.do?storeNo=${vo.storeNo}'/>" class="text-decoration-none text-dark mx-2">
		                    <i class="p-2 bg-light rounded-circle font-weight-bold">
			                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="15" fill="red" class="bi bi-star" viewBox="0 1 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</i>
						</a>
	                </div>
                </c:if>
                <c:if test="${!likeChk}">
	                <div class="feather_icon">
	                    <a href="<c:url value='/member/store/likeControll.do?storeNo=${vo.storeNo}'/>" class="text-decoration-none text-dark mx-2">
		                    <i class="p-2 bg-light rounded-circle font-weight-bold">
			                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="15" fill="currentColor" class="bi bi-star" viewBox="0 1 16 16">
								  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288l1.847-3.658 1.846 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.564.564 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
								</svg>
							</i>
						</a>
	                </div>
                </c:if>
                <!-- 쿠폰 발급버튼 -->
                <c:if test="${couponChk}">
	                <div class="d-grid gap-2 col-6 mx-auto">
	                	<button class="col-12 btn btn-outline-light" type="button" data-toggle="modal" data-target=".couponModal">쿠폰 발급받기</button>
	                </div>
	               	<!-- 쿠폰 모달 -->
	                <div class='modal fade couponModal' tabindex='-1' role='dialog' aria-labelledby='option' aria-hidden='true'>
						<div class='modal-dialog modal-dialog-centered'>
							<div class='modal-content'>
								<div class='modal-header'>
									<h5 class='modal-title text-align-center'>쿠폰함</h5>
									<button type='button' class='close' data-dismiss='modal' aria-label='Close'>
									<span aria-hidden='true'>&times;</span></button>
								</div>
								<div class='modal-body p-0'><form name="couponForm"><!-- 쿠폰 모달 html() --></form></div> 
			               	</div> 
		               	</div> 
	               	</div> 
                </c:if>
            </div>
        </div>
    </div>
    <div class="container position-relative">
        <div class="row">
            <div class="col-lg-8 pt-3">
            	<!-- Menu -->
            	<div class="shadow-sm rounded bg-white mb-3 overflow-hidden">
	            	<div class="d-flex item-aligns-center">
				        <p class="font-weight-bold h6 p-3 border-bottom mb-0 w-100">점포 소개</p>
	            	</div>
	            	<div class="row m-0">
	            		<div class="col-md-12 col-12 border-top">
					    	<div class="row m-0">
						    	<div class="col-md-12 col-12 p-5">
						    		<c:if test="${empty vo.storeContent}">
						    			<img alt="" class="img-fluid" src="<c:url value='/resources/imgs/noListDefault.png'/>" style="inline-size:48em">
						    		</c:if>
						    		<c:if test="${!empty vo.storeContent}">
										<p class="mb-0 h6 font-monospace" style="line-height: 2;">${vo.storeContent}</p>
						    		</c:if>
								</div>
							</div>
						</div>
	            	</div>
	            </div>
	            <!-- 대표메뉴 div -->
	            <c:if test="${!empty menuAllvo.memberMenuVo.menuImg}">
            	<div class="shadow-sm rounded bg-white mb-3 overflow-hidden">
	            	<div class="d-flex item-aligns-center">
				        <p class="font-weight-bold h6 p-3 border-bottom mb-0 w-100">대표메뉴      <span class="badge bg-primary text-white">MAIN</span></p>
				    </div>
            		<div class="row m-0">
            			<div class="col-md-12 col-12 border-top">
					    	<div class="bg-light">
						    	<div class="row m-0">
						    		<div class="col-md-4 col-4 p-2">
										<img src="<c:url value='/resources/imgs/MenuImages/${menuAllvo.memberMenuVo.menuImg}' />" class="img-fluid rounded float-start" alt="...">
							    	</div>
							    	<div class="col-md-8 col-8 p-2 pt-5">
										<p class="mb-0 h5 fw-bold font-monospace" style="text-align: center">${menuAllvo.memberMenuVo.menuContent}</p>
									</div>
								</div>
						    </div>
						</div>
						<div class="col-md-12 px-0 border-top">
						    <div class="bg-white">
						    	<!-- 대표메뉴 -->
						    	<div class="p-3 border-bottom gold-members">
								    <span class="float-right"><a href="#" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#mainMenuModal">옵션 선택</a></span>
								    <div class="media">
								        <div class="mr-3 font-weight-bold text-danger non_veg">.</div>
								        <div class="media-body">
								            <h6 class="mb-1">${menuAllvo.memberMenuVo.menuName}</h6>
								            <p class="text-muted mb-0">${menuAllvo.memberMenuVo.menuPrice}원</p>
								        </div>
								    </div>
								</div>
								<div class="modal fade" id="mainMenuModal" tabindex="-1" role="dialog" aria-labelledby="option" aria-hidden="true">
							        <div class="modal-dialog modal-dialog-centered">
							            <div class="modal-content">
							                <div class="modal-header">
								                <h5 class="modal-title">${menuAllvo.memberMenuVo.menuName}</h5>
								                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                	<span aria-hidden="true">&times;</span>
								                </button>
							                </div>
							                <div class="col-md-12" style="text-align: center;line-height: 25">
							                	<img src="<c:url value='/resources/imgs/MenuImages/${menuAllvo.memberMenuVo.menuImg}' />" width="250px" height="250px">
							                	<br>
												<p class="h5 p-2">${menuAllvo.memberMenuVo.menuContent}</p>                 	
							                </div>
							                <form name="cartForm">
							                	<input type="hidden" name="menuNo" value="${menuAllvo.memberMenuVo.menuNo}">
							                	<input type="hidden" name="storeNo" value="${storeNo}">
							                	<input type="hidden" name="storeName" value="${vo.storeName}">
								                <div class="modal-body p-0">
								                    <div class="osahan-filter">
								                        <div class="filter">
								                            <!--옵션선택 -->
								                            <c:if test="${empty menuAllvo.menuOptionList}">
									                            <div class="p-3 bg-light border-bottom">
									                                <h6 class="m-0">기본선택만 가능</h6>
									                                <div class="custom-control custom-radio border-bottom py-2">
										                                <input type="radio" class="custom-control-input" id="noOption${menuAllvo.memberMenuVo.menuNo}" name="mOptionNo" value="0" checked>
										                                <input type="hidden" value="${menuAllvo.memberMenuVo.menuPrice}">
										                                <label class="custom-control-label py-3 w-100 px-3" for="noOption${menuAllvo.memberMenuVo.menuNo}">기본<p class="text-muted mb-0">추가 없음</p></label>
									                                </div>
									                            </div>
								                            </c:if>
								                            <c:if test="${!empty menuAllvo.menuOptionList}">
									                            <div class="p-3 bg-light border-bottom">
									                                <h6 class="m-0">옵션선택</h6>
									                            </div>
									                            	<div class="custom-control custom-radio border-bottom py-2">
										                                <input type="radio" class="custom-control-input" id="noOptionMain${menuAllvo.memberMenuVo.menuNo}" name="mOptionNo" value="0" checked>
										                                <input type="hidden" value="${menuAllvo.memberMenuVo.menuPrice}">
										                                <label class="custom-control-label py-3 w-100 px-3" for="noOptionMain${menuAllvo.memberMenuVo.menuNo}">기본<p class="text-muted mb-0">추가 없음</p></label>
									                                </div>
									                            <c:forEach var="oVo" items="${menuAllvo.menuOptionList}">
										                            <div class="custom-control custom-radio border-bottom py-2">
										                                <input type="radio" class="custom-control-input" id="defaultCheck${oVo.mOptionNo}" name="mOptionNo" value="${oVo.mOptionNo}">
										                                <input type="hidden" value="${menuAllvo.memberMenuVo.menuPrice+oVo.mOptionPrice}">
										                                <label class="custom-control-label py-3 w-100 px-3" for="defaultCheck${oVo.mOptionNo}">${oVo.mOptionName} <p class="text-muted mb-0">+${oVo.mOptionPrice}원</p></label>
										                            </div>
									                            </c:forEach>
								                            </c:if>
								                        </div>
								                    </div>
								                </div>
								                <div class="p-3 bg-light border-bottom">
								                    <p class="text-muted h6">수량 <span class="count-number float-right">
								                    	<button type="button" class="btn-sm btn btn-outline-secondary minusBt"><i class="feather-minus"></i></button>
								                    	<input class="count-number-input qty" type="text" name="cartQty" readonly="readonly" value="1">
								                    	<button type="button" class="btn-sm btn btn-outline-secondary plusBt"><i class="feather-plus"></i></button>
								                    </span></p>
								                </div>
								                <div class="p-3 bg-light border-bottom">
								                    <p class="text-muted fs-5 fw-bold font-monospace">Total
									                    <span class="float-right font-monospace totalPrice" style="font-weight: 700">
									                    ${menuAllvo.memberMenuVo.menuPrice}원</span>
								                    </p>
								                </div>
								                <div class="modal-footer p-0 border-0">
								                    <div class="col-6 m-0 p-0">
								                        <button type="submit" class="btn btn-primary btn-lg btn-block">장바구니담기</button>
								                    </div>
								                    <div class="col-6 m-0 p-0">
								                        <button type="button" class="btn border-top btn-lg btn-block closeBt" data-dismiss="modal">취소</button>
								                    </div>
								                </div>
							                </form>
							            </div>
							        </div>
							    </div>
					        </div>
					    </div>
					</div>
            	</div>
            	</c:if>
            	<!--/대표메뉴 끝 -->
            	<div class="shadow-sm rounded bg-white mb-3 overflow-hidden">
				    <div class="d-flex item-aligns-center">
				        <p class="font-weight-bold h6 p-3 border-bottom mb-0 w-100">메뉴</p>
				    </div>
		            <c:import url="/member/menu/menuGroupInc.do">
		            	<c:param name="storeNo" value="${storeNo}" />
		            	<c:param name="storeName" value="${vo.storeName}" />
		            </c:import>
                </div>
                <!-- /Menu -->
                
                <!-- MAP -->
                <div class="shadow-sm rounded bg-white mb-3 p-3 overflow-hidden" >
                	<h6 class="mb-3">점포 위치</h6>
                	<div id="map" style="min-height:300px"></div>
                </div>
                <!-- /MAP -->
                
                <!-- Review -->
                <div class="mb-3">
                    <div id="ratings-and-reviews" class="bg-white shadow-sm d-flex align-items-center rounded p-3 mb-3 clearfix restaurant-detailed-star-rating">
                        <h6 class="mb-0">별점 평균</h6>
                        <div class="star-rating ml-auto">
                            <div class="d-inline-block h6 m-0">
	                            <c:forEach var="i" begin="1" end="5">
		                    		<c:if test="${vo.reviewRating>=i}">
		                        		<i class="feather-star text-warning"></i>
		                    		</c:if>
		                    		<c:if test="${vo.reviewRating<i}">
		                    			<i class="feather-star"></i>
		                    		</c:if>
		                    	</c:forEach>
                            </div>
                            <b class="text-black ml-2">${vo.reviewCount} 건의 리뷰</b>
                        </div>
                    </div>
                    <c:import url="/member/review/storeReview.do">
                    	<c:param name="storeNo" value="${vo.storeNo}"/>
                    	<c:param name="startIndex" value="1"/>
      					<c:param name="lastIndex" value="3"/>
      					<c:param name="totalRecords" value="${vo.reviewCount}" />
                    </c:import>
                </div>
                <!-- /Review -->
            </div>
            
            <!-- 장바구니 -->
            <div class="col-lg-4 pt-3" id="cartDiv"></div>
            <!-- /장바구니 -->
        </div>
    </div>
</html>
<%@include file="../../memInc/bottom.jsp" %>