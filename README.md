# 🛵 FLEXDELIVERY

>🎉 `플렉스딜리버리`를 소개합니다.<br>
>실생활에서 사용하고 있는 배달앱을 벤치마킹하여 배달 웹 개발을 목표로 진행하였으며 3가지 웹 사이트로 구성됩니다.</p>

1. <a href="https://github.com/2020-07-31/FLEXDELIVERY/tree/master/FlexDelivery/src/main/webapp/WEB-INF/views/member">order site</a><p> : 회원 가입, 로그인, 점포 조회, 장바구니, 쿠폰 발급, 주문/결제, 리뷰 작성, 마이페이지, 선물하기, 일대일문의, 오늘 뭐먹지?</p>
2. <a href="https://github.com/2020-07-31/FLEXDELIVERY/tree/master/FlexDelivery/src/main/webapp/WEB-INF/views/owner">owner site</a><p> : 사장님 가입, 로그인, 사장님 마이페이지, 입점 신청, 내가게 매출/현황 조회, 메뉴 등록/수정, 주문 처리 현황, 리뷰 관리, 쿠폰/광고 관리, 요청 처리 현황, 이벤트, 공지사항, 사장님 꿀 팁, 자주 묻는 질문, 일대일 문의</p>
3. <a href="https://github.com/2020-07-31/FLEXDELIVERY/tree/master/FlexDelivery/src/main/webapp/WEB-INF/views/admin">admin site</a><p> : 회원 관리, 점주 관리, 요청 현황, 메뉴  카테고리 관리, 쿠폰/광고 관리, 선물하기 관리, 공지사항/이벤트/사장님 꿀 팁 작성, 일대일 문의 답변</p>

## 🛵 기간 : 2021.01.11 ~ 2021.02.19 ( 6주 )
- 참여 인원 : 5명<br>
- 1 ~ 2주차 : 기획 및 분석<br>
- 3주차 : DB설계 및 전반적인 UI 구현<br>
- 4 ~ 5주차 : 기능 구현 및 테스트<br>
- 6주차 : 디버깅 및 마무리 작업<br>

## 🛵 사용기술
<!-- Table -->
|분류||
|:--:|:--|
|Front-End|Javascript, HTML5, CSS3, JQuery, Ajax, JSP, BootStrap|
|Back-End|Java, MyBatis, Oracle, Spring Tool Suite|
|Open API|import, ck Editor, JAMES, POI, reCAPTCHA, datePicker, BCrypt, c3|
|Tool|Apache Tomcat 9.0, Eclipse, Git, Github, SourceTree, STS|

## 🛵 내용
- 회원가입시 이메일 확인 처리 JAMES api이용, reCAPCHA로 무분별한 회원가입 방지, 도로명주소 api사용
- BCrypt로 비밀번호 암호화
- 주문(회원), 광고(점포) 결제 import api
- c3 차트로 사장님 페이지에서 매출 현황 조회, 관리자 운영 정보 조회 가능
- POI로 DB정보 엑셀로 다운로드 가능(관리자)
- ckEditor로 게시판 글 작성 가능
- datePicker로 리뷰 기간별 조회 가능
- 회원 페이지에서 주문, 사장님 페이지에서 주문을 처리하는 프로세스 구현
- 회원이 작성한 리뷰 신고 처리 과정에서 관리자 승인 필요
- 게시판 페이징 처리, 점포 조회 시 스크롤 페이징 처리

