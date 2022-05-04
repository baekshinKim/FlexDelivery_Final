<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../memInc/top.jsp"%>
<div class="osahan-home-page">
	<div class="bg-primary p-3 d-none">
	    <div class="text-white">
	        <div class="title d-flex align-items-center">
	            <a class="toggle" href="<c:url value='/resources/memberResources/#' />">
	                <span></span>
	            </a>
	            <h4 class="font-weight-bold m-0 pl-5">Flex-Delivery</h4>
	        </div>
	    </div>
	</div>
	
	<!-- 이벤트출력 -->
	<div class="bg-white">
	    <div class="container">
	    	<div class="pt-4 pb-2 title d-flex align-items-center">
	        	<h5 class="m-0">Event & Notice</h5>
	    	</div>
	    	<c:set var="no" property="${vo.lCategoryNo }" />
	    	
	        <div class="offer-slider">
	        	<!-- 공지사항 forEach -->
	        	<c:forEach var="bVo" items="${bList}">
		            <div class="cat-item px-1 py-3" style="text-align: center">
		                <a class="d-block text-center shadow-sm" href="<c:url value='/member/board/detail.do?boardNo=${bVo.boardNo}'/>" >
		                    <img alt="#" src="<c:url value='/resources/imgs/NoticeEventImages/${bVo.boardThumbnail}' />" class="img-fluid rounded" style="height: 200px;">
		                </a>
		            </div>
		            <!-- /공지사항 -->
	            </c:forEach>
	        </div>
	    </div>
	</div>
        <!-- 대분류카테고리 -->
    <div class="bg-white">
		<div class="container">
			<div class="pt-4 pb-2 title d-flex align-items-center">
				<h5 class="m-0">Menu</h5>
			</div>
			<div class="row">
				<c:forEach var="vo" items="${list}">
					<div class="col-sm-3 col-4 pb-3">
						<a class="bg-white rounded d-block p-2 text-center shadow-sm mb-2" href="<c:url value='/member/store/storeList.do?lCategoryNo=${vo.lCategoryNo}' />" style="color:gray;">
							<img alt="이미지 추가예정" src="<c:url value='/resources/imgs/LargeCategoryImages/${vo.lCategoryFilename }'/>" class="img-fluid mb-2">
							<h6 class="m-0">${vo.lCategoryName}</h6>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div> <!-- 대분류 끝 -->
    <div class="container">
        <!-- 뭐넣을지고민중 -->
        
        <%-- <div class="pt-4 pb-2 title d-flex align-items-center">
            <h5 class="m-0">Trending this week</h5>
        </div>
        <!-- slider -->
        <div class="trending-slider">
            <div class="osahan-slider-item">
                <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
                    <div class="list-card-image">
                        <div class="star position-absolute"><span class="badge badge-success"><i class="feather-star"></i> 3.1 (300+)</span></div>
                        <div class="favourite-heart text-danger position-absolute"><a href="<c:url value='/resources/memberResources/#' />"><i class="feather-heart"></i></a></div>
                        <div class="member-plan position-absolute"><span class="badge badge-dark">Promoted</span></div>
                        <a href="<c:url value='/resources/memberResources/restaurant.html' />">
                            <img alt="#" src="<c:url value='/resources/memberResources/img/trending1.png' />" class="img-fluid item-img w-100">
                        </a>
                    </div>
                    <div class="p-3 position-relative">
                        <div class="list-card-body">
                            <h6 class="mb-1"><a href="<c:url value='/resources/memberResources/restaurant.html' />" class="text-black">Famous Dave's Bar-B-Que
                          </a>
                            </h6>
                            <p class="text-gray mb-3">Vegetarian • Indian • Pure veg</p>
                            <p class="text-gray mb-3 time"><span class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i class="feather-clock"></i> 15–30 min</span> <span class="float-right text-black-50"> $350 FOR TWO</span></p>
                        </div>
                        <div class="list-card-badge">
                            <span class="badge badge-danger">OFFER</span> <small> Use Coupon OSAHAN50</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="osahan-slider-item">
                <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
                    <div class="list-card-image">
                        <div class="star position-absolute"><span class="badge badge-success"><i class="feather-star"></i> 3.1 (300+)</span></div>
                        <div class="favourite-heart text-danger position-absolute"><a href="<c:url value='/resources/memberResources/#' />"><i class="feather-heart"></i></a></div>
                        <div class="member-plan position-absolute"><span class="badge badge-dark">Promoted</span></div>
                        <a href="<c:url value='/resources/memberResources/restaurant.html' />">
                            <img alt="#" src="<c:url value='/resources/memberResources/img/trending2.png' />" class="img-fluid item-img w-100">
                        </a>
                    </div>
                    <div class="p-3 position-relative">
                        <div class="list-card-body">
                            <h6 class="mb-1"><a href="<c:url value='/resources/memberResources/restaurant.html' />" class="text-black">Thai Famous Cuisine</a></h6>
                            <p class="text-gray mb-3">North Indian • Indian • Pure veg</p>
                            <p class="text-gray mb-3 time"><span class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i class="feather-clock"></i> 30–35 min</span> <span class="float-right text-black-50"> $250 FOR TWO</span></p>
                        </div>
                        <div class="list-card-badge">
                            <span class="badge badge-success">OFFER</span> <small>65% off</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="osahan-slider-item">
                <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
                    <div class="list-card-image">
                        <div class="star position-absolute"><span class="badge badge-success"><i class="feather-star"></i> 3.1 (300+)</span></div>
                        <div class="favourite-heart text-danger position-absolute"><a href="<c:url value='/resources/memberResources/#' />"><i class="feather-heart"></i></a></div>
                        <div class="member-plan position-absolute"><span class="badge badge-dark">Promoted</span></div>
                        <a href="<c:url value='/resources/memberResources/restaurant.html' />">
                            <img alt="#" src="<c:url value='/resources/memberResources/img/trending3.png' />" class="img-fluid item-img w-100">
                        </a>
                    </div>
                    <div class="p-3 position-relative">
                        <div class="list-card-body">
                            <h6 class="mb-1"><a href="<c:url value='/resources/memberResources/restaurant.html' />" class="text-black">The osahan Restaurant
                          </a>
                            </h6>
                            <p class="text-gray mb-3">North • Hamburgers • Pure veg</p>
                            <p class="text-gray mb-3 time"><span class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i class="feather-clock"></i> 15–25 min</span> <span class="float-right text-black-50"> $500 FOR TWO</span></p>
                        </div>
                        <div class="list-card-badge">
                            <span class="badge badge-danger">OFFER</span> <small>65% OSAHAN50</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="osahan-slider-item">
                <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
                    <div class="list-card-image">
                        <div class="star position-absolute"><span class="badge badge-success"><i class="feather-star"></i> 3.1 (300+)</span></div>
                        <div class="favourite-heart text-danger position-absolute"><a href="<c:url value='/resources/memberResources/#' />"><i class="feather-heart"></i></a></div>
                        <div class="member-plan position-absolute"><span class="badge badge-dark">Promoted</span></div>
                        <a href="<c:url value='/resources/memberResources/restaurant.html' />">
                            <img alt="#" src="<c:url value='/resources/memberResources/img/trending2.png' />" class="img-fluid item-img w-100">
                        </a>
                    </div>
                    <div class="p-3 position-relative">
                        <div class="list-card-body">
                            <h6 class="mb-1"><a href="<c:url value='/resources/memberResources/restaurant.html' />" class="text-black">Thai Famous Cuisine</a></h6>
                            <p class="text-gray mb-3">North Indian • Indian • Pure veg</p>
                            <p class="text-gray mb-3 time"><span class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i class="feather-clock"></i> 30–35 min</span> <span class="float-right text-black-50"> $250 FOR TWO</span></p>
                        </div>
                        <div class="list-card-badge">
                            <span class="badge badge-success">OFFER</span> <small>65% off</small>
                        </div>
                    </div>
                </div>
            </div>
        </div> --%>
    </div>
</div>
<%@include file="../memInc/bottom.jsp"%>
