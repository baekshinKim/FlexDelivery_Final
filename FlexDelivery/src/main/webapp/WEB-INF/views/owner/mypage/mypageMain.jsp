<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../ownerInc/top.jsp" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<script type="text/javascript">
$(function(){
	var boxes = document.querySelectorAll('#boxes > div');
	  [].forEach.call(boxes, box => {
	    box.addEventListener('mousemove', e => {
	      document.body.style.setProperty(
	        '--bg-color',
	        box.style.getPropertyValue('--color')
	      );

	      var size = parseInt(getComputedStyle(box).width);
	      
	      // scaling
	      var x = size * .3 * .7 + .7 * e.offsetX;
	      var y = size * .3 * .7 + .7 * e.offsetY;
	      
	      box.style.setProperty('--x', x);
	      box.style.setProperty('--y', y);
	      box.style.setProperty('--size', size);
	    });
	  });
});


function scrollMove(){

	window.scrollTo({top:700, behavior:'smooth'});
}


function scrollMoveUp(){
	
	window.scrollTo({top:100, behavior:'smooth'});
}
	
function mypageInClick(){
	$('.mypageIn').click(function(){
		var url="";
		if($(this).val()=='edit'){
			url="<c:url value='/owner/register/registerEdit.do'/>";
			location.href=url;
		}else if($(this).val()=='cancle'){
			
			scrollMoveUp();
			$('#cardArea').css("display","none");
		}else if($(this).val()=="withdraw"){
			location.href="<c:url value='/owner/mypage/mypageDelete.do'/>";
		}else if($(this).val()=="reCancle" || $(this).val()=="stCancle"){
			location.href="<c:url value='/owner/menu2/requests/requests.do'/>";
		}
		
		
	});
}
 

