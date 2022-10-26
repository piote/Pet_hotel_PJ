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
    
		#counter {
            position: relative;
        }
        
        #counterNormal {
            margin: 0 auto;
            width: 1000px;
            height: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
        }

        #counterBronze {
            margin: 0 auto;
            width: 1000px;
            height: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: absolute;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
        }

        #counterSilver {
            margin: 0 auto;
            width: 1000px;
            height: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: absolute;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
        }
        
        .centerBar {
            position: absolute;
            width: 100%;
            height: 15px;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            border: 1px solid lightgray;
            background-color: lightgray;
            border-radius: 5px;
        }

        .countDot {
            position: relative;
            background-color: gray;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            border: 1px solid gray;
            opacity: 1;
            z-index: 100;
        }

        .countOnOff {
            position: absolute;
            border-radius: 50%;
            border: 2px solid white;
            width: 400%;
            height: 400%;
            margin: auto;
            box-shadow: 0px 0px 6px 1px gray;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            visibility: hidden;
            z-index: 1000;
        }
        #useTxt {
            margin: 3% auto;
            width: 1000px;
			text-align: right;
			font-size: 15px;      
        }
        
        .scaling{
			-webkit-animation:scale 2s ease-in-out infinite alternate;
			-moz-animation:scale 2s ease-in-out infinite alternate;
			animation:scale 2s ease-in-out infinite alternate;
		}
		
		@-webkit-keyframes scale{
			0% {transform: scale(1, 1) translate(-50%, -50%);}
			100% {transform: scale(1.1, 1.1) translate(-50%, -50%);}
		}

		@-moz-keyframes scale{
			0% {transform: scale(1, 1) translate(-50%, -50%);}
			100% {transform: scale(1.1, 1.1) translate(-50%, -50%);}
		}

		@keyframes scale{
			0% {transform: scale(1, 1) translate(-50%, -50%);}
			100% {transform: scale(1.1, 1.1) translate(-50%, -50%);}
		}
    </style>
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
            <div class="main_title">
                <img src="${contextPath}/resources/img/bonus_icon.png">
                <h2>멤버쉽 할인</h2>
                <p>연간 이용횟수에 따라 할인 프로그램을 제공해드립니다.</p>
                <input id=grade type="hidden" value="${user.grade}">
                <input id=use type="hidden" value="7">
	            <c:choose>
	        		<c:when test="${isLogOn == true  && user!= null}">
						<p>${user.name}의 등급은 현재 ${user.grade}입니다.</p>
					</c:when>
					<c:otherwise>
							<p>로그인을 하시면 회원님의 등급을 안내해드립니다.</p>
	        		</c:otherwise>
	        	</c:choose>
            </div>
            <c:choose>
	        <c:when test="${isLogOn == true  && user!= null}">
            <div id="counter">
		        <div id="counterNormal">
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="centerBar"> </div>
		        </div>
		        <div id=counterBronze>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="centerBar"> </div>
		        </div>
		        <div id=counterSilver>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="countDot"><div class="countOnOff scaling"></div></div>
		            <div class="centerBar"> </div>
		        </div>
		        <p id=useTxt></p>
    		</div>
    		
    		</c:when>
			<c:otherwise>
			</c:otherwise>
	        </c:choose>
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
                        <p>미용서비스 1회 제공</p>
                    </div>
                </li>
                <li class="m_gold">
                    <img class="m_icon" src="${contextPath}/resources/img/gold_medal.png">
                    <h3>골드</h3>
                    <div class="box">
                        <p>연간 이용횟수 20회 이상</p>
                        <p>1회 이용금액의 10% 할인</p>
                        <p>미용 및 목욕서비스 1회 제공</p>
                    </div>
                </li>
            </ul>
        </div>
        <div class="m_qna">
            <h2>Anitel 멤버쉽 QnA</h2>
            <div class="qna">
                <button class="q_btn" data-num="0">Q1 질문1입니다.</button>
                <div class="answer">답변 1입니다.</div>
            </div>
            <div class="qna">
                <button class="q_btn" data-num="1">Q2 질문2입니다.</button>
                <div class="answer">답변 2입니다.</div>
            </div>
            <div class="qna">
                <button class="q_btn" data-num="2">Q3 질문3입니다.</button>
                <div class="answer">답변 3입니다.</div>
            </div>
            <div class="qna">
                <button class="q_btn" data-num="3">Q4 질문4입니다.</button>
                <div class="answer">답변 4입니다.</div>
            </div>
            <div class="qna">
                <button class="q_btn" data-num="4">Q5 질문5입니다.</button>
                <div class="answer">답변 5입니다.</div>
            </div>
            <div class="qna">
                <button class="q_btn" data-num="5">Q6 질문6입니다.</button>
                <div class="answer">답변 6입니다.</div>
            </div>
            <div class="qna">
                <button class="q_btn" data-num="6">Q7 질문7입니다.</button>
                <div class="answer">답변 7입니다.</div>
            </div>
        </div>
    </section>
</body>
<script src="${contextPath}/resources/js/membership.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/membership.css">
</html>
