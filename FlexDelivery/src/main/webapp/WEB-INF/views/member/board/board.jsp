<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
		$('a[data-toggle="tab"]').on("show.bs.tab", function(e) {
			if(e.target.id=='home-tab'){
				$('#tabIdx').val(1)
				searchNlist(1);
			}else if(e.target.id=='profile-tab'){
				$('#tabIdx').val(2)
				searchElist(1);
			}
		});
		
		$(document).on('click','#searchBt',function(){
			//var tabIdx=$('#tabIdx').val();
			//if(tabIdx==1){
				searchNlist(1);
				console.log(tabIdx);
			//}else if(tabIdx==2){
				searchElist(1);
				console.log(tabIdx);
			//}
		});
		
		$('form[name=frmSearch]').submit(function(){
			//var tabIdx=$('#tabIdx').val();
			//if(tabIdx==1){
				searchNlist(1);
			//}else if(tabIdx==2){
				searchElist(1);
			//}
			event.preventDefault();
		});
		
		$("#inlineFormInputGroup").keydown(function(key) {
            if (key.keyCode == 13) {
            	//var tabIdx=$('#tabIdx').val();
    			//if(tabIdx==1){
    				searchNlist(1);
    				console.log(tabIdx);
    			//}else if(tabIdx==2){
    				searchElist(1);
    				console.log(tabIdx);
    			//}
            }
        });
		
		$(document).on('click','.research',function(){
			$('#eSearchKey').val("");
			$('#nSearchKey').val("");
			$('#inlineFormInputGroup').val("");
			window.location.href="<c:url value='/member/board/boardReset.do'/>";
		})
		
	});
	
	function pageFunc(cur){
		var tabIdx=$('#tabIdx').val();
		if(tabIdx==1){
			$('#nCurP').val(cur);
			searchNlist(2);
			console.log(tabIdx);
		}else if(tabIdx==2){
			$('#eCurP').val(cur);
			searchElist(2);
			console.log(tabIdx);
		}
	}
	
</script>
<input type="hidden" id="tabIdx" value="1">
<div class="d-none">
    <div class="bg-primary p-3 d-flex align-items-center">
        <a class="toggle togglew toggle-2" href="#"><span></span></a>
        <h4 class="font-weight-bold m-0 text-white">Board</h4>
    </div>
</div>
<div class="osahan-popular">
    <!-- Most popular -->
    <div class="container">
        <div class="search py-5">
			<form name="frmSearch">
	            <div class="input-group mb-4">
	                <input type="text" class="form-control form-control-lg input_search border-right-0" id="inlineFormInputGroup" placeholder="검색어를 입력하세요" name="searchKeyword" value="${param.searchKeyword}" autocomplete="off">
	                <div class="input-group-prepend">
	                    <div class="btn input-group-text bg-white border_search border-left-0 text-primary" id="searchBt"><i class="feather-search"></i></div>
	                </div>
	            </div>
			</form>
            <!-- nav tabs -->
             <ul class="nav nav-tabs border-0" id="myTab" role="tablist">
                 <li class="nav-item" role="presentation">
                     <a class="nav-link active border-0 bg-light text-dark rounded" id="home-tab" data-toggle="tab" href="#notice" role="tab" aria-controls="home" aria-selected="true"><i class="feather-home mr-2"></i>공지사항 (${nCount})</a>
                 </li>
                 <li class="nav-item" role="presentation">
                     <a class="nav-link border-0 bg-light text-dark rounded ml-3" id="profile-tab" data-toggle="tab" href="#event" role="tab" aria-controls="profile" aria-selected="false"><i class="feather-disc mr-2"></i>이벤트 (${eCount})</a>
                 </li>
             </ul>
             <div class="tab-content" id="myTabContent">
             
             	<!-- 공지사항 -->
             	<div class="tab-pane fade show active" id="notice" role="tabpanel" aria-labelledby="home-tab">
	             	<c:import url="/member/board/noticeBoard.do"></c:import>
	           	</div>
	           	<!-- 공지사항 끝 -->
	           	
				<!-- 이벤트 -->
				<div class="tab-pane fade" id="event" role="tabpanel" aria-labelledby="profile-tab">
	            	<c:import url="/member/board/eventBoard.do"></c:import>
	            </div>
            	<!-- 이벤트 끝 -->
            	
	       	</div>
    	</div>
    <!--  -->
	</div>
</div>
<%@include file="../../memInc/bottom.jsp" %>