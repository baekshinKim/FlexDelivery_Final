<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/paging.js'/>"></script>
<script type="text/javascript">
	var totalCount=0;
	
	$(function(){		
		$('.addressSelected').hide();
		$('#modalAddressDetail').hide();
		
		$('#submit').click(function(){
			if($('#dong').val().length<1){
				alert('지역명을 입력하세요');
				$('#dong').focus();
				return false;
			}
			
			send(1);
			
			event.preventDefault();
		});
		
		$('.modal').on('hidden.bs.modal',function(){
			$('#divCount').html("");
			$('#divZip').html("");
			$('#divPage').html("");
			$('input[name=dong]').val("");
			$('#modalAddressDetail').hide();
			$('#modalAddressDetail').val("");
			$('#selectAddress').html("");
			$('.addressSelected').hide();
		});
		
		
		$('#applyBt').click(function(){
			if($('#modalAddressDetail').val().length<1){
				alert('상세주소를 입력하세요');
				return false;
			}
			
			var address=$('#modalAddress').val();
			var addressDetail=$('#modalAddressDetail').val();
			$('#bodyAddress').html(address);
			$('#bodyAddressDetail').html(addressDetail);
			$('#ordersAddress').val(address+" "+addressDetail);
		})
	});
	
	function send(curPage){
		$('#currentPage').val(curPage);
		
		$.ajax({
			url:"<c:url value='/member/register/ajaxZipcode.do'/>",
			type:"post",
			data: $('#frmZip').serializeArray(),
			dataType:"xml",
			success:function(xmlStr){
				//alert(xmlStr);
				console.log(xmlStr);
				totalCount=$(xmlStr).find('totalCount').html();
				var errorCode=$(xmlStr).find('errorCode').text();
				var errorMessage=$(xmlStr).find('errorMessage').text();
				
				if(errorCode!=0){
					alert(errorCode +" => " + errorMessage);
				}else{
					if(xmlStr!=null){
						makeList(xmlStr);
						pageMake();
					}
				}
			},
			error:function(xhr, status, error){
				alert("error! : " + error);
			}
		});
	}
	
	function makeList(xmlStr){
		if(totalCount==0){
			$('#divCount').html("");
			$('#divZip').html("<p style='text-align:center'>검색된 내용이 없습니다.</p>");
			return;
		}	
		
		$('#divCount').html("<p class='text-muted'>도로명 주소 검색 결과 ("+ totalCount +"건)</p>");
		
		var str="<table class='box2 table'>";
		str+="<thead><tr><th style='width:20%'>우편번호</th>";
		str+="<th style='width:80%;text-align:center'>도로명 주소</th></tr></thead>";
		str+="<tbody>"
		$(xmlStr).find('juso').each(function(idx, item){
			var roadAddr = $(this).find("roadAddr").text();
			var zipNo = $(this).find("zipNo").text();
			
			str+="<tr>";
			str+="<td>"+zipNo+"</td>";
			str+="<td>"
			str+="<a href='#' onclick='setAddress(\""+roadAddr+"\")'>"; 
			str+= roadAddr +"</a></td></tr>";			
		});//each
		str+="</tbody></table>";
		
		$('#divZip').html(str);
	}
	
	function pageMake(){
		var blockSize=10;
		pagination($('#currentPage').val(), $('#countPerPage').val(),
				blockSize, totalCount);	
		
		var str="<nav><ul class='pagination pagination-sm justify-content-center'>";
		
		//이전 블럭
		if( firstPage>1 ){	
			str+="<li class='page-item'><a href='#' class='page-link' onclick='send("+(firstPage-1)+")'><span aria-hidden='true'>&laquo;</span></a></li>";			
		}else{
			str+="<li class='page-item disabled'><a href='#' class='page-link' onclick='send("+(firstPage-1)+")'><span aria-hidden='true'>&laquo;</span></a></li>";			
		}
						
		//[1][2][3][4][5][6][7][8][9][10]
		for(var i=firstPage;i<=lastPage;i++){
			if(i==currentPage){
				str+="<li class='page-item active'><span class='page-link'>"+i+"</span></li>";			
			}else{
				str+="<li class='page-item'><a class='page-link' href='#' onclick='send("+i+")'>"+i+"</a></li>";
			}
		}//for
	
		//다음 블럭으로 이동
		if(lastPage < totalPage){
			str+="<li class='page-item'><a href='#' class='page-link' onclick='send("+(lastPage+1)+")'><span aria-hidden='true'>&raquo;</span></a></li>";
		}else{
			str+="<li class='page-item disabled'><a href='#' class='page-link' onclick='send("+(lastPage+1)+")'><span aria-hidden='true'>&raquo;</span></a></li>";
		}
		str+="</ul></nav>";
		$('#divPage').html(str);
	}
	
	function setAddress(roadAddr){
		$('.addressSelected').show();
		$('#selectAddress').html(roadAddr);
		$('#modalAddress').val(roadAddr);
		$('#modalAddressDetail').show();
	}
	
