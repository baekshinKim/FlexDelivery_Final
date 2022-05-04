<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/ownerResources/herbJs/mainstyle.css'/>" />
<style type="text/css">
body {
	margin: 5px;
	padding: 5px;
}
caption {
	visibility: hidden;
}
.blue{
	color:#006AD5;
}
#divZip table{
	width: 430px;
	margin: 15px 0;
}
#divPage{
	text-align: center;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/ownerResources/herbJs/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/ownerResources/herbJs/paging.js'/>"></script>
<script type="text/javascript">
	var totalCount=0;
	
	$(function(){		
		$('#dong').focus();
		
		$('#submit').click(function(){
			if($('#dong').val().length<1){
				alert('지역명을 입력하세요');
				$('#dong').focus();
				return false;
			}
			
			$.send(1);
			
			event.preventDefault();
		});
	});
	
	$.send=function(curPage){
		$('#currentPage').val(curPage);
		
		$.ajax({
			url:"<c:url value='/owner/mypage/ajaxZipcode.do'/>",
			type:"post",
			data: $('#frmZip').serializeArray(),
			dataType:"xml",
			success:function(xmlStr){
				//alert(xmlStr);
				totalCount=$(xmlStr).find('totalCount').html();
				var errorCode=$(xmlStr).find('errorCode').text();
				var errorMessage=$(xmlStr).find('errorMessage').text();
				
				if(errorCode!=0){
					alert(errorCode +" => " + errorMessage);
				}else{
					if(xmlStr!=null){
						$.makeList(xmlStr);
						$.pageMake();
					}
				}
				
			},
			error:function(xhr, status, error){
				alert("error! : " + error);
			}
		});
	}
	
	$.makeList=function(xmlStr){
		if(totalCount==0){
			$('#divCount').html("");
			$('#divZip')
				.html("<p style='text-align:center'>검색된 내용이 없습니다.</p>");
			return;
		}	
		
		$('#divCount').html("<p>도로명 주소 검색 결과 ("+ totalCount +"건)</p>");
		
		var str="<table class='box2'>";
		str+="<tr><th style='width:20%'>우편번호</th>";
		str+="<th style='width:80%'>도로명 주소</th></tr>";
		
		$(xmlStr).find('juso').each(function(idx, item){
			console.log(xmlStr);
			var roadAddr = $(this).find("roadAddr").text();
			var zipNo = $(this).find("zipNo").text();
			var sggNm = $(this).find("sggNm").text();
			
			str+="<tr>";
			str+="<td>"+zipNo+"</td>";
			str+="<td>"
			str+=
		"<a href='#' onclick='setZipcode(\""+roadAddr+"\",\""+sggNm+"\")'>"; 
			str+= roadAddr +"</a></td>";			
			str+="</tr>";
		});//each
		str+="</table>";
		
		$('#divZip').html(str);
	}
	
	$.pageMake=function(){
		var blockSize=10;
		pagination($('#currentPage').val(), $('#countPerPage').val(),
				blockSize, totalCount);	
		
		var str="";
		//alert("firstPage="+firstPage+", lastPage="+lastPage+",totalPage="+totalPage);
		
		//이전 블럭
		if( firstPage>1 ){	
			str+="<a href='#' onclick='$.send("+(firstPage-1)+")'>";			
	 	str+="<img src='<c:url value='/resources/imgs/first.JPG'/>'></a>"; 
		}
						
		//[1][2][3][4][5][6][7][8][9][10]
		for(var i=firstPage;i<=lastPage;i++){
			if(i==currentPage){
				str+="<span style='color:blue;font-weight: bold'>"+i+"</span>";			
			}else{
				str+="<a href='#' onclick='$.send("+i+")'>["+i+"]</a>";			
			}
		}//for
	
		//다음 블럭으로 이동
		if(lastPage < totalPage){	
			str+="<a href='#' onclick='$.send("+(lastPage+1)+")'>";
			 str+="<img src='<c:url value='/resources/imgs/last.JPG'/>'></a>"; 
		}
		
		$('#divPage').html(str);
	}
	
	function setZipcode(address, sggNm){
		$.ajax({
			url:"<c:url value='/owner/mypage/selectLocationNo.do'/>",
			data:"locationName="+sggNm,
			dataType:"json",
			type:"GET",
			success:function(res){
				$(opener.document).find('input[name=locationNo]').val(res);
				$(opener.document).find('input[name=tStoreAddress]').val(address);
				/* $(opener.document).find('input[name=locationName]').val(sggNm); */
				
				self.close();
			},
			error:function(xhr,status,error){
				alert("error!! : " + error);
			}
		});
		
		event.preventDefault();
	}
</script>
</head>
<body style="text-align: center;">

	<h2>도로명 주소 검색</h2>
	<p>도로명주소, 건물명 또는 지번을 입력하세요</p>
	<p class="blue">검색어 예 : 도로명(반포대로 58), 건물명(독립 기념관), 지번(삼성동 25)</p>
	
	<form name="frmZipcode" id="frmZip" method="post">
		<input type="hidden" name="currentPage" id="currentPage" value="1"/> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
		<input type="hidden" name="countPerPage" id="countPerPage" value="6"/><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) --> 
		<input type="hidden" name="confmKey" id="confmKey" 
		 value="U01TX0FVVEgyMDE3MTIxODE3Mzc0MTEwNzU1Njg="/><!-- 요청 변수 설정 (승인키) -->
		
		<label for="dong">지역명 : </label> 
		<input type="text" name="dong"
			id="dong" style="ime-mode: active" > 
		<input type="submit" id="submit" value="찾기">
	</form>
	
	<div id="divCount"></div>
	<div id="divZip" align="center"></div>
	<div id="divPage"></div>
	
</body>
</html>