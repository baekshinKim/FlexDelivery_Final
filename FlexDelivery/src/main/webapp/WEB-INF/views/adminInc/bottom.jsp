<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <!-- adminInc/bottom.jsp -->
    
    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area text-center" style="background-color: white;">
        <div class="container">
            <div class="row">
                <div class="col-12">
			                      
			<!-- 플렉스 딜리버리 사업자 소개 Start-->
			<p>
			<c:if test="${!empty sessionScope.adminId}">
				<a href="<c:url value='/admin/index.do' />" style="text-decoration: none; color: #8D18FF;">플렉스 딜리버리 FLEX DELIVERY</a>
				<br>
				경상북도 울릉군 울릉읍 <a href="https://dokdo.mofa.go.kr/kor/" style="text-decoration: none; color: black;">독도</a>
				안용복길 3 | 대표전화: 054-0115-0219 | 팩스: 054-0219-0115 | 대표메일: FlexDeliveryCEO@flexdelivery.com | 사업자등록번호: PROJ-219-FINAL | 통신판매업신고: 제 2021-경북울릉-####호
				&copy; Flex Delivery Corp.
			</c:if>
			<c:if test="${empty sessionScope.adminId}">
				<a href="<c:url value='/admin/index.do' />" style="text-decoration: none; color: #8D18FF;">플렉스 딜리버리 FLEX DELIVERY</a>
				<a href="<c:url value='/admin/login/login.do' />">&nbsp;</a><br>
				경상북도 울릉군 울릉읍 <a href="https://dokdo.mofa.go.kr/kor/" style="text-decoration: none; color: black;">독도</a>
				안용복길 3 | 대표전화: 054-0115-0219 | 팩스: 054-0219-0115 | 대표메일: FlexDeliveryCEO@flexdelivery.com | 사업자등록번호: PROJ-219-FINAL | 통신판매업신고: 제 2021-경북울릉-####호
				&copy; Flex Delivery Corp.
			</c:if>
			</p>

			<!-- 플렉스 딜리버리 사업자 소개 End-->

			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with 
			<i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    
                </div>
            </div>
        </div>

    </footer>
    <!-- ##### Footer Area End ##### -->
  
</body>
</html>
