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
</head>
<body>
  <header>
    <div class="header_box">
        <a class="logo" href="${contextPath}/main.do">Anitel</a>
        <div class="log_wrap">
            <a id="login" href="#">로그인</a>
            <a id="signup" href="#">회원가입</a>
            <a id="mypage" href="${contextPath}/mypage/myPage.do" hidden>마이페이지</a>
            <a id="logout" href="#" hidden>로그아웃</a>
        </div>
        <div class="hr"></div>
        <nav>
            <div class="r_menu menu_wrap">
                <a href="${contextPath}/reservation.do" class="menu">호텔예약</a>
                <a href="#" class="menu">호텔소개</a>
                <a href="${contextPath}/reviewboard.do" class="menu">리뷰게시판</a>
            </div>
            <div class="l_menu menu_wrap">
                <a href="#" class="menu">멤버쉽</a>
                <a href="#" class="menu">고객센터</a>
            </div>
        </nav>
    </div>
</header>

</body>
</html>
