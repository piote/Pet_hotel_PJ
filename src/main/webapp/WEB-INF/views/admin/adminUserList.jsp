<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자페이지_회원조회</title>
    <script src="${contextPath}/resources/js/adminUserPage.js"></script>
    <style>
        #adm_user{
        	color: #333;
        }
        .list_wrap{
            width: 1000px; height: auto;
            position: absolute; 
            top: 120px; right: 0;
        }
        .list_option{
            width: 100%;
            height: 30px;
            background-color: #fff;
            margin-bottom: 30px;
            position: relative;
            display: flex;
            flex-direction: row;
        }
        .search_wrap{
            margin-left: 10px;
            width: 315px;
            position: relative;
        }
        #search_op{
            width: 85px; height: 20px;
            border: 1px solid #bababa;
            border-radius: 4px;
            padding-left: 2px;
            font-size: 13px;
            box-sizing: border-box;
        }
        #search_op:focus{
            border: 1px solid #bababa;
            outline: none;
        }
        .search_txt{
            width: 220px; height: 25px;
            border: 0;
            background-color: #f1f1f1;
            transition: background-color 0.2s;
            padding-left: 10px;
            box-sizing: border-box;
            font-size: 13px;
            color: #606060;
        }
        .search_txt:focus{
            border: 0;
            outline: none;
            background-color: #eaeaea;
        }
        .seh_icon{
            width: 17px;height: 17px;
            display: block;
            position: absolute;
            right: 10px;
            top: 5px;
            background: none;
            border: none;
            cursor: pointer;
        }
        .grade_option,.res_option{
            font-size: 14px;
            color: #606060;
            line-height: 30px;
        }
        .grade_option{
            margin-left: 40px;
        }
        .res_option{
            margin-left: 35px;
        }
        .grade_option input[type=checkbox], .res_option input[type=checkbox]{
            accent-color: #ffa245;
            color: #ffa245;
            transform: scale(0.9);
            margin: 0 5px;
            position: relative;
            top: 2px;
        }
        .hr{
            height: 100%; width: 1px;
            background-color: #ccc;
            transform: scaleY(0.6);
            margin-left: 30px;
        }
        .grade_option label,.res_option label{
            margin: 0 10px;
        }
        .list_tb{
            border-collapse: collapse;
            width: 1000px;
            text-align: center;
        }
        .list_tb tr{
            height: 40px;
            border-bottom: 1px solid #d6d6d6;
        }
        .list_tb td{
            font-size: 13px;
            color: #606060;
        }
        .tb_title{
            background-color: #f1f1f1;
        }
        .tb_title td{
            font-size: 14px;
            font-weight: bold;
            color: #030303;
        }
        .user_id,.user_name,.user_grade,.user_resState{
            width: 13%;
        }
        .user_joinDate{
            width: 14%;
        }
        .user_email{
            width: 18%;
        }
        .user_tel{
            width: 16%;
        }
        .page_num{
            margin-top: 50px;
            text-align: center;
        }
        .pageNO{
            display: inline-block;
            margin: 0 5px;
            cursor: pointer;
            font-size: 14px;
            color: #999999;
        }
        .select_number{
            color: #030303;
        }
        .red_color{
            color: red;
        }
    </style>
</head>
<body>
    <div class="list_wrap">
        <div class="list_option">
            <div class="search_wrap" id="searchForm" name="searchForm" onSubmit="search()" >
                <select name="search_op" id="search_op" aria-label="search">
                    <option value="search_id">아이디</option>
                    <option value="search_name">이름</option>
                    <option value="search_tel">전화번호</option>
                    <option value="search_email">이메일</option>
                </select>
                <input type="text" name="keyword" id="keyword" class="search_txt" placeholder="검색">
                <button type="button" class="seh_icon" onclick="search()" ><svg width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M15.853 16.56c-1.683 1.517-3.911 2.44-6.353 2.44-5.243 0-9.5-4.257-9.5-9.5s4.257-9.5 9.5-9.5 9.5 4.257 9.5 9.5c0 2.442-.923 4.67-2.44 6.353l7.44 7.44-.707.707-7.44-7.44zm-6.353-15.56c4.691 0 8.5 3.809 8.5 8.5s-3.809 8.5-8.5 8.5-8.5-3.809-8.5-8.5 3.809-8.5 8.5-8.5z"/></svg></button>
            </div>
            <div class="grade_option">
                멤버쉽 :
                <label><input type="checkbox" name="grade" id="Normal" value="Normal">Normal</label>
                <label><input type="checkbox" name="grade" id="Bronze" value="Bronze">Bronze</label>
                <label><input type="checkbox" name="grade" id="Silver" value="Silver">Silver</label>
                <label><input type="checkbox" name="grade" id="Gold" value="Gold">Gold</label>
            </div>
            <div class="hr"></div>
            <div class="res_option">
                예약여부 :
                <label><input type="checkbox" name="reservation" id="res_O" value="O">O</label>
                <label><input type="checkbox" name="reservation" id="res_X" value="X">X</label>
            </div>
        </div>

        <table class="list_tb">
            <tr class="tb_title">
                <td class="user_id">아이디</td>
                <td class="user_name">이름</td>
                <td class="user_grade">멤버쉽등급</td>
                <td class="user_joinDate">가입일</td>
                <td class="user_email">이메일</td>
                <td class="user_tel">전화번호</td>
                <td class="user_resState">예약여부</td>
            </tr>
        </table>
        <div class="page_num"></div>
    </div>
</body>
</html>
