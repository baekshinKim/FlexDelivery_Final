<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../memInc/top.jsp"%>
 <div class="osahan-profile">
    <div class="d-none">
        <div class="bg-primary border-bottom p-3 d-flex align-items-center">
            <a class="toggle togglew toggle-2" href="#"><span></span></a>
            <h4 class="font-weight-bold m-0 text-white">MyFlex</h4>
        </div>
    </div>
   
        <!-- profile -->
        <div class="container position-relative">
            <div class="py-5 osahan-profile row">
            <!-- 사이드바 -->
                <div class="col-md-12 mb-12">
                    <div class="bg-white rounded shadow-sm sticky_sidebar overflow-hidden">
                        <a href="<c:url value='/member/register/memberEdit.do' />" class="">
                            <div class="d-flex align-items-center p-3">
                                <div class="right">
                                    <h6 class="mb-1 font-weight-bold">${vo.memberName}<i class="feather-check-circle text-success"></i></h6>
                                    <p class="text-muted m-0 small">${vo.memberEmail1}@${vo.memberEmail2}</p>
                                </div>
                            </div>
                        </a>
                        <!-- profile-details -->
                        <div class="bg-white profile-details">
                        	<a class="d-flex align-items-center border-bottom p-3">
                                <div class="left mr-3">
                                    <h6 class="font-weight-bold mb-1">주소</h6>
                                    <p class="small text-muted m-0">${vo.memberAddress}&nbsp;${vo.memberAddressDetail}</p>
                                </div>
                                <div class="right ml-auto">
                                    <h6 class="font-weight-bold m-0"><i class="feather-chevron-right"></i></h6>
                                </div>
                            </a>
                            <!-- <a data-toggle="modal" data-target="#exampleModal" class="d-flex w-100 align-items-center border-bottom p-3">
                               <div class="left mr-3">
                                    <h6 class="font-weight-bold mb-1 text-dark">내 등급</h6>
                                    <p class="small text-muted m-0"></p>
                                </div>
                                <div class="right ml-auto">
                                    <h6 class="font-weight-bold m-0"><i class="feather-chevron-right"></i></h6>
                                </div>
                            </a> -->
                            
                            <a href='<c:url value="/member/register/memberEdit.do" />' class="d-flex w-100 align-items-center border-bottom px-3 py-4">
                                <div class="left mr-3">
                                    <h6 class="font-weight-bold m-0 text-dark"><i class="feather-edit bg-primary text-white p-2 rounded-circle mr-2"></i>회원수정</h6>
                                </div>
                                <div class="right ml-auto">
                                    <h6 class="font-weight-bold m-0"><i class="feather-chevron-right"></i></h6>
                                </div>
                            </a>
                            <a href='<c:url value="/member/order/orderList.do" />' class="d-flex w-100 align-items-center border-bottom px-3 py-4">
                                <div class="left mr-3">
                                    <h6 class="font-weight-bold m-0 text-dark"><i class="feather-list bg-warning text-white p-2 rounded-circle mr-2"></i>주문내역</h6>
                                </div>
                                <div class="right ml-auto">
                                    <h6 class="font-weight-bold m-0"><i class="feather-chevron-right"></i></h6>
                                </div>
                            </a>
                            <a href="<c:url value="/member/mypage/myCoupon.do" />" class="d-flex w-100 align-items-center border-bottom px-3 py-4">
                                <div class="left mr-3">
                                    <h6 class="font-weight-bold m-0 text-dark"><i class="feather-tag bg-success text-white p-2 rounded-circle mr-2"></i>쿠폰함</h6>
                                </div>
                                <div class="right ml-auto">
                                    <h6 class="font-weight-bold m-0"><i class="feather-chevron-right"></i></h6>
                                </div>
                            </a>
                            <a href="<c:url value="/member/mypage/myLikeStore.do" />" class="d-flex w-100 align-items-center border-bottom px-3 py-4">
                                <div class="left mr-3">
                                    <h6 class="font-weight-bold m-0 text-dark"><i class="feather-heart bg-primary text-white p-2 rounded-circle mr-2"></i>찜한가게</h6>
                                </div>
                                <div class="right ml-auto">
                                    <h6 class="font-weight-bold m-0"><i class="feather-chevron-right"></i></h6>
                                </div>
                            </a>
                            <a href="<c:url value="/member/gift/myGift.do" />" class="d-flex w-100 align-items-center border-bottom px-3 py-4">
                                <div class="left mr-3">
                                    <h6 class="font-weight-bold m-0 text-dark"><i class="feather-gift bg-success text-white p-2 rounded-circle mr-2"></i>선물함</h6>
                                </div>
                                <div class="right ml-auto">
                                    <h6 class="font-weight-bold m-0"><i class="feather-chevron-right"></i></h6>
                                </div>
                            </a>
                            <a href="<c:url value="/member/review/myReview.do" />" class="d-flex w-100 align-items-center border-bottom px-3 py-4">
                                <div class="left mr-3">
                                    <h6 class="font-weight-bold m-0 text-dark"><i class="feather-file-text bg-warning text-white p-2 rounded-circle mr-2"></i>내 리뷰</h6>
                                </div>
                                <div class="right ml-auto">
                                    <h6 class="font-weight-bold m-0"><i class="feather-chevron-right"></i></h6>
                                </div>
                            </a>
                            <a href="#" class="d-flex w-100 align-items-center px-3 py-4" data-toggle="modal" data-target="#outModal">
                                <div class="left mr-3">
                                    <h6 class="font-weight-bold m-0 text-dark"><i class="feather-x-circle bg-danger text-white p-2 rounded-circle mr-2"></i>회원탈퇴</h6>
                                </div>
                                <div class="right ml-auto">
                                    <h6 class="font-weight-bold m-0"><i class="feather-chevron-right"></i></h6>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
              <!-- 사이드바 end -->
            </div>
        </div>
    </div>
<%@include file="../../memInc/myPageBottom.jsp"%>