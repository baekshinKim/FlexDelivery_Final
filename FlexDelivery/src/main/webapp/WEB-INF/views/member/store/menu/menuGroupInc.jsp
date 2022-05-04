<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach items="${menuGroupList}" var="vo">
	<div class="row m-0">
		    <h6 class="p-3 m-0 bg-light w-100">${vo.sMGroupName}<small class="text-black-50"> ${vo.sMGroupCount}EA</small></h6>
		<div class="col-md-12 px-0 border-top">
		    <div class="bg-white">
		    	<!-- 메뉴 forEach -->
				<c:import url="/member/menu/menuInc.do">
					<c:param name="sMGroupNo" value="${vo.sMGroupNo}" />
					<c:param name="storeName" value="${storeName}" />
				</c:import>
	        </div>
	    </div>
	</div>
</c:forEach>
