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
    <style>
          
        .adm_title{
            width: 1000px; height: 65px;
            margin: 0 auto;
            border-bottom: 1px solid #ccc;
        }
        .adm_title p{
            font-size: 17px;
            font-weight: 800;
            text-align: center;
        }
        .y_txt{
            color: #FF862F;
        }
    </style>
</head>
<body>
    <div class="adm_title">
        <p><samp class="y_txt">관리자</samp>님 반갑습니다.</p>
    </div>   
</body>
</html>
