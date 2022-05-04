<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
function searchElist(idx){
	var data="";
	if(idx==1){
		data=$('form[name=frmSearch]').serializeArray();
	}else if(idx==2){
		data=$('form[name=frmEPage]').serializeArray();
	}
	$.ajax({
		url:"<c:url value='/member/board/searchEvent.do'/>",
		type:"post",
		data:data,
		dataType:"json",
		success:function(map){
			var str="<form name='frmEPage' method='post'>";
			str+="<input type='hidden' name='currentPage' id='eCurP'>";
			str+="<input type='hidden' name='searchKeyword' value='"+map.searchKeyword+"'></form>";
			if(map.elist.length<1){
				str+="<div class='row d-flex align-items-center justify-content-center py-5'>";
				str+="<div class='col-md-4 py-5'>";
				str+="<div class='text-center py-5'>";
				str+="<p class='h4 mb-4'><a href='' class='research'><i class='feather-search bg-primary text-white rounded p-2'></i></a></p>";
				str+="<p class='font-weight-bold text-dark h5'>검색결과가 없습니다</p>";
				str+="<p>돋보기를 클릭하세요!</p>";
				str+="</div></div></div>";
			}else{
				str+="<div class='container mt-4 mb-4 p-0'>";
				str+="<div class='bg-white'>";
				str+="<table class='table table-borderless table-hover'>";
					str+="<thead>";
						str+="<tr>";
						str+="<th scope='col' width='5%'>No</th>";
						str+="<th scope='col' width='65%' align='center'>Title</th>";
						str+="<th scope='col' width='30%'>Date</th>";
						str+="</tr>";
					str+="</thead>";
					str+="<tbody>";
					$.each(map.elist,function(idx,item){
						str+="<tr>";
						str+="<th scope='row'>"+item.rn+"</th>";
						str+="<td><a href='<c:url value='/member/board/detail.do?boardNo="+item.boardNo+"'/>'>"+item.boardTitle+"</a></td>";
						str+="<td>"+item.boardRegdate+"</td>";
						str+="</tr>";
					})
					str+="</tbody>";
				str+="</table>";
				str+="</div>";
				str+="</div>";
				//페이징처리부분
				str+="<div class='eventPage'> ";
				str+="<nav aria-label='...'>";
				str+="<ul class='pagination justify-content-center'>";
				if(map.ePaging.firstPage>1){
					str+="<li class='page-item'>";
					str+="<a class='page-link' onclick='pageFunc("+(map.ePaging.firstPage-1)+")' href='#' tabindex='-1' aria-disabled='true'>이전 페이지</a>";
					str+="</li>";
				}else{
					str+="<li class='page-item disabled'>";
					str+="<a class='page-link' href='#' tabindex='-1' aria-disabled='true'>이전 페이지</a>";
					str+="</li>";
				}
				for(var i=map.ePaging.firstPage;i<=map.ePaging.lastPage;i++){
					if(i!=map.ePaging.currentPage){
						str+="<li class='page-item'><a class='page-link' href='#' onclick='pageFunc("+i+")'>"+i+"</a></li>";
					}else{
						str+="<li class='page-item active' aria-current='page'>";
						str+="<span class='page-link'>"+i+"</span>";
						str+="</li>"
					}
				}
				if(map.ePaging.lastPage<map.ePaging.totalPage){
					str+="<li class='page-item'><a class='page-link' href='#' onclick='pageFunc("+(map.ePaging.lastPage+1)+")'>다음 페이지</a></li>";
				}else{
					str+="<li class='page-item disabled'><a class='page-link' tabindex='-1' aria-disabled='true' href='#'>다음 페이지</a></li>";
				}
				str+="</ul></nav></div>";
			}
			$('#inlineFormInputGroup').val(map.searchKeyword);
			$('#event').html(str);
			$('#profile-tab').html("<i class='feather-disc mr-2'></i>이벤트 ("+map.ePaging.totalRecord+")");
			event.preventDefault();
		},error:function(error){
			alert("error:"+error);
		}
	})
};
</script>
<form name="frmEPage" method="post">
	<input type="hidden" name="currentPage" id="eCurP">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}" id="eSearchKey">
</form>
<c:if test="${empty elist}">
<div class="row d-flex align-items-center justify-content-center py-5">
   	<div class="col-md-4 py-5">
       	<div class="text-center py-5">
           	<p class="h4 mb-4"><a href="" class="research"><i class="feather-search bg-primary text-white rounded p-2"></i></a></p>
       		<p class="font-weight-bold text-dark h5">검색결과가 없습니다</p>
       		<p>돋보기를 클릭하세요!</p>
       	</div>
   	</div>
</div>
</c:if>
<c:if test="${!empty elist}">
	<div class="container mt-4 mb-4 p-0">
		<div class="bg-white">
        	<table class="table table-borderless table-hover">
        		<thead>
				    <tr>
				      <th scope="col" width="5%">No</th>
				      <th scope="col" width="65%" align="center">Title</th>
				      <th scope="col" width="30%">Date</th>
				    </tr>
				</thead>
				<tbody>
					<c:forEach items="${elist}" var="eVo">
						<tr>
						    <th scope="row">${eVo.rn}</th>
							<td><a href="<c:url value='/member/board/detail.do?boardNo=${eVo.boardNo}'/>">${eVo.boardTitle}</a></td>
							<td><fmt:formatDate value="${eVo.boardRegdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
			  	</tbody>
			</table>
		</div>
   	</div>
    <!-- 페이지 번호 -->
   	<div class="eventPage"> 
		<nav aria-label="...">
		  <ul class="pagination justify-content-center">
		  	<c:if test="${ePaging.firstPage>1}">
			    <li class="page-item">
			      <a class="page-link" onclick="pageFunc(${ePaging.firstPage-1})" href="#" tabindex="-1" aria-disabled="true">이전 페이지</a>
			    </li>
		  	</c:if>
		  	<c:if test="${ePaging.firstPage==1}">
		  		<li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전 페이지</a>
			    </li>
		  	</c:if>
		    <c:forEach var="j" begin="${ePaging.firstPage}" end="${ePaging.lastPage}">
		    	<c:if test="${j!=ePaging.currentPage}">
			    	<li class="page-item"><a class="page-link" href="#" onclick="pageFunc(${j})">${j}</a></li>
		    	</c:if>
		    	<c:if test="${j==ePaging.currentPage}">
				    <li class="page-item active" aria-current="page">
				      <span class="page-link">${j}</span> <!-- 선택된 페이지 -->
				    </li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${ePaging.lastPage < ePaging.totalPage }">
			    <li class="page-item">
			      <a class="page-link" href="#">다음 페이지</a>
			    </li>
			</c:if>
			<c:if test="${ePaging.lastPage>=ePaging.totalPage}">
				<li class="page-item disabled">
			      <a class="page-link" tabindex="-1" aria-disabled="true" href="#">다음 페이지</a>
			    </li>
			</c:if>
		  </ul>
		</nav>
	</div>
    <!-- /페이지번호 -->
</c:if>