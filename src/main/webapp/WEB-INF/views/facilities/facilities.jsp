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
        <title>Facilities</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js'></script>
        <script src="../../../resources/js/script.js"> </script>
        <!-- 초기화 코드 -->
        <link rel="stylesheet" href="../../../resources/css/reset.css">
        <link rel="stylesheet" href="../../../resources/css/tiles.css">
        <style>
            /* common 공통 시작 */
            /* 공통 섹션 */
            section {
                width: 1270px; 
                height: 650px;
                margin: 200px auto;
                position: relative;
                /* border: 1px solid red; */
            }
            html {
                scroll-behavior: smooth;
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
            /* header_box_back 시작 */
            .header_box_back {
	   bottom: 200px; 
                margin: 0;
                position: relative;
                width: 100%;
                /* right: -324px; */
                height: 160px;
                background-color: rgb(231, 226, 219);
            }
            /* header_box_back 시작 */
            /* index 시작 */
            .index {
                margin: 0;
                height: 210px;
                width: 180px;
                position: fixed;
                left: 60px;
                bottom: 300px;
                background-color: rgb(231, 226, 219);
                /* border: 1px double #e59f5a; */
                border-radius: 20px;
            }
            .index .txt_index {
                text-align: center;
            }
            .index .bar {
                position: relative;
                left: 10px;
            }
            .index .txt_index .sec_title {
                position: relative;
                top: -8px;
            }
            /* index 끝 */
            /* facilites_inside 시작 */
            .facilites_inside{
                margin-bottom: 150px;
                position: relative;
                top: -300px;
            }
            .scroll_bar{
                width: 320px; 
                height: 10px;
                background-color: #ddd;
                border-radius: 30px;
                margin: 0 auto; 
                margin-bottom: 50px;
            }
            .scroll_bar_in{
                width: 160px; 
                height: 10px;
                background-color: #e59f5a;
                border-radius: 30px;
                position: relative;
            }
            .roll_banner{ 
                width: 1200px; 
                height: 500px;
                margin: 0 auto;
                overflow-y: hidden;
                overflow-x: scroll;
                -ms-overflow-style: none;
                /* border: 1px solid blue; */
            }
            .roll_banner::-webkit-scrollbar{
                display:none;
            }
            .roll_banner_in {
                width: 1510px; 
                height: 100%;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                position: relative;
                /* border: 1px solid green; */
                /* left: -510px; */
            }
            .roll_banner_in img{
                height: 500px;
            }
            .txt_facilites_inside{
                width: 500px; 
                height: 150px;
                text-align: center;
                margin: 0 auto;
                margin-top: 40px;
            }
            /* facilites_inside 끝 */
            /* facilites_outside 시작 */
            .facilites_outside{
                margin-bottom: 150px;
                position: relative;
                top: -200px;
            }
            .scroll_bar{
                width: 320px; 
                height: 10px;
                background-color: #ddd;
                border-radius: 30px;
                margin: 0 auto; 
                margin-bottom: 50px;
            }
            .scroll_bar_in{
                width: 160px; 
                height: 10px;
                background-color: #e59f5a;
                border-radius: 30px;
                position: relative;
            }
            .roll_banner{ 
                width: 1200px; 
                height: 500px;
                margin: 0 auto;
                overflow-y: hidden;
                overflow-x: scroll;
                -ms-overflow-style: none;
                /* border: 1px solid blue; */
            }
            .roll_banner::-webkit-scrollbar{
                display:none;
            }
            .roll_banner_in {
                width: 1510px; 
                height: 100%;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                position: relative;
                /* border: 1px solid green; */
                /* left: -510px; */
            }
            .roll_banner_in img{
                height: 500px;
                border: 5px solid white;
            }
            .txt_facilites_outside{
                width: 500px; 
                height: 150px;
                text-align: center;
                margin: 0 auto;
                margin-top: 40px;
            }
            /* facilites_outside 끝 */   
            /* caution 주의 문구 시작 */
            .caution {
                color: crimson;
                font-size: 13px;
                font-weight: 700;
                line-height: 30px;
                position: relative;
                right: -40px;
                bottom: -5px;
            }
            /* caution 주의 문구 끝 */
            /* room 시작 */
            .room{
                margin-bottom: 150px;
                position: relative;
                top: -250px;
                /* border: 1px solid red; */
            }
            .scroll_bar_no{
                width: 320px; 
                height: 10px;
                background-color: #ddd;
                border-radius: 30px;
                margin: 0 auto; 
                margin-bottom: 50px;
                right: -35px;
                /* border: 1px green solid; */
            }
            .scroll_bar_in_no{
                width: 320px; 
                height: 10px;
                background-color: #e59f5a;
                border-radius: 30px;
                position: relative;
            }
            /* .roll_banner_no{ 
                width: 1200px; 
                height: 500px;
                margin: 0 auto;
                overflow-y: hidden;
                overflow-x: scroll;
                -ms-overflow-style: none;
                
            } */
            .roll_banner_no::-webkit-scrollbar{
                display:none;
            }
            .roll_banner_in_no {
                width: 1200px; 
                height: 100%;
                display: flex;
                right: -35px;
                flex-direction: row;
                justify-content: space-between;
                position: relative;
                /* border: 1px solid green; */
                /* left: -510px; */
            }
            .roll_banner_in_no img{
                position: relative;
                height: 500px;
                border: 5px solid white;
            }
            .txt_deluxe {
                width: 300px; 
                height: 150px;
                text-align: center;
                margin: 0 auto;
                margin-top: 40px;
                /* border: 1px solid red; */
                top: -20px;
                position: relative;
                right: 390px
            }
            .txt_deluxe .sec_p {
                position: relative;
                top: -15px; 
            }
            .txt_suite {
                width: 300px; 
                height: 150px;
                text-align: center;
                margin: 0 auto;
                margin-top: 40px;
                /* border: 1px solid red; */
                top: -205px;
                position: relative;
            }
            .txt_suite .sec_p {
                position: relative;
                top: -15px;
            }
            .txt_superior {
                width: 300px; 
                height: 150px;
                text-align: center;
                margin: 0 auto;
                margin-top: 40px;
                /* border: 1px solid red; */
                top: -395px;
                position: relative;
                left: 410px;
            }
            .txt_superior .sec_p {
                position: relative;
                top: -15px;
            }
            /* room 끝 */
            /* cut 시작 */
            .cut{
                margin-bottom: 150px;
                position: relative;
                top: -250px;
                /* border: 1px solid red; */
            }
            .scroll_bar_cut{
                width: 320px; 
                height: 10px;
                background-color: #ddd;
                border-radius: 30px;
                margin: 0 auto; 
                margin-bottom: 50px;
                right: -35px;
                /* border: 1px green solid; */
            }
            .scroll_bar_in_cut{
                width: 320px; 
                height: 10px;
                background-color: #e59f5a;
                border-radius: 30px;
                position: relative;
            }
            /* .roll_banner_no{ 
                width: 1200px; 
                height: 500px;
                margin: 0 auto;
                overflow-y: hidden;
                overflow-x: scroll;
                -ms-overflow-style: none;
                
            } */
            .roll_banner_cut::-webkit-scrollbar{
                display:none;
            }
            .roll_banner_in_cut {
                width: 1200px; 
                height: 100%;
                display: flex;
                right: -35px;
                flex-direction: row;
                justify-content: space-between;
                position: relative;
                top: 30px;
                /* border: 1px solid green; */
                /* left: -510px; */
            } 
            .roll_banner_in_cut img{
                position: relative;
                height: 500px;
                /* border: 1px solid red; */
                left: 50px;
            }
            .cut_price {
                /* border: 1px solid red; */
                position: relative;
                width: 650px;
                right: -550px;
                top: -480px;
            }

            .txt_cut {
                width: 300px; 
                height: 150px;
                text-align: left;
                margin: 0 auto;
                margin-top: 40px;
                /* border: 1px solid red; */
                top: -520px;
                position: relative;
                right: -80px
            }
            .txt_cut .sec_p {
                position: relative;
                top: -15px; 
            }
            /* cut 끝 */
            /* spa 시작 */
            .spa{
                margin-bottom: 150px;
                position: relative;
                top: -350px;
                /* border: 1px solid red; */
            }
            .scroll_bar_spa{
                width: 320px; 
                height: 10px;
                background-color: #ddd;
                border-radius: 30px;
                margin: 0 auto; 
                margin-bottom: 50px;
                right: -35px;
                /* border: 1px green solid; */
            }
            .scroll_bar_in_spa{
                width: 320px; 
                height: 10px;
                background-color: #e59f5a;
                border-radius: 30px;
                position: relative;
            }
            /* .roll_banner_no{ 
                width: 1200px; 
                height: 500px;
                margin: 0 auto;
                overflow-y: hidden;
                overflow-x: scroll;
                -ms-overflow-style: none;
                
            } */
            .roll_banner_spa::-webkit-scrollbar{
                display:none;
            }
            .roll_banner_in_spa {
                width: 1200px; 
                height: 100%;
                display: flex;
                right: -35px;
                flex-direction: row;
                justify-content: space-between;
                position: relative;
                top: 30px;
                /* border: 1px solid green; */
                /* left: -510px; */
            } 
            .roll_banner_in_spa img{
                position: relative;
                /* height: 500px; */
                /* border: 1px solid red; */
                left: 50px;
            }
            .spa_price {
                /* border: 1px solid red; */
                position: relative;
                width: 650px;
                right: -550px;
                top: -140px;
            }
            .txt_spa {
                width: 300px; 
                height: 150px;
                text-align: right;
                margin: 0 auto;
                margin-top: 40px;
                /* border: 1px solid red; */
                top: -580px;
                position: relative;
                left: -310px
            }
            .txt_spa .sec_p {
                position: relative;
                top: -15px; 
            }
            .spa_move {
                position: relative;
                left: 100px;
            }
            /* spa 끝 */         
            .caution2 {
                color: crimson;
                font-weight: 700;
                font-size: 13px;
                line-height: 30px;
                position: relative;
                right: -660px;
                bottom: 330px;
            }   
        </style>
    </head>
    <body>
        <!-- header_box_back 시작 -->
        <section class="header_box_back">
        </section>
        <!-- header_box_back 끝 -->
        <!-- index 시작 -->
        <section class="index">
            <div class="txt_index">
                <div class="bar"></div>
                <a href="#"><p class="sec_title">목차</p></a>
                <ul class="gnb">
                    <li><a href="#facilitesindex">시설 소개</a></li>
                    <br>
                    <li><a href="#roomindex">객실 안내</a></li>
                    <br>
                    <li><a href="#cutindex">커트</a></li>
                    <br>
                    <li><a href="#spaindex">스파</a></li>
                </ul>
            </div>
        </section>
        <!-- index 끝 -->
        <!-- facilites_inside 시작 -->
        <section class="facilites_inside" id="facilitesindex">
            <div class="scroll_bar">
                <div class="scroll_bar_in"></div>
            </div>
            <div class="roll_banner">
                <div class="roll_banner_in">
                    <img src="../../../resources/img/inside1.PNG" alt="inside1" width="525">
                    <img src="../../../resources/img/inside2.PNG" alt="inside2" width="525">
                    <img src="../../../resources/img/inside3.PNG" alt="inside3" width="500">
                    <img src="../../../resources/img/inside4.PNG" alt="inside4" width="500">
                </div>
            </div>
            <div class="txt_facilites_inside">
                <p class="sec_title">내부 시설 소개</p>
                <p class="sec_p">실ㆍ내외 200평의 넓은 시설을 가지고 있으며 <br>
                                 미끄럼 방지 매트가 깔려 있어 <br>
                                 반려견의 슬개골을 보호할 수 있습니다. <br>
                                 또한 반려견 이탈을 방지할 수 있는 <br>
                                 이중 안전 문이 설치되어 있습니다. <br>
                                 그리고 보호자님께서 쉬어가실 수 있는 휴식 공간도 준비되어 있습니다.
                </p>
            </div>
        </section>
        <!-- facilites_inside 끝 -->
        <!-- facilites_outside 시작 -->
        <section class="facilites_outside">
            <div class="scroll_bar">
                <div class="scroll_bar_in"></div>
            </div>
            <div class="roll_banner">
                <div class="roll_banner_in">
                    <img src="../../../resources/img/outside1.jpg" alt="outside1" width="600">
                    <img src="../../../resources/img/outside2.jpg" alt="outside2" width="600">
                    <img src="../../../resources/img/outside3.jpg" alt="outside3" width="600">
                </div>
            </div>
            <div class="txt_facilites_outside">
                <p class="sec_title">외부 시설 소개</p>
                <p class="sec_p">야외에는 인조잔디가 설치되어 있어서 <br>
                                 아이들이 다치지 않고 마음껏 뛰어놀 수 있습니다.                                 
                </p>
            </div>
        </section>
        <!-- facilites_outside 끝 -->
        <!-- room 시작 -->
        <section class="room" id="roomindex">
            <div class="scroll_bar_no">
                <div class="scroll_bar_in_no"></div>
            </div>
            <p class="caution"><b>* 1박 24시간 기준 가격이며 이후 추가시간당 요금이 발생합니다.</b></p>
            <div class="roll_banner_no">
                <div class="roll_banner_in_no">
                    <img src="../../../resources/img/deluxe.jpg" alt="deluxe" width="400">
                    <img src="../../../resources/img/suite.jpg" alt="suite" width="400">
                    <img src="../../../resources/img/superior.PNG" alt="superior" width="400">
                </div>
            </div>
            <div class="txt_deluxe">
                <p class="sec_title">Deluxe</p>
                <p class="sec_p">7kg 이하의 <b>소형견</b>이 <br>
                                 이용하는 방입니다.<br> 
                                 35,000\                            
                </p>
            </div>
            <div class="txt_suite">
                <p class="sec_title">Suite</p>
                <p class="sec_p">7kg 초과 ~ 15kg 이하의 <b>중형견</b>이 <br>
                                 이용하는 방입니다. <br>
                                 45,000\                                 
                </p>
            </div>
            <div class="txt_superior">
                <p class="sec_title">Superior</p>
                <p class="sec_p">15kg 초과하는 <b>대형견</b>이 <br>
                                 이용하는 방입니다. <br>
                                 55,000\                                 
                </p>
            </div>
        </section>
        <!-- room 끝 -->        
        <!-- cut 시작 -->
        <section class="cut" id="cutindex">
            <div class="scroll_bar_cut">
                <div class="scroll_bar_in_cut"></div>
            </div>
            <div class="roll_banner_cut">
                <div class="roll_banner_in_cut">
                    <img src="../../../resources/img/cut1.jpg" alt="cut1" width="400">
                </div>
            </div>
            <div class="cut_price">
                <img src="../../../resources/img/cut2.PNG" alt="" width="650">
            </div>
            <div class="txt_cut">
                <p class="sec_title">Clipping & Scissoring</p>
                <p class="sec_p">미용 후에 무료 리터치 서비스 가능합니다. <br>
                                 또한 귀 청소, 발톱 정리도 같이 해드립니다. <br>
                                 어떤 스타일을 원하시는지 말씀하시면 <br>
                                 최대한 의견을 반영해 드리겠습니다.                           
                </p>
            </div>
        </section>
        <!-- cut 끝 -->            
        <!-- spa 시작 -->
        <section class="spa" id="spaindex">
            <div class="scroll_bar_spa">
                <div class="scroll_bar_in_spa"></div>
            </div>
            <div class="spa_move">
                <div class="roll_banner_spa">
                    <div class="roll_banner_in_spa">
                        <img src="../../../resources/img/spa2.PNG" alt="spa1" width="400">
                    </div>     
                </div>
            
                <div class="spa_price">
                    <img src="../../../resources/img/spa1.jpg" alt="" width="400">
                </div>
                <div class="txt_spa">
                    <p class="sec_title">Spa</p>
                    <p class="sec_p"><b>스파</b>는 문제성 피부와 피부염 등의 <br>
                                    질병에 개선 효과가 있습니다. <br>
                                    피부 보습, 모발 윤기, 각질 제거 <br>
                                    냄새 제거까지 도움을 줍니다. <br>
                                    소요시간은 약 2시간 정도 소요가 됩니다.                
                    </p>
                </div>
            </div>
            <p class="caution2">* 숙박 시설을 이용하지 않고 커트와 스파를 따로 이용하실 수는 없습니다. </p>
        </section>
        <!-- spa 끝 -->            
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
            <a class="side_btn move_bt" href="${contextPath}/reservation.do">
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