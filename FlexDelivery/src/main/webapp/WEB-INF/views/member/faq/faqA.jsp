<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Card -->
<c:if test="${empty faqAList}">
	<div>
		faq가 존재하지 않습니다.
	</div>
</c:if>
Alist
<c:if test="${!empty faqAList}">
	<c:forEach var="vo" items="${faqAList}">
	<div class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
		<div id="basicsHeadingOne">
			<h5 class="mb-0">
				<button
					class="shadow-none btn btn-block d-flex justify-content-between card-btn p-3 collapsed"
					data-toggle="collapse" data-target="#basicsCollapseOne"
					aria-expanded="false" aria-controls="basicsCollapseOne">
					${vo.faqQ }
					
					<span class="card-btn-arrow">
						<span class="feather-chevron-down"></span>
					</span>
				</button>
			</h5>
		</div>
		<div id="basicsCollapseOne" class="collapse show"
			aria-labelledby="basicsHeadingOne" data-parent="#basicsAccordion"
			style="">
			<div class="card-body border-top p-3 text-muted">Anim
				${vo.faqA }
			</div>
		</div>
	</div>
<!-- End Card -->
	</c:forEach>
</c:if>