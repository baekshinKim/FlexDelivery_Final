<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../../memInc/top.jsp" %>
<div class="osahan-home-page">
    <div class="bg-primary p-3 d-none">
	    <div class="text-white">
	        <div class="title d-flex align-items-center">
	            <a class="toggle">
	                <span></span>
	            </a>
	            <h4 class="font-weight-bold m-0 pl-5">Flex-Delivery</h4>
	        </div>
	    </div>
	</div>

       <!-- 대분류카테고리 -->
       <c:import url="/member/store/categorySlider.do" />'
       
       <!-- 점포리스트 출력 -->
       <div class="container">
       
           <!-- Flex 광고 -->
           <div class="pt-4 pb-2 title d-flex align-items-center">
               <h5 class="m-0">FLEX RECOMMEND</h5>
           </div>
          	<c:import url="/member/store/flexAdList.do">
          		<c:param name="lCategoryNo" value="${param.lCategoryNo}"/>
          	</c:import>
          	
           <!-- 오픈리스트 -->
           <div class="py-3 title d-flex align-items-center">
               <h5 class="m-0">오픈리스트</h5>
           </div>
           <div class="most_popular">
               <div class="row justify-content-center">
               	<c:import url="/member/store/openAdList.do">
           			<c:param name="lCategoryNo" value="${param.lCategoryNo}"/>
           		</c:import>
               </div>
           </div>
           
           <!-- 전체상품 -->
           <div class="pt-2 pb-3 title d-flex align-items-center">
               <h5 class="m-0">전체보기</h5>
           </div>
          	<c:import url="/member/store/storeAll.do">
      			<c:param name="lCategoryNo" value="${param.lCategoryNo}"/>
      			<c:param name="startIndex" value="1"/>
      			<c:param name="lastIndex" value="6"/>
      		</c:import>
       </div>
   </div>
<%@include file="../../memInc/bottom.jsp" %>