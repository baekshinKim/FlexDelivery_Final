


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- top 시작-->


<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<!-- top 끝 -->


<script type="text/javascript">
	$(function(){
		$('.btn').click(function(){
			var advertiseNo = $(this).val();
			location.href='<c:url value="/owner/menu2/advertise/advertiseWrite.do?advertiseNo='+advertiseNo+'" />';
		});
		
	});
</script>
		<br>
		<br>
		<br>
		<br>
			<div class="text-center">
				  <p class="card-text text-center mb-5 mt-3" style="font-size:30px; color:#023047;"><b>✅광고 선택 부탁드려요✅</b></p>
			</div>
		<br>
		
		<!-- row 시작 -->
		<div class="row"> 
			<c:if test="${empty list }">
				<div class="card">
					<div class="card-body">
						<p>등록된 광고가 없습니다</p>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var="vo" items="${list}">
				<!-- flex deivery ad 설명 -->
					<div class="col-md-2 col-sm-12"></div>
					<div class="col-md-8 col-sm-12">
						<div class="card">
							<div class="card-content">
							  <c:if test="${vo.advertiseNo==1 }">
						      	 <img class="card-img-top img-fluid" style="height:300px;" src="<c:url value='/resources/imgs/todayBg1.png'/>" alt="Card image cap">
						      </c:if>
						      <c:if test="${vo.advertiseNo==2 }">
						      		<img class="card-img-top img-fluid"  style="height:300px;"  src="<c:url value='/resources/imgs/todayBg3.png'/>"  alt="Card image cap">
						      </c:if>
						       <div class="card-body">
						           <h4 class="card-title">${vo.advertiseName }</h4>
						           <p class="card-text">
						               	안녕하세요. ${vo.advertiseName }는 전문적이고 체계적인 방식으로 <br>
						               	사장님들의 플렉스를 돕습니다.
						           </p>
						            <p class="card-text">
						               	승인날을 기준으로 한달의 유효기간을 가집니다.
						           </p>
						           <p class="card-text text-right">
						               	<span>가격 : ${vo.advertisePrice }</span> <br>
						               	<span>월정액 시스템 입니다.</span> <br>
						             
						           </p>
						           <div class="text-right">
						         	  <button class="btn btn-primary block" id="btFlexAD" value="${vo.advertiseNo}" name="btFlexAD" style="color:black; background-color:#fcbe32; border: none; ">선택</button>
						           </div>
						       </div>
						   </div>
						</div>
					</div>
					<div class="col-md-2 col-sm-12"></div>
				</c:forEach>
			</c:if>
		
		</div>
		<!-- row 끝 -->
		
		
<!-- bottom 시작-->
<%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>


		