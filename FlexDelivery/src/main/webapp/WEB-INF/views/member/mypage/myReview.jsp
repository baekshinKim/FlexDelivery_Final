<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp"%>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	
	$(document).on('click','.delBt',function(){
		 if(!confirm("리뷰 삭제 시 다시 작성이 불가능합니다. 삭제하시겠습니까?")){
			event.preventDefault(); 
		 }
	});	
})
</script>
<div class="osahan-profile">
    <div class="d-none">
        <div class="bg-primary border-bottom p-3 d-flex align-items-center">
            <a class="toggle togglew toggle-2" href="#"><span></span></a>
            <h4 class="font-weight-bold m-0 text-white">My Review</h4>
        </div>
    </div>

     <!-- profile -->
     <div class="container position-relative">
         <div class="py-5 osahan-profile row">
         <!-- 사이드바 -->
             <div class="col-md-12 mb-12">
	<c:if test="${empty list}">
		<div class="bg-white p-3 mb-3 restaurant-detailed-ratings-and-reviews shadow-sm rounded">
		    <h6 class="mb-3">내가 쓴 리뷰 ${list.size()} 건</h6>
		    <div class="row" style="text-align: center">
			    <div class="col-md-12 mb-3">
		   			<img alt="" class="img-fluid" src="<c:url value='/resources/imgs/noReviewDefault.png'/>" style="min-width:439px">
		   		</div>
	   		</div>
	    </div>
	</c:if>
	<c:if test="${!empty list}">
		<div class="bg-white p-3 mb-3 restaurant-detailed-ratings-and-reviews shadow-sm rounded">
		    <h6 class="mb-1">내가 쓴 리뷰 ${list.size()} 건</h6>
		    <p class="text-muted mb-4 mt-1 small">고객님의 소중한 리뷰입니다</p>
		    <div id="reviewDiv">
			    <c:forEach var="vo" items="${list}">
					<c:if test="${vo.reviewDelFlag!='Y'}">
				    <div class="reviews-members py-3">
				        <div class="media">
				            <div class="media-body">
				                <div class="reviews-members-header">
				                    <div class="star-rating float-right">
				                        <div class="d-inline-block" style="font-size: 14px;">
				                        	<c:forEach var="i" begin="1" end="5">
				                    		<c:if test="${vo.reviewRating>=i}">
				                        		<i class="feather-star text-warning"></i>
				                    		</c:if>
				                    		<c:if test="${vo.reviewRating<i}">
				                    			<i class="feather-star"></i>
				                    		</c:if>
				                    	</c:forEach>
				                        </div>
				                    </div>
				                    <h6 class="mb-0"><a class="text-dark" href="<c:url value='/member/store/storeDetail.do?storeNo=${vo.storeNo}'/>">점포 ${vo.storeName}</a></h6>
				                    <p class="text-muted small"><fmt:formatDate value="${vo.reviewRegdate}" pattern="yyyy-MM-dd" /></p>
				                </div>
				                <div class="reviews-members-body">
				                	<c:if test="${!empty vo.reviewFilename}">
						                <div class="row mb-3">
					                		<img alt="" src="<c:url value='/resources/imgs/ReviewImages/${vo.reviewFilename}'/>" class="img-fluid mx-auto" width="50%">
					                	</div>
				                	</c:if>
				                    <p class="p-3 mb-3 bg-light rounded w-100"><span class="badge bg-dark text-light">리뷰</span><span class="small text-muted" style="float:right">&nbsp;&nbsp;${vo.menuName} 등 ${vo.menuCount}건</span><br><br>${vo.reviewContent}</p>
					                <c:if test="${!empty coList}">
					                	<c:forEach var="coVo" items="${coList}">
										<c:if test="${coVo.reviewNo==vo.reviewNo}">
							                <p class="p-3 my-3 bg-secondary rounded w-100 text-light">
							                <span class="badge bg-light text-dark">사장님</span><span class="small text-light" style="float:right">&nbsp;&nbsp;<fmt:formatDate value="${coVo.rCommentRegdate}" pattern="yyyy-MM-dd"/></span><br><br>
							                ${coVo.rCommentContent}
							                </p>	                
										</c:if>
					                	</c:forEach>
					                </c:if>
				                </div>
				                <div class="reviews-members-footer">
				                <c:if test="${vo.memberNo==sessionScope.memberNo}">
					                <a class="total-like btn btn-sm btn-outline-primary delBt" href='<c:url value='/member/review/delReview.do?reviewNo=${vo.reviewNo}' />' style="float:right">
					                	삭제</a>
					                    <span class="total-like-user-main ml-2" dir="rtl"></span>
				                </c:if>
				                <c:if test="${vo.memberNo!=sessionScope.memberNo}">
					                <a class="total-like btn btn-sm btn-outline-primary likeBt" href="<c:url value='/member/review/reviewLike.do?reviewNo=${vo.reviewNo}'/>">
					                <i class="feather-thumbs-up"></i>${vo.reviewLike} </a>
					                    <span class="total-like-user-main ml-2" dir="rtl"></span>
				                </c:if>
				                </div>
				            </div>
				        </div>
				    </div>
				    <hr>
				    </c:if>
			    </c:forEach>
		    </div>
		    <a class="btn btn-primary btn-block my-2 text-light" style="font-weight: bold" href="<c:url value='/member/index.do'/>">홈으로</a>
		    <a class="btn btn-light btn-block my-2 text-dark" style="font-weight: bold" href="<c:url value='/member/mypage/main.do'/>">마이페이지로</a>
		</div>
	</c:if>
		</div>
	</div>
</div>
</div>
		

<%@include file="../../memInc/bottom.jsp"%>