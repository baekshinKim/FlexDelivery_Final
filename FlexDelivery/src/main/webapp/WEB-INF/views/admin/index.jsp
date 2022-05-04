<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminInc/top.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.0/assets/owl.carousel.min.css">
 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/adminResources/carouselTest.css"/>


<div class="blog-wrapper clearfix" style="padding-bottom: 5%; background-color: white;">
    <div class="container" style="min-width: -webkit-fill-available;">	
 
	<section class="cards">
	  <div class="owl-wrapper">
	    <div class="loop owl-carousel owl-theme">
	      
	      <article class="card" style="background-image: url(<c:url value='/resources/imgs/CommonImages/covid.png'/>);
	      	background-size: contain;background-repeat: no-repeat;background-color: #D5DCE2;background-position: center;">
	        <div class="card__content">
	          <h4 class="card__title"><span></span></h4>
	        </div>
	      </article>
	      
	      <article class="card" style="background-image: url(<c:url value='/resources/imgs/CommonImages/firstPrize.png'/>);
	      	background-size: contain;background-repeat: no-repeat;background-color: #E9F1FE;background-position: center;">
	        <div class="card__content">
	          <h4 class="card__title"><span></span></h4>
	        </div>
	      </article>
	      
	      <article class="card" style="background-image: url(<c:url value='/resources/imgs/CommonImages/newmember.png'/>);
	      	background-size: contain;background-repeat: no-repeat;background-color: white;background-position: center;">
	        <div class="card__content">
	          <h4 class="card__title"><span></span></h4>
	        </div>
	      </article>
	      
	      <article class="card" style="background-image: url(<c:url value='/resources/imgs/CommonImages/weatherMain.png'/>);
	      	background-size: contain;background-repeat: no-repeat;background-color: #DFF3F2;background-position: center;">
	        <div class="card__content">
	          <h4 class="card__title"><span></span></h4>
	        </div>
	      </article>
	    </div>
	  </div>
	</section>
	
	<script>
	var $owl = $('.loop');
	
	$owl.owlCarousel({
	    autoplay: true,
	    autoplayHoverPause: true,
	    autoplayTimeout: 3000,
	    autoplaySpeed: 800,
	    center: true,
	    items: 1.4,
	    stagePadding: 15,
	    loop: true,
	    margin: 15,
	  animateOut: 'slide-up',
	animateIn: 'slide-down',
	});
	</script>
	
	</div>
