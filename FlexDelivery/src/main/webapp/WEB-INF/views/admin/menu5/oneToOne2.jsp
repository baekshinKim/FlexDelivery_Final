<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../adminInc/top.jsp" %>    

<!-- CSS start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<!-- CSS end -->    

<div class="container">
	<div class="row">
		<div class="main-content container-fluid">
		    <div class="page-title">
		        <div class="row">
		            <div class="col-12 col-md-6 order-md-1 order-last">
		                <h3>1:1 문의내역 조회</h3>
		                <p class="text-subtitle text-muted">글번호, 제목, 아이디, 회원종류, 답변여부에 따른 정렬이 가능합니다.</p>
		            </div>
		        </div>
		    </div>
		    <section class="section">
		        <div class="card">
		            <div class="card-header">
		            </div>
		            <div class="card-body">
		                <ul class="nav nav-tabs">
						  <li class="nav-item">
						    <a class="nav-link active" data-toggle="tab" href="#qwe">1:1 문의하기</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" data-toggle="tab" href="#asd">나의 질문과 답변보기 <span class="badge bg-transparent">3</span></a>
						  </li> 
						</ul>
						<div class="tab-content">
						  <div class="tab-pane fade show active" id="qwe">
						  	<br>
						    <div class="card-body">
				                <form class="form form-horizontal">
				                <div class="form-body">
				                    <div class="row">
				                    <div class="col-md-4">
				                        <label>제목</label>
				                    </div>
				                    <div class="col-md-8 form-group">
				                        <input type="text" id="first-name" class="form-control" name="fname" placeholder="문의글 제목을 입력하세요">
				                    </div>
				                    <div class="col-md-4">
				                        <label>내용</label>
				                    </div>
				                    <div class="col-md-8 form-group">
				                        <textarea id="email-id" class="form-control" name="email-id" placeholder="문의글 내용을 입력하세요" style="height: 120px;"></textarea>
				                    </div>
				                   <div class="col-12 col-md-8 offset-md-4 form-group">
				                        <div class='form-check'>
				                            <div class="checkbox">
				                                <input type="checkbox" id="checkbox1" class='form-check-input' checked>
				                                <label for="checkbox1">[필수] 개인정보 수집 및 이용에 동의합니다.</label>
				                            </div>
				                        </div>
				                    </div>
				                    <div class="col-sm-12 d-flex justify-content-end">
				                        <button type="submit" class="btn btn-primary mr-1 mb-1">문의하기</button>
				                        <button type="reset" class="btn btn-light-secondary mr-1 mb-1">다시 쓰기</button>
				                    </div>
				                    </div>
				                </div>
				                </form>
				            </div>
						  </div>
						  <div class="tab-pane fade" id="asd">
						  	<br>
						  	<!-- Hoverable rows start -->
							<div class="row" id="table-hover-row">
							  <div class="col-12">
							    <div class="card">
							      <div class="card-content">
		       				        <!-- table hover -->
							        <div class="table-responsive">
							          <table class="table table-hover mb-0">
							            <thead>
							              <tr>
							                <th>번호</th>
							                <th colspan="3">제목</th>
							                <th></th>					
							                <th>등록일시</th>
							                <th>상태</th>
							                <th>취소하기</th>
							              </tr>
							            </thead>
							            <tbody>
							              <tr>
							                <td class="text-bold-500">3</td>
							                <td colspan="3">음식에서 이물질이 나왔습니다</td>							               
							                <td></td>
							                <td>2021-01-19</td>
							                <td><span class="badge bg-danger">미답변</span></td>
							                <td><span class="badge bg-dark">취소</span></td>
							              </tr>
							              <tr>
							                <td class="text-bold-500">2</td>
							                <td colspan="3">배달 지역 변경은 안되나요?</td>							                
							                <td></td>
							                <td>2021-01-08</td>
							                <td><span class="badge bg-success">답변완료</span></td>
							                <td><span class="badge bg-dark">X</span></td>
							              </tr>
							              <tr>
							                <td class="text-bold-500">1</td>
							                <td colspan="3">선물하기는 정해진 금액만 가능한가요?</td>							                
							                <td></td>
							                <td>2021-01-06</td>
							                <td><span class="badge bg-success">답변완료</span></td>
							                <td><a href="#"><i
							                      class="badge-circle badge-circle-light-secondary font-medium-1" data-feather="mail"></i></a></td>
							              </tr>
							              
							            </tbody>
							          </table>
							        </div>
							      </div>
							    </div>
		            </div>
		        </div>
		    </section>
		</div>
		
	</div>
</div>
    
<!-- script start -->   
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->
        
<%@include file="../../adminInc/bottom.jsp" %>    