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
            margin-left: 250px;
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
        .modBT{
            transform: scale(1) rotate(0deg);
            transition: all 0.2s;
            fill: #909090;
        }
        .modBT:hover{
            transform: scale(1.2) rotate(0deg);
            fill: #606060;
        }
        .modBT_push{
            transform: scale(1) rotate(180deg);
        }
        .tb_title td{
            font-size: 14px;
            font-weight: bold;
            color: #030303;
        }
        .user_id,.user_name,.user_grade,.user_resState{
            width: 12%;
        }
        .user_joinDate{
            width: 13%;
        }
        .user_email{
            width: 17%;
        }
        .user_tel{
            width: 17%;
        }
        .user_updata{
            width: 5%;
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
            color: red !important;
        }
        .blue_color{
            color: blue !important;
        }
        #addTr{
            height: 0;
            transition: height 0.3s;
            overflow: hidden;
            position: relative;
        }
        #addTr button{
            width: 60px; height: 25px;
            border-radius: 20px;
            background-color: #eee;
            color: #333;
            border: 0;
            cursor: pointer;
        }
        #addTr button:last-child{
            margin-left: 10px;
        }
        #addTr button:hover{
            background-color: #ccc;
        }
        #addTr td{
            padding-left: 30px;
            box-sizing: border-box;
            opacity: 0;
        }
        #addTr td:nth-child(2){
        }
        #addTr td:nth-child(2) .info_box input[type=text]{
            width: 70%;
        }
        #addTr td:nth-child(3){
            padding-right: 35px;
        }
        #addTr td:nth-child(4){
            position: absolute;
            top: 100px;
            width: 190px;
            right: 10px;
        }
        .profil{
            width: 150px;
            height: 150px;
            background-color: aliceblue;
            border-radius: 50%;
            overflow: hidden;
            box-shadow: 2px 2px 5px #00000030;
            margin: 0 auto;
        }
        .profil img{
            width: 150px;
            height: 150px;
            object-fit: cover;
        }
        input[type=file]{
            width: 170px;
            margin-top: 20px;
        }
        .bt_removeImg{
	        width: 70px; height: 20px;
		    margin: 0 auto; margin-top: 10px;
		    border: 1px solid #999;
		    border-radius: 20px;
		    line-height: 20px;
		    font-size: 6px;
		    cursor: pointer;
		}
		.bt_removeImg:hover{
		background-color: #eee;
		}
        .info_box{
            width: 100%; height: auto;
            display: flex;
            line-height: 30px;
            margin-bottom: 10px;
            position: relative;
        }
        .info_box input[type=text], .info_box input[type=date]{
            width: 60%;
            height: 30px;
            border:0;
            resize: none;
            position: absolute;
            right: 0;
            background-color: #eee;
            padding-left: 5px;
        }
        .info_box input[type=text]:focus, .info_box input[type=date]:focus{
            outline: 1px solid #ccc;
        }
        .info_box input[type=radio]{
            width: 15px;
            height: 15px;
            position: inherit;
            margin-top: 7px;
        }
        .info_grand{
            justify-content: center;
        }
        .crown{
            fill: #ffa245;
        }
    </style>
</head>
<body>
    <input id="contextPath" type="hidden" value="${contextPath}" name="contextPath">
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
        <form name="modUserForm" action="${contextPath}/modMember.do" method="post enctype="multipart/form-data">
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
         </form>
        <div class="page_num"></div>
    </div>
</body>
</html>
