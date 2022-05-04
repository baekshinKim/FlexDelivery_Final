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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">


<div style="background-color: rgba(30,30,30,0.9);">
	<br>
	<br>
	<div>
		<p style="margin-left:10%; font-size:15px; color:white; text-align: center;">오늘 뭐먹지?</p>
	</div>
	
	<div style=" margin-bottom:50px; margin-top:100px; " data-aos="fade-right" data-aos-duration="1500">
		<p style="margin-left:10%; font-size:60px; color:white;"> 오늘은<br>간편한 도시락🍱<br>어때요 ?</p>
	</div>
	
	<div class="row">
		<div class="col-12 col-sm-1"></div>
		<div class="col-12 col-sm-10">
			<div class="row row-cols-1 row-cols-md-3 mb-4" >
			  <div class="col p-0 pl-4 pr-2" data-aos="fade-right" data-aos-duration="1500">
			    <div class="card h-100" style="width: 100%; background-image: url('<c:url value='/resources/imgs/todayBg3.png'/>'); background-repeat: no-repeat; background-size: cover; border:none;">
			      <div class="card-body" style="color: white;">
					     <div class="row" style="margin:auto;">
					     <div class="col-12 col-md-2"></div>
					     <div class="col-12 col-md-8">
					     <div class="row" style="margin-top:10%;">
					     	 <div class="col-12 col-md-4  mb-4 p-1">
						   	 	 <span style="border-radius: 10px; background-color:rgba(30,30,30,0.3); font-size:13px;" class="p-2 spanClick">#로봇김밥</span>
						     </div>
						      <div class="col-12 col-md-4  mb-4 p-1">
						   	 	 <span style="border-radius: 10px; background-color:rgba(30,30,30,0.3); font-size:13px;" class="p-2 spanClick" >#마녀김밥</span>
						     </div>
						      <div class="col-12 col-md-4  mb-4 p-1">
						   	 	 <span style="border-radius: 10px; background-color:rgba(30,30,30,0.3); font-size:13px;" class="p-2 spanClick">#소담김밥</span>
						     </div>
						      <div class="col-12 col-md-4  mb-4 p-1">
						   	 	 <span style="border-radius: 10px; background-color:rgba(30,30,30,0.3); font-size:13px;" class="p-2 spanClick">#김가네김밥</span>
						     </div>
						     <div class="col-12 col-md-4  mb-4 p-1">
						   	 	 <span style="border-radius: 10px; background-color:rgba(30,30,30,0.3); font-size:13px;" class="p-2 spanClick">#고봉민김밥</span>
						     </div>
						     
						    
					      </div>
					 	 </div>
					 	<div class="col-12 col-md-2"></div>
					 	</div>
			      </div>
			    </div>
			  </div>
			  <div class="col p-0 pr-4 pl-2" data-aos="fade-left"  data-aos-duration="1500" >
			    <div class="card h-100" style="width: 100%;  background-color: rgba(0,0,0,0.2);">
			      <div class="card-body" style="color: white;">
			       	<div style="text-align: right; margin-right:70px;" class="mb-4 mt-3">
				       	 <span>우리 동네</span><Br>
					     <span style="font-size: 25px;">김밥</span><span> 추천!</span><br>
				    </div>
				    <a href="#" class="btn btn-warning" style="width:80%;  border-radius: 20px; display:block; margin: auto; color:#333;"><b>주문하러 가기</b></a>
			      </div>
			    </div>
			  </div>
			</div>
		<div class="col-12 col-sm-1"></div>
		</div>
	</div>

		<div class="container p-0">
			<div class="card-columns">
			  <div class="card "  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/noddle.jpg'/>" alt="Card image cap">
			  </div>
			   <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/sawooPotato.jpg'/>" alt="Card image cap">
			  </div>
			   <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/pancake.jpg'/>" alt="Card image cap">
			  </div>
			   <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/hot.jpg'/>" alt="Card image cap">
			  </div>
			   <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index1.jpg'/>" alt="Card image cap">
			  </div>
			    <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index2.jpg'/>" alt="Card image cap">
			  </div>
			  <div class="card"  data-aos="fade-up" > 
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index4.jpg'/>" alt="Card image cap">
			  </div>
			    <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index5.jpg'/>" alt="Card image cap">
			  </div>
			    <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index6.jpg'/>" alt="Card image cap">
			  </div>
			    <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index7.jpg'/>" alt="Card image cap">
			  </div>
			    <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index9.jpg'/>" alt="Card image cap">
			  </div>
			   <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/sawooPotato.jpg'/>" alt="Card image cap">
			  </div>
			
			  <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index5.jpg'/>" alt="Card image cap">
			  </div>
			    <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index6.jpg'/>" alt="Card image cap">
			  </div>
			    <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index7.jpg'/>" alt="Card image cap">
			  </div>
			    <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index9.jpg'/>" alt="Card image cap">
			  </div>  
			  <div class="card" data-aos="fade-up">
			    <img class="card-img" src="<c:url value='/resources/imgs/sawooPotato.jpg'/>" alt="Card image cap">
			  </div>
			   <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/pancake.jpg'/>" alt="Card image cap">
			  </div>
			   <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/hot.jpg'/>" alt="Card image cap">
			  </div>
			    <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index6.jpg'/>" alt="Card image cap">
			  </div>
			    <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index7.jpg'/>" alt="Card image cap">
			  </div>
			    <div class="card"  data-aos="fade-up" >
			    <img class="card-img" src="<c:url value='/resources/imgs/CommonImages/index9.jpg'/>" alt="Card image cap">
			  </div>
			</div>
		</div>

	<div class="row" id="footerDiv" style="height:80px; display: none;" >
		<div class="col-12 col-md-4"></div>
		<div class="col-12 col-md-4">
			<div style="margin-bottom:10%; ">
				<p style="color:white; font-size:30px; text-align: center;" class="mt-3">주문하러 가시겠습니까?  
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

#footerDiv > div:nth-child(2) > div > p:hover, #cancelBottom:hover, .spanClick:hover{
	cursor:pointer;
}

 </style>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>