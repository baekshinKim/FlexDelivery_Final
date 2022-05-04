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
	
			
			var ownerNo = ${vo.ownerNo};

			$.ajax({
			    url:"<c:url value='/owner/VerifyRecaptcha.do'/>",
			    type: 'post',
			    data: {
			        recaptcha: $("#g-recaptcha-response").val()
			    },
			    success: function(data) {
			        switch (data) {
			            case 0:
			             
			                location.href="<c:url value='/owner/withdraw.do?ownerNo="+ownerNo+"'/>"; 
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
         			 <div class="row">
			          		<input type="hidden" id="ownerNo" value="${vo.ownerNo }">
			          		<div class="col-12 text-center mb-4 mt-5">
				           		<h4 style="display: inline;"><b>💜사 장 님💜</b></h4>
				           </div>
				           <div class="col-md-4">
				               <label>아이디</label>
				           </div>
				           <div class="col-md-7 form-group">
				               <input type="text"  class="form-control text-center" name="tStoreName" title="아이디" value="${vo.ownerId }">
				             
				           </div>
				             <div class="col-md-1"></div>
				            <div class="col-md-4">
				               <label>이름</label>
				           </div>
				           <div class="col-md-7 form-group">
				               <input type="text"  class="form-control text-center" name="tStoreAddress" title="이름" value="${vo.ownerName }">
				            </div>
				            <div class="col-md-1"></div>
				           <div class="col-12">
				          	<hr>
				          </div>
			    
			         		 <div class="col-12 mt-3" style="margin-bottom:100px;">
									<div class="g-recaptcha " data-sitekey="6LfgUU4aAAAAACrshEabcLYMkxfW7ZUfAATntxow" style="margin-left:15%;"></div>
									<div style="display: flex; justify-content: space-around;">
										<button class="btn-primary mt-4" id="robotCheck" style="width:200px; height:50px; font-size:15px; ">탈퇴</button>
										<button class="btn-outline-primary mt-4" onclick="history.back()" style="width:200px; height:50px;font-size:15px;">취소</button>
									</div>
			          		</div>
 							 <br><Br><br>
		      			</div>
	     			 </div>
	     			 <div class="col-md-4 col-12"></div>
				</div>












<%@ include file="../../ownerInc/bottom.jsp" %>


