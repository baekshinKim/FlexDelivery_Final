<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.6.9/core.min.js"></script>

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/requests.css" />
<link rel="stylesheet" href="https://ceo-cdn.baemin.com/cdn/ceo-selfservice/css/ceo-selfservice.css?ts=20210119110213">


<div class="frame-wrap">
	<div class="frame-body">
		<button class="top-button  hide">
			<i class="icon icon-top"></i>
		</button>
		<div class="p-sm-2">
			<div class="inline-values flex-1 ">
				<div class="checkbox-group">
					<label class="checkbox-button  mt-1"><input type="checkbox"
						value="" checked=""><span class="checkbox"><i
							class="icon icon-done align-top"></i></span>
					<p class="label">
							<i class="icon icon-done" style="margin-bottom: 4px;"></i> 전체선택
						</p></label><label class="checkbox-button  mt-1"><input
						type="checkbox" value="pending" checked=""><span
						class="checkbox"><i class="icon icon-done align-top"></i></span>
					<p class="label">대기</p></label><label class="checkbox-button  mt-1"><input
						type="checkbox" value="running" checked=""><span
						class="checkbox"><i class="icon icon-done align-top"></i></span>
					<p class="label">진행</p></label><label class="checkbox-button  mt-1"><input
						type="checkbox" value="giveback" checked=""><span
						class="checkbox"><i class="icon icon-done align-top"></i></span>
					<p class="label">반려</p></label><label class="checkbox-button  mt-1"><input
						type="checkbox" value="cancel" checked=""><span
						class="checkbox"><i class="icon icon-done align-top"></i></span>
					<p class="label">취소</p></label><label class="checkbox-button  mt-1"><input
						type="checkbox" value="complete" checked=""><span
						class="checkbox"><i class="icon icon-done align-top"></i></span>
					<p class="label">승인</p></label>
				</div>
			</div>
			<div
				class="filter-container pl-sm-0 pr-sm-0 pt-sm-2 pb-sm-2 pt-2 pb-2">
				<div class="filter-row">
					<select><option value="">전체</option>
						<option value="Shop">가게 입점</option>
						<option value="ShopStatus">가게 상태 변경</option>
						<option value="ShopLogo">가게 로고</option>
						<option value="OwnerInfo">사업자 정보 변경</option>
						<option value="AdContract">광고 신청</option>
					<div class="DateRangePicker ">
						<span class="date-wrap">2020. 12. 20.
							<div class="DayPickerInput">
								<input placeholder="From" value="2020. 12. 20.">
							</div>
						</span><span class="date-range">~</span><span class="date-wrap">2021.
							01. 20.
							<div class="DayPickerInput">
								<input placeholder="To" value="2021. 01. 20.">
							</div>
						</span>
						<button class="icon icon-calendar" type="button"></button>
					</div>
					<button type="button" class="button medium">조회</button>
				</div>
			</div>
			<ul class="bullet-ul small muted">
				<li>최대 6개월 이내 요청 처리 이력만 검색을 통해 조회 가능합니다.</li>
			</ul>
		</div>
		<h5 class="mt-4 text-sub px-sm-2">요청 처리 내역이 없습니다. 상세 조건을 설정하여 다시
			조회해주세요.</h5>
		<nav></nav>
	</div>
	<div class="frame-promo">
		<div class="tip-container"></div>
	</div>
</div>

<%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>

