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
            color: #E59F5A;
        }
        .info_wrap{
            width: 100%; height: auto;
            position: relative;
            margin-top: 60px;
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
    <div class="adm_title">
        <p><samp class="y_txt">관리자</samp>님 반갑습니다.</p>
        
    </div>
    <div class="info_wrap">
        <div class="list_left">
            <ul class="list_nav">
                <li><a class="sideNav" id="adm_user" href="${contextPath}/admin/adminUserList.do">회원조회</a></li>
                <li><a class="sideNav" id="adm_res" href="${contextPath}/admin/adminResList.do">예약관리</a></li>
                <li><a class="sideNav" href="${contextPath}/reviewBoard.do">리뷰게시판 관리</a></li>
                <li><a class="sideNav" href="${contextPath}/questions/questionsList.do">문의게시판 관리</a></li>
                <li><a class="sideNav" href="#">소개페이지 관리</a></li>
            </ul>
        </div>
    </div>    
</body>
</html>
