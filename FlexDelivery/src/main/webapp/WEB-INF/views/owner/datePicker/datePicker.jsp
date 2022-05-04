<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="${pageContext.request.contextPath}/resources/ownerResources/herbJs/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/bootstrap-datepicker-master/dist/css/bootstrap-datepicker.min.css"> 
<script src="${pageContext.request.contextPath}/resources/ownerResources/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/bootstrap-datepicker-master/dist/locales/bootstrap-datepicker.ko.min.js" charset="UTF-8"></script>


<script>
		
		

		
 $('document').ready(function(){
	 $('#startDay').datepicker({
			format:'yyyy-mm-dd',
			language:'kr',
			todayHighlight: true,
			autolose:true,
			startDate:'-6m',
            endDate: '0d'
		 })
		 .datepicker('setDate','${searchVo.startDay }')
		 .on('changeDate',function(selectedDate){
			 if($('#startDay').val()>$('#endDay').val()){
				 $('#startDay').datepicker('setDate',new Date($('#endDay').val()));
			 }
		 });
		 $('#endDay').datepicker({
				 format:'yyyy-mm-dd',
				language:'kr',
				todayHighlight: true,
				autolose:true,
				startDate:'-6m',
	            endDate: '0d'
		 }) .datepicker('setDate','${searchVo.endDay }')
			 .on('changeDate',function(selectedDate){
				if($('#startDay').val()>$('#endDay').val()){
				 	$('#endDay').datepicker('setDate',new Date($('#startDay').val()));
			}
			
	 });
	 
 });		
		
		
	/* 	
	$(function(){
		xIniDatePicker = function ( controlId , _screenLangCd )
		{
		    var controlDate = $("#" + controlId);
		    if (controlDate.length == 0) { return; }
			
		    var datePickerLang = "en"; // 기본 영어
		    switch ( _screenLangCd )
		    {
		    	case "ko": datePickerLang = "ko"; break;
		    	case "ko-KR": datePickerLang = "ko"; break;
		    	case "ja": datePickerLang = "ja"; break;
		        case "ja-JP": datePickerLang = "ja"; break;
		        default: datePickerLang = "us";
		    }
		
		
		    controlDate.datepicker({
		        assumeNearbyYear: false,
		        autoclose: "true", // 자동으로 창을 닫는다
				format: "yyyy-mm-dd", // 일자 형식
				language: datePickerLang, // 언어코드 ( 한국어 )
				todayBtn: true, // 오늘 버튼
				todayHighlight: true, // 오늘에 하이라이트
				clearBtn: false, // 닫기 버튼
				startDate:'-6m',
	            endDate: '0d'
	            
			});
			
			 	.on('changeDate', function(){
					if($('#startDay').val()>$('#endDay').val()){
						$('#startDay').datepicker('setDate',new Date($('#endDay').val()));
					}				 
				 });
			 
		}
	
		/*
		//초기화 함수 호출
		xIniDatePicker ( "startDay", "ko" );
		
		$("#btnSearchDate").click(function(){	xShowCalendar("startDay"); });
		
		
		xShowCalendar = function ( _controlId )
			{
				var ctrl = document.getElementById(_controlId); // 컨트롤을 찾는다.
				if ( ctrl != null )
				{
					$(ctrl).datepicker('show');// 달력을 보인다.
				}
				//return false;
			}
		
		
	});
	
	
	
	
	$(function(){
		xIniDatePicker = function ( controlId , _screenLangCd )
		{
		    var controlDate = $("#" + controlId);
		    if (controlDate.length == 0) { return; }
			
		    var datePickerLang = "en"; // 기본 영어
		    switch ( _screenLangCd )
		    {
		    	case "ko": datePickerLang = "ko"; break;
		    	case "ko-KR": datePickerLang = "ko"; break;
		    	case "ja": datePickerLang = "ja"; break;
		        case "ja-JP": datePickerLang = "ja"; break;
		        default: datePickerLang = "us";
		    }
		
		
		    controlDate.datepicker({
		        assumeNearbyYear: false,
		        autoclose: "true", // 자동으로 창을 닫는다
				format: "yyyy-mm-dd", // 일자 형식
				language: datePickerLang, // 언어코드 ( 한국어 )
				todayBtn: true, // 오늘 버튼
				todayHighlight: true, // 오늘에 하이라이트
				clearBtn: false, // 닫기 버튼
				startDate:'-6m',
				endDate: '0d'
				
			});
			
			
				.on('changeDate', function(){
					if($('#startDay').val()>$('#endDay').val()){
						$('#endDay').datepicker('setDate',new Date($('#startDay').val()));
					}				 
				 });
			 
		}
	
		
		//초기화 함수 호출
		xIniDatePicker ( "endDay", "ko" );
		
		$("#btnSearchDate").click(function(){	xShowCalendar("endDay"); });
		
		
		xShowCalendar = function ( _controlId )
			{
				var ctrl = document.getElementById(_controlId); // 컨트롤을 찾는다.
				if ( ctrl != null )
				{
					$(ctrl).datepicker('show');// 달력을 보인다.
				}
				//return false;
			}
	});
 
	
	 */
		
		

</script>


<style>
	input{
		border: 1px solid rgb(212,212,212);
		border-radius: 5px;
		height:30px;
	}

</style>
</head>


<body>




			
	
			<div class="input-group" >
			   <input type="text"  class="form-control text-right mr-2"  name="startDay" id="startDay"   maxlength="8" style="width:100px;" autocomplete="off" value="${searchVo.startDay }">
		   		<label for="startDay">
			   		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-check mt-2" viewBox="0 0 16 16">
				 		 <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
						 <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
					</svg>
				</label>
			    <span class="mt-2"> &nbsp; ~ &nbsp; </span>
				<input type="text"  class="form-control text-right mr-2"   name="endDay" id="endDay"  maxlength="8" style="width:100px;" autocomplete="off" value="${searchVo.endDay }">
			 	<label for="endDay">
			   		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-check mt-2" viewBox="0 0 16 16">
				 		 <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
						 <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
					</svg>
				</label>
		  </div>
	
	
</body>
</body>
</html>