$(function(){
	$('.mypage').click(function(){
		
		if($(this).attr('title')=='myInfo'){
			$('#cardArea').css("display","block");
			scrollMove();
			$.ajax({
				url:"<c:url value='/owner/mypage/myInfo.do'/>",
				success:function(vo){
					console.log(${result});
					var str="";
					var str2="";
					var str3="";
				
					str+="<table style='width:60%; margin-left:20%;'>";
		        	str+="<tr>";
		        	str+="<td><hr><span  style='float: left;'>회원 아이디</span><span  style='float: right;'>"+vo.ownerId+"</span><br><hr></td>";
		        	str+="</tr><tr>";
		        	str+="<td><span  style='float: left;'>회원 이름</span><span  style='float: right;'>"+vo.ownerName+"</span><br><hr></td></tr>";
		        	if(vo.ownerHp2!=null && vo.ownerHp3!=null){
		        		str+="<tr><td><span  style='float: left;'>회원 전화번호</span><span  style='float: right;'>"+vo.ownerHp1+"-"+vo.ownerHp2+"-"+vo.ownerHp3+"</span><br><hr></td></tr></table>";
		        	}
		        	
		        	if(${result}==1 || ${result}==3){
		        		str2+="<button class='btn btn-light-primary mypageIn mr-1'  value='edit' style='background-color:rgb(182,73,197);  color:white;'>수정</button>";
		        	}
		        	str2+="<button class='btn btn-light-primary mypageIn' value='cancle' style='background-color:rgb(182,73,197); color:white;'>확인</button>";
		        	if(${result}==1){
		        		str2+="<button class='btn btn-light-primary mypageIn ml-1'  value='withdraw' style='background-color:rgb(210,210,210); color:white;'>탈퇴</button>";
		        	}
		        	$('#title').html('내정보');
					$('#content').html(str);
					$('#btArea').html(str2);
					mypageInClick();
				},
				error:function(xhr,status,error){
					alert('error !! = '+ error);
				}
			});
			event.preventDefault();
		}else if($(this).attr('title')=='myRegister'){
			if(${result}==2 || ${result}==3 || ${result}==4 || ${result}==5 || ${result}==6){
				$('#cardArea').css("display","block");
				scrollMove();
				$.ajax({
					url:"<c:url value='/owner/mypage/myRegister.do'/>",
					success:function(vo){
						
						var str="";
						var str2="";
						
							if(vo.aAgreeNo==3 || vo.aAgreeNo==1){ 
								if(vo.aAgreeNo==1){
									str+="<p>현재 사업자 등록 <b>[승인 대기]</b> 중입니다</p>";
								}else if(${result}==6){
									str+="<p>현재 점포 탈퇴 <b>[승인 대기]</b> 중입니다</p>";
								}
								
								str+="<table style='width:60%; margin-left:20%;'>";
					        	str+="<tr>";
					        	str+="<td><hr><span  style='float: left;'>사업자 번호</span><span  style='float: right;'>"+vo.oRegisterNo+"</span><br><hr></td>";
					        	str+="</tr><tr>";
					        	
					        	if(vo.oRegisterFileName.substring(0,4)=='http'){
					        		str+="<td><img src='"+vo.oRegisterFileName+"'  alt ='"+vo.oRegisterNo+"'  style='height:150px;'><br><hr></td></tr>";
					        	}else if(vo.oRegisterFileName.substring(0,4)!='http' && vo.oRegisterFileName!=null){
					        		str+="<td><img src='<c:url value='/resources/imgs/OwnerRegisterImages/"+vo.oRegisterFileName+"'/>' style='height:150px;' alt ='"+vo.oRegisterNo+"' ><br><hr></td></tr>";
					        	}
							 }else{
								 str+="<p>사업자 등록 진행바랍니다</p>";
							 }
							
							if(${result}==3){
				        		str2+="<button class='btn btn-light-primary mypageIn mr-1' value='edit' style='background-color:rgb(182,73,197);  color:white;'>수정</button>";
				        	}
				        	
				        	if(${result}==2 || ${result}==4){
				        		str2+="<button class='btn btn-light-primary mypageIn mr-1' value='reCancle' style='background-color:rgb(182,73,197);  color:white;'>사업자 등록 취소</button>";
				        	}
				        	str2+="<button class='btn btn-light-primary mypageIn' value='cancle' style='background-color:rgb(182,73,197); color:white;'>확인</button>";
				        	
				        	$('#title').html('사업자 정보');
							$('#content').html(str);
							$('#btArea').html(str2);
							mypageInClick();
							
					},
					error:function(xhr,status,error){
						alert('error !! = '+ error);
					}
				});
				event.preventDefault();
			}else{
				 alert('사업자 등록 부탁 드립니다.');
				 $('#cardArea').css("display","none");
			}
		}else if($(this).attr('title')=='myStore'){
			if( ${result}==3 ||  ${result}==5 || ${result}==6){
				$('#cardArea').css("display","block");
				scrollMove();
				
				$.ajax({
					url:"<c:url value='/owner/mypage/myStore.do'/>",
					success:function(map2){
						var str="";
						var str2="";
						if(map2.vo.aAgreeNo==3 || map2.vo.aAgreeNo==1 || map2.vo.aAgreeNo==8){
							
							if(map2.vo.aAgreeNo==1){
								str+="<p>현재 점포 등록 <b>[승인 대기]</b> 중입니다</p>";
							}
							if(map2.vo.aAgreeNo==8){
								str+="<p>점포 탈퇴 <b>[승인 대기]</b> 중입니다.</p>";
							}
							if(map2.vo.storeLogo!=null){
								if(map2.vo.storeLogo.substring(0,4)=='http'){
					        		str+="<div><img src='"+map2.vo.storeLogo+"'  alt ='"+map2.vo.storeName+"'  style='height:200px;'><br><hr></div>";
					        	}else if(map2.vo.storeLogo.substring(0,4)!='http' && map2.vo.storeLogo!=null){
					        		str+="<div><img src='<c:url value='/resources/imgs/StoresImages/"+map2.vo.storeLogo+"'/>' style='height:200px;' alt ='"+map2.vo.storeName+"' ><br><hr></div>";
					        	}
							}
							str+="<h5>필 수 정 보 </h5>";
						
							str+="<table style='width:60%; margin-left:20%;'>";
				        	str+="<tr>";
				        	str+="<td><hr><span  style='float: left;'>점포 이름</span><span  style='float: right;'>"+map2.vo.storeName+"</span><br><hr></td>";
				        	str+="</tr>";
				        	str+="<tr><td><span  style='float: left;'>대분류 카테고리</span><span  style='float: right;'>"+map2.lCategoryName+"</span><br><hr></td></tr>";
				        	str+="<tr><td>점포 주소<br><br><textarea cols='50' rows='2' disabled='disabled'>"+map2.vo.storeAddress+" "+map2.vo.storeAddressDetail+"</textarea><br><hr></td></tr></table>";
				        	
				        	if(map2.vo.storeMinPrice!=null || map2.vo.storeContent!=null (map2.vo.storeOpenTime !=null && map2.vo.storeCloseTime !=null) || map2.vo.sStatusNo!=null ||
				        			map2.vo.hCategoryNo!=null){
				        		str+="<h5 style='margin-bottom:20px; margin-top:30px;'>부 가 정 보 </h5>";
				        	}
				        	str+="<table style='width:60%; margin-left:20%;'>";
				        	str+="<tbody>";
				        	if(map2.vo.storeMinPrice!=null){
				        		str+="<tr><td><span  style='float: left;'>최소 주문 금액</span><span  style='float: right;'>"+map2.vo.storeMinPrice+"원</span><br><hr></td></tr>";
				        	}
				        	if(map2.vo.storeOpenTime !=null && map2.vo.storeCloseTime !=null){
				        		str+="<tr><td><span  style='float: left;'>영업 시간</span><span  style='float: right;'>"+map2.vo.storeOpenTime+"~"+map2.vo.storeCloseTime+"</span><br><hr></td></tr>";
				        	}
				        	if(map2.vo.sStatusNo!=null){
				        		str+="<tr><td><span  style='float: left;'>영업 상태</span><span  style='float: right;'>"+map2.map['S_STATUS_NAME']+"</span><br><hr></td></tr>";
				        	}
				        	if(map2.vo.hCategoryNo!=null){
				        		if(map2.vo.hCategoryNo==7){
				        			str+="<tr><td><span  style='float: left;'>휴무일</span><span  style='float: right;'>"+map2.map['H_CATEGORY_NAME']+"</span><br><hr></td></tr>";
				        		}else{
				        			str+="<tr><td><span  style='float: left;'>휴무일</span><span  style='float: right;'>"+map2.map['H_CATEGORY_NAME']+"요일</span><br><hr></td></tr>";
				        		}
				        	}
				        	if(map2.vo.storeContent!=null){
				        		if(map2.vo.aAgreeNo==1){
				        			str+="<td>요청 사항";
				        		}else{
				        			str+="<td>가게 소개";
				        		}
				        		str+="<br><br><textarea cols='50' rows='5' disabled='disabled'>"+map2.vo.storeContent+"</textarea><br><hr></td></tr>";
				        		
				        	}
				        	str+="</tbody>";
				        	str+="</table>";
				        
						}else{
							 str+="<p>점포 등록을 진행바랍니다</p>";
						 }
			        	
						
						if(${result}==3){
			        		str2+="<button class='btn btn-light-primary mypageIn mr-1' value='edit' style='background-color:rgb(182,73,197);  color:white;'>수정</button>";
			        	}
			        	
			        	if(${result}==5 || ${result}==6){
			        		str2+="<button class='btn btn-light-primary mypageIn mr-1' value='stCancle' style='background-color:rgb(182,73,197);  color:white;'>승인 신청 취소</button>";
			        	}
			        	str2+="<button class='btn btn-light-primary mypageIn' value='cancle' style='background-color:rgb(182,73,197); color:white;'>확인</button>";

						if(${result}==3){
			        		str2+="<button class='btn btn-light-primary mypageIn ml-1'  value='withdraw' style='background-color:rgb(210,210,210); color:white;'>탈퇴</button>";
			        	}
			        	
			        	
			        	$('#title').html('가게 정보');
						$('#content').html(str);
						$('#btArea').html(str2);
						mypageInClick();
					},
					error:function(xhr, status, error){
						alert("error : "+error);
					}
				});
			}else if(${result} ==1){
				alert("사업자 등록 부탁드립니다");
				$('#cardArea').css("display","none");
			}else if(${result}==2){
				alert('점포 등록 부탁드립니다');
				$('#cardArea').css("display","none");
			}else if(${result}==4){
				alert('사업자 등록 승인 대기중입니다.');
				$('#cardArea').css("display","none");
			}
				
		}
	});
});
	
