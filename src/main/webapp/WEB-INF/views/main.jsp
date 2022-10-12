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
    <link rel="shortcut icon" href="${contextPath}/resources/img/anitel.ico">
    <title>Anitel</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js'></script>
    <script src="${contextPath}/resources/js/script.js"> </script>
    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    <!-- <link rel="stylesheet" href="${contextPath}/resources/css/tiles.css"> -->
    <style>
        /* slider */
        .slider_wrap{
            width: auto; height: 100vh;
            background-color: azure;
            position: relative;
            margin-top: -200px;
        }
        .slider_wrap .first_slider{
            background-image: url(${contextPath}/resources/img/main_1.png);
            background-size: cover;
            width: 100%; height: 100%;
            display: block;
        }
        .txt_wrap{
            width: 1000px;
            height: 230px;
            position: absolute;
            margin-left: 50%; left: -500px;
            bottom: 100px;
        }
        .first_slider p:nth-child(1){
            font-size: 75px;
            font-weight: 800;
            text-align: right;
        }
        .first_slider p:nth-child(2){
            font-size: 45px;
            font-weight: 100;
            margin-top: -10px;
            text-align: right;
        }
        .slider_bt{
            width: 170px; height: 40px;
            border: 1px solid #030303;
            border-radius: 15px;
            font-size: 22px; line-height: 40px;
            text-align: center;
            margin-top: 40px;
            float: right;
            transition: all 0.3s;
            cursor: pointer;
        }
        .slider_bt:hover{
            background-color: rgba(255, 255, 255,0.5);
        }
        /* slider end */

        /* section */
        section{
            width: 1270px; height: 650px;
            margin: 250px auto;
            position: relative;
        }
        .bar{
            width: 160px; height: 10px;
            background-color: #e59f5a;
            border-radius: 30px;
        }
        .sec_title{
            font-size: 30px;   
            font-weight: 800;
            margin-top: 15px; 
        }
        .sec_p{
            font-size: 15px;   
            letter-spacing:-0.5px;
            color: #909090;
            margin-top: 20px; 
            line-height: 30px;
        }
        .more{
            font-size: 15px;
            letter-spacing:-0.5px;
            color: #909090;
            float: right;
        }
        .more:hover{
            color:#e59f5a;
            font-weight: 800;
        }


        /* introduce */
        .txt_introduce{
            width: 400px; height: 150px;
            background-color: #fff;
            position: relative;
            top: 130px; left: 200px;
        }
        .txt_introduce .sec_title{
            margin-left: 50px;
        }
        .txt_introduce .sec_p{
            margin-left: 80px;
        }

        .intro_con_wrap{
            position: relative;
            width: 500px; height: 200px;
            top: 180px; left: 200px;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }
        .con{
            width: 150px; height: 200px;
            background-image: url(${contextPath}/resources/img/con_1.png);
            transition: transform 0.3s;
            font-size: 15px; font-weight: 800;
            text-align: center;
        }
        .con span{
            display: inline-block;
            margin-top: 40px; margin-bottom: 5px;
            color: #fff;
        }
        .con p{
            font-size: 25px;
            margin-top: 50px;
            color:#e59f5a;
        }
        .con:last-child p{
            margin-top: 40px;
        }
        .con:hover{
            transform: scale(1.05);
        }
        .intro_img_wrap{
            width: 480px; height: 650px;
            display: block;
            position: relative;
            top: -350px; left: 700px;
        }
        /* introduce end */

        /* facilities */
        .fac_img_wrap{
            width: 650px; height: 465px;
            position: relative;
            left: 150px;
            overflow: hidden;
        }
        .fac_img_wrap img{
            transition: transform 0.3s;
        }
        .fac_img_wrap img:hover{
            transform: scale(1.05);
        }
        .txt_facilities{
            width: 280px; height: 225px;
            position: relative;
            float: right;
            top: -230px; right: 120px;
        }
        .txt_facilities .bar{
            margin-left: 50px;
        }
        .txt_facilities .sec_p{
            margin-left: 40px;
        }
        .txt_facilities .more{
            margin-top: 70px;
        }
        /* facilities end */

        /* experience */
        .experience{
            margin-bottom: 150px;
        }
        .scroll_bar{
            width: 320px; height: 10px;
            background-color: #ddd;
            border-radius: 30px;
            margin: 0 auto; margin-bottom: 50px;
        }
        .scroll_bar_in{
            width: 160px; height: 10px;
            background-color: #e59f5a;
            border-radius: 30px;
            position: relative;
        }
        .roll_banner{
            width: 1000px; height: 280px;
            margin: 0 auto;
            overflow-y: hidden;
            overflow-x: scroll;
            -ms-overflow-style: none;
        }
        .roll_banner::-webkit-scrollbar{
            display:none;
        }
        .roll_banner_in {
            width: 1510px; height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            position: relative;
            /* left: -510px; */
        }
        .roll_banner_in img{
            height: 280px;
        }
        .txt_experience{
            width: 240px; height: 150px;
            text-align: center;
            margin: 0 auto;
            margin-top: 70px;
        }
        /* experience end */
        /* section end */

    </style>
