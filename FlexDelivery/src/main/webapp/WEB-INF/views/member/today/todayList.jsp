<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<style>
 html{
 	background-color: rgba(30,30,30,0.9);
 }	
</style>
<script src="${pageContext.request.contextPath}/resources/ownerResources/herbJs/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<style>
	li{
		float: left;
	    display: flex;
	    margin: 0.3em;
	}
	
	ul{
		display: contents;
	}
</style>
<script>
	

	function goStore(no){
		location.href="<c:url value='/member/store/storeDetail.do?storeNo="+no+"'/>";
	}
	 
	
	$(function(){
		$('#goStore').click(function(){
			var lCategoryNo = $('input[name=lCategoryNo]').val();
			location.href="<c:url value='/member/store/storeList.do?lCategoryNo="+lCategoryNo+"'/>";
		});
	});
	
	
	
	$(function(){
		$('#cancelBottom').click(function(){
			location.href="<c:url value='/member/index.do'/>";
		});
	});
	
	
	$(function(){
		$('#imgHover').click(function(){
			location.href="<c:url value='/member/index.do'/>";
		});
	});
	
	$(function(){
		
		
		var mCategoryNo=$('input[name=mCategoryNo]').val();
		
		$.ajax({
			url:"<c:url value='/member/today/todayListStores.do'/>",
			data:"mCategoryNo="+mCategoryNo,
			success:function(mcList){
				var str="";
		
				
				
				if(mcList.length==0){ //나중에 데이터 넣고나면 지울거임!
					str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/noddle.jpg' alt='Card image cap'>";
		  			str+="</div>";
					str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/CommonImages/index1.jpg' alt='Card image cap'>";
		  			str+="</div>";
					str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/CommonImages/index2.jpg' alt='Card image cap'>";
		  			str+="</div>";
					str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/CommonImages/index4.jpg' alt='Card image cap'>";
		  			str+="</div>";
		  			str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/pancake.jpg' alt='Card image cap'>";
		  			str+="</div>";
					str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/CommonImages/index5.jpg' alt='Card image cap'>";
		  			str+="</div>";
					str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/CommonImages/index6.jpg' alt='Card image cap'>";
		  			str+="</div>";
					str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/CommonImages/index7.jpg' alt='Card image cap'>";
		  			str+="</div>";
		  			str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/sawooPotato.jpg' alt='Card image cap'>";
		  			str+="</div>";
					str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/CommonImages/index9.jpg' alt='Card image cap'>";
		  			str+="</div>";
		  			str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/hot.jpg' alt='Card image cap'>";
		  			str+="</div>";
					str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/CommonImages/inex3.jpg' alt='Card image cap'>";
		  			str+="</div>";
					str+="<div class='card' data-aos='fade-up' >";
					str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/CommonImages/index11.jpg' alt='Card image cap'>";
		  			str+="</div>";
				}else{
					$.each(mcList, function(idx,items){
						if(items['MENU_IMG'].substring(0,4)=='http'){
							str+="<div class='card' data-aos='fade-up' >";
					    	str+="<img class='card-img' src='"+items['MENU_IMG']+"' alt='Card image cap'>";
					  		str+="</div>";
						}else if(items['MENU_IMG'].substring(0,4)!='http' && items['MENU_IMG']!=null){
							str+="<div class='card' data-aos='fade-up' >";
							str+="<img class='card-img' src='${pageContext.request.contextPath}/resources/imgs/MenuImages/"+items['MENU_IMG']+"' alt='Card image cap'>";
				  			str+="</div>";
						}
					});
				}	
		
				$('#menuImgList').html(str);
				
			},
			error:function(xhr, status, error){
				alert('error! '+error);
			}
		});
		event.preventDefault();
			
		
	}); 
	
	$(function(){
		$('')
	});
</script>