</script>
<style>
	}   
	 */
#boxesBG { 
  height: 100%; 
  margin: 0;
}

#boxesBG, #boxes div.btColor { 
  display: flex;
  align-items: center; 
  justify-content: center;
}

#boxesBG:after {
  z-index: -1;
  content: '';
  position: absolute; 
 /*  top: 50;  */
/*   left: 0;  */
  width: 100%;
  height: 100%;
  transition: all .5s ease;
/*   background: var(--bg-color, #f44336); */
  opacity: .1;
}

#boxes {
  counter-reset: number;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}

@media (max-width: 320px) {
  #boxes {
    grid-template-columns: repeat(2, 1fr);
  }
}

#boxes div.btColor {
  counter-increment: number;
  width: 10vw;
  height: 10vw;
  min-width: 5em;
  min-height: 5em;
  transition: .5s all ease;
  background: var(--color, #aaa);
  border: 0 solid transparent;
  box-sizing: border-box;
  border-radius: 50%;
  margin: .5em;
  opacity: .7;
  --dx: calc(var(--size) - var(--x));
  --dy: calc(var(--size) - var(--y));
}

#boxesBG:not([style]) #boxes div.btColor:first-child {
  --x: 150;
  --y: 160;
  --size: 300;
}

#boxesBG:not([style]) #boxes div.btColor:first-child,
#boxes div.btColor:hover {
  opacity: 1;
  cursor: pointer;
  border: calc(2px + .85vw) solid rgba(255, 255, 255, .5);
  transition:
    .5s background-color ease,
    .2s border ease;

  border-radius:
    calc(var(--x) / var(--size) * 100%) 
    calc(var(--dx) / var(--size) * 100%)
    calc(var(--dx) / var(--size) * 100%) 
    calc(var(--x) / var(--size) * 100%) / 
    calc(var(--y) / var(--size) * 100%) 
    calc(var(--y) / var(--size) * 100%) 
    calc(var(--dy) / var(--size) * 100%) 
    calc(var(--dy) / var(--size) * 100%) 
}

