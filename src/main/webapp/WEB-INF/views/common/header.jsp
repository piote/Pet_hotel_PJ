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
        
        <div id ="head_link">
        	<ul>
        	<c:choose>
        		<c:when test="${isLogOn==true and not empty userInfo}">
        			<li><a href="${contextPath}/user/logout.do">로그아웃</a><li>
        			<li><a href="${contextPath}/user/logout.do">마이페이지</a><li>
        		</c:when>
           <c:otherwise>
           		<li><a href="${contextPath}/user/loginForm.do">로그인</a><li>
        		<li><a href="${contextPath}/user/userForm.do">회원가입</a><li>
        	</c:otherwise>
        	</c:choose>
        	<li><a href="#">고객센터</a><li>
        	</ul>

        </div>
        <div class="hr"></div>
        <nav>
            <div class="r_menu menu_wrap">
                <a href="${contextPath}/reservation.do" class="menu">호텔예약</a>
                <a href="#" class="menu">호텔소개</a>
                <a href="${contextPath}/reviewBoard.do" class="menu">리뷰게시판</a>
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
