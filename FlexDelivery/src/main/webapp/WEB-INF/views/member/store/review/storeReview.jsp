<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('div#reviewStar span').click(function(){
			  console.log("직음");
			  $(this).parent().children('span').removeClass('text-warning');
			  $(this).addClass('text-warning').prevAll('span').addClass('text-warning');
			  var reviewRating=$(this).attr('title');
			  $('input[name=reviewRating]').val(reviewRating);
		});
		
		 $('#reviewFilename').on('change', function(){
		       readInputFile(this);
		 });
		 
		 $(document).on('click','.delBt',function(){
			 if(!confirm("리뷰 삭제 시 다시 작성이 불가능합니다. 삭제하시겠습니까?")){
				event.preventDefault(); 
			 }
		 });
		 
		 $(document).on('click','.likeBt',function(){
			 if(!confirm("해당 리뷰를 추천하시겠습니까?")){
				event.preventDefault(); 
			 }
		 })
		 
	});
	
	function readInputFile(input) {
	    if(input.files && input.files[0]) {
	        var reader = new FileReader();
	       reader.onload = function (e) {
	            $('#preview').html("<img class='img-fluid' style='max-width:50%' src="+ e.target.result +">");
	        }
	        reader.readAsDataURL(input.files[0]);
	    }  
	}; 
	
	function moreReview(){
		var pageSize=3;
		
		var startIndex=new Number;
		startIndex=parseInt($('#startIndex').val());
		startIndex+=pageSize;
		$('#startIndex').val(startIndex);
		
		
		
		var lastIndex=new Number;
		lastIndex=parseInt($('#lastIndex').val());
		
		if(lastIndex+pageSize>$('#totalRecords').val()){
			$('#lastIndex').val($('#totalRecords').val());
		}else{
			$('#lastIndex').val(lastIndex+pageSize);
		}
		
		$.ajax({
			url:"<c:url value='/member/review//storeReview.do'/>",
			type:"post",
			dataType:"JSON",
			data:$('#frmPlus').serialize(),
			success:function(map){
				var memberNo=${sessionScope.memberNo};
				$.each(map.list,function(idx,item){
					if(item.reviewReport!='Y'){
						if(item.reviewDelFlag=='Y'){
							var str="<div class='reviews-members py-1'>";
						    str+="<div class='media'>";
						    str+="<div class='media-body'>";
						    str+="<p class='text-muted'>회원요청에 의해 삭제된 리뷰입니다</p>";        
					        str+=" </div></div></div><hr>"; 
						}else{
							var str="<div class='reviews-members py-3'>";
							str+="<div class='media'>";
							str+="<div class='media-body'>";
							str+="<div class='reviews-members-header'>";
							str+="<div class='star-rating float-right'>";
							str+="<div class='d-inline-block' style='font-size: 14px;letter-spacing:3px'>";
							for(var i=0;i<5;i++){
								if(item.reviewRating>=i){
									str+="<i class='feather-star text-warning'></i>";
								}else if(item.reviewRating<i){
									str+="<i class='feather-star'></i>";
								}
							}
							str+="</div></div>";
							str+="<h6 class='mb-0'><a class='text-dark' href='#'>"+item.memberId+"</a></h6>";
							str+="<p class='text-muted small'>"+formatDate(item.reviewRegdate)+"</p></div>";
							str+="<div class='reviews-members-body'>";
							if(item.reviewFilename!=null){
								str+="<div class='row mb-3'><img src='<c:url value='/resources/imgs/ReviewImages/"+item.reviewFilename+"'/>' class='img-fluid mx-auto' width='50%'></div>";
							}
							str+="<p class='p-3 mb-3 bg-light rounded w-100'><span class='badge bg-dark text-light'>리뷰</span><span class='small text-muted' style='float:right'>&nbsp;&nbsp;"+item.menuName+" 등"+item.menuCount+"건</span><br><br>"+item.reviewContent+"</p>";
							if(map.coList.length>0){
								$.each(map.coList,function(idx,coVo){
									if(coVo.reviewNo==item.reviewNo){
										str+="<p class='p-3 my-3 bg-secondary rounded w-100 text-light'>";
						                str+="<span class='badge bg-light text-dark'>사장님</span><span class='small text-light' style='float:right'>&nbsp;&nbsp;"+formatDate(coVo.rCommentRegdate)+"</span><br><br>";
						                str+=coVo.rCommentContent+"</p>";
									}
								})
							}
							str+="</div>";
							str+="<div class='reviews-members-footer'>";
							if(item.memberNo==memberNo){
								str+="<a class='total-like btn btn-sm btn-outline-primary delBt' style='float:right' href='<c:url value='/member/review/delReview.do?reviewNo="+item.reviewNo+"' />'>삭제</a>";
								str+="<span class='total-like-user-main ml-2' dir='rtl'></span>";
							}else{
								str+="<a class='total-like btn btn-sm btn-outline-primary likeBt' href='<c:url value='/member/review/reviewLike.do?reviewNo="+item.reviewNo+"'/>'><i class='feather-thumbs-up'></i>"+item.reviewLike+"</a>";
								str+="<span class='total-like-user-main ml-2' dir='rtl'></span>";
							}
							str+="</div></div></div></div><hr>";
						}
					}else{
						if(item.reviewDelFlag=='Y'){
							var str="<div class='reviews-members py-1'>";
						    str+="<div class='media'>";
						    str+="<div class='media-body'>";
						    str+="<p class='text-muted'>부적절한 이유로 삭제된 리뷰입니다</p>";        
					        str+=" </div></div></div><hr>";       
						}else{
							var str="<div class='reviews-members py-1'>";
						    str+="<div class='media'>";
						    str+="<div class='media-body'>";
						    str+="<p class='text-muted'>신고 접수로 인해 당분간 노출되지 않는 리뷰입니다</p>";        
					        str+=" </div></div></div><hr>";
						}
					}
					$('#reviewDiv').append(str);
				})
			},error:function(xhr,status,error){
				alert("error:"+error);
			} 
		})
	};
	
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();
	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;

	    return [year, month, day].join('-');
	};
