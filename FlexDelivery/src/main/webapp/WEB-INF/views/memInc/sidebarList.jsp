<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<ul>
	<c:forEach var="vo" items="${list}">
		<li><a href="${pageContext.request.contextPath}/member/store/storeList.do?lCategoryNo=${vo.lCategoryNo}">${vo.lCategoryName }</a></li>
	</c:forEach>
</ul>
