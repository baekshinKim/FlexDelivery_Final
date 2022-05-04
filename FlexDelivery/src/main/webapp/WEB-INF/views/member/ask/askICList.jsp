<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<input type ="hidden" name="askId" id="askId" value="${sessionScope.memberId}">
<div>
	<c:if test="${empty askICList}">
		<div>
			1:1 문의가 존재하지 않습니다.
		</div>
	</c:if>

	<!-- 리스트 시작 -->
	<c:if test="${!empty askICList }">
		<c:forEach var="vo" items="${askICList }" varStatus="i">
		<tr>
			<td class="text-bold-500">${vo.askNo }</td>
			<td colspan="3">
			<a href="<c:url value='/member/ask/askDetail.do?askNo=${vo.askNo}'/>">
			${vo.askTitle }
			</a>
			</td>
			<td><fmt:formatDate value="${vo.askRegdate }" pattern="yyyy-MM-dd"/></td>
				<c:if test="${vo.askReplyFlag =='N'}">
				<td><span class="badge badge-danger">
				미답변
				</span></td>
				</c:if>
				<c:if test="${vo.askReplyFlag =='Y'}">
				<td><span class="badge badge-success">
				답변 완료
				</span></td>
				</c:if>
			<td><a href="<c:url value='/member/ask/askDelete.do?askNo=${vo.askNo}'/>" class="badge bg-secondary text-light" >삭제</a></td>
		</tr>
		</c:forEach>
	</c:if>
	
</div>