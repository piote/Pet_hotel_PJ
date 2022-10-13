<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<% request.setCharacterEncoding("UTF-8"); %>   
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>멤버쉽 안내</title>
    <style>
        @import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');

        * {
            margin: 0;
            padding: 0;
            font-family: 'nanumsquare';
        }
        /* 멤버쉽 타이틀 화면 시작 */
        .m_section {
            position: relative;
            width: auto; height: 100vh;
            background-image: url(${contextPath}/resources/img/mem_main.jpg);
            background-size: cover;
            display: block;
            margin-top: -200px;
        }

        .m_title {
            position: absolute;
            margin-left: 69vw;
            margin-top: 55vh;
            font-size: 30px;   
            font-weight: 800;
        }

        .m_title p:nth-child(1){
            font-size: 75px;
            font-weight: 800;
            text-align: right;
        }

        .m_title p:nth-child(2){
            font-size: 45px;
            font-weight: 100;
            margin-top: -10px;
            text-align: right;
        }
        /* 멤버쉽 타이틀 화면 끝 */

        /* 멤버쉽 상세 안내 시작 */
        .m_main {
            width: auto; height: 100%;
            display: block;
            position: relative;
        }
        
        .m_list {
            margin: 0 10vw;
            padding-top: 3%;
            text-align: center;
        }
        .m_list>div {
            margin-left: auto;
            margin-right: auto;
            width: 55vw;
            text-align: center;
        }
        
        .m_list>div>img {
            float: left;
            width: 90px; height: 90px;
        }

        .m_list>div>h2 {
            font-size: 45px;
            color: #030303;
            text-align: left;
        }
        
        .m_list>div>p {
            margin-top: 5px;
            font-size: 30px;
            text-align: left;
        }
        
        #m_menu {
            display: inline-block;
            list-style: none;
            margin: 3% 5% 0 5%;

        }

        #m_menu>li {
            margin: 2% 10px 0 10px;
            width: 320px;
            float: left;
            text-align: center;
            display: flex;
        }

        .m_icon {
            width: 60px; height: 60px;
            float: left;
            text-align: center;
        }

        h3 {
            font-size: 30px;
            text-align: left;
            margin-right: 10px;
        }
        .box {
            margin: 0 auto;
        }
        /* 멤버쉽 상세 안내 끝 */
        .m_qna {
            margin-left: 10vw;
            margin-right: 10vw;
            padding-top: 3%;
            text-align: center;
        }

        .m_qna>h2 {
            margin: 0 5%;
            font-size: 45px;
            color: #030303;
            text-align: left;
        }
        
        .qna {
            margin: 0 5%;
            border-bottom: 1px solid #e0e0e0;
        }

        .qna>button {
            font-size: 19px;
            padding: 20px 0;
            cursor: pointer;
            border: none;
            outline: none;
            background: none;
            width: 100%;
            text-align: left;
        }

        .qna>button:hover {
            color: #2962ff;
        }
        .qna>div {
            text-align: left;
            display: none;
            padding-bottom: 20px;
        }
        .qna>div.active {
            margin: 0 5%;
            display: block;
            padding-bottom: 20px;
        }
    </style>
    <script>
        window.onload = function() {
            var q_btnAll = document.querySelectorAll('.q_btn');
            var answerAll = document.querySelectorAll('.answer');
            console.log(q_btnAll);
            console.log(answerAll);
            
            for(var i=0; i<q_btnAll.length; i++){
                q_btnAll[i].addEventListener('click',function() {
                    var q_btnNum = this.getAttribute('data-num');
                    showHideToggle(q_btnNum);
                    console.log(q_btnNum);
                }); 
            };

            function showHideToggle(index) {
                answerAll[index].classList.toggle('active');
            };
        }
    </script>
</head>
<body>
    <section class="m_section">
        <div class="m_title">
            <p>Anitel</p>
            <p>멤버쉽 안내</p>
        </div>
    </section>
    <section class="m_main">
        <div class="m_list">
            <div>
                <img src="${contextPath}/resources/img/bonus_icon.png">
                <h2>멤버쉽 할인</h2>
                <p>연간 이용횟수에 따라 할인 프로그램을 제공해드립니다.</p>
            </div>
            <ul id="m_menu">
                <li class="m_bronze">
                    <img class="m_icon" src="${contextPath}/resources/img/bronze_medal.png">
                    <h3>브론즈</h3>
                    <div class="box">
                        <p>연간 이용횟수 5회 이상</p>
                        <p>1회 이용금액의 2% 할인</p>
                    </div>
                </li>
                <li class="m_silver">
                    <img class="m_icon" src="${contextPath}/resources/img/silver_medal.png">
                    <h3>실버</h3>
                    <div class="box">
                        <p>연간 이용횟수 10회 이상</p>
                        <p>1회 이용금액의 5% 할인</p>
                        <p>체크아웃 연장 1시간 무료</p>
                    </div>
                </li>
                <li class="m_gold">
                    <img class="m_icon" src="${contextPath}/resources/img/gold_medal.png">
                    <h3>골드</h3>
                    <div class="box">
                        <p>연간 이용횟수 20회 이상</p>
                        <p>1회 이용금액의 10% 할인</p>
                        <p>목욕서비스 1회 제공</p>
                        <p>체크아웃 연장 2시간 무료</p>
                    </div>
                </li>
            </ul>
        </div>
        <div class="m_qna">
            <h2>Anitel 멤버쉽 QnA</h2>
            <div class="qna">
                <button class="q_btn" data-num="0">Q1 첫번째 질문입니다.</button>
                <div class="answer">답변 1입니다.</div>
            </div>
            <div class="qna">
                <button class="q_btn" data-num="1">Q2 두번째 질문입니다.</button>
                <div class="answer">답변 2입니다.</div>
            </div>
            <div class="qna">
                <button class="q_btn" data-num="2">Q3 세번째 질문입니다.</button>
                <div class="answer">답변 3입니다.</div>
            </div>
            <div class="qna">
                <button class="q_btn" data-num="3">Q4 네번째 질문입니다.</button>
                <div class="answer">답변 4입니다.</div>
            </div>
            <div class="qna">
                <button class="q_btn" data-num="4">Q5 다섯번째 질문입니다.</button>
                <div class="answer">답변 5입니다.</div>
            </div>
            <div class="qna">
                <button class="q_btn" data-num="5">Q6 여섯번째 질문입니다.</button>
                <div class="answer">답변 6입니다.</div>
            </div>
        </div>
    </section>
</body>
</html>