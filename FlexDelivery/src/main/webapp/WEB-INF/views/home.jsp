<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#spinnerDiv').hide();
	});
	$(window).scroll(function(){
		if($(window).scrollTop()==$(document).height()-$(window).height()){
			//더보기처리
			var pageSize=6;
			
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
				url:"<c:url value='/member/store/storeAll.do'/>",
				type:"post",
				dataType:"JSON",
				data:$('#frmPlus').serialize(),
				success:function(map){
					for(var i=0;i<map.list.length;i++){
						var str="<div class='col-md-6 mb-3' onclick=\"location.href='<c:url value='/member/store/storeDetail.do?storeNo="+map.list[i].storeNo+"'/>'\">";
						str+="<div class='d-flex align-items-center list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm'>";
						str+=" <div class='list-card-image'>";
						str+="<div class='favourite-heart text-danger position-absolute'><a href='<c:url value='/member/memberLike.do?storeNo="+map.list[i].storeNo+"' />'><i class='feather-heart'></i></a></div>";
						if(map.list[i].sStatusNo==2){
							str+="<div class='member-plan position-absolute'><span class='badge badge-primary'>영업중</span></div>";
						}else if(map.list[i].sStatusNo==1 || map.list[i].sStatusNo==3){
							str+="<div class='member-plan position-absolute'><span class='badge badge-dark'>준비중</span></div>";
						}
						str+="<a href='<c:url value='/member/store/storeDetail.do?storeNo="+map.list[i].storeNo+"' />'>";
						str+="<img src='<c:url value='/resources/imgs/"+map.list[i].storeLogo+"'/>' class='img-fluid item-img w-100'></a></div>";
						str+="<div class='p-3 position-relative'>";
						str+="<div class='list-card-body'>";
						str+="<p class='mb-1 h6'>"+map.list[i].storeName+"</p>";
						str+="<p class='text-gray mb-2'>"+map.list[i].storeAddress+" "+map.list[i].storeAddressDetail+"</p>";
						str+="<p class='text-gray mb-2 time'>";
						str+="<span class='bg-light text-dark rounded-sm'><i class='feather-clock'></i>";
						str+=map.list[i].storeOpenTime+"~"+map.list[i].storeCloseTime+"</span></p>";
						str+="<p class='text-gray mb-2'>";
						str+="</div></div>";
						if(map.list[i].couponExist>0){
							str+="<span class='badge badge-danger float-right' style='position: absolute; top: 8px;right: 8px' >coupon</span>";
						}
						str+="</div></div>";
						
						$('#listDiv').append(str);
					}
				},
				error:function(xhr,status,error){
					alert("error:"+error);
				},
				beforeSend:function(){
					$('#spinnerDiv').show();
				},
				complete:function(){
					$('#spinnerDiv').hide();
				}
			})
		}	
	});
</script>
<div class="most_sale">
   <div class="row mb-3" id="listDiv">
   <form name="frmPlus" id="frmPlus" method="post">
   		<input type="hidden" name="startIndex" id="startIndex" value="${map.startIndex}">
   		<input type="hidden" name="lastIndex" id="lastIndex" value="${map.lastIndex}">
   		<input type="hidden" name="lCategoryNo" id="lCategoryNo" value="${map.lCategoryNo}">
   		<input type="hidden" name="totalRecords" id="totalRecords" value="${map.totalRecords}">
   </form>
	<c:if test="${empty list}">
		<div class="col-md-12 pb-12">
		    <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm" style="min-height: 250px">
		        <h1>텅 </h1>
		    </div>
		</div>
	</c:if>
	<c:if test="${!empty list}">	
		<c:forEach var="vo" items="${list}">
			<div class="col-md-6 mb-3" onclick="location.href='<c:url value='/member/store/storeDetail.do?storeNo=${vo.storeNo}' />'">
			    <div class="d-flex align-items-center list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
			        <div class="list-card-image">
			            <div class="favourite-heart text-danger position-absolute"><a href="<c:url value='/resources/memberResources/#' />"><i class="feather-heart"></i></a></div>
			            <c:if test="${vo.sStatusNo==2}">
			                <div class="member-plan position-absolute"><span class="badge badge-primary">영업중</span></div>
		                </c:if>
		                <c:if test="${vo.sStatusNo==1 or vo.sStatusNo==3}">
			                <div class="member-plan position-absolute"><span class="badge badge-dark">준비중</span></div>
		                </c:if>
			            <a href="<c:url value='/member/store/storeDetail.do?storeNo=${vo.storeNo}' />">
		                    <img alt="#" src='<c:url value="/resources/imgs/${vo.storeLogo}"/>' class="img-fluid item-img w-100">
		                </a>
			        </div>
			        <div class="p-3 position-relative">
			            <div class="list-card-body">
		                   <p class="mb-1 h6">${vo.storeName}</p>
		                    <p class="text-gray mb-2">${vo.storeAddress} ${vo.storeAddressDetail}</p>
			                <p class="text-gray mb-2 time">
			                <span class="bg-light text-dark rounded-sm"><i class="feather-clock"></i>
			                	${vo.storeOpenTime} ~ ${vo.storeCloseTime}
			                 </span>
			                </p>
		               		<p class="text-gray mb-2">
		                </div>
			        </div>
	                   <c:if test="${vo.couponExist>0}">
			               	<span class="badge badge-danger float-right" style="position: absolute; top: 8px;right: 8px" >coupon</span>
	                   </c:if>
			    </div>
			</div>
		</c:forEach>
	</c:if>
 	</div>
</div>
<div class="d-flex justify-content-center mb-3">
  <div class="spinner-border" role="status" id="spinnerDiv">
    <span class="visually-hidden"></span>
  </div>
</div>