</script>
 <!-- Footer -->
    <div class="osahan-menu-fotter fixed-bottom bg-white px-3 py-2 text-center d-none">
        <div class="row">
            <div class="col selected">
                <a href="${pageContext.request.contextPath}/member/index.do" class="text-danger small font-weight-bold text-decoration-none">
                    <p class="h4 m-0"><i class="feather-home text-danger"></i></p>
                    Home
                </a>
            </div>
            <div class="col">
                <a href="${pageContext.request.contextPath}/member/today/todayList.do" class="text-dark small font-weight-bold text-decoration-none">
                    <p class="h4 m-0"><i class="feather-check-circle"></i></p>
                    	오늘뭐먹지?
                </a>
            </div>
            <div class="col bg-white rounded-circle mt-n4 px-3 py-2">
                <div class="bg-danger rounded-circle mt-n0 shadow">
                    <a href="${pageContext.request.contextPath}/member/cart/cartView.do" class="text-white small font-weight-bold text-decoration-none">
                        <i class="feather-shopping-cart"></i>
                    </a>
                </div>
            </div>
            <div class="col">
                <a href="${pageContext.request.contextPath}/member/mypage/myLikeStore.do" class="text-dark small font-weight-bold text-decoration-none">
                    <p class="h4 m-0"><i class="feather-heart"></i></p>
                    	찜한가게
                </a>
            </div>
            <div class="col">
                <a href="${pageContext.request.contextPath}/member/mypage/main.do" class="text-dark small font-weight-bold text-decoration-none">
                    <p class="h4 m-0"><i class="feather-user"></i></p>
                    MyFlex
                </a>
            </div>
        </div>
    </div>
    
    <!-- footer -->
    <footer class="section-footer border-top bg-dark">
        <div class="container">
            <section class="footer-top padding-y py-5">
                <div class="row">
                    <aside class="col-md-4 footer-about">
                        <article class="d-flex pb-3">
                            <div><img alt="#" src="${pageContext.request.contextPath}/resources/memberResources/img/logo_web.png" class="logo-footer mr-3"></div>
                            <div>
                                <h6 class="title text-white">About Us</h6>
								<!-- 플렉스 딜리버리 사업자 소개 Start-->
								<p class="text-muted">
									<b>플렉스 딜리버리 FLEX DELIVERY</b><a href="<c:url value='/admin/login/login.do'/>">&nbsp;</a><br>
									<b>대표자:</b> 윤희영 | 김정만 | 김백신 | 박수정 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 박지안 | 양현준 | 이소정 <br><b>본사 :</b> 경상북도 울릉군 울릉읍 <a href="https://dokdo.mofa.go.kr/kor/" style="text-decoration: none">독도</a>안용복길 3<br><b>대표전화:</b> 054-0115-0219<br><b>대표메일:</b> FlexDeliveryCEO@flexdelivery.com
								</p>
                            </div>
                        </article>
                    </aside>
                    <aside class="col-sm-3 col-md-2 text-white">
                        <h6 class="title">Main</h6>
                        <ul class="list-unstyled hov_footer">
                            <li> <a href="${pageContext.request.contextPath}/member/index.do" class="text-muted">Home</a></li>
                            <c:if test="${empty sessionScope.memberId}">
                            	<li> <a href="${pageContext.request.contextPath}/member/login/memberLogin.do" class="text-muted">Flex-ON</a></li>
                            	<li> <a href="${pageContext.request.contextPath}/member/register/register.do" class="text-muted">Flex-Register</a></li>
                            </c:if>
                            <c:if test="${!empty sessionScope.memberId}">
                            	<li> <a href="${pageContext.request.contextPath}/member/login/logout.do" class="text-muted">Flex-OUT</a></li>
                            	<li> <a href="${pageContext.request.contextPath}/member/register/memberEdit.do" class="text-muted">회원정보수정</a></li>
                            </c:if>
                        </ul>
                    </aside>
                    <aside class="col-sm-3 col-md-2 text-white">
                        <h6 class="title"><a href="${pageContext.request.contextPath}/member/mypage/main.do" class="text-muted">MyFlex</a></h6>
                        <ul class="list-unstyled hov_footer">
                            <li> <a href="${pageContext.request.contextPath}/member/mypage/myCoupon.do" class="text-muted">내 쿠폰함</a></li>
                            <li> <a href="${pageContext.request.contextPath}/member/gift/myGift.do" class="text-muted">내 선물</a></li>
                            <li> <a href="${pageContext.request.contextPath}/member/mypage/myLikeStore.do" class="text-muted">찜한가게</a></li>
                            <li> <a href="${pageContext.request.contextPath}/member/review/myReview.do" class="text-muted">내 리뷰</a></li>
                        </ul>
                    </aside>
                    <aside class="col-sm-3  col-md-2 text-white">
                        <h6 class="title">Order</h6>
                        <ul class="list-unstyled hov_footer">
                            <li> <a href="${pageContext.request.contextPath}/member/order/orderList.do" class="text-muted"> 주문내역 </a></li>
                            <li> <a href="${pageContext.request.contextPath}/member/cart/cartView.do" class="text-muted"> 장바구니 </a></li>
                            <li> <a href="${pageContext.request.contextPath}/member/today/todayList.do" class="text-muted"> 오늘뭐먹지 </a></li>
                        </ul>
                    </aside>
                    <aside class="col-sm-3  col-md-2 text-white">
                        <h6 class="title">Flex-Activity</h6>
                        <ul class="list-unstyled hov_footer">
                            <li> <a href="${pageContext.request.contextPath}/member/board/board.do" class="text-muted">알림광장</a></li>
                            <li> <a href="${pageContext.request.contextPath}/member/addOn/addOn.do" class="text-muted">FLEX-OFFERS</a></li>
                            <li> <a href="${pageContext.request.contextPath}/member/ask/askList.do" class="text-muted">1:1문의</a></li>
                            <li> <a href="${pageContext.request.contextPath}/member/faq/faqList.do" class="text-muted">자주묻는질문</a></li>
                        </ul>
                    </aside>
                </div>
                <!-- row.// -->
            </section>
            <!-- footer-top.// -->
        </div>
        <!-- //container -->
        <section class="footer-copyright border-top py-3 bg-light">
            <div class="container d-flex align-items-center">
                <p class="mb-0"> © Flex Delivery Corp. </p>
            </div>
        </section>
    </footer>
    <nav id="main-nav">
        <ul class="second-nav">
            <li><a href="${pageContext.request.contextPath}/member/index.do"><i class="feather-home mr-2"></i>홈</a></li>
            <li><a href="${pageContext.request.contextPath}/member/order/orderList.do"><i class="feather-list mr-2"></i>주문내역</a></li>
            <li>
                <c:if test="${empty sessionScope.memberId}">
                	<a href="${pageContext.request.contextPath}/member/login/memberLogin.do"><i class="feather-user mr-2"></i>로그인하세요</a>
	                <ul>
	                    <li><a href="${pageContext.request.contextPath}/member/register/register.do">회원가입</a></li>
	                </ul>
                </c:if>
                <c:if test="${!empty sessionScope.memberId}">
                	<a href="${pageContext.request.contextPath}/member/mypage/main.do"><i class="feather-user mr-2"></i>MyFlex</a>
	                <ul>
	                    <li><a href="${pageContext.request.contextPath}/member/mypage/myCoupon.do">쿠폰함</a></li>
	                    <li><a href="${pageContext.request.contextPath}/member/gift/myGift.do">선물함</a></li>
	                    <li><a href="${pageContext.request.contextPath}/member/mypage/myLikeStore.do">찜한가게</a></li>
	                    <li><a href="${pageContext.request.contextPath}/member/review/myReview.do">내 리뷰관리</a></li>
	                    <li><a href="${pageContext.request.contextPath}/member/loing/logout.do">FLEX-OUT</a></li>
	                </ul>
                </c:if>
            </li>
            <li>
                <a><i class="feather-map-pin mr-2"></i>점포조회</a>
                <c:import url="/member/sidebarList.do" />
            </li>
            <li><a href="${pageContext.request.contextPath}/member/addOn/addOn.do"><i class="feather-award mr-2"></i>FLEX-OFFERS</a></li>
            <li><a href="${pageContext.request.contextPath}/member/board/board.do"><i class="feather-user mr-2"></i>알림광장</a></li>
            <li><a href="${pageContext.request.contextPath}/member/today/todayList.do"><i class="feather-check-circle mr-2"></i>오늘뭐먹지</a></li>
            <li>
                <a><i class="feather-link mr-2"></i>Contact Us</a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/admin/index.do">사장님 사이트</a></li>
                    <li data-nav-custom-content>
                        <div class="custom-message">
                            	지금 바로 Flex-Delivery에 입점신청해 사장님이 되어보세요!
                        </div>
                    </li>
                </ul>
            </li>
        </ul>
        <ul class="bottom-nav">
            <li class="email">
                <a class="text-danger" href="${pageContext.request.contextPath}/member/index.do">
                    <p class="h5 m-0"><i class="feather-home text-danger"></i></p>
                    Home
                </a>
            </li>
            <li class="github">
                <a href="${pageContext.request.contextPath}/member/faq/faqList.do">
                    <p class="h5 m-0"><i class="feather-message-circle"></i></p>
                    FAQ
                </a>
            </li>
            <c:if test="${!empty sessionScope.memberId}">
	            <li class="ko-fi">
	                <a href="${pageContext.request.contextPath}/member/login/logout.do">
	                    <p class="h5 m-0"><i class="feather-log-out"></i></p>
	                    Flex-Out
	                </a>
	            </li>
            </c:if>
            <c:if test="${empty sessionScope.memberId}">
            	<li class="ko-fi">
	                <a href="${pageContext.request.contextPath}/member/login/memberLogin.do">
	                    <p class="h5 m-0"><i class="feather-log-in"></i></p>
	                    Flex-On
	                </a>
	            </li>
            </c:if>
        </ul>
    </nav>
    <div class="modal fade" id="addressModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">도로명 주소 검색</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body p-0">
                    <div class="osahan-filter">
                        <div class="filter col-lg-10 mx-auto">
                        	<br>
							<p>도로명주소, 건물명 또는 지번을 입력하세요</p>
							<p class="blue text-muted">검색어 예 : 도로명(반포대로 58), 건물명(독립 기념관), 지번(삼성동 25)</p>
							<form name="frmZipcode" id="frmZip" method="post">
								<input type="hidden" name="currentPage" id="currentPage" value="1"/> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
								<input type="hidden" name="countPerPage" id="countPerPage" value="6"/><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) --> 
								<input type="hidden" name="confmKey" id="confmKey" 
								 value="U01TX0FVVEgyMDE3MTIxODE3Mzc0MTEwNzU1Njg="/><!-- 요청 변수 설정 (승인키) -->
								
								<label for="dong">지역명 : </label> 
								<div class="input-group mb-3">
									<input type="text" name="dong" id="dong" style="ime-mode: active" class="form-control"> 
									<span class="input-group-btn">
								        <button class="btn btn-default" type="button" id="submit">검색</button>
								    </span>
							    </div>
							</form>
							<div id="divCount"></div>
							<div id="divZip"></div>
							<input type="hidden" id="modalAddress">
							<p class="blue text-muted addressSelected">선택주소 : <span class="blue text-muted addressSelected" id="selectAddress"></span></p>
							<input type="text" id="modalAddressDetail" class="form-control" placeholder="상세주소를 입력하세요">
							<br>
							<hr>
                        </div>
						<div id="divPage" class="mx-auto"></div>
                    </div>
                </div>
                <div class="modal-footer p-0 border-0">
                    <div class="col-6 m-0 p-0">
                        <button type="button" class="btn btn-primary btn-lg btn-block" data-dismiss="modal" id="applyBt">Apply</button>
                    </div>
                    <div class="col-6 m-0 p-0">
                        <button type="button" class="btn border-top btn-lg btn-block" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/memberResources/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/memberResources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- slick Slider JS-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/memberResources/vendor/slick/slick.min.js"></script>
    <!-- Sidebar JS-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/memberResources/vendor/sidebar/hc-offcanvas-nav.js"></script>
    <!-- Custom scripts for all pages-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/memberResources/js/osahan.js"></script>
</body>
</html>