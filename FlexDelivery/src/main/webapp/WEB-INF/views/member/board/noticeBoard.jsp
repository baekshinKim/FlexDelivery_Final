<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	function searchNlist(idx){
		var data="";
		if(idx==1){
			data=$('form[name=frmSearch]').serializeArray();
			console.log(data);
		}else if(idx==2){
			data=$('form[name=frmNPage]').serializeArray();
		}
		$.ajax({
			url:"<c:url value='/member/board/searchNotice.do'/>",
			type:"post",
			data:data,
			dataType:"json",
			success:function(map){
				var str="<form name='frmNPage' method='post'>";
				str+="<input type='hidden' name='currentPage' id='nCurP'>";
				str+="<input type='hidden' name='searchKeyword' value='"+map.searchKeyword+"'></form>";
				if(map.nlist.length<1){
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
						$.each(map.nlist,function(idx,item){
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
					str+="<div class='noticePage'> ";
					str+="<nav aria-label='...'>";
					str+="<ul class='pagination justify-content-center'>";
					if(map.nPaging.firstPage>1){
						str+="<li class='page-item'>";
						str+="<a class='page-link' onclick='pageFunc("+(map.nPaging.firstPage-1)+")' href='#' tabindex='-1' aria-disabled='true'>이전 페이지</a>";
						str+="</li>";
					}else{
						str+="<li class='page-item disabled'>";
						str+="<a class='page-link' href='#' tabindex='-1' aria-disabled='true'>이전 페이지</a>";
						str+="</li>";
					}
					for(var i=map.nPaging.firstPage;i<=map.nPaging.lastPage;i++){
						if(i!=map.nPaging.currentPage){
							str+="<li class='page-item'><a class='page-link' href='#' onclick='pageFunc("+i+")'>"+i+"</a></li>";
						}else{
							str+="<li class='page-item active' aria-current='page'>";
							str+="<span class='page-link'>"+i+"</span>";
							str+="</li>"
						}
					}
					if(map.nPaging.lastPage<map.nPaging.totalPage){
						str+="<li class='page-item'><a class='page-link' href='#' onclick='pageFunc("+(map.nPaging.lastPage+1)+")'>다음 페이지</a></li>";
					}else{
						str+="<li class='page-item disabled'><a class='page-link' tabindex='-1' aria-disabled='true' href='#'>다음 페이지</a></li>";
					}
					str+="</ul></nav></div>";
				}
				$('#inlineFormInputGroup').val(map.searchKeyword);
				$('#home-tab').html("<i class='feather-home mr-2'></i>공지사항 ("+map.nPaging.totalRecord+")");
				$('#notice').html(str);
				event.preventDefault();
			},error:function(error){
				alert("error:"+error);
			}
		})
	};
</script>
<form name="frmNPage" method="post">
	<input type="hidden" name="currentPage" id="nCurP">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}" id="nSearchKey">
</form>
<c:if test="${empty nlist}">
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
<c:if test="${!empty nlist}">
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
				<c:forEach items="${nlist}" var="nVo">
			    <tr>
			      <th scope="row">${nVo.rn}</th>
			      <td><a href="<c:url value='/member/board/detail.do?boardNo=${nVo.boardNo}'/>">${nVo.boardTitle}</a></td>
			      <td><fmt:formatDate value='${nVo.boardRegdate}' pattern="yyyy-MM-dd" /></td>
			    </tr>
			    </c:forEach>
		  		</tbody>
			</table>
		</div>
   	</div>
        	<!-- 페이지 번호 -->
	<div class="noticePage"> 
		<nav aria-label="...">
		  <ul class="pagination justify-content-center">
		  	<c:if test="${nPaging.firstPage>1}">
			    <li class="page-item">
			      <a class="page-link" onclick="pageFunc(${nPaging.firstPage-1})" href="#" tabindex="-1" aria-disabled="true">이전 페이지</a>
			    </li>
		  	</c:if>
		  	<c:if test="${nPaging.firstPage==1}">
		  		<li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전 페이지</a>
			    </li>
		  	</c:if>
		    <c:forEach var="i" begin="${nPaging.firstPage}" end="${nPaging.lastPage}">
		    	<c:if test="${i!=nPaging.currentPage}">
			    	<li class="page-item"><a class="page-link" href="#" onclick="pageFunc(${i})">${i}</a></li>
		    	</c:if>
		    	<c:if test="${i==nPaging.currentPage}">
				    <li class="page-item active" aria-current="page">
				      <span class="page-link">${i}</span> <!-- 선택된 페이지 -->
				    </li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${nPaging.lastPage < nPaging.totalPage }">
			    <li class="page-item">
			      <a class="page-link" href="#">다음 페이지</a>
			    </li>
			</c:if>
			<c:if test="${nPaging.lastPage>=nPaging.totalPage}">
				<li class="page-item disabled">
			      <a class="page-link" tabindex="-1" aria-disabled="true" href="#">다음 페이지</a>
			    </li>
			</c:if>
		  </ul>
		</nav>
	</div>
    <!-- /페이지번호 -->
</c:if>
<!-- /공지사항 -->