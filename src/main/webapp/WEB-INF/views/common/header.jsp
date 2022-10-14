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
        
        <div class="log_wrap" id ="head_link">
        <c:choose>
        		<c:when test="${isLogOn==true and not empty userInfo}">
                    <a id="mypage" href="${contextPath}/logout.do">마이페이지</a>
        			<a id="logout" href="${contextPath}/logout.do">로그아웃</a>
        		</c:when>
           <c:otherwise>
           		<a id="login" href="${contextPath}/user/loginForm.do">로그인</a>
        		<a id="signup" href="${contextPath}/user/userForm.do">회원가입</a>
        	</c:otherwise>
        	</c:choose>
        	<!--  
            <a id="login" href="#">로그인</a>
            <a id="signup" href="#">회원가입</a>
            <a id="mypage" href="${contextPath}/mypage/myPage.do" hidden>마이페이지</a>
            <a id="logout" href="#" hidden>로그아웃</a>
            -->
        </div>
        
        <div class="hr"></div>
        <nav>
            <div class="r_menu menu_wrap">
                <a href="${contextPath}/introduce.do" class="menu">호텔소개</a>
                <a href="${contextPath}/facilities.do" class="menu">시설소개</a>
                <a href="${contextPath}/reservation.do" class="menu">호텔예약</a>
                <a href="${contextPath}/reviewBoard.do" class="menu">리뷰게시판</a>
            </div>
            <div class="l_menu menu_wrap">
                <a href="${contextPath}/membership.do" class="menu">멤버쉽</a>
                <a href="${contextPath}/questionsList.do" class="menu">고객센터</a>
            </div>
        </nav>
    </div>
</header>

</body>
</html>
