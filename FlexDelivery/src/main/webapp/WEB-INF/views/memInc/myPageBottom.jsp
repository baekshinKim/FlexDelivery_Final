<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#outForm').submit(function(){
			var data=$(this).serializeArray();
			
			$.ajax({
				url:"<c:url value='/member/memberOut.do'/>",
				type:"post",
				data:data,
				dataType:"json",
				success:function(no){
					if(no==1){
						alert('회원 탈퇴처리 되었습니다.');
						location.href="<c:url value='/member/index.do'/>";
					}else if(no==2){
						alert('비밀번호가 일치하지 않습니다.');
					}else if(no==3){
						alert('회원 정보가 일치하지 않습니다.');
					}else{
						alert('회원 탈퇴처리에 실패하였습니다. 고객센터로 문의해주세요.');
					}
				},error:function(error){
					alert("error : "+error);
				}
				
			});
			$('#outModal').hide();
			event.preventDefault();
		})
	});
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
	                    <li><a href="${pageContext.request.contextPath}/member/login/logout.do">FLEX-OUT</a></li>
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
    <!-- modal창 -->
    <div class="modal fade" id="outModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">회원탈퇴</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <form name="outForm" id="outForm">
	                <div class="modal-body p-0">
	                    <div class="osahan-filter">
	                        <div class="filter">
	                            <div class="p-3 bg-light border-bottom">
	                                <h6 class="m-0">정말 FLEX-DELIVERY를 탈퇴하시겠어요?</h6>
	                            </div>
	                            <div class="custom-control border-bottom px-2 mt-3">
		                            <div class="form-group">
		                                <input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder="비밀번호를 입력해주세요">
		                            </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="modal-footer p-0 border-0">
	                    <div class="col-6 m-0 p-0">
	                        <button type="submit" class="btn btn-primary btn-lg btn-block">탈퇴하기</button>
	                    </div>
	                    <div class="col-6 m-0 p-0">
	                        <button type="button" class="btn border-top btn-lg btn-block" data-dismiss="modal">닫기</button>
	                    </div>
	                </div>
                </form>
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