<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 리뷰 상이드바 안눌리는거 ??  -->
<style>
   textarea, input {
      border: 1px solid rgb(212,212,212);
      border-radius: 5px;
   }
   .one {
  background-color: #F46A6A;
  color:#fff;
  max-width:800px;
  margin: 100px auto 0;
  text-align: center;
  display: table;
}

.counter {
  display: table-cell;
  margin:1.5%;
  font-size:50px;
  background-color: #FF6F6F;
  width:200px;
  border-radius: 50%;
  height:200px;
  vertical-align: middle;
}
</style>
<br><br><br><br><br>
 <div class="row mt-3 mb-2">
	<div class="col-md-2 col-12"></div>
		<div class="col-md-8 col-12">
			<div class="text-right">
            <button type="button" class="btn " id="btAll" style="border:1px solid #fcbe32; color:#333;  font-size: 15px; font-weight: bold;">전체(${fn:length(allList)})</button>
            <button type="button" class="btn " id="btnocmt" style=" background-color:#fcbe32; color:#333; border: none; font-size: 15px; font-weight: bold;">미답변(${fn:length(nocmtList)}) </button>
            <button type="button" class="btn" id="btBlock"style=" background-color:#fcbe32; color:#333; border: none; font-size: 15px; font-weight: bold;">차단(${fn:length(blockList)}) </button>
         </div>
      </div>
      <div class="col-md-2 col-sm-12"></div>
   </div>
