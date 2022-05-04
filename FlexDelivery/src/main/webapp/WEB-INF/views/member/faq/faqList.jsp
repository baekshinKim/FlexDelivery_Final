<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="osahan-home-page">
	
		<div class="text-black mt-5">
			<div class="title d-flex align-items-center">
				<h4 class="font-weight-bold m-0 pl-5">고객센터</h4>
			</div>
		</div>
	
	<!-- profile -->
	<div class="container position-relative">
		<div class="py-5 osahan-profile row">
			<div class="col-md-12 mb-12">
				<div class="osahan-cart-item-profile">
					<div class="box bg-white mb-3 shadow-sm rounded">
						<div class="p-3 d-flex align-items-center">
							<i class="feather-lock display-4"></i>
							<div class="ml-3">
								<h6 class="text-dark mb-2 mt-0">1:1문의</h6>
								<p class="mb-0 text-muted">찾으시는 내용이 없다면 1:1 문의를 이용하세요.</p>
							</div>
						</div>
						<div class="overflow-hidden border-top d-flex align-items-center p-3">
							<a class="font-weight-bold d-block"
								href="<c:url value='/member/ask/askList.do'/>">1:1 문의 메뉴로 이동합니다.</a> <i
								class="feather-arrow-right-circle ml-auto text-primary"></i>
						</div>
					</div>
					<div id=memberregister>
						<!-- forEach -->
						<c:forEach var="map" items="${list}">
							<div class="mb-2 mt-3">
								<h5 class="font-weight-semi-bold mb-0">${map['F_CATEGORY_NAME']} FAQ</h5>
							</div>
		 					<c:import url="/member/faq/faqC.do">
								<c:param name="fCategoryNo" value="${map['F_CATEGORY_NO']}"></c:param>
							</c:import>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../../memInc/bottom.jsp"%>