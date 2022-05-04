<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../memInc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	function cartList(){
		var data="memberNo="+${sessionScope.memberNo};
		
		$.ajax({
			url:"<c:url value='/member/cart/cartList.do'/>",
			type:"get",
			data:data,
			success:function(map){
				var str="<div class='osahan-cart-item rounded rounded shadow-sm overflow-hidden bg-white'>";
				if(map.list.length>0){
				    str+="<div class='d-flex border-bottom osahan-cart-item-profile bg-white p-3'>";
				    str+="<a href='<c:url value='/member/store/storeDetail.do?storeNo="+map.vo.storeNo+"'/>'><img alt='logo' src='<c:url value='/resources/imgs/StoresImages/"+map.vo.storeLogo+"'/>' class='mr-3 rounded-circle img-fluid' style='max-width: 41px;max-height: 41px;'></a>";
				    str+="<div class='d-flex flex-column'>";
				    str+="<h6 class='mb-1 font-weight-bold'><a href='<c:url value='/member/store/storeDetail.do?storeNo="+map.vo.storeNo+"'/>'>"+map.vo.storeName+"</a></h6>";
				    str+="<p class='mb-0 small text-muted'><i class='feather-map-pin'></i>"+map.vo.storeAddress+" "+map.vo.storeAddressDetail+"</p></div></div>";
				}
		   		var buyPrice=0;
		   		var totalPrice=0;
		   		var delivery=0;
				if(map.list.length<1){
		    		str+="<div class='gold-members d-flex align-items-center justify-content-between px-3 py-2 border-bottom'>";
	    			str+="<img class='img-fluid mx-auto' style='inline-size:40em' alt='장바구니 상품 없음' src='<c:url value='/resources/imgs/TUNG.png'/>'>";
		    		str+="</div>";
		    	}else{
			    	str+="<div class='bg-white border-bottom py-2 cartDiv'>";
		    		for (var i = 0; i < map.list.length; i++) {
		    			var sum=(map.list[i].menuPrice+map.list[i].mOptionPrice)*map.list[i].cartQty;
		    			buyPrice=buyPrice+sum;
		    			if(i==map.list.length-1){
					        str+="<div class='gold-members d-flex align-items-center justify-content-between px-3 py-2'>";
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
		    			}else{
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
						str+="<a class='btn btn-primary btn-block btn-lg' href='<c:url value='/member/order/orderSheet.do'/>'>ORDER "+totalPrice+"원<i class='feather-arrow-right'></i></a>";
			   		}else if(map.vo.sStatusNo==1 || map.vo.sStatusNo==3){
				    	str+="<a class='btn btn-dark btn-block btn-lg disabled' href='#' >지금은 준비중이에요</a>";
			   		}
			   	}
			    str+="</div></div>";
			    
			    $('.cartDiv').html(str);
			},
			error:function(){
				alert("error!");
			}
		})
	};

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
		<h4 class="font-weight-bold m-0 text-white">CART</h4>
	</div>
</div>	
<div class="container position-relative">
	<div class="py-5 row">
		<div class="col-md-12 cartDiv">
			<div class="osahan-cart-item rounded rounded shadow-sm overflow-hidden bg-white">
				<c:if test="${!empty list}">
				    <div class="d-flex border-bottom osahan-cart-item-profile bg-white p-3">
				    	<a href="<c:url value='/member/store/storeDetail.do?storeNo=${vo.storeNo}'/>"><img alt="osahan" src="<c:url value='/resources/imgs/StoresImages/${vo.storeLogo}'/>" class="mr-3 rounded-circle img-fluid" style="max-width: 41px;max-height: 41px;"></a>
				        <div class="d-flex flex-column">
				            <h6 class="mb-1 font-weight-bold"><a href="<c:url value='/member/store/storeDetail.do?storeNo=${vo.storeNo}'/>">${vo.storeName}</a></h6>
				            <p class="mb-0 small text-muted"><i class="feather-map-pin"></i>${vo.storeAddress} ${vo.storeAddressDetail}</p>
				        </div>
				    </div>
				</c:if>
				<c:set var="buyPrice" value="0" />
				<c:set var="totalPrice" value="0" />
				<c:set var="delivery" value="0" />
			   	<c:if test="${empty list}">
			   		<div class="gold-members d-flex align-items-center justify-content-between px-3 py-2 border-bottom">
			   			<img class="img-fluid mx-auto" alt="장바구니 상품 없음" style="inline-size:40em" src="<c:url value='/resources/imgs/tung2.png'/>">
			   		</div>
			   	</c:if>
			   	<c:if test="${!empty list}">
				    <div class="bg-white border-bottom py-2">
			    		<c:forEach var="cVo" items="${list}" varStatus="i" >
				    		<c:set var="sum" value="${(cVo.menuPrice+cVo.mOptionPrice)*cVo.cartQty}" />
			    			<c:set var="buyPrice" value="${buyPrice+sum}" />
			    			<c:if test="${i.last}">
						        <div class="gold-members d-flex align-items-center justify-content-between px-3 py-2">
						            <div class="media align-items-center">
						                <div class="mr-3 text-danger" style='font-size:18px'><a href='' onclick="deletecart(${cVo.cartNo})">&times;</a></div>
						                <input type="hidden" value="${cVo.cartNo}" name="cartNoHidden">
						                <div class="media-body">
						                    <p class="m-0">${cVo.menuName}
						                    <span class="font-monospace text-dark"><small><br>${cVo.mOptionName}</small></span>
						                    </p>
						                </div>
						            </div>
						            <div class="d-flex align-items-center">
							            <p class="text-gray mb-0 float-right mr-3 text-muted small">${(cVo.menuPrice+cVo.mOptionPrice)*cVo.cartQty}원</p>
						                <span class="count-number float-right">
						                <button type="button" class="btn-sm left dec btn btn-outline-secondary" onclick="minus(${cVo.cartNo},${cVo.cartQty})"> <i class="feather-minus"></i> </button>
						                <input class="count-number-input" type="text" readonly value="${cVo.cartQty}">
						                <button type="button" class="btn-sm right inc btn btn-outline-secondary" onclick="plus(${cVo.cartNo},${cVo.cartQty})"> <i class="feather-plus"></i> </button>
						                </span>
						            </div>
						        </div>
			    			</c:if>
			    			<c:if test="${!i.last}">
						        <div class="gold-members d-flex align-items-center justify-content-between px-3 py-2 border-bottom">
						            <div class="media align-items-center">
						                <div class="mr-3 text-danger" style='font-size:18px'><a href='' onclick="deletecart(${cVo.cartNo})">&times;</a></div>
						                <input type="hidden" value="${cVo.cartNo}" name="cartNoHidden">
						                <div class="media-body">
						                    <p class="m-0">${cVo.menuName}
						                    <span class="font-monospace text-dark"><small><br>${cVo.mOptionName}</small></span>
						                    </p>
						                </div>
						            </div>
						            <div class="d-flex align-items-center">
							            <p class="text-gray mb-0 float-right mr-3 text-muted small">${(cVo.menuPrice+cVo.mOptionPrice)*cVo.cartQty}원</p>
						                <span class="count-number float-right">
						                <button type="button" class="btn-sm left dec btn btn-outline-secondary" onclick="minus(${cVo.cartNo},${cVo.cartQty})"> <i class="feather-minus"></i> </button>
						                <input class="count-number-input" type="text" readonly value="${cVo.cartQty}">
						                <button type="button" class="btn-sm right inc btn btn-outline-secondary" onclick="plus(${cVo.cartNo},${cVo.cartQty})"> <i class="feather-plus"></i> </button>
						                </span>
						            </div>
						        </div>
					        </c:if>
			    		</c:forEach>
			    	</div>
				    <c:if test="${buyPrice<vo.storeMinPrice}">
				    	<c:set var="delivery" value="3000" />
				    </c:if>
				    <c:set var="totalPrice" value="${buyPrice+delivery}" />
				    <div class="bg-white p-3 clearfix border-bottom">
				        <p class="mb-1">총합 <span class="float-right text-dark" id="cartTotalPrice">${buyPrice} 원</span></p>
				        <p class="mb-1">배달팁<span class="text-info ml-1"><i class="feather-info"></i></span><span class="float-right text-dark">${delivery} 원</span></p>
				        <hr>
				        <h6 class="font-weight-bold mb-0">TO PAY <span class="float-right">${totalPrice}원</span></h6>
				    </div>
			   	</c:if>
			  	
			    <div class="p-3">
			    	<c:if test="${empty list}">
				        <a class="btn btn-dark btn-block btn-lg disabled" href="#" >장바구니에 상품이 없어요</a>
			    	</c:if>
			    	<c:if test="${!empty list}">
					   	<c:if test="${vo.sStatusNo==2}">
					        <a class="btn btn-primary btn-block btn-lg" href="<c:url value='/member/order/orderSheet.do'/>" >ORDER ${totalPrice}원<i class="feather-arrow-right"></i></a>
					   	</c:if>
					   	<c:if test="${vo.sStatusNo==1 || vo.sStatusNo==3}">
					        <a class="btn btn-dark btn-block btn-lg disabled" href="#" >지금은 준비중이에요</a>
					   	</c:if>
			    	</c:if>
			   	</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../../../memInc/bottom.jsp" %>