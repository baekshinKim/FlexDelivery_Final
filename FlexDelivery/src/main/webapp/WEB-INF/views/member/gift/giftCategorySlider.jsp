<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="container">
    <div class="cat-slider" style="visibility:hidden;">
    	<div class="cat-item px-1 py-3">
            <a class="bg-white rounded d-block p-2 text-center shadow-sm" href="#" onclick="categoryClick(0)">
                <p class="m-0 small">전체보기</p>
            </a>
        </div>
    	<c:forEach var="map" items="${list}">
        <div class="cat-item px-1 py-3">
            <a class="bg-white rounded d-block p-2 text-center shadow-sm" href="#" onclick="categoryClick(${map['G_CATEGORY_NO']})">
                <p class="m-0 small">${map['G_CATEGORY_NAME']}</p>
            </a>
        </div>
    	</c:forEach>
    </div>
 </div>
