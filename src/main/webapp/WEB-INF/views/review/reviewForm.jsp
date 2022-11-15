<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<c:set  var="reviewList"  value="${reviewMap.reviewList}" />
<c:set  var="totArticles"  value="${reviewMap.totArticles}" />
<c:set  var="section"  value="${reviewMap.section}" />
<c:set  var="pageNum"  value="${reviewMap.pageNum}" />
<c:set  var="res_num"  value="${res_num}" />


<%
  request.setCharacterEncoding("UTF-8");
%> 
<html>

<head>
    <style>
        .fd1 {
            display: inline-block;
            direction: rtl;
            border: 0;
        }

        #reviewForm fieldset legend {
            text-align: right;
        }

        .fd1>input {
            display: none;
        }

        .fd1>label {
            font-size: 2em;
            color: transparent;
            text-shadow: 0 0 0 #f0f0f0;
            text-shadow: 0 0 0 rgba(211, 211, 211, 0.8);
        }

        .fd1>label:hover {
            text-shadow: 0 0 0 rgba(255, 211, 0, 0.66);
        }

        .fd1>label:hover~label {
            text-shadow: 0 0 0 rgba(255, 211, 0, 0.66);
        }

        .fd1>input:checked~label {
            text-shadow: 0 0 0 rgba(255, 211, 0, 0.66);
        }


        .div {
            width: 1270px;
            height: 600px;


            margin-left: 17%;
            margin-top: 14%;
        }


        table {
            width: 100%;

        }

        .w_tr1>td {
            border-bottom: 1px solid #ddd;
        }

        .but {
            margin-top: 30px;
            position: absolute;
            right: 25%;
        }


        .fd2>label {
            font-size: 18px;
            line-height: 2rem;
            padding: 0.2em 0.4em;
        }

        span {
            vertical-align: middle;
        }

        .fd2>label>input {
            vertical-align: middle;
            appearance: none;
            border: max(2px, 0.1em) solid gray;
            border-radius: 50%;
            width: 1.25em;
            height: 1.25em;
            transition: border 0.3s ease-in-out;
        }

        .fd2>label>input:checked {
            border: 0.4em solid tomato;
        }

        .fd2>label>input:focus-visible {
            outline-offset: max(2px, 0.1em);
            outline: max(2px, 0.1em) dotted tomato;
        }

        .fd2>label>input:hover {
            box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
            cursor: pointer;
        }

        .fd2>label>input:disabled {
            background-color: lightgray;
            box-shadow: none;
            opacity: 0.7;
            cursor: not-allowed;
        }

        .fd2>label>input:disabled+span {
            opacity: 0.7;
            cursor: not-allowed;
        }

        /* Global CSS */
        .fd2 {
            display: flex;
            justify-content: center;
            border: none;
            margin: 0;
            padding: 40px 20px;
            float: right;
        }

        *,
        *::before,
        *::after {
            box-sizing: border-box;
        }


        .atc_content textarea {
            box-sizing: border-box;
            width: 100%;
            min-height: 300px;
            resize: none;
            border: 0;
            background-color: #eee;
            font-size: 15px;
            padding: 20px;
            transition: background-color 0.2s;

            -ms-overflow-style: none;
            /* IE and Edge */
            scrollbar-width: none;
            /* Firefox */
        }

        .atc_content textarea::placeholder {
            color: #909090;
        }

        .atc_content textarea:focus {
            background-color: rgb(228, 228, 228);
            outline: none;
        }

        .atc_content textarea::-webkit-scrollbar {
            display: none;
            /* Chrome, Safari, Opera*/
        }

        #questionscommentLengh {
            text-align: right;
        }

        .id {
            float: left;
        }

        .d_file {
            background-color: white;
            border: 2px solid #adb5bd;
            width: 90px;
            height: 30px;
            line-height: 30px;
            color: black;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 5%;
            float: left;
        }

        .image {
            background-color: white;
            border: 2px solid #adb5bd;
            width: 90px;
            height: 30px;
            line-height: 30px;
            color: black;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 5%;
            float: left;
        }

        .image:hover {
            background-color: #adb5bd;
            color: white;
        }

        .star {
            float: right;
        }

        .back {
            background-color: white;
            border: 2px solid #adb5bd;
            width: 90px;
            height: 30px;
            line-height: 30px;
            color: black;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 5%;
            float: right;
            margin-right: 10px;
        }

        .back:hover {
            background-color: #adb5bd;
            color: white;
        }

        .questionsCommentInfo {
            background-color: white;
            border: 2px solid #adb5bd;
            width: 90px;
            height: 30px;
            line-height: 30px;
            color: black;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 5%;
            float: right !important;
        }

        .questionsCommentInfo:hover {
            background-color: #adb5bd;
            color: white;
        }
    </style>





    <meta charset="UTF-8">



    <title>글쓰기창</title>

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#preview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function backToList(obj) {
            0
            obj.action = "${contextPath}/review/reviewBoard.do";
            obj.submit();
        }


        function fn_addFile() {
            $("#d_file").append("<br>" + "<input type='file' name='file' />");

        }




    </script>
    <!--  <title>글쓰기창</title> -->
</head>

<body>

    <div class="div">
        <h2 style="text-align:left">리뷰 쓰기</h2>

        <form name="reviewForm" id="reviewForm" method="post" action="${contextPath}/review/addNewReview.do"
            enctype="multipart/form-data">

            <table class="table2">
                <tr class="w_tr1">
                    <td>
                        <p class="id">${user.id}</p>
                        <input type="hidden" name="res_num" value="${res_num}" />
                        <input type="hidden" name="rec" value="0" />
                    </td>
                    <td align="center">
                        <fieldset class="fd1">

                            <input type="radio" name="rate" class="rate" value="5" checked="checked" id="rate1"><label
                                for="rate1">★</label>
                            <input type="radio" name="rate" class="rate" value="4" id="rate2"><label
                                for="rate2">★</label>
                            <input type="radio" name="rate" class="rate" value="3" id="rate3"><label
                                for="rate3">★</label>
                            <input type="radio" name="rate" class="rate" value="2" id="rate4"><label
                                for="rate4">★</label>
                            <input type="radio" name="rate" class="rate" value="1" id="rate5"><label
                                for="rate5">★</label>
                            <c:if test="rate==null">

                            </c:if>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset class="fd2">
                            <label>
                                <input type="radio" name="ROOM_GRADE" value="Deluxe" checked />
                                <span>Deluxe</span>
                            </label>

                            <label>
                                <input type="radio" name="ROOM_GRADE" value="Suite" />
                                <span>Suite</span>
                            </label>

                            <label>
                                <input type="radio" name="ROOM_GRADE" value="Superior" />
                                <span>Superior</span>
                            </label>
                        </fieldset>


                    </td>
                </tr>

                <tr>
                    <td colspan="3" class="atc_content">
                        <textarea id="questionsCommendBox" name="title" spellcheck="false" maxlength="1000"
                            placeholder="리뷰를 입력해주세요." onkeydown="resize(this)" onkeyup="resize(this)"></textarea>

                        <div id="questionscommentLengh">
                            <button type="button" class="image" value="파일 추가"
                                onClick="fn_addFile(); this.onclick=null;">파일 추가 </button>
                            <button class="questionsCommentInfo" type="submit" value="리뷰 등록">리뷰 등록</button>
                            <button class="back" value="목록보기" onClick="backToList(this.form)"> 목록 보기</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div id="d_file"></div>
                    </td>
                </tr>
            </table>




    </div>
</body>

</html>