<!--  -->
<div class="row" id="table-hover-row">
   <div class="col-md-2 col-sm-12"></div>
   <div class="col-md-8 col-sm-12">
      <div class="card">
         <br>
         <div class="card-content">
            <div class="card-body" id="allreview"><br><br>
               <p class="card-text text-center" style="font-size:30px; color:#333; font-weight:bold;">리뷰 관리</p>
               <p class="card-text text-center">소중한 고객님의 리뷰에 댓글을 달아보세요 !</p><br><br>
               <div style="padding-left:10px;"class="single-blog-area blog-style-2 wow fadeInUp" data-wow-delay="0.3s" data-wow-duration="1000ms">
                 <div id="top_x_div" style="width: 600px; height: 300px;"></div>
               </div>
               <br> <br>
               <div class="card-content">
                  <div class="card-body text-center">
                     <form name="frmPage" method="post" name="frm1" action="<c:url value='/owner/menu2/reviewOwner/reviewOwnerList.do'/>">
                        <div class="row">
                           <div class="col-md-4 col-12"></div>
                           <div class="col-md-6 col-12 ">
                              <%@include file="../../../owner/datePicker/datePicker.jsp"%>
                              <input type="hidden" name="currentPage" value="1">
                           </div>
                        <div class="col-md-2 col-12">
                           <input type="submit" style="color:black; background-color:#fcbe32; border: none;" value="조회" id="searchDate" >
                        </div>
                     </div>
                        </form>
                     <br>
                        <c:if test="${empty reviewList }">
                           <div class="row">
                              <div class="ccol-md-8">데이터가 존재하지 않습니다.</div>
                           </div>
                        </c:if>
                        <c:if test="${!empty reviewList }">
                           <c:set var="k" value="0"/>
                           <c:forEach var="map" items="${reviewList }" >
                              <hr>
                              <br>
                              <div class="review-list">
                                 <div class="row ">
                                    <div class="col-md-3">
                                       <h4 class="card-title">${map['MEMBER_ID']}</h4>
                                    </div>
                                       <div class="col-md-6"></div>
                                       <div class="col-md-3">
                                       <div class="text-right">
                                       <c:if test="${map['REVIEW_REPORT'] == 'N' }">
                                          <button type="button" class="button small" onclick="btSingo(${map['REVIEW_NO']})" style=" background-color:#f1f3f5; color:#333; border: none;">신고</button>
                                       </c:if>
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="col-md-3">${map['REVIEW_RATING'] }점</div>
                                       <div class="col-md-1"></div>
                                       <div class="col-md-5 text-left">${map['MENU_NAME']}
                                       <c:if test="${!empty map['M_OPTION_NAME']}">
                                         + ${map['M_OPTION_NAME']}
                                        </c:if>
                                        </div>
                                    </div>
                                 </div>
                                 <div class="row ">
                                    <div class="col-md-3">
                                       <fmt:formatDate value="${map['REVIEW_REGDATE']}" pattern="yyyy-MM-dd" />
                                    </div>
                                    <div class="col-md-6 text-left">${map['REVIEW_CONTENT']}</div>
                                      <div class="col-md-3">
                                           <div class="single-blog-thumbnail">
                                          <c:if test="${fn:substring(map['REVIEW_FILENAME'], 0,4)=='http' }">
                                             <img src="${map['REVIEW_FILENAME']}" class="card-img-top" style="margin-bottom: 40px;" alt="${map['MENU_NAME']}">
                                          </c:if>
                                          <c:if test="${fn:substring(map['REVIEW_FILENAME'], 0,4)!='http' and (!empty map['REVIEW_FILENAME']) }">
                                             <img src="<c:url value='/resources/imgs/ReviewImages/${map["REVIEW_FILENAME"]}'/>" alt="${map['MENU_NAME']}" class="card-img-top" style="margin-bottom: 40px;">
                                          </c:if>
                                       </div>
                                      </div>
                                 </div>
                                 </div>
                              <br>
                              <br>
                              <div class="table-responsive">
                                 <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-8"></div>
                                    <div class="col-xs-6 col-md-4"></div>
                                 </div>
                                 <!-- CEO comment start !! -->
                                    <div class="CEO-comment" style="background-color: rgba(208, 201, 208, 0.12); color: #333;">
                                    <c:if test="${map['REVIEW_REPORT'] == 'Y'}">
                                    	<p style="padding:5%">신고접수된 리뷰입니다. </p>
                                    </c:if>
                               		 <c:if test="${!empty map['R_COMMENT_CONTENT'] && map['REVIEW_REPORT'] == 'N'}">
                                       <form class="frm${map['REVIEW_NO']}" method="post" action="<c:url value='/owner/menu2/reviewOwner/edit.do'/>">
                                          <input type="hidden" id="reviewNo" name="reviewNo" value="${map['REVIEW_NO'] }"> 
                                          <input type="hidden" id="storeNo" name="storeNo" value="${sessionScope.storeNo }">
                                          <div class="reply" style="padding: 7%;">
                                             <div class="row">
                                                <div class="col-md-3">
                                                   <h4>사장님&nbsp;</h4>
                                                </div>
                                                <div class="col-md-6 text-left">${map['MEMBER_ID'] }님,</div>
                                                <div class="col-md-1"></div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-3">
                                                   <fmt:formatDate value="${map['R_COMMENT_REGDATE'] }" pattern="yyyy-MM-dd" />
                                                </div>
                                                <div class="listDiv${map['REVIEW_NO']} col-md-7 text-left text-left">${map['R_COMMENT_CONTENT'] }</div>
                                                	<div class="result${map['REVIEW_NO']}" id="resultDiv">
                                                </div> 
                                             </div>
                                             <div class="row">
                                                <div class=".col-xs-12 .col-sm-6 .col-md-8"></div>
                                                <div class="text-right" style="margin-bottom: 10px;">
                                                   <div class="button-group button-group-row align-right btgroup${map['REVIEW_NO']}">
                                                      <br> <br>
                                                      <button type="button" class="button small" onclick="btDel(${map['REVIEW_NO']})" style="color:black; background-color:#fcbe32; border: none; ">삭제 </button>
                                                      <button type="submit" class="button small btn-outline-dark" onclick="Edit_form(${map['REVIEW_NO']})" style="color:black; background-color:#fcbe32; border: none; ">수정 </button>
                                                   </div>
                                                </div>
                                           	  </div>
                                             </div>
                                      	 </form>
                                		</c:if>
                                       </div>
                                    </div>
                                    <div class="col-md-2 col-sm-12"></div>
                                    <br>
                                 <!-- No Comment -->
                                 <c:if test="${empty map['R_COMMENT_CONTENT'] && map['REVIEW_REPORT'] == 'N'}">
                                    <div class="card-body">
                                       <form id="frm1" method="post" action="<c:url value='/owner/menu2/reviewOwner/reviewOwner.do'/>">
                                          <input type="hidden" id="reviewNo" name="reviewNo" value="${map['REVIEW_NO'] }"> 
                                          <input type="hidden" id="storeNo" name="storeNo" value="${sessionScope.storeNo }">
                                          <label for="content"></label>
                                          <div style="border: 2px solid lightgray; padding:5%;" class="">
                                          <input type="text" class="form-control form-control-lg comment" name="rCommentContent" style="width: 80%; border:none;" placeholder="사장님 ! 댓글을 등록해주세요.">
                                             <input class="button" type="submit" style="color:black; background-color:#fcbe32; border: none;" value="댓글작성">
                                          </div>
                                       </form>
                                    </div>
                                    <c:set var="k" value="${k+1 }"/>
                                 </c:if>
                                 <br> <br>
                           </c:forEach>
                        </c:if>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<div class="col-md-2 col-sm-12"></div>
