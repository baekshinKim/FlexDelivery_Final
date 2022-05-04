/**
 * storesregister.js
 */

$(function() {
	$('#btRegi').click(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).attr('title')+ '를(을) 입력하세요');
					$(this).focus();
					event.preventDefault();
					return false;  //each 탈출
				}else
					if(!$('#chkAgree').is(":checked")){
						alert('개인 정보 수집 이용에 동의하셔야 합니다.');
						$('#chkAgree').focus();
						event.preventDefault();
					}
				else{
					alert('🎉축하합니다!🎉 \n입점 등록 신청이 완료되었습니다. \n내 가게 정보로 이동합니다.');
					// 기본정보로 이동 
					location.href = '<c:url value="/owner/menu2/basic/basic.do"/>';
				}
			});
				
		});

	var contextPath="/fd";

			$('#btnZipcode').click(function(){
				open(contextPath+"/zipcode.do", "chk",
		"width=500,height=500,left=0,top=0,location=yes,resizable=yes");
			});
});
 

 	function validate_oRegisterNo(num){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(num);
		/*
			businessLicense에서 사용함
			0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
			닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복
		*/
	}
