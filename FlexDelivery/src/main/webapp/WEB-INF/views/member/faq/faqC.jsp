<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Basics Accordion -->
<div id="Accordion">
	<c:if test="${empty faqCList}">
		<div>
			faq가 존재하지 않습니다.
		</div>
	</c:if>
	
	<!-- Card -->
	<c:if test="${!empty faqCList}">
		<c:forEach var="vo" items="${faqCList}" varStatus="i">
			<div class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
				<div id="accountHeading${vo.faqNo }">
					<h5 class="mb-0">
						<button class="shadow-none btn btn-block d-flex justify-content-between card-btn collapsed p-3"
							data-toggle="collapse" data-target="#accountCollapse${vo.faqNo }"
							aria-expanded="false" aria-controls="accountCollapse${vo.faqNo }">
							${vo.faqQ } 
							<span class="card-btn-arrow">
								<span class="feather-chevron-down"></span>
							</span>
						</button>
					</h5>
				</div>
				<div id="accountCollapse${vo.faqNo }" class="collapse"
					aria-labelledby="accountHeading${vo.faqNo }"
					data-parent="#Accordion">
					<div class="card-body border-top p-3 text-muted">
						${vo.faqA }
					</div>
				</div>
			</div>
	<!-- End Card -->
		</c:forEach>
	</c:if>


</div>