</script>
<form name="frmPlus" id="frmPlus" method="post">
	<input type="hidden" name="startIndex" id="startIndex" value="${map.startIndex}">
   	<input type="hidden" name="lastIndex" id="lastIndex" value="${map.lastIndex}">
   	<input type="hidden" name="storeNo" id="storeNo" value="${map.storeNo}">
   	<input type="hidden" name="totalRecords" id="totalRecords" value="${map.totalRecords}">
</form>
<c:if test="${empty list}">
	<div class="bg-white p-3 mb-3 restaurant-detailed-ratings-and-reviews shadow-sm rounded">
	    <p class="font-weight-bold h6 p-3 border-bottom mb-0 w-100">이 가게의 리뷰</p>
	    <div style="text-align: center">
		    <img alt="" class="img-fluid p-3" src="<c:url value='/resources/imgs/noReviewDefault.png'/>" style="inline-size:40em;">
	    </div>
    </div>
</c:if>
<c:if test="${!empty list}">
	<div class="bg-white p-3 mb-3 restaurant-detailed-ratings-and-reviews shadow-sm rounded">
	    <h6 class="mb-1">이 가게의 리뷰</h6>
	    <p class="text-muted mb-5 mt-1 small">실제 주문고객들의 리뷰와 평점입니다</p>
	    <div id="reviewDiv">
	    	<hr>
		    <c:forEach var="vo" items="${list}">
		    	<c:if test="${vo.reviewReport=='Y'}">
		    		<c:if test="${vo.reviewDelFlag=='Y'}">
						<div class="reviews-members py-1">
					        <div class="media">
					            <div class="media-body">
				                    <p class="text-muted">부적절한 이유로 삭제된 리뷰입니다</p>
					            </div>
					        </div>
				        </div>
				        <hr>
					</c:if>
					<c:if test="${vo.reviewDelFlag=='N'}">
						<div class="reviews-members py-1">
					        <div class="media">
					            <div class="media-body">
				                    <p class="text-muted">신고 접수로 인해 당분간 노출되지 않는 리뷰입니다</p>
					            </div>
					        </div>
				        </div>
				        <hr>
					</c:if>
		    	</c:if>
		    	<c:if test="${vo.reviewReport!='Y'}">
		    		<c:if test="${vo.reviewDelFlag=='Y'}">
						<div class="reviews-members py-1">
					        <div class="media">
					            <div class="media-body">
				                    <p class="text-muted">회원 요청에 의해 삭제된 리뷰입니다</p>
					            </div>
					        </div>
				        </div>
				        <hr>
					</c:if>
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
				                    <h6 class="mb-0"><a class="text-dark" href="#">${vo.memberId}</a></h6>
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
							                <span class="badge bg-light text-dark">사장님답변</span><span class="small text-light" style="float:right">&nbsp;&nbsp;<fmt:formatDate value="${coVo.rCommentRegdate}" pattern="yyyy-MM-dd"/></span><br><br>
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
		    	</c:if>
		    </c:forEach>
	    </div>
	    <button type="button" class="btn btn-primary btn-block my-2" onclick="moreReview()"> 리뷰 더 보기 </button>
	</div>
