<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<c:set  var="review"  value="${reviewMap.review}" />
<c:set  var="imageFileList"  value="${reviewMap.imageFileList}" />
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
        #reviewForm fieldset {
            display: inline-block;
            direction: rtl;
            border: 0;
        }

        #reviewForm fieldset legend {
            text-align: right;
        }

        #reviewForm input[type=radio] {
            display: none;
        }

        #reviewForm label {
            font-size: 2em;
            color: transparent;
            text-shadow: 0 0 0 #f0f0f0;
            text-shadow: 0 0 0 rgba(211, 211, 211, 0.8);

        }

        #reviewForm label:hover {
            text-shadow: 0 0 0 rgba(255, 211, 0, 0.66);
        }

        #reviewForm label:hover~label {
            text-shadow: 0 0 0 rgba(255, 211, 0, 0.66);
        }

        #reviewForm input[type=radio]:checked~label {
            text-shadow: 0 0 0 rgba(255, 211, 0, 0.66);
        }

        .div {
            width: 1270px;
            height: auto;


            margin-left: 17%;
            margin-top: 14%;
        }

        table {
            width: 100%;

        }

        .w_tr1>td {
            border-bottom: 1px solid #ddd;
        }

        .atc_content textarea {
            box-sizing: border-box;
            width: 990px;
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

        .view_image {
            float: right;
        }

        .r_date {


            padding: 40px 20px;
            text-align: right;
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

        #preview {
            border: 0px solid #000;
        }
    </style>
    <meta charset="UTF-8">



    <title>글쓰기창</title>



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
            obj.action = "${contextPath}/review/checkReview.do";
            obj.submit();
        }

        var cnt = 1;
        function fn_addFile() {
            $("#d_file").append("<br>" + "<input type='file' name='file" + cnt + "' />");
            cnt++;
        }
        var Cell3 = newRow.insertCell();


    </script>
    <!--  <title>글쓰기창</title> -->
</head>

<body>

    <div class="div">
        <h2 style="text-align:left">리뷰 수정</h2>

        <form name="frmReview" method="post" action="${contextPath}" enctype="multipart/form-data">

            <table class="table2">
                <tr class="w_tr1">

                    <td align="left">
                        ${review.id }
                        <input type="hidden" name="reviewNO" value="${review.reviewNO }" />
                        <input type="hidden" name="rec" value="${review.rec}" />
                    </td>
                    <td class="r_date">
                        ${review.date}
                    </td>
                </tr>

                <tr>
                    <td class="atc_content">
                        <textarea id="questionsCommendBox" name="title" spellcheck="false" maxlength="1000"
                            onkeydown="resize(this)" onkeyup="resize(this)">${review.title }</textarea>

                    </td>
                    <c:choose>
                        <c:when test="${not empty review.image && review.image != 'null'}">


                            <td class="view_image">
                                <input type="hidden" name="originalFileName" value="${review.image}" />
                                <img src="${contextPath}/${review.image}" id="preview" width="250" height="250" /><br>
                                <input type="file" name="imageFileName " id="i_imageFileName"
                                    onchange="readURL(this);" />
                            </td>


                        </c:when>
                        <c:otherwise>

                            <td>
                                <input type="hidden" name="originalFileName" value=""" />
	     	<img id=" preview" width="250" height="250" /><br>
                                <input type="file" name="imageFileName " id="i_imageFileName"
                                    onchange="readURL(this);" />
                            </td>

                        </c:otherwise>
                    </c:choose>


                </tr>
                <tr>
                    <td colspan="2" height="100px">
                        <div id="questionscommentLengh">
                            <button type="button" class="image" value="파일 추가"
                                onClick="fn_addFile(); this.onclick=null;">파일 추가 </button>
                            <input type=button class="questionsCommentInfo" value="수정하기"
                                onClick="fn_modify_article(frmReview)">
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
    <script>
        function fn_modify_article(obj) {
            obj.action = "${contextPath}/review/modReview.do";
            obj.submit();
        }
    </script>
</body>

</html>