</div><!-- 캐러셀 -->
	
	
<div class="blog-wrapper clearfix" style="background-color: white;">
    <div class="container">
        <div class="row align-items-end" style="text-align: center;">
             
            <!-- Single Blog Area -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-catagory-area clearfix mb-100">
                    <img style="max-height: 440px;" src="${pageContext.request.contextPath}/resources/imgs/CommonImages/index11.jpg" alt="">
                    <!-- Catagory Title -->
                    <div class="catagory-title" style="display: -webkit-box;">
                        <a style="color: white; font-size: medium;">사업자 등록 미승인</a><br>
                        <a href="<c:url value='/admin/menu2/registList.do' />" style="font-size: xx-large;text-decoration: none;">${newRegister } 건</a>
                    </div>
                </div>
            </div>
            <!-- Single Blog Area -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-catagory-area clearfix mb-100">
                    <img style="max-height: 440px;" src="${pageContext.request.contextPath}/resources/imgs/CommonImages/index9.jpg" alt="">
                    <!-- Catagory Title -->
                    <div class="catagory-title" style="top: 27%; display: -webkit-box;">
                        <a style="color: white; font-size: medium;">점포 신규 미승인</a><br>
                        <a href="<c:url value='/admin/menu2/approvalList.do' />" style="font-size: xx-large;text-decoration: none;">${newStore } 건</a>
                    </div>
                    <!-- Catagory Title -->
                    <div class="catagory-title" style="top: 75%; display: -webkit-box;">
                        <a style="color: white; font-size: medium;">점포 변경 미승인</a><br>
                        <a href="<c:url value='/admin/menu2/editList.do' />" style="font-size: xx-large;text-decoration: none;">${changeStore } 건</a>
                    </div>
                </div>
            </div>
            <!-- Single Blog Area -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-catagory-area clearfix mb-100">
                    <img style="max-height: 440px;" src="${pageContext.request.contextPath}/resources/imgs/CommonImages/index5.jpg" alt="">
                    <!-- Catagory Title -->
                    <div class="catagory-title" style="display: -webkit-box;">
                        <a style="color: white; font-size: medium;">광고 신청</a><br>
                        <a href="<c:url value='/admin/menu2/storeAdList.do' />" style="font-size: xx-large;text-decoration: none;">${newAd } 건</a>
                    </div>
                </div>
            </div>
            <!-- Single Blog Area -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-catagory-area clearfix mb-100">
                    <img style="max-height: 440px;" src="${pageContext.request.contextPath}/resources/imgs/CommonImages/index7.jpg" alt="">
                    <!-- Catagory Title -->
                    <div class="catagory-title" style="display: -webkit-box;">
                        <a style="color: white; font-size: medium;">리뷰 신고</a><br>
                        <a href="<c:url value='/admin/menu1/reviewMgList.do' />" style="font-size: xx-large;text-decoration: none;">${newReview } 건</a>
                    </div>
                </div>
            </div>
            <!-- Single Blog Area -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-catagory-area clearfix mb-100">
                    <img style="max-height: 440px;" src="${pageContext.request.contextPath}/resources/imgs/CommonImages/index6.jpg" alt="">
                    <!-- Catagory Title -->
                    <div class="catagory-title" style="display: -webkit-box;">
                        <a style="color: white; font-size: medium;">1:1 문의 미답변</a><br>
	                    <c:if test="${empty askList}">
	                        <a href="<c:url value='/admin/menu5/oneToOne.do' />" style="font-size: xx-large;text-decoration: none;">
	                        	0 건</a>
	                    </c:if>
	                    <c:if test="${!empty askList}">
	                        <a href="<c:url value='/admin/menu5/oneToOne.do' />" style="font-size: xx-large;text-decoration: none;">
	                        	${cnt} 건 </a>
	                    </c:if>
                    </div>
                </div>
            </div>
            <!-- Single Blog Area -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-catagory-area clearfix mb-100">
                    <img style="max-height: 440px;" src="${pageContext.request.contextPath}/resources/imgs/CommonImages/index4.jpg" alt="">
                    <!-- Catagory Title -->
                    <div class="catagory-title" style="display: -webkit-box; top:27%;">
                        <a style="color: white; font-size: medium;">오늘 뭐 먹지?</a><br>
                        <a style="color: white; font-size: x-large;">${mVo.mCategoryName }</a>
                    </div>
                    <!-- Catagory Title -->
                    <div class="catagory-title" style="display: -webkit-box; top:75%;">
                        <a style="color: white; font-size: small; font-weight: 600;">추천 메뉴</a><br>
                        <c:if test="${empty foodList }">
	                        <a style="color: white; font-size: x-large; font-weight: bolder;">등록된 메뉴가 없어요😥</a>
                        </c:if>
                        <c:if test="${!empty foodList }">
                        	<c:forEach var="map" items="${foodList}">
	                        	<a style="color: white; font-size: medium; font-weight: bolder;">"${map['MENU_NAME'] }"</a>
                        	</c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
            
        </div>
    </div>

    <div class="container">
        <div class="row">

            <div class="col-12 col-md-6 col-lg-4">
                <div class="post-sidebar-area">

                    <!-- Widget Area -->
                    <div class="sidebar-widget-area">
                    	<div style="display: flex; align-items: center;">
                    		<div style="text-align: left; width: 60%;">
		                    	<a style="font-size: larger;font-weight: 600;">💬공지사항</a>
                    		</div>
                    		<div style="text-align: right; width: 40%;">
                    			<a href="<c:url value='/admin/menu3/notice.do' />"
                    				style="font-size: small; color: gray; text-decoration: none;">더보기</a>
                    		</div>
                    	</div>

                        <div class="widget-content">
                        	<hr>
                        	<c:if test="${empty nList }">	
	                            <!-- Single Blog Post -->
	                            <div class="single-blog-post d-flex align-items-center widget-post">
	                                <!-- Post Content -->
	                                <div class="post-content" style="margin-left: 5%;">
	                                    <h4><a class="post-headline">등록된 공지사항이 없어요.</a></h4>
	                                </div>
	                            </div>
                        	</c:if>

                        	<c:if test="${!empty nList }">
                        		<c:forEach var="vo" items="${nList }" varStatus="status" end="3">
		                            <!-- Single Blog Post -->
		                            <div class="single-blog-post d-flex align-items-center widget-post">
		                                <!-- Post Thumbnail -->
		                                <div class="post-thumbnail">
		                                    <img src="${pageContext.request.contextPath}/resources/imgs/NoticeEventImages/noticeDefault.jpg">
		                                </div>
		                                <!-- Post Content -->
		                                <div class="post-content">
		                                    <a class="post-tag">${vo.boardRegdate }</a>
		                                    <h4><a href="<c:url value='/admin/menu3/notice/detail.do?no=${vo.boardNo }'/>" 
		                                    	class="post-headline">${vo.boardTitle }</a></h4>
		                                </div>
		                            </div>
                        		</c:forEach>
                        	</c:if>

                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-12 col-md-6 col-lg-4">
                <div class="post-sidebar-area">
                    <!-- Widget Area -->
                    <div class="sidebar-widget-area">
						<div style="display: flex; align-items: center;">
                    		<div style="text-align: left; width: 60%;">
		                    	<a style="font-size: larger;font-weight: 600;">🎉이벤트</a>
                    		</div>
                    		<div style="text-align: right; width: 40%;">
                    			<a href="<c:url value='/admin/menu3/event.do' />"
                    				style="font-size: small; color: gray; text-decoration: none;">더보기</a>
                    		</div>
                   		</div>

                        <div class="widget-content">
							<hr>
                            <c:if test="${empty eList }">	
	                            <!-- Single Blog Post -->
	                            <div class="single-blog-post d-flex align-items-center widget-post">
	                                <!-- Post Content -->
	                                <div class="post-content" style="margin-left: 5%;">
	                                    <h4><a class="post-headline">등록된 이벤트가 없어요.</a></h4>
	                                </div>
	                            </div>
                        	</c:if>
							<c:if test="${!empty eList }">
                        		<c:forEach var="vo" items="${eList }" varStatus="status" end="3">
		                            <!-- Single Blog Post -->
		                            <div class="single-blog-post d-flex align-items-center widget-post">
		                                <!-- Post Thumbnail -->
		                                <div class="post-thumbnail">
		                                    <img src="${pageContext.request.contextPath}/resources/imgs/NoticeEventImages/${vo.boardThumbnail}" >
		                                </div>
		                                <!-- Post Content -->
		                                <div class="post-content">
		                                    <a class="post-tag">${vo.boardRegdate }</a>
		                                    <h4><a href="<c:url value='/admin/menu3/event/detail.do?no=${vo.boardNo }'/>" 
		                                    	class="post-headline">${vo.boardTitle }</a></h4>
		                                </div>
		                            </div>
                        		</c:forEach>
                        	</c:if>
                            
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-12 col-md-6 col-lg-4">
                <div class="post-sidebar-area">
                    <!-- Widget Area -->
                    <div class="sidebar-widget-area">
                   		<div style="display: flex; align-items: center;">
                    		<div style="text-align: left; width: 60%;">
		                    	<a style="font-size: larger;font-weight: 600;">🍯사장님꿀팁</a>
                    		</div>
                    		<div style="text-align: right; width: 40%;">
                    			<a href="<c:url value='/admin/menu3/honeytip.do' />"
                    				style="font-size: small; color: gray; text-decoration: none;">더보기</a>
                    		</div>
                   		</div>

                        <div class="widget-content">
							<hr>

                           <c:if test="${empty hList }">	
	                            <!-- Single Blog Post -->
	                            <div class="single-blog-post d-flex align-items-center widget-post">
	                                <!-- Post Content -->
	                                <div class="post-content" style="margin-left: 5%;">
	                                    <h4><a class="post-headline">등록된 사장님꿀팁이 없어요.</a></h4>
	                                </div>
	                            </div>
                        	</c:if>
							<c:if test="${!empty hList }">
                        		<c:forEach var="vo" items="${hList }" varStatus="status" end="3">
		                            <!-- Single Blog Post -->
		                            <div class="single-blog-post d-flex align-items-center widget-post">
		                                <!-- Post Thumbnail -->
		                                <div class="post-thumbnail">
		                                    <img src="${pageContext.request.contextPath}/resources/imgs/HoneytipImages/${vo.honeytipThumbnail}" >
		                                </div>
		                                <!-- Post Content -->
		                                <div class="post-content">
		                                    <a class="post-tag">${vo.honeytipRegdate }</a>
		                                    <h4><a href="<c:url value='/admin/menu3/honeytip/detail.do?no=${vo.honeytipNo }'/>" 
		                                    	class="post-headline">${vo.honeytipTitle }</a></h4>
		                                </div>
		                            </div>
                        		</c:forEach>
                        	</c:if>
                            
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>
<!-- ##### Blog Wrapper End ##### -->


<%@ include file="../adminInc/bottom.jsp" %>

