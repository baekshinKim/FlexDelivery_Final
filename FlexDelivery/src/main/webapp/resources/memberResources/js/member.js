/**
 * member.js
 */
 
var contextPath="/fd/member";
 
$(function(){
	$('#btnChkId').click(function(){
		var type=$(this).attr('class');	//admin , user
		open(contextPath+"/member/checkId.do?userid="+$('#userid').val()+"&type="+type, "chk",
"width=400,height=300,left=0,top=0,location=yes,resizable=yes");
	});
	
	$('#btZipcode').click(function(){
		open(contextPath+"/register/zipcode.do", "chk",
"width=500,height=500,left=0,top=0,location=yes,resizable=yes");
	});
});


	function validate_memberid(id){
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(id);
		/*
		a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 시작하거나 
		끝나야 한다는 의미
		닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미
		*/
	};
	
	function validate_membername(name){
		var pattern = new RegExp(/^[가-힣]*$/g);
		return pattern.test(name);
	};
	
	function validate_email(email){
		var pattern = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
		return pattern.test(email);
		
	};
	
	function validate_phone(tel){
		var pattern = new RegExp(/^[0-9]+$/g);
		return pattern.test(tel);
		/*
			0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
			닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복
		*/
	};
