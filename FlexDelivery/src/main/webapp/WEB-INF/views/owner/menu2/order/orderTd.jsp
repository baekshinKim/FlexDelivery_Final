<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<td><a href="#" data-toggle="modal" data-target="#orderDetail"  onclick="goDetail(${ordersNo }, ${ordersDiscount })">${title}
<c:if test="${type==1 }">
	<c:if test="${hurryImg>0.3 }">
			<span class="badge bg-danger ml-1 p-1" style="height:18px; font-size:7px;">긴급</span>
	</c:if>
</c:if>
</a></td>