</head>
<body>

  <div class="slider_wrap">
    <div class="first_slider">
        <div class="txt_wrap">
            <p>Anitel</p>
            <p>펫 호텔 서비스</p>
            <a class="slider_bt" href="${contextPath}/reservation.do" >예약하기 ></a>
        </div>
    </div>
  </div>

  <section class="introduce">
    <div class="txt_introduce">
        <div class="bar"></div>
        <p class="sec_title">Introduce</p>
        <p class="sec_p">반려동물의 행복을 최우선으로 생각하는<br>저희 호텔을 소개드립니다.</p>
        <a class="more" href="#">더보기 +</a>
    </div>
    <div class="intro_con_wrap">
        <div class="con">
            <span>Room</span><br>
            <svg xmlns="http://www.w3.org/2000/svg" width="41.051" height="23.946" viewBox="0 0 41.051 23.946">
                <path id="패스_4" data-name="패스 4" d="M41.051,28.946V16.973a1.711,1.711,0,0,0-1.71-1.71H1.71A1.711,1.711,0,0,0,0,16.973V28.946H1.71V25.525H39.34v3.421ZM8.552,13.552v-1.71a1.711,1.711,0,0,1,1.71-1.71H17.1a1.711,1.711,0,0,1,1.71,1.71v1.71h3.421v-1.71a1.711,1.711,0,0,1,1.71-1.71h6.842a1.711,1.711,0,0,1,1.71,1.71v1.71H37.63V6.71A1.711,1.711,0,0,0,35.92,5H5.131a1.711,1.711,0,0,0-1.71,1.71v6.842Z" transform="translate(0 -5)" fill="#fff" fill-rule="evenodd"/>
            </svg>
            <p>23</p>
        </div>
        <div class="con">
            <span>Petsitter</span><br>
            <svg xmlns="http://www.w3.org/2000/svg" width="36.822" height="26.301" viewBox="0 0 36.822 26.301">
                <path id="패스_5" data-name="패스 5" d="M14.628,21.831C18.4,20.961,20.6,20.2,18.9,16.989,13.726,7.222,17.526,2,22.988,2c5.569,0,9.276,5.423,4.09,14.989-1.752,3.228.575,3.99,4.263,4.842,3.265.755,3.481,2.35,3.481,5.114V28.3H11.151C11.151,24.691,10.861,22.7,14.628,21.831ZM-2,28.3H8.269c-.046-10.753,4.519-6.987,4.519-14.633A4.7,4.7,0,0,0,7.859,8.575c-4.1,0-6.946,3.918-3.068,11.242C6.065,22.224,3.435,22.8.608,23.449-1.841,24.014-2,25.211-2,27.285V28.3Z" transform="translate(2 -2)" fill="#fff"/>
            </svg>
            <p>15</p>
        </div>
        <div class="con">
            <span>Services</span><br>
            <svg xmlns="http://www.w3.org/2000/svg" width="28.908" height="28.908" viewBox="0 0 28.908 28.908">
                <path id="패스_7" data-name="패스 7" d="M14.4,13.25c4.011,0,8.5,7.375,9.193,10.5s-1.2,5.7-4.2,4.953c-1.315-.326-3.917-1.574-4.941-1.555-1.114.019-2.865,1.007-4.321,1.508-3.2,1.1-5.682-1.545-4.83-4.906C6.236,20.073,10.7,13.25,14.4,13.25Zm13-5.288c1.431.649,1.962,3.4,1.077,6.348-.848,2.82-2.806,4.584-5.488,3.368-2.326-1.056-2.6-3.828-1.077-6.348C23.446,8.792,25.967,7.311,27.4,7.962Zm-26.46.85c-1.257.878-1.277,3.609.1,6.281,1.315,2.554,3.509,3.9,5.863,2.252,2.043-1.427,1.812-4.135-.1-6.281S2.2,7.934.938,8.812ZM19.78.029c1.594.3,2.8,2.925,2.628,6.1-.161,3.032-1.692,5.278-4.676,4.712-2.588-.49-3.539-3.2-2.627-6.1C16.022,1.826,18.188-.273,19.78.029ZM7.38.1C5.853.642,5.067,3.418,5.721,6.527c.625,2.971,2.484,4.955,5.344,3.938,2.481-.882,3-3.706,1.659-6.427C11.369,1.3,8.907-.444,7.38.1Z" transform="translate(0 0)" fill="#fff" fill-rule="evenodd"/>
            </svg>
            <p>various</p>
        </div>
    </div>
    <div class="intro_img_wrap">
        <img src="${contextPath}/resources/img/main_2.png" alt="dog" height="650">
    </div>
</section>

<section class="facilities">
    <div class="fac_img_wrap">
        <img src="${contextPath}/resources/img/main_3.png" alt="fac" width="650">
    </div>
    <div class="txt_facilities">
        <div class="bar"></div>
        <p class="sec_title">Facilities</p>
        <p class="sec_p">반려동물을 위한 특별하고 깔끔한 룸,<br>주요 시설들을 소개드립니다.</p>
        <a class="more" href="#">더보기 +</a>
    </div>
</section>

<section class="experience">
    <div class="scroll_bar">
        <div class="scroll_bar_in"></div>
    </div>
    <div class="roll_banner">
        <div class="roll_banner_in">
            <img src="${contextPath}/resources/img/roll_1.png" alt="roll1">
            <img src="${contextPath}/resources/img/roll_2.png" alt="roll2">
            <img src="${contextPath}/resources/img/roll_3.png" alt="roll3">
            <img src="${contextPath}/resources/img/roll_4.png" alt="roll4">
        </div>
    </div>
    <div class="txt_experience">
        <p class="sec_title">Experience</p>
        <p class="sec_p">많은 경험을 토대로<br>여러분의 반려동물을 안전하고 자유롭게<br>행복한 하루를 만들어 드리겠습니다.</p>
    </div>

  </section>
</body>
</html>
