<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.6.9/core.min.js"></script>
<script src="https://kit.fontawesome.com/e42a7f130f.js" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/couponUsed.css" />
<link rel="stylesheet" href="https://ceo-cdn.baemin.com/cdn/ceo-selfservice/css/ceo-selfservice.css?ts=20210119110213">

<div class="frame-wrap">
	<div class="frame-body">
		<button class="top-button  hide">
			<i class="icon icon-top"></i>
		</button>
		<div>
			<div class="ShopSelect mb-4 mb-sm-0">
				<select><option value="13195815">피자알파 서면점</option></select>
				<section class="title">
					<h3>
						피자알파 서면점 <i class="fas fa-angle-down"></i>
					</h3>
					<p class="text-sub mt-1">피자 · 배달의민족 · W13195815</p>
				</section>
			</div>
			<div class="tabs ">
				<ul>
					<li><a aria-current="page" class="active"
						href="/self-service/shops/13195815/benefit/coupon/used">사용내역</a></li>
					<li><a 
						href="/self-service/shops/13195815/benefit/coupon/released">발행내역</a></li>
				</ul>
			</div>
			<div class="p-sm-0">
				<div class="filter-container pb-2">
					<div class="filter-row">
						<select><option value="2021">2021년</option>
							<option value="2020">2020년</option></select>
						<div class="DateRangePicker ">
							<span class="date-wrap">21. 01. 14.
								<div class="DayPickerInput">
									<input placeholder="From" value="21. 01. 14.">
								</div>
							</span><span class="date-range">~</span><span class="date-wrap">21.
								01. 20.
								<div class="DayPickerInput">
									<input placeholder="To" value="21. 01. 20.">
								</div>
							</span>
							<button class="icon icon-calendar" type="button"></button>
						</div>
						<div class="input-label-container" style="width: inherit;">
							<div class="input-container left">
								<input type="text" placeholder="주문번호 입력" value="">
							</div>
						</div>
						<button type="button" class="button text-center medium inGroup">조회</button>
					</div>
				</div>
				<ul class="bullet-ul px-sm-2 small muted">
					<li>1개월 이내 내역만 조회할 수 있습니다.</li>
				</ul>
				<div class="mt-3">
					<div class="Card ">
						<div class="card-body p-sm-0">
							<table class="Table responsive-table ">
								<thead>
									<tr>
										<th store="[object Object]" idx="0">혜택이름</th>
										<th store="[object Object]" idx="1">혜택 ID</th>
										<th store="[object Object]" idx="2">사용일시</th>
										<th store="[object Object]" idx="3">주문번호</th>
										<th store="[object Object]" idx="4">할인금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class=" pivoted"><div class="tdBefore">혜택이름</div>11111</td>
										<td class=" pivoted"><div class="tdBefore">혜택 ID</div>251981</td>
										<td class=" pivoted"><div class="tdBefore">사용일시</div>
											<time>21.01.20(수) 02:33:12</time></td>
										<td class=" pivoted"><div class="tdBefore">주문번호</div>B0UZ002ALC</td>
										<td class=" pivoted"><div class="tdBefore">할인금액</div>1,000원</td>
									</tr>
									<tr>
										<td class=" pivoted"><div class="tdBefore">혜택이름</div>11111</td>
										<td class=" pivoted"><div class="tdBefore">혜택 ID</div>251981</td>
										<td class=" pivoted"><div class="tdBefore">사용일시</div>
											<time>21.01.20(수) 01:52:50</time></td>
										<td class=" pivoted"><div class="tdBefore">주문번호</div>B0UZ001XNA</td>
										<td class=" pivoted"><div class="tdBefore">할인금액</div>1,000원</td>
									</tr>
									<tr>
										<td class=" pivoted"><div class="tdBefore">혜택이름</div>11111</td>
										<td class=" pivoted"><div class="tdBefore">혜택 ID</div>251981</td>
										<td class=" pivoted"><div class="tdBefore">사용일시</div>
											<time>21.01.19(화) 00:48:49</time></td>
										<td class=" pivoted"><div class="tdBefore">주문번호</div>B0UY001AJH</td>
										<td class=" pivoted"><div class="tdBefore">할인금액</div>1,000원</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<nav class="Paging">
						<ul>
							<li class=" disabled"><a><i
									class="icon icon-arrow-2left"></i></a></li>
							<li class=" disabled"><a><i class="icon icon-arrow-left"></i></a></li>
							<li class=" active"><a>1</a></li>
							<li class=" disabled"><a><i
									class="icon icon-arrow-right"></i></a></li>
							<li class=" disabled"><a><i
									class="icon icon-arrow-2right"></i></a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="frame-promo">
		<div class="tip-container"></div>
	</div>
</div>


<%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>
