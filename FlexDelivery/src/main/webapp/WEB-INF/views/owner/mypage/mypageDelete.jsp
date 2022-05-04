<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ include file="../../ownerInc/top.jsp" %>

    <!-- JavaScript Bundle with Popper -->
	<script src='https://www.google.com/recaptcha/api.js'></script>
	<script type="text/javascript">





$(function(){
	$('#robotCheck').click(function(){
			var storeNo = 0;
			if($('input[id=storeNo]').val()!=null){
				storeNo=$('input[id=storeNo]').val();		
			}
			
			$.ajax({
			    url:"<c:url value='/owner/VerifyRecaptcha.do'/>",
			    type: 'post',
			    data: {
			        recaptcha: $("#g-recaptcha-response").val()
			    },
			    success: function(data) {
			        switch (data) {
			            case 0:
			                location.href="<c:url value='/owner/withdrawStore.do?storeNo="+storeNo+"'/>"; 
			                break;
			
			            case 1:
			                alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
			                break;
			
			            default:
			                alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
			                break;
			        }
			    }
			});
		
		
	});
});
</script>

<!--recaptcha-->


		<br>
		<div class="row">
			  <div class="col-md-4 col-12"></div>
			    <div class="col-md-4 col-12">
		          <div class="row text-center">
					  		<input type="hidden" id="storeNo" value="${map['STORE_NO'] }">
				            <div class="col-12 text-center mb-4 mt-5">
				           		<h4 style="display: inline;"><b>🏦점 포🏦</b></h4>
				           </div>
				           <div class="col-md-4">
				               <label>점포명</label>
				           </div>
				           <div class="col-md-7 form-group">
				               <input type="text"  class="form-control text-center" name="tStoreName" title="점포명" value="${map['STORE_NAME'] }">
				             
				           </div>
				             <div class="col-md-1"></div>
				            <div class="col-md-4">
				               <label>점포주소</label>
				           </div>
				           <div class="col-md-7 form-group">
				               <input type="text"  class="form-control text-center" name="tStoreAddress" title="주소" value="${map['STORE_ADDRESS'] }">
				            </div>
				            <div class="col-md-1"></div>
				           <div class="col-md-4">
				               <label>점포상세주소</label>
				           </div>
				           <div class="col-md-7 form-group">
				               <input type="text" class="form-control text-center" name="tStoreAddressDetail" title="주소" value="${map['STORE_ADDRESS_DETAIL'] }" >
				           </div>
				           <div class="col-md-1"></div>
				           <div class="col-12">
				          	<hr>
				          </div>
			         
			          <Br>
			          <div class="col-12 mb-5">
							<div class="g-recaptcha mb-3" data-sitekey="6LfgUU4aAAAAACrshEabcLYMkxfW7ZUfAATntxow" style="margin-left:14%;"></div>
							<div style="display: flex; justify-content: space-around;">
								<button class="btn-primary" id="robotCheck" style="width:200px; height:50px; margin-bottom:30px;font-size:15px;">탈퇴</button>
								<button class="btn-outline-primary" onclick="history.back()" style="width:200px; height:50px; margin-bottom:30px;font-size:15px;">취소</button>
			         		</div>
			          </div>
			          <br><Br><br>
		      </div>
	      </div>
	      <div class="col-md-4 col-12"></div>
	</div>











<%@ include file="../../ownerInc/bottom.jsp" %>