___
## 역할 및 페이지 구성
#### ➡️ <a href="https://github.com/2020-07-31/FLEXDELIVERY/blob/master/FlexDelivery/src/main/webapp/WEB-INF/views/owner/index.jsp">사장님 사이트 메인 화면</a>
>* 공지사항, 이벤트, 사장님 꿀팁, 이달의 점포 순위, 광고가 보여집니다.<br>
>* 서류 제출 후 내 가게를 운영할 수 있습니다.<br>
<img src="https://user-images.githubusercontent.com/69043412/109512488-7db54d80-7ae7-11eb-944c-8fd86f840129.png" alt="ownermain" width="600"><br>
#### ➡️ <a href="https://github.com/2020-07-31/FLEXDELIVERY/blob/master/FlexDelivery/src/main/webapp/WEB-INF/views/owner/menu1/launch/launch.jsp">입점 신청</a>
>* 로그인 후 내 가게 운영을 위한 서류절차입니다.
>* ajax를 이용한 중복 확인
>* js를 이용한 입력 값 유효성 검사
>* 우편번호 찾기 api 사용
>* multipart/form-data를 이용한 사업자등록증 파일, 로고 이미지 썸네일<br>
<img src="https://user-images.githubusercontent.com/69043412/109521610-d5a48200-7af0-11eb-9e7c-2976f3075bde.png" alt="storelaunch" width="600"/><br>
#### ➡️ <a href="https://github.com/2020-07-31/FLEXDELIVERY/blob/master/FlexDelivery/src/main/webapp/WEB-INF/views/owner/menu2/myStoreIndex.jsp">내가게 메인</a>
>* 가게 운영에 전반적인 내용을 한 눈에 볼 수 있습니다.<br>
>* 승인 요청 현황은 테이블 여러개를 카운트해 트렌젝션 처리를 하였습니다.
<img src="https://user-images.githubusercontent.com/69043412/109515408-6166e000-7aea-11eb-86a6-6fca0ae7ae5d.png" width="600"><br>
#### ➡️ <a href="https://github.com/2020-07-31/FLEXDELIVERY/blob/master/FlexDelivery/src/main/webapp/WEB-INF/views/owner/menu2/requests/requests.jsp">승인 현황 조회</a>
>* 리스트를 출력해 뷰페이지에서 IF조건절을 사용해 뱃지 색상을 다르게하였습니다.
>* 승인 현황 상세보기를 누르면 승인 대기 상태일 경우 본인 인증 후 취소가 가능합니다.<br>
<img src="https://user-images.githubusercontent.com/69043412/109515399-5f048600-7aea-11eb-8d0d-c5410117684f.png" width="600"><br>
#### ➡️ <a href="https://github.com/2020-07-31/FLEXDELIVERY/blob/master/FlexDelivery/src/main/webapp/WEB-INF/views/owner/menu2/advertise/advertiseWrite.jsp">광고 신청</a>
>* 회원 주문 페이지에 노출되는 광고를 선택해 결제 가능합니다. (import api)
<img src="https://user-images.githubusercontent.com/69043412/109740457-a08e5180-7c0e-11eb-8155-304f9cfc4e33.png" alt="advertise" width="600"><br>
#### ➡️ <a href="https://github.com/2020-07-31/FLEXDELIVERY/blob/master/FlexDelivery/src/main/webapp/WEB-INF/views/owner/menu2/reviewOwner/reviewOwner.jsp">리뷰관리</a>
>* 날짜별로 조회가 가능하며 (datePicker)
>* 부적절한 리뷰를 신고할 수 있습니다. (관리자 승인 후 차단으로 이동)
>* 리뷰에 대한 답변 CRUD (Ajax사용)<br>
<img src="https://user-images.githubusercontent.com/69043412/109516574-b0614500-7aeb-11eb-949e-bb49adfa9fd3.png" alt="review" width="600"><br>
#### ➡️ <a href="https://github.com/2020-07-31/FLEXDELIVERY/blob/master/FlexDelivery/src/main/webapp/WEB-INF/views/owner/menu2/couponused/couponUsed.jsp">쿠폰 등록</a>
>* 고객에게 제공중인 쿠폰 현황 조회
>* 본인 인증 후 쿠폰을 발급 받을 수 있습니다.
>* 만료기간이 남은 쿠폰은 재발급이 불가능하게 트렌젝션 처리를 하였습니다.
>* 사용 상태 Flag를 추가하여 만료기간 이전의 쿠폰들은 사용중지/재사용이 가능합니다.<br>
<img src="https://user-images.githubusercontent.com/69043412/109516649-c111bb00-7aeb-11eb-9267-a75436565176.png" alt="coupon" width="600"><br>
#### ➡️ <a href="https://github.com/2020-07-31/FLEXDELIVERY/blob/master/FlexDelivery/src/main/webapp/WEB-INF/views/owner/menu5/oneToOne.jsp">일대일 문의</a>
>* 나의 일대일 문의 작성, 전체 조회, 답변보기, 수정, 삭제가 가능합니다.<br>
<img src="https://user-images.githubusercontent.com/69043412/109518585-b5bf8f00-7aed-11eb-88c4-9aea287a1797.png" alt="ask" width="600"><br>
#### ➡️ <a href="https://github.com/2020-07-31/FLEXDELIVERY/blob/master/FlexDelivery/src/main/webapp/WEB-INF/views/owner/menu5/faq.jsp">자주 묻는 질문</a>
>* 카테고리별 조회가 가능하며 부트스트랩 아코디언 컴포넌트를 이용하였습니다.<br>
<img src="https://user-images.githubusercontent.com/69043412/109518619-c07a2400-7aed-11eb-8634-d430aff45770.png" alt="faq" width="600"><br>
#### ➡️ <a href="https://github.com/2020-07-31/FLEXDELIVERY/blob/master/FlexDelivery/src/main/webapp/WEB-INF/views/owner/menu3/honeyTip/honeyTip.jsp">사장님 꿀 팁</a>
>* 사장님에게만 제공되는 놓치면 후회할 팁들을 모았습니다.<br>
<img src="https://user-images.githubusercontent.com/69043412/109518656-c96af580-7aed-11eb-80c2-e0a29eada045.png" alt="honeytip" width="600"><br>
#### ➡️ DB설계
> <img src="https://user-images.githubusercontent.com/69043412/109821635-850c6080-7c79-11eb-94b5-e2a6b987589e.png" alt="honeytip" width="600"><br>
<br>
<br>
<br>
