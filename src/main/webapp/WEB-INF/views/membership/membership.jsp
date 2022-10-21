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
            </div>
            <div class="count">
            <c:choose>
        		<c:when test="${isLogOn == true  && user!= null}">
					<p>안녕하세요 ${user.name}님!</p>
                	<p>${user.name}님은 현재 ${user.grade}등급입니다.</p>
				</c:when>
				<c:otherwise>
						<p>로그인을 하시면 회원님의 등급을 안내해드립니다.</p>
        		</c:otherwise>
        	</c:choose>
        	</div>
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
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/membership.css">
<script src="${contextPath}/resources/js/membership.js"></script>
</html>