<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../adminInc/top.jsp" %>    

<!-- CSS start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<!-- CSS end -->    

<script>
$(function(){
	
	$('#pwd1Ok').hide();
	$('#pwd2Ok').hide();
	$('#nameOk').hide();
	
	checkPwd1();
	checkPwd2();
	checkName();
	

	$('form[name=frmMyPage]').submit(function(){
		checkPwd1();
		checkPwd2();
		checkName();
		
		var ok1=$('#pwd1Ok').html();
		var ok2=$('#pwd2Ok').html();
		var ok3=$('#nameOk').html();
		//alert (ok1+"/"+ok2+"/"+ok3);
		
		if (!(ok1=="Y" && ok2=="Y" && ok3=="Y")){
			alert("정보 수정 실패!");
			event.preventDefault();	
		}
	})
	
});

function validate_pwd(pwd){
	 var pattern= new RegExp(/^[A-Za-z0-9]+$/g);
	 return pattern.test(pwd);
}

function validate_name(name){
	 var pattern= new RegExp(/^[ㄱ-ㅎ가-힣]+$/g);
	 return pattern.test(name);
}

function checkPwd1(){
	var result="";
	$('#adminPwd1').keyup(function(){
		var pwd1=$('#adminPwd1').val();
		
		if (pwd1.length<4){
			
			$.ajax({
				url:"<c:url value='/admin/myPage/myPageEditChkPwd1.do'/>",
				type:"get",
				data:"pwd1="+pwd1,
				dataType:"json",
				success:function(bool){
					if(!bool){
						result="비밀번호는 4자리 이상이어야 합니다.";
					}
					$('#chkPwd1').text(result);
					$('#pwd1Ok').html('N');
				},
				error:function(xhr, status, error){
					alert("error!! : " + error);
				}
				
			});
		} else if(pwd1.length>3&&validate_pwd(pwd1)){
			result="사용 가능한 비밀번호 입니다."
			$('#chkPwd1').text(result);
			$('#pwd1Ok').html('Y');
			
		} else if (!validate_pwd(pwd1)){
			result="비밀번호는 숫자와 영문만 사용할 수 있습니다."
			$('#chkPwd1').text(result);
			$('#pwd1Ok').html('N');
			
		}
		event.preventDefault();
		return false;
	});
}

function checkPwd2(){
	var result="";
	$('#adminPwd2').keyup(function(){
		var pwd1=$('#adminPwd1').val();
		var pwd2=$('#adminPwd2').val();
		
		if (pwd1==pwd2){
			result="비밀번호가 일치합니다."
			$('#chkPwd2').text(result);
			$('#pwd2Ok').html('Y');
			/* $.ajax({
				url:"<c:url value='/admin/myPage/myPageEditChkPwd2.do'/>",
				type:"get",
				data:"pwd1="+pwd1+"&pwd2="+pwd2,
				dataType:"json",
				success:function(bool){
					if(bool){
						result="비밀번호가 일치합니다.";
					}else{
						result="비밀번호가 일치하지 않습니다.";
					}
					$('#chkPwd2').text(result);
				},
				error:function(xhr, status, error){
					alert("error!! : " + error);
				}
				
			}); */
		} else {
			result="비밀번호가 일치하지 않습니다."
			$('#chkPwd2').text(result);
			$('#pwd2Ok').html('N');
			$('#adminPwd2').focus();
		}
		event.preventDefault();
		return false;
	});
}

function checkName(){
	var result="";
	$('#basicInput').keyup(function(){
		var name=$('#basicInput').val();
		
		if (validate_name(name) && name.length>1){
			
			$.ajax({
				url:"<c:url value='/admin/myPage/myPageEditChkName.do'/>",
				type:"get",
				data:"name="+name,
				dataType:"json",
				success:function(bool){
					if(bool){
						result="사용가능한 이름입니다.";
						$('#nameOk').html('Y');
					}else{
						result="사용 불가능한 이름입니다."
						$('#nameOk').html('N');
					}
					$('#chkName').text(result);
				},
				error:function(xhr, status, error){
					alert("error!! : " + error);
				}
				
			});
		} else if(!validate_name(name)){
			result="한글만 입력 가능합니다."
			$('#chkName').text(result);
			$('#nameOk').html('N');
		} else if(name.length<=1){
			result="두 글자 이상 입력하십시오!"
			$('#chkName').text(result);
			$('#nameOk').html('N');
			$('#basicInput').focus();
			
			
		}
		event.preventDefault();
		return false;
	});
}

</script>

<div class="container">
	<div class="row">
		<div class="col-12">
             <div class="card">
                 <div class="card-header">
                     <h4 class="card-title">마이페이지</h4>
                     <!-- <a href="#" class="btn btn-dark round">등록</a> -->
                 </div>
                 <div class="card-body">
	                 <div class="col-md-6">
	                 	 <form name="frmMyPage" action="<c:url value='/admin/myPage/myPageEdit.do' />" method="post">
		                     <div class="form-group">
		                     	<input type="hidden" name="adminNo" value="${vo.adminNo }">
		                     
		                         <label for="disabledInput">아이디 </label>
		                         <input type="text" class="form-control" id="adminId" placeholder="admin" disabled>
		                         <label for="basicInput">비밀번호</label>
	                             <span id="chkPwd1"></span><span id="pwd1Ok"></span>
	                             <input type="password" class="form-control" id="adminPwd1" placeholder="비밀번호를 입력해주세요"
	                             	name="adminPwd" required >
		                         <label for="basicInput">비밀번호 확인</label>
	                             <span id="chkPwd2"></span><span id="pwd2Ok"></span>
	                             <input type="password" class="form-control" id="adminPwd2" placeholder="비밀번호를 다시 입력해주세요" required>
		                         <label for="basicInput">이름</label>
	                             <span id="chkName"></span>
	                             <input type="text" class="form-control" id="basicInput" placeholder="이름을 입력해주세요" 
	                             	name="adminName" value="${vo.adminName }">
                             	<span id="chkName"></span><span id="nameOk"></span>
		                     </div>
		                     <!-- <div class="form-group">
		                         <label for="disabledInput">Readonly Input</label>
		                         <input type="text" class="form-control" id="readonlyInput" readonly="readonly"
		                             value="You can't update me :P">
		                     </div> -->
		                     
		                     <br><br><input type="submit" class="btn btn-dark round">
	                 	 </form>
	                 </div>	
                 </div>
            </div>                
       	</div>   		
	</div>
</div>
    
<!-- script start -->   
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->
        
<%@include file="../../adminInc/bottom.jsp" %>    