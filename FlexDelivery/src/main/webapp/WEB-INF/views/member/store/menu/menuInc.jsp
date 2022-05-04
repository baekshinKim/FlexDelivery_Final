<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<c:forEach var="mVo" items="${menuList}">
	<div class="p-3 border-bottom gold-members">
	    <span class="float-right"><a href="#" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#menu${mVo.memberMenuVo.menuNo}Option">옵션 선택</a></span>
	    <div class="media">
	        <div class="mr-3 font-weight-bold text-danger non_veg">.</div>
	        <div class="media-body">
	            <h6 class="mb-1">${mVo.memberMenuVo.menuName}</h6>
	            <p class="text-muted mb-0">${mVo.memberMenuVo.menuPrice}원</p>
	        </div>
	    </div>
	</div>
	<div class="modal fade" id="menu${mVo.memberMenuVo.menuNo}Option" tabindex="-1" role="dialog" aria-labelledby="option" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
	                <h5 class="modal-title">${mVo.memberMenuVo.menuName}</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                	<span aria-hidden="true">&times;</span>
	                </button>
                </div>
                <div class="col-md-12" style="text-align: center;line-height: 25">
                	<img src="<c:url value='/resources/imgs/MenuImages/${mVo.memberMenuVo.menuImg}' />" width="250px" height="250px">
                	<br>
					<p class="h5">${mVo.memberMenuVo.menuContent}</p>                 	
                </div>
                <form name="cartForm">
                	<input type="hidden" name="menuNo" value="${mVo.memberMenuVo.menuNo}">
                	<input type="hidden" name="storeNo" value="${storeNo}">
                	<input type="hidden" name="storeName" value="${storeName}">
	                <div class="modal-body p-0">
	                    <div class="osahan-filter">
	                        <div class="filter">
	                            <!--옵션선택 -->
	                            <c:if test="${empty mVo.menuOptionList}">
		                            <div class="p-3 bg-light border-bottom">
		                                <h6 class="m-0">기본선택만 가능</h6>
		                            </div>
	                                <div class="custom-control custom-radio border-bottom py-2">
		                                <input type="radio" class="custom-control-input" id="noOption${mVo.memberMenuVo.menuNo}" name="mOptionNo" value="0" checked>
									    <input type="hidden" value="${mVo.memberMenuVo.menuPrice}">
									    <label class="custom-control-label py-3 w-100 px-3" for="noOption${mVo.memberMenuVo.menuNo}">기본<p class="text-muted mb-0">추가 없음</p></label>
								    </div>
	                            </c:if>
	                            <c:if test="${!empty mVo.menuOptionList}">
		                            <div class="p-3 bg-light border-bottom">
		                                <h6 class="m-0">옵션선택</h6>
		                            </div>
			                            <div class="custom-control custom-radio border-bottom py-2">
			                                <input type="radio" class="custom-control-input" id="noOption${mVo.memberMenuVo.menuNo}" name="mOptionNo" value="0" checked>
										    <input type="hidden" value="${mVo.memberMenuVo.menuPrice}">
										    <label class="custom-control-label py-3 w-100 px-3" for="noOption${mVo.memberMenuVo.menuNo}">기본선택<p class="text-muted mb-0">추가 없음</p></label>
			                            </div>
		                            <c:forEach var="oVo" items="${mVo.menuOptionList}">
			                            <div class="custom-control custom-radio border-bottom py-2">
			                                <input type="radio" class="custom-control-input" id="menu${mVo.memberMenuVo.menuNo}Check${oVo.mOptionNo}" name="mOptionNo" value="${oVo.mOptionNo}">
			                               	<input type="hidden" value="${mVo.memberMenuVo.menuPrice+oVo.mOptionPrice}">
			                                <label class="custom-control-label py-3 w-100 px-3" for="menu${mVo.memberMenuVo.menuNo}Check${oVo.mOptionNo}">${oVo.mOptionName}<p class="text-muted mb-0">+${oVo.mOptionPrice}원</p></label>
			                            </div>
		                            </c:forEach>
	                            </c:if>
	                        </div>
	                    </div>
	                </div>
	                <div class="p-3 bg-light border-bottom">
	                    <p class="m-0 h6">수량<span class="count-number float-right">
	                    	<button type="button" class="btn-sm left dec btn btn-outline-secondary minusBt"><i class="feather-minus"></i></button>
	                    	<input class="count-number-input qty" type="text" name="cartQty" readonly="readonly" value="1">
	                    	<button type="button" class="btn-sm right inc btn btn-outline-secondary plusBt"><i class="feather-plus"></i></button>
	                    </span></p>
	                </div>
	                <div class="p-3 bg-light border-bottom">
	                    <p class="text-muted fs-5 fw-bold font-monospace">Total 
	                    <span class="float-right font-monospace totalPrice" style="font-weight: 700">
	                    ${mVo.memberMenuVo.menuPrice}원
	                    </span>
	                    </p>
	                </div>
	                <div class="modal-footer p-0 border-0">
	                    <div class="col-6 m-0 p-0">
	                        <button type="submit" class="btn btn-primary btn-lg btn-block">장바구니담기</button>
	                    </div>
	                    <div class="col-6 m-0 p-0">
	                        <button type="button" class="btn border-top btn-lg btn-block closeBt" data-dismiss="modal">취소</button>
	                    </div>
	                </div>
                </form>
            </div>
        </div>
    </div>
</c:forEach>
