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
        .info_wrap{
            width: 100%; height: auto;
            position: relative;
            margin-top: 80px;
        }
        .list_left{
            width: 270px; height: 500px;
        }
        .list_nav{
            width: 100%; height: 200px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            font-size: 14px;
        }
        .sideNav{
            color: #989898;
        }
        .sideNav:hover{
            color: #333;
        }
        .current{
            color: #333;
        }
    </style>
</head>
<body>
    <div class="info_wrap">
        <div class="list_left">
            <ul class="list_nav">
                <li><a class="sideNav" id="adm_user" href="${contextPath}/admin/adminUserList.do">회원조회</a></li>
                <li><a class="sideNav" id="adm_res" href="${contextPath}/admin/adminResList.do">예약관리</a></li>
                <li><a class="sideNav" href="${contextPath}/review/checkReview2.do">리뷰게시판 관리</a></li>
                <li><a class="sideNav" href="${contextPath}/questions/questionsList.do">문의게시판 관리</a></li>
                <li><a class="sideNav" href="${contextPath}/introduce.do">호텔소개페이지 관리</a></li>
                <li><a class="sideNav" href="${contextPath}/facilities.do">시설소개페이지 관리</a></li>
            </ul>
        </div>
    </div>    
</body>
</html>
