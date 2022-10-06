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
    <title>pethotel</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js'></script>
    <script src="${contextPath}/resources/js/script.js"> </script>
    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/tiles.css">

</head>
<body>
  <header>
    <div class="header_box">
        <a class="logo" href="#">Anitel</a>
        <div class="log_wrap">
            <a id="login" href="#">로그인</a>
            <a id="logout" href="#">로그아웃</a>
            <a id="mypage" href="#" hidden>마이페이지</a>
        </div>
        <div class="hr"></div>
        <nav>
            <div class="r_menu menu_wrap">
                <a href="#" class="menu">호텔예약</a>
                <a href="#" class="menu">호텔소개</a>
                <a href="#" class="menu">리뷰게시판</a>
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
