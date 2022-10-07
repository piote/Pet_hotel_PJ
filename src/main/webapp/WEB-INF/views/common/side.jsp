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

	<div class="side_wrap">
        <a class="side_btn" href="#">
            <svg class="plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 23"><defs></defs><polygon class="cls-1" points="23 11.03 11.97 11.03 11.97 0 11.03 0 11.03 11.03 0 11.03 0 11.97 11.03 11.97 11.03 23 11.97 23 11.97 11.97 23 11.97 23 11.03"/></svg>
            <svg class="plus arrow" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 22.53 11.97"></defs><polygon class="cls-1" points="0.71 11.97 11.26 1.41 21.82 11.97 22.53 11.26 11.97 0.71 11.26 0 0 11.26 0.71 11.97"/></svg>
        </a>
        <a class="side_btn move_bt" href="#">
            <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M19.619 21.671c-5.038 1.227-8.711-1.861-8.711-5.167 0-3.175 3.11-5.467 6.546-5.467 3.457 0 6.546 2.309 6.546 5.467 0 1.12-.403 2.22-1.117 3.073-.029 1 .558 2.435 1.088 3.479-1.419-.257-3.438-.824-4.352-1.385zm-10.711-5.167c0-4.117 3.834-7.467 8.546-7.467.886 0 1.74.119 2.544.338-.021-4.834-4.761-8.319-9.998-8.319-5.281 0-10 3.527-10 8.352 0 1.71.615 3.391 1.705 4.695.047 1.527-.851 3.718-1.661 5.313 2.168-.391 5.252-1.258 6.649-2.115.803.196 1.576.304 2.328.363-.067-.379-.113-.765-.113-1.16z"/></svg>
            <p>문의하기</p>
        </a>
        <a class="side_btn move_bt" href="#">
            <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M20 22.621l-3.521-6.795c-.008.004-1.974.97-2.064 1.011-2.24 1.086-6.799-7.82-4.609-8.994l2.083-1.026-3.493-6.817-2.106 1.039c-7.202 3.755 4.233 25.982 11.6 22.615.121-.055 2.102-1.029 2.11-1.033z"/></svg>
            <p>호텔예약</p>
        </a>
        <a class="side_btn move_bt" href="#">
            <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M20.822 18.096c-3.439-.794-6.64-1.49-5.09-4.418 4.72-8.912 1.251-13.678-3.732-13.678-5.082 0-8.464 4.949-3.732 13.678 1.597 2.945-1.725 3.641-5.09 4.418-3.073.71-3.188 2.236-3.178 4.904l.004 1h23.99l.004-.969c.012-2.688-.092-4.222-3.176-4.935z"/></svg>
            <p>마이페이지</p>
        </a>
    </div>

</body>
</html>
