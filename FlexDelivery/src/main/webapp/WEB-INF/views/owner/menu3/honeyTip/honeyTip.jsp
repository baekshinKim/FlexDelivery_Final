<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../ownerInc/top.jsp"%>
<style>
a.event {
	color: black;
}

a.event:hover {
	color: rgb(182, 73, 197);
	text-decoration: none;
}
footer.footer-area.text-center {
    width: -webkit-fill-available;
}
</style>
<div class="row">
	<div class="col-12 col-md-1"></div>
	<div class="col-12 col-md-11">
<div class="single-blog-area blog-style-2 wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="1000ms">
	<div class="row align-items-center" style="padding: 5%;">
		<div class="col-12 col-md-10">
			<a href="<c:url value='/owner/menu3/honeyTip/honeyTip.do'/>" style="text-decoration: none; color: black;">
				<h4>사장님 꿀팁</h4>
			</a>
		</div>
		<div class="col-12 col-md-1">
		</div>
		<div class="col-12 col-md-1"></div>
		<br> <br> <br> <br>
		<c:if test="${!empty list }">
			<c:forEach var="vo" items="${list}" varStatus="status">
				<div class="col-12 col-md-3">
					<div class="single-blog-thumbnail">
						<c:if test="${fn:substring(vo.honeytipThumbnail, 0,4)=='http' }">
							<img src="${vo.honeytipThumbnail}" class="card-img-top" style="margin-bottom: 40px;" alt="${vo.honeytipTitle }">
						</c:if>
						<c:if test="${fn:substring(vo.honeytipThumbnail, 0,4)!='http' and (!empty vo.honeytipThumbnail) }">
							<img src="<c:url value='/resources/imgs/HoneytipImages/${vo.honeytipThumbnail}'/>" alt="${vo.honeytipTitle }" class="card-img-top" style="margin-bottom: 40px;">
						</c:if>
					</div>
				</div>
				<div class="col-12 col-md-2" style="height: 200px; padding-right: 0px;">
					<div class="single-blog-content" style="margin-bottom: 40px;">
						<div class="line mb-2"></div>
						<a href="<c:url value='/owner/menu3/honeyTip/detail.do?honeyTipNo=${vo.honeytipNo }'/>" class="post-tag event">HONEY TIP</a>
						<h4>
							<a href="<c:url value='/owner/menu3/honeyTip/detail.do?honeyTipNo=${vo.honeytipNo }'/>" class="post-headline event"><b>${vo.honeytipTitle }</b></a>
						</h4>
						<div class="post-meta">
							<p>By FLEX DELIVERY</p>
							<p></p>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-1"></div>
			</c:forEach>
		</c:if>
		</div>
	</div>
	<div class="col-12 col-md-1" style="padding-bottom: 5%;"></div>
</div>
<%@ include file="../../../ownerInc/bottom.jsp"%>