#boxesBG:not([style]) #boxes div.btColor:first-child:after,
#boxes div.btColor:after {
  /*  content: counter(number);  */
  color: rgba(255, 255, 255, 0);
  font-size: calc(1vw + 1.2em);
  font-weight: 200;
  transition: all .2s ease;
  transition-delay: .1s;
  transform: translate3d(0, -.5em, 0);
}

#boxesBG:not([style]) #boxes div.btColor:first-child:after,
#boxes div.btColor:hover:after {
  color: rgba(255, 255, 255, .7);
  transform: translate3d(0, 0, 0);
}	
	
</style>


 
<div class="row" style="margin-bottom:130px;">
	<div class="col-12 col-md-3"></div>
	<div class="col-12 col-md-6 text-center" >
	
	 <br>
		<div class="row mb-5 mt-3" style="border: 2px solid black; " data-aos="zoom-in-up">
			<br><br>
			<!-- 헤드 시작 -->
			<div class="col-12 col-md-2 pt-5"></div>
			<div class="col-12 col-md-8 text-center pt-5" >
				 <h3>마 이 페 이 지</h3>
			</div>
			<div class="col-12 col-md-2 pt-5"></div>
				<br><br><Br>
			<!-- 헤드 시작 -->
			<div class="col-11 text-right mt-4 mb-4" >
				 <h5 style="display: inline;">[${ownerName}]</h5><span><small>&nbsp;사장님 반갑습니다</small></span><br>
				<span><small><a href="<c:url value='/owner/menu2/requests/requests.do'/>" style="decoration:none; color:black;">[ 승인 현황 보기 ]</a></small></span>
			</div>
			<div class="col-12 col-md-1"></div>
				<br><br>
				
			
			<div class="col-12 text-center mt-4 mb-5"  >
				<div id="boxesBG" >
					<div id="boxes" >
						<div class="btColor "style="--color: #e91e63; color:white; font-size:24px; display:none;"></div>
						<div class="btColor mypage" style="--color: #e91e63; color:white; font-size:24px;" title="myInfo">내정보</div>
					    <div class="btColor mypage" style="--color: #9c27b0; color:white; font-size:24px;" title="myRegister">사업자<br>등록증</div>
					    <div class="btColor mypage" style="--color: #ff9800; color:white; font-size:24px;" title="myStore" data-target="#info">점포</div>
					</div>
				</div>
			</div>
			
		</div> 
	</div>
	<div class="col-12 col-md-3"></div>

  



	<div class="col-12 col-md-3"></div>
	<div class="col-12 col-md-6 text-center p-0" >

				<div class="card" id="cardArea" style="display:none;">
                    <div class="card-content">
                        <div class="card-body">
                            <h3 class="card-title mb-5 mt-3" id="title" ></h3>
                            <div class="card-text" id="content" >
                                
                            </div>
                        </div>
                    </div>
                    <div class=" d-flex justify-content-center mb-5" style="background-color:white; " id="btArea">
                    </div>
                   
                </div>
			</div>
	<div class="col-12 col-md-3"></div>

</div>	  

 <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
			<script>
				AOS.init();
			</script>

<%@ include file="../../ownerInc/bottom.jsp" %>