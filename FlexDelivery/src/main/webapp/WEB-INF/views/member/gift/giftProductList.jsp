<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">

	function categoryClick(no){
		var data="gCategoryNo="+no;
		$.ajax({
			url:"<c:url value='/member/gift/giftProductAjax.do'/>",
			type:"get",
			data:data,
			success:function(map){
				
				if(map.list.length==0){
					var str="<div class='p-3 rounded shadow-sm bg-white' style='text-align:center'>";
					str+="<img src='<c:url value='/resources/imgs/noListDefault.png'/>' class='img-fluid' style='inline-size:45em;'>";
					str+="</div>"
					
					$('#home').html(str);
					event.preventDefault();
				}else{
					var name="";
					if(map.name!=null){
						name=map.name;
					}
					var str="<h5 class='mb-1'>"+name+" ("+map.count+"개)</h5>";
					str+="<p>특별한 날,특별한 누군가를 위해 FLEX-DELIVERY만의 상품권을 선물하세요</p>";
					str+="<div class='row'>";
					for(var i=0;i<map.list.length;i++){
						str+="<div class='col-md-3 col-6 pb-3'>";
						str+="<div class='list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm'>";
						str+="<div class='list-card-image'>";
						str+="<div class='member-plan position-absolute'>";
						if(map.list[i].gCategoryNo==1){
							str+="<span class='badge badge-success'>";
						}else if(map.list[i].gCategoryNo==2){
							str+="<span class='badge' style='background-color: #D7F205; color: black;'>";
						}else if(map.list[i].gCategoryNo==3){
							str+="<span class='badge badge-success'>";
						}else if(map.list[i].gCategoryNo==4){
							str+="<span class='badge badge-secondary'>";
						}else if(map.list[i].gCategoryNo==5){
							str+="<span class='badge badge-warning' style='color:white'>";
						}else if(map.list[i].gCategoryNo==6){
							str+="<span class='badge badge-info'>";
						}else if(map.list[i].gCategoryNo==7){
							str+="<span class='badge' style='background-color: #F25CA2;color: white'>";
						}else if(map.list[i].gCategoryNo==8){
							str+="<span class='badge' style='background-color: #008080;color: white'>";
						}else if(map.list[i].gCategoryNo==9){
							str+="<span class='badge' style='background-color: #AB05F2;color: white'>";
						}else if(map.list[i].gCategoryNo==10){
							str+="<span class='badge badge-primary'>";
						}else{
							str+="<span class='badge badge-light'>";
						}
						str+=map.list[i].gCategoryName+"</span></div>";
						str+="<a href='#' data-toggle='modal' data-target='#giftModal' onclick='modalOn("+map.list[i].gProductNo+")'><img alt='#' style='height:200px' src='<c:url value='/resources/imgs/GiftProductImages/"+map.list[i].gProductFilename+"'/>' class='img-fluid item-img w-100'></a></div>";
						str+="<div class='p-3 position-relative'>";
						str+="<div class='list-card-body'>";
						str+="<span class='h5 mb-2 text-end'>"+map.list[i].gProductName+"</span></div>";
						str+="<div class='list-card-badge'><small>5,000원 부터~</small></div></div></div></div>";
					}
					
					$('#home').html(str);
					event.preventDefault();
				}
				
			},error:function(error){
				alert("error"+error);
			}
		})
	};
	
	function modalOn(no) {
		$('#gProductNo').val(no);
	}
</script>
<c:if test="${empty list}">
	<div class='p-3 rounded shadow-sm bg-white' style='text-align:center'>
		<img src='<c:url value='/resources/imgs/noListDefault.png'/>' class='img-fluid' style='inline-size:45em;'>
	</div>
</c:if>
<c:if test="${!empty list}"> 
		<h5 class="mb-1">전체 (${count}개)</h5>
		<p>특별한 날,특별한 누군가를 위해 FLEX-DELIVERY만의 상품권을 선물하세요</p>
		<div class="row">
		<c:forEach var="vo" items="${list}">
		    <div class="col-md-3 col-6 pb-3">
		        <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
		            <div class="list-card-image">
		                <div class="member-plan position-absolute">
		                <c:choose>
			                <c:when test="${vo.gCategoryNo==1}">
			               		<span class="badge badge-danger">
			                </c:when>
			                <c:when test="${vo.gCategoryNo==2}">
			               		<span class="badge" style='background-color: #D7F205; color: black;'>
			                </c:when>
			                <c:when test="${vo.gCategoryNo==3}">
			               		<span class="badge badge-success">
			                </c:when>
			                <c:when test="${vo.gCategoryNo==4}">
			               		<span class="badge badge-secondary">
			                </c:when>
			                <c:when test="${vo.gCategoryNo==5}">
			               		<span class="badge badge-warning" style="color: white">
			                </c:when>
			                <c:when test="${vo.gCategoryNo==6}">
			               		<span class="badge badge-info">
			                </c:when>
			                <c:when test="${vo.gCategoryNo==7}">
			               		<span class="badge" style='background-color: #F25CA2;color: white'>
			                </c:when>
			                <c:when test="${vo.gCategoryNo==8}">
			               		<span class="badge" style='background-color: #008080;color: white'>
			                </c:when>
			                <c:when test="${vo.gCategoryNo==9}">
			               		<span class="badge" style='background-color: #AB05F2;color: white'>
			                </c:when>
			                <c:when test="${vo.gCategoryNo==10}">
			               		<span class="badge badge-primary">
			                </c:when>
							<c:otherwise>
								<span class="badge badge-light">
							</c:otherwise>			                
		                </c:choose>
		                ${vo.gCategoryName}</span></div>
		                <a href="#" data-toggle="modal" data-target="#giftModal" onclick="modalOn(${vo.gProductNo})">
		                    <img alt="#" src="<c:url value='/resources/imgs/GiftProductImages/${vo.gProductFilename}'/>" class="img-fluid item-img w-100" style="height:200px">
		                </a>
		            </div>
		            <div class="p-3 position-relative">
		                <div class="list-card-body">
		                    <span class="h5 mb-2 text-end">${vo.gProductName}</span>
		                </div>
		                <div class="list-card-badge">
		                     <small>5,000원 부터~</small>
		                </div>
		            </div>
		        </div>
		    </div>
		</c:forEach>
	</div>
</c:if>


