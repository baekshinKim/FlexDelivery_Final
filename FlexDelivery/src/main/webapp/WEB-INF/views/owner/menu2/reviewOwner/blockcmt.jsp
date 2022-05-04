<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<br><br><br><br><br>
 <div class="row mt-3 mb-2">
	<div class="col-md-2 col-12"></div>
		<div class="col-md-8 col-12">
			<div class="text-right">
				<button type="button" class="btn" id="btAll" style=" background-color:#fcbe32; color:#333; border: none; font-size: 15px; font-weight: bold;">전체(${fn:length(allList)})</button>
				<button type="button" class="btn" id="btnocmt" style=" background-color:#fcbe32; color:#333; border: none; font-size: 15px; font-weight: bold;">미답변(${fn:length(nocmtList)}) </button>
				<button type="button" class="btn" id="btBlock" style="border:1px solid #fcbe32; color:#333;  font-size: 15px; font-weight: bold;">차단(${fn:length(blockList)}) </button>
			</div>
		</div>
		<div class="col-md-2 col-sm-12"></div>
	</div>
<div class="row" id="table-hover-row">
   <div class="col-md-2 col-sm-12"></div>
   <div class="col-md-8 col-sm-12">
      <div class="card">
         <br>
         <div class="card-content">
            <div class="card-body" id="allreview"><br><br>
               <p class="card-text text-center" style="font-size:30px; color:#333; font-weight:bold;">차단 리뷰 관리</p>
               <p class="card-text text-center"></p>
               <br> <br>
               <div class="card-content">
                  <div class="card-body text-center">
                     <br>
                        <c:if test="${empty blockList }">
                           <div class="row">
                              <div class="ccol-md-8">데이터가 존재하지 않습니다.</div>
                           </div>
                        </c:if>
                        <c:if test="${!empty blockList}">
                           <c:set var="k" value="0"/>
                           <c:forEach var="map" items="${blockList}" >
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
                                      <!-- 
                                         <img src="<c:url value='/resources/imgs/pancake.jpg'/>" alt="${map['MENU_NAME']}" class="card-img-top" style="margin-bottom: 40px;">
                                       -->
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
                                    <div class="CEO-comment" style="background-color: rgba(208, 201, 208, 0.12); color: #333;">
                                 <c:if test="${empty map['R_COMMENT_CONTENT']}">
                                	<p style="padding:5%">신고접수된 리뷰입니다. </p>
                                 </c:if>
                                 <!-- CEO comment start !! -->
                                 <c:if test="${!empty map['R_COMMENT_CONTENT']}">
                                       <form class="frm${map['REVIEW_NO']}" method="post" action="<c:url value='/owner/menu2/reviewOwner/edit.do'/>">
                                          <input type="hidden" id="reviewNo" name="reviewNo" value="${map['REVIEW_NO'] }"> 
                                          <input type="hidden" id="storeNo" name="storeNo" value="1">
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
                                                <div class="listDiv col-md-7 text-left text-left">${map['R_COMMENT_CONTENT'] }</div>
                                                <div class="result${map['REVIEW_NO']}" id="resultDiv"></div>
                                             </div>
                                             <div class="row">
                                                <div class=".col-xs-12 .col-sm-6 .col-md-8"></div>
                                                <div class="text-right" style="margin-bottom: 10px;">
                                                   <div class="button-group button-group-row align-right btgroup">
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
                                    <div class="col-md-2 col-sm-12"></div>
                                    <br>
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
</div>
<div class="col-md-2 col-sm-12"></div>
<br>
<script type="text/javascript">
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
      alert(num);
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
             var output="<textarea class='col-md-7 text-left content' name='rCommentContent'>";
                output+=res.rCommentContent+" </textarea><br>";
                output+="<button type='submit' class='button small secondary inGroup' id='btEdit' style='width: auto;'>수정하기 </button>";
             
                   $('.result'+num).append(output);
                   
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

</script>
<%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>