<br>
<br>
<br>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['bar']});
google.charts.setOnLoadCallback(drawStuff);
	
function drawStuff() {
	  
  var data = new google.visualization.arrayToDataTable([
    ['countNum', 'Person'],
    ["5점 ", 44],
    ["4점 ", 31],
    ["3점 ", 12],
    ["2점 ", 10],
    ['1점 ', 3]
  ]);

  var options = {
    title: 'My store review star ratings ',
    legend: { position: 'none' },
    chart: { title: '우리 가게 고객들의 리뷰 별점입니다. ',
        subtitle: 'Reviews by my store customers, star ratings' },
    bars: 'horizontal', // Required for Material Bar Charts.
    axes: {
      x: {
        0: { side: 'top', label: 'Person '} // Top x-axis.
      }
    },
    bar: { groupWidth: "60%" }
  };

  var chart = new google.charts.Bar(document.getElementById('top_x_div'));
  chart.draw(data, options);
};

   function btDel(reviewNo){
      if(confirm("리뷰 답변을 삭제하시겠습니까?")) {
         location.href= "<c:url value='/owner/menu2/reviewOwner/reviewOwnerDelete.do?reviewNo='/>" + reviewNo;
         event.preventDefault();
      }else {
         return false;
      }
   }
   
   function btSingo(reviewNo){
      if(confirm("리뷰를 신고 하시겠습니까?")) {
         location.href= "<c:url value='/owner/menu2/reviewOwner/reviewOwnerSingo.do?reviewNo='/>" + reviewNo;
         event.preventDefault();
      }else {
         return false;
      }
   }
   
   //댓글 수정버튼 눌렀을 시 폼
    function Edit_form(num) {
        $(this).parent().prev().css("display", "none");
        console.log(this);
        //alert(num);
   $(function(){
      if($('.content').val()<1){
          alert("댓글 내용을 입력해 주세요 ! ");
         event.preventDefault();
      }else{
           var params = $(".frm"+num).serialize();
           $.ajax({
            url:"<c:url value='/owner/menu2/reviewOwner/edit.do'/>",
            type:"GET",
            data: params,
            dataType:"json",
            contentType: 'application/x-www-form-urlencoded; charset=utf-8',
            success:function(res){
            	var  output="<div style='border: 2px solid lightgray; padding:5%;' class=''>";
               output+="<input type='text' class='col-md-7 text-left content' name='rCommentContent'  style='width: 80%; border:none; background: unset;' value="+res.rCommentContent+">";
               output+="<input type='submit' class='button' type='submit' style='color:black; background-color:#fcbe32; border: none; ' value='수정하기'>";
          	 	output+="</div>";
               $('.result'+num).append(output);
               $('.listDiv'+num).empty();
               $('.btgroup'+num).empty();
               event.preventDefault();
                     
            },
               error:function(xhr, status, error){
                  alert("error! : " + error);
               }            
            });//ajax
         }
      });
   event.preventDefault();
   }
      
   
   $(function(){
      $('form[name=frmDate]').submit(function(){
         if($('#startDay').val().length<1){
            alert('시작일을 입력하세요');
            $('#startDay').focus();
            event.preventDefault();
         }else if($('#endDay').val().length<1){
            alert('종료일을 입력하세요');
            $('#endDay').focus();
            event.preventDefault();
         }
      });//frmDate
   
      $('form[name=frm1]').submit(function(){
         if($('.comment').val().length<1){
            alert('내용을 입력하세요');
            $('.comment').focus();
            event.preventDefault();
         }
      });//frm1
   });
   
   function pageFunc(curPage){
      $('form[name=frmDate]').find('input[name=currentPage]').val(curPage);   
      $('form[name=frmDate]').submit();
      
   }
   $(function(){
      $('#btAll').click(function(){
      location.href='<c:url value="/owner/menu2/reviewOwner/reviewOwner.do"/>';
      });
      
      $('#btnocmt').click(function(){
         location.href='<c:url value="/owner/menu2/reviewOwner/nocomment.do"/>';
      });
      
      $('#btBlock').click(function(){
         location.href='<c:url value="/owner/menu2/reviewOwner/blockcmt.do"/>';
      });
      
   });
   $('.counter').each(function() {
	   var $this = $(this),
	       countTo = $this.attr('data-count');
	   
	   $({ countNum: $this.text()}).animate({
	     countNum: countTo
	   },
	   {
	     duration: 8000,
	     easing:'linear',
	     step: function() {
	       $this.text(Math.floor(this.countNum));
	     },
	     complete: function() {
	       $this.text(this.countNum);
	       //alert('finished');
	     }

	   });  

	 });
</script>

<%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>