<div style="background-color: rgba(30,30,30,0.9);">
	<input type="hidden" name="mCategoryNo" value="${map['M_CATEGORY_NO'] }">
	<input type="hidden" name="lCategoryNo" value="${map['L_CATEGORY_NO'] }">
	<br>
	<br>
	<div>
		<p><img src='${pageContext.request.contextPath}/resources/imgs/CommonImages/fdLogo_EN.png' id="imgHover" style="display:block; margin: auto; height:60px;"></p>
		
	</div>
	
	<div style=" margin-bottom:50px; margin-top:120px; " data-aos="fade-right" data-aos-duration="1500">
		<p style="margin-left:10%; font-size:60px; color:white;"> 오늘은<br>맛있는 ${map['M_CATEGORY_NAME'] }${emoji }<br>어때요 ?</p>
	</div>
	
	<div class="row">
		<div class="col-12 col-sm-1"></div>
		<div class="col-12 col-sm-10">
			<div class="row row-cols-1 row-cols-md-3 mb-4" >
			  <div class="col p-0 pl-4 pr-2" data-aos="fade-right" data-aos-duration="1500">
			    <div class="card h-100" style="width: 100%; background-image: url('<c:url value='/resources/imgs/todayBg3.png'/>'); background-repeat: no-repeat; background-size: cover; border:none;">
			      <div class="card-body" style="color: white;">
					     <div class="row" style="margin:auto;">
					     <div class="col-12 col-md-1"></div>
					     <div class="col-12 col-md-10">
						     <div  style="margin-top:5%;" id="tagList" >
									<c:if test="${empty mList }">
										<div >
			   	 							<p style='border-radius: 10px; background-color:rgba(30,30,30,0.3); font-size:13px; width:100%; text-align:center;' class='p-2'>메뉴 준비 중입니다</p>
				   						</div>
									</c:if>
									<c:if test="${!empty mList }">
										<c:forEach var="map" items="${mList }">
										<ul>
											<li >
				   	 							<span style='border-radius: 10px; background-color:rgba(30,30,30,0.3); font-size:13px; width:auto;' class='p-2 spanClick' onclick="goStore(${map['STORE_NO']})">#${map['MENU_NAME'] }</span>
					    					</li>
					    				</ul>
					    				</c:forEach>
									</c:if>   
						      </div>
					 	 </div>
					 	<div class="col-12 col-md-1"></div>
					 	</div>
			      </div>
			    </div>
			  </div>
			  <div class="col p-0 pr-4 pl-2" data-aos="fade-left"  data-aos-duration="1500" >
			    <div class="card h-100" style="width: 100%;  background-color: rgba(0,0,0,0.2);">
			      <div class="card-body" style="color: white;">
			       	<div style="text-align: right; margin-right:70px;" class="mb-4 mt-3">
				       	 <span >우리 동네</span><Br>
					     <span style="font-size: 25px;">${map['M_CATEGORY_NAME'] }${emoji }</span><span> 추천!</span><br>
				    </div>
				    <c:set var="lCategoryNoCset" value="${map['L_CATEGORY_NO'] }"></c:set>
				    <a href="<c:url value='/member/store/storeList.do?lCategoryNo=${lCategoryNoCset}'/>" class="btn btn-warning" style="width:80%;  border-radius: 20px; display:block; margin: auto; color:#333;"><b>주문하러 가기</b></a>
			      </div>
			    </div>
			  </div>
			</div>
		<div class="col-12 col-sm-1"></div>
		</div>
	</div>

		<div class="container p-0">
			<div class="card-columns" id="menuImgList">
			  
			  
			</div>
		</div>

	<div class="row " id="footerDiv" style="height:80px; display: none;" >
		<div class="col-12 col-md-4"></div>
		<div class="col-12 col-md-4">
			<div style="margin-bottom:10%; ">
				<p style="color:white; font-size:30px; text-align: center;" id="goStore" class="mt-3">주문하러 가시겠습니까?  
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-arrow-right-circle ml-1" viewBox="0 0 16 16" style="color:white;">
		  			<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg>
				
				</p>
			
			</div>
		</div>
		<div class="col-12 col-md-4" style="text-align: right;">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" id="cancelBottom" class="bi bi-x mt-4 mr-4" viewBox="0 0 16 16" style="color:white;">
				<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
			</svg>

		</div>
 	</div>
</div>
 <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
			<script>
				AOS.init();
				
				$(function(){
					var sa = 100;
					//스크롤 기본폼 window기억!
					$(window).scroll(function(){
						var num = $('html,body').scrollTop();
						console.log(num);
						if(num<sa){
					   		$('#footerDiv').show();
					   }else{
					   		$('#footerDiv').hide();
					   }
					});
					
				});
				
			</script>

 <style>
 /*아래의 column수를 조절하면 화면에 보여지는 컬럼 수가  바껴요 2로바꾸면 2개만보입니다.  */
 .card-columns{
 	    column-count: 3;
 }
  
  
 
 .card-columns .card {
    border: none;
}

#footerDiv {
    position: fixed;
    bottom:0;
    width: 100%;
    background-color: rgba(30,30,30,0.6);
    font-weight: bold;
}

#footerDiv > div:nth-child(2) > div > p:hover, #cancelBottom:hover, .spanClick:hover, #imgHover:hover{
	cursor:pointer;
}

 </style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>