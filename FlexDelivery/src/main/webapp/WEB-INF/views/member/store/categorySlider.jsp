<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="container">
    <div class="cat-slider">
    	<c:forEach var="vo" items="${list}">
        <div class="cat-item px-1 py-3">
            <a class="bg-white rounded d-block p-2 text-center shadow-sm" href="<c:url value='/member/store/storeList.do?lCategoryNo=${vo.lCategoryNo}' />">
	            <!-- <img src='${vo.lCategoryFilename}' class="img-fluid mb-2"> -->
	            <img alt="" src="<c:url value='/resources/imgs/LargeCategoryImages/${vo.lCategoryFilename }'/>">
                <p class="m-0 small">${vo.lCategoryName}</p>
            </a>
        </div>
    	</c:forEach>
    </div>
</div>