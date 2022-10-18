<!-- https://xd.adobe.com/view/9c5bb8c9-f3b5-4e36-71b7-4f11b5566854-ea6a/screen/ebd0eb7b-6ffd-44c7-89ae-7278f8340449?fullscreen -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%
  request.setCharacterEncoding("UTF-8");
%>   
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
        <title>Hotel Introduce</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js'></script>
        <script src="../../../resources/js/script.js"> </script>
        <!-- 초기화 코드 -->
        <link rel="stylesheet" href="../../../resources/css/reset.css">
        <link rel="stylesheet" href="../../../resources/css/tiles.css">
        <style>
            /* common 공통 시작 */
            /* section */
            section {
                width: 1270px; 
                height: 650px;
                margin: 200px auto;
                position: relative;
            }
            /* 노란색 바 */
            .bar {
                width: 160px; height: 10px;
                background-color: #e59f5a;
                border-radius: 30px;
            }
            /* 제목 */
            .sec_title{
                font-size: 30px;   
                font-weight: 800;
                margin-top: 15px; 
            }
            /* 내용 */
            .sec_p {
                font-size: 15px;   
                letter-spacing:-0.5px;
                color: #909090;
                margin-top: 20px; 
                line-height: 30px;
            }
            /* common 공통 끝 */
            /* outline 개요 시작 */
            .outline {
                margin: 0px;
                right: -324px;
                bottom: 20px;
            }
            .txt_outline{
                width: 400px; 
                height: 150px;
                background-color: #fff;
                position: relative;
                top: 100px; 
                left: 150px;
            }
            .outline .txt_outline .bar {   
                left: 230px;
                position: relative;
            }
            .txt_outline .sec_title{
                margin-left: 343px;
                right: -20px;
                position: relative;
            }
            .txt_outline .sec_p{
                margin-left: 80px;
                text-align: right;
            }
            .outline_con_wrap{
                position: relative;
                width: 500px; height: 200px;
                top: 180px; left: 200px;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }
            .outline_img_wrap {
                width: 480px; 
                height: 650px;
                display: block;
                position: relative;
                top: -153px; left: 700px;
            }
            /* outline 개요 끝 */
            /* feed 사료 시작 */
            .feed {
                bottom: 120px;
            }
            .feed_img_wrap{
                width: 550px; 
                height: 550px;
                position: relative;
                left: 150px;
                bottom: -200px;
                overflow: hidden;
            }
            .txt_feed{
                width: 280px; 
                height: 225px;
                position: relative;
                float: right;
                top: -230px; 
                right: 220px;
            }
            .txt_feed .bar{
                margin-left: 50px;
            }
            .txt_feed .sec_p{
                margin-left: 40px;
            }
            .txt_feed .sec_title{
                margin-left: 20px;
            }
            /* feed 사료 끝 */
             /* spray 소독 시작 */
            .spray {
                bottom: 70px;
            }
            .txt_spray{
                width: 400px; 
                height: 150px;
                background-color: #fff;
                position: relative;
                top: 130px; 
                left: 150px;
            }
            .txt_spray .sec_title{
                margin-left: 130px;
                position: relative;
                right: -240px;
            }
            .spray .txt_spray .bar {
                left: 235px;
                position: relative;
            }
            .txt_spray .sec_p{
                margin-left: 80px;
                text-align: right;
            }
            .spray_con_wrap{
                position: relative;
                width: 500px; height: 200px;
                top: 180px; left: 200px;
                display: flex;
                flex-direction: row;
                justify-content: space-between;

            }
            .spray_img_wrap {
                width: 480px; 
                height: 650px;
                display: block;
                position: relative;
                top: -153px; left: 700px;

                /* border: 1px solid red; */
            }
            /* spray 소독 끝 */
            /* cctv 시작 */
            .cctv {
                bottom: 180px
            }
            .cctv_img_wrap{
                width: 550px; 
                height: 550px;
                position: relative;
                left: 250px;
                bottom: -200px;
                overflow: hidden;
            }
            .txt_cctv{
                width: 280px; 
                height: 225px;
                position: relative;
                float: right;
                top: -230px; 
                right: 220px;
            }
            .txt_cctv .bar{
                margin-left: 50px;
                position: relative;
                left: 0px;
            }
            .txt_cctv .sec_p{
                margin-left: 40px;
            }
            .txt_cctv .sec_title{
                margin-left: 20px;
                position: relative;
                left: -20px;
            }
            /* cctv 끝 */
            /* call 연락 시작 */
            .call {
                bottom: 0px;
            }
            .txt_call{
                width: 400px; 
                height: 150px;
                background-color: #fff;
                position: relative;
                top: 110px; 
                left: 170px;
            }
            .txt_call .sec_title{
                margin-left: 130px;
                position: relative;
                right: -220px;
            }
            .txt_call .sec_p{
                margin-left: 80px;
                text-align: right;
                position: relative;
                left: -30px;
            }
            .call .txt_call .bar {
                position: relative;
                right: -200px;
            }
            .call_con_wrap{
                position: relative;
                width: 500px; height: 200px;
                top: 180px; left: 200px;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }
            .call_img_wrap {
                width: 480px; 
                height: 650px;
                display: block;
                position: relative;
                top: -110px; 
                left: 680px;
            }
            /* call 연락 끝 */
            /* walk 산책 시작 */
            .walk {
                bottom: 300px
            }
            .walk_img_wrap{
                width: 550px; 
                height: 550px;
                position: relative;
                left: 250px;
                bottom: -180px;
                overflow: hidden;
                /* border: 1px solid red; */
            }
            .txt_walk{
                width: 280px; 
                height: 225px;
                position: relative;
                float: right;
                top: -230px; 
                right: 230px;
            }
            .txt_walk .bar{
                margin-left: 50px;
            }
            .txt_walk .sec_p{
                margin-left: 40px;
            }
            .txt_walk .sec_title{
                margin-left: 20px;
                position: relative;
                right: 10px;
            }
            /* walk 산책 끝 */
            .header_box_back {
	   bottom: 200px;
                margin: 0;
                position: relative;
                width: 100%;
                height: 160px;
                background-color: white;
            }
        </style>
    </head>
    <body>
        <section class="header_box_back">
        </section>
        <!-- outline 개요 시작  -->
        <section class="outline">
            <div class="txt_outline">
                <div class="bar"></div>
                <p class="sec_title">개요</p>
                <p class="sec_p"><b>애니텔</b>은 <br> 
                                 입실 전 꼼꼼한 체크를 합니다.<br>
                                 건강 상태, 알레르기 여부 등 <br>
                                 맞춤형 호텔링을 위해 꼼꼼한 체크가 이뤄집니다. <br>
                                 또한 미용, 스파도 함께 준비되어 있습니다. <br>
                                 그 어떤 반려견 중에 소중하지 않은 아이는 없습니다. <br>
                                 믿고 맡겨주시는 보호자님의 그 마음에 보답하는 <br>
                                 <b>애니텔</b>이 되겠습니다. 감사합니다. 
                </p>
            </div>
            <div class="outline_img_wrap">
                <img src="../../../resources/img/hotel.jpg" alt="호텔" height="600">
            </div>
        </section>
        <!-- outline 개요 끝 -->
        <!-- feed 사료 시작 -->
        <section class="feed">
            <div class="feed_img_wrap">
                <img src="../../../resources/img/feed.jpg" alt="사료" width="500" height="450">
            </div>
            <div class="txt_feed">
                <div class="bar"></div>
                <p class="sec_title">사료</p>
                <p class="sec_p"> 신선한 동물성, 식물성 단백질과 <br> 
                                  20개 이상의 영양이 풍부한 <br>
                                  슈퍼푸드를 바탕으로 만든<br>
                                  사료를 쓰며 반려견의 나이 <br>
                                  활동량을 고려하여 급여를 합니다.   
                </p>
            </div>
        </section>
        <!-- feed 사료 끝 -->
        <!-- spary 소독 시작  -->
        <section class="spray">
            <div class="txt_spray">
                <div class="bar"></div>
                <p class="sec_title">소독</p>
                <p class="sec_p"> 각종 유해세균을 99.99% <br>
                                  살균을 하고 안전기준을 확인받은 <br>
                                  소독제를 사용하여 매장, 반려동물 장난감 <br>
                                  방석, 배변 패드까지 1일 1회 이상 <br>
                                  꼼꼼히 소독합니다. 
                </p>
            </div>
            <div class="spray_img_wrap">
                <img src="../../../resources/img/spray.jpg" alt="소독" height="600">
            </div>
        </section>
        <!-- spray 소독 끝 -->
        <!-- cctv 시작 -->
        <section class="cctv">
            <div class="cctv_img_wrap">
                <img src="../../../resources/img/cctv.jpg" alt="CCTV" width="400">
            </div>
            <div class="txt_cctv">
                <div class="bar"></div>
                <p class="sec_title">CCTV</p>
                <p class="sec_p"> 좌우,상하 자유로운 회전을 하고 <br>
                                  1080P 풀 HD CCTV를 사용해 <br> 
                                  보다 선명한 화질과 <br> 
                                  사각지대 없는 촬영을 하고 <br>
                                  반려견의 모습을 휴대폰으로 연동하여 <br>
                                  확인하실 수 있습니다.   
                </p>
            </div>
        </section>
        <!-- cctv 끝 -->
        <!-- call 연락 시작  -->
        <section class="call">
            <div class="txt_call">
                <div class="bar"></div>
                <p class="sec_title">연락</p>
                <p class="sec_p"> 반려동물과 떨어진 보호자님께 <br>
                                  불안한 마음을 달래고자 <br>
                                  CCTV로는 확인이 불가능한 특이 사항 등 <br>
                                  반려견이 이상이 있는지 없는지 <br>
                                  지속적인 연락을 드립니다. 
                </p>
            </div>
            <div class="call_img_wrap">
                <img src="../../../resources/img/call.jpg" alt="연락" height="400">
            </div>
        </section>
        <!-- call 연락 끝 -->
        <!-- walk 산책 시작 -->
        <section class="walk">
            <div class="walk_img_wrap">
                <img src="../../../resources/img/walk.jpg" alt="산책" width="400">
            </div>
            <div class="txt_walk">
                <div class="bar"></div>
                <p class="sec_title">산책</p>
                <p class="sec_p"> 강아지한테 있어서 <br> 
                                  가장 중요한 부분인 산책을 <br>
                                  내부 시설에서 노는 것으로 <br>
                                  그치지 않고 1일 1회 이상 <br>
                                  외부 산책을 실시합니다.    
                </p>
            </div>
        </section>
        <!-- walk 산책 끝 -->
        <!-- side 버튼 시작 -->
        <div class="side_wrap">
            <a class="side_btn" href="#">
                <svg class="plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 23"><defs></defs><polygon class="cls-1" points="23 11.03 11.97 11.03 11.97 0 11.03 0 11.03 11.03 0 11.03 0 11.97 11.03 11.97 11.03 23 11.97 23 11.97 11.97 23 11.97 23 11.03"/></svg>
                <svg class="plus arrow" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 22.53 11.97"></defs><polygon class="cls-1" points="0.71 11.97 11.26 1.41 21.82 11.97 22.53 11.26 11.97 0.71 11.26 0 0 11.26 0.71 11.97"/></svg>
            </a>
            <a class="side_btn move_bt" href="${contextPath}/questionsList.do">
                <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M19.619 21.671c-5.038 1.227-8.711-1.861-8.711-5.167 0-3.175 3.11-5.467 6.546-5.467 3.457 0 6.546 2.309 6.546 5.467 0 1.12-.403 2.22-1.117 3.073-.029 1 .558 2.435 1.088 3.479-1.419-.257-3.438-.824-4.352-1.385zm-10.711-5.167c0-4.117 3.834-7.467 8.546-7.467.886 0 1.74.119 2.544.338-.021-4.834-4.761-8.319-9.998-8.319-5.281 0-10 3.527-10 8.352 0 1.71.615 3.391 1.705 4.695.047 1.527-.851 3.718-1.661 5.313 2.168-.391 5.252-1.258 6.649-2.115.803.196 1.576.304 2.328.363-.067-.379-.113-.765-.113-1.16z"/></svg>
                <p>문의하기</p>
            </a>
            <a class="side_btn move_bt" href="javascript:fn_reservationForm('${isLogOn}','${contextPath}/reservationForm.do','${contextPath}/loginForm.do')">
                <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M20 22.621l-3.521-6.795c-.008.004-1.974.97-2.064 1.011-2.24 1.086-6.799-7.82-4.609-8.994l2.083-1.026-3.493-6.817-2.106 1.039c-7.202 3.755 4.233 25.982 11.6 22.615.121-.055 2.102-1.029 2.11-1.033z"/></svg>
                <p>호텔예약</p>
            </a>
            <a class="side_btn move_bt" href="${contextPath}/mypage/myPage.do">
                <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M20.822 18.096c-3.439-.794-6.64-1.49-5.09-4.418 4.72-8.912 1.251-13.678-3.732-13.678-5.082 0-8.464 4.949-3.732 13.678 1.597 2.945-1.725 3.641-5.09 4.418-3.073.71-3.188 2.236-3.178 4.904l.004 1h23.99l.004-.969c.012-2.688-.092-4.222-3.176-4.935z"/></svg>
                <p>마이페이지</p>
            </a>
        </div>
        <!-- side 버튼 끝 -->
    </body>
</html>