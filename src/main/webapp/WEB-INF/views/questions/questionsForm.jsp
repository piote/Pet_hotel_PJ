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
    <title>문의하기</title>
    <link rel="stylesheet" href="reset.css">
    <style>
        li,ul{
            list-style: none;
        }
        .atc_wrap{
            width: 1000px; height: auto;
            margin: 0 auto;
            margin-bottom: 200px;
            
        }
        .title_wrap{
            width: 100%;
            text-align: center;
            margin-bottom: 50px;
        }
        .title_wrap>div{
            width: 200px;
            height: 10px;
            background-color: #e59f5a;
            border-radius: 10px;
            margin: 15px auto;
        }
        .titie{
            font-size: 20px;
            font-weight: 800;
        }
        .atc_tb{
            margin-bottom: 40px;
        }
        .user_name{
            font-size: 15px;
            margin: 50px 0;
            text-align: center;
        }

        .user_name span{
            color: #e59f5a;
        }
        .atc_title{
            margin-bottom: 50px;
        }
        .atc_title p{
            margin-bottom: 10px;
            font-size: 15px;
            font-weight: 800;
        }
        .atc_title input[type=text] {
            width: 100%;
            height: 40px;
            border: 0;
            border-bottom: 2px solid #ddd;
            font-size: 15px;
            text-indent: 20px;
            transition: background-color 0.2s;
        }
        .atc_title input[type=text]::placeholder {
            color: #909090;
        }
        .atc_title input[type=text]:focus {
            background-color: #eee;
            outline: none;
        }
        .atc_content textarea{
            box-sizing: border-box;
            width: 100%; height: 300px;
            resize: vertical;
            border: 0;
            background-color: #eee;
            font-size: 15px;
            padding: 20px;
            transition: background-color 0.2s;
        }
        .atc_content textarea::placeholder{
            color: #909090;
        }
        .atc_content textarea:focus{
            background-color: rgb(232, 232, 232);
            outline: none;
        }
        .bt_wrap{
            width: 100%; height: auto;
            position: relative;
        }
        .bt_wrap input{
            width: 100px; height: 30px;
            border: 1px solid #999;
            border-radius: 20px;
            background-color: #fff;
            position: absolute; right: 0;
        }
        .bt_wrap input:nth-child(1){
            right: 110px;
        }

        .bt_wrap input:hover{
            border-color: #e59f5a;
            background-color: #e59f5a;
            color: #fff;
        }

    </style>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        
        //목록보기
        function backToList(obj){
            obj.action="${contextPath}/board/listArticles.do";
            obj.submit();
        }

    </script>
</head>
<body>
    <div class="atc_wrap">
        <div class="title_wrap">
            <div></div>
            <p class="titie">문의하기</p>
        </div>

        <div class="hr"></div>

        <form name="articleForm" method="post" action="#">

            <li class="atc_tb">
                <ul class="user_name">
                    <span>${user.name }</span>님!  무엇을 도와드릴까요?
                </ul>
                <ul class="atc_title">
                    <p>글제목</p>
                    <input type="text" name="title" spellcheck="false" maxlength="500" placeholder="제목을 입력해주세요." />
                </ul>
                <ul class="atc_content">
                    <textarea name="content" spellcheck="false" maxlength="4000" placeholder="내용을 입력해주세요."></textarea>
                </ul>
            </li>
            <div class="bt_wrap">
                <input type="submit" value="문의하기" />
                <input type=button value="목록보기"onClick="backToList(this.form)" />
            </div>
        </form>

    </div>
</body>
</html>