</c:if>
<form name="reviewForm" method="post" action="<c:url value='/member/review/reviewReg.do'/>" enctype="multipart/form-data">
	<input type="hidden" name="storeNo" value="${map.storeNo}">
	<div class="bg-white p-3 rating-review-select-page rounded shadow-sm">
	    <h6 class="mb-3">리뷰 작성</h6>
	    <div class="d-flex align-items-center mb-3">
	        <p class="m-0 small">고객님의 메뉴를 평가해주세요!</p>
	        <div class="star-rating ml-auto">
	            <div class="d-inline-block" id="reviewStar">
	                <span class="feather-star text-warning" style="cursor: pointer;" title="1"></span>
	                <span class="feather-star" style="cursor: pointer;" title="2"></span>
	                <span class="feather-star" style="cursor: pointer;" title="3"></span>
	                <span class="feather-star" style="cursor: pointer;" title="4"></span>
	                <span class="feather-star" style="cursor: pointer;" title="5"></span>
	            </div>
	            <input type="hidden" name="reviewRating" id="reviewRating" value="1">
	        </div>
	    </div>
	       <c:if test="${!empty orderList}">
		       <select class="custom-select form-control mb-3" name="ordersNo">
				  <option selected value="0">어떤 메뉴를 주문하셨나요?</option>
				  <c:forEach var="map" items="${orderList}">
					  <option value="${map['ORDERS_NO']}">${map['MENU_NAME']} 등 ${map['MENU_COUNT']}건</option>
				  </c:forEach>
				</select>
	       </c:if>
	       <div class="d-flex align-items-center mb-3 justify-content-center" id="preview"> </div>
	       <div class="form-group"><label class="form-label">내용</label>
	       <textarea class="form-control" name="reviewContent" placeholder="리뷰는 한번 작성 시 수정 및 삭제가 불가능합니다. 신중하게 작성해주세요!"></textarea>
	       </div>
	       <div class="d-flex align-items-center my-3">
	       		<label for="reviewFilename" ><img class="img-fluid" style="inline-size:7em;cursor: pointer;" src="<c:url value='/resources/imgs/photo.png'/>"> </label>
	       		<input type="file" id="reviewFilename" name="tqFilename" accept=".gif, .jpg, .png" style="visibility: hidden;">
	       </div>
	       <c:if test="${reviewChk}">
		       <div class="form-group mb-0">
		       	<button type="submit" class="btn btn-primary btn-block"> 리뷰 작성 </button>
		       </div>
	       </c:if>
	       <c:if test="${!reviewChk}">
	       		<div class="form-group mb-0">
		       	<button type="submit" class="btn btn-secondary btn-block" disabled> 리뷰 작성 권한이 없습니다 </button>
		       </div>
	       </c:if>
	</div>
</form>