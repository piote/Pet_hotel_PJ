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
            padding-left: 5px;
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
            width: 100%; min-height:300px;
            resize: none;
            border: 0;
            background-color: #eee;
            font-size: 15px;
            padding: 20px;
            transition: background-color 0.2s;
            margin-bottom: 30px;
            -ms-overflow-style: none; /* IE and Edge */
    		scrollbar-width: none; /* Firefox */
        }
        .atc_content textarea::placeholder{
            color: #909090;
        }
        .atc_content textarea:focus{
            background-color: rgb(232, 232, 232);
            outline: none;
        }
	   	.atc_content textarea::-webkit-scrollbar {
		    display: none; /* Chrome, Safari, Opera*/
		}
        .imageFile_wrap label{
        	display: inline-block;
		    width: 100px;
		    height: 25px;
		    border: 1px solid #aaa;
		    border-radius: 7px;
		    background-color: #fff;
		    font-size: 13px;
		    line-height: 25px;
		    text-align: center;
		    color: #444;
        }
        .imageFile_wrap label:hover{
        	background-color: #eee;
        }
        .upload-name{
	        display: inline-block;
		    height: 30px;
		    padding: 0 10px;
		    vertical-align: middle;
		    border: none;
		    width: 78%;
		    color: #999999;
        }
        .upload-name:focus {
          background-color: #fff;
          outline: none;
      	}
        .imageFile_wrap input[type="file"] {
		    position: absolute;
		    width: 0;
		    height: 0;
		    padding: 0;
		    overflow: hidden;
		    border: 0;
		}
        .img_bt{
        	width: 100px; height: 30px;
            border: 1px solid #999;
            border-radius: 20px;
            background-color: #fff;
        }
        #preview{
        	margin-top: 30px;
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
        #questionscommentLengh{      
        	margin: auto;
        	width: 97%;
        	text-align: right;
        	}

    </style>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        //글자수세기
        window.onload = function (){
         $("#questionsCommendBox").on('keyup', function (event) {
	        var currentString = $("#questionsCommendBox").val()
	        $("#questionsCommentInfo").html(currentString.length);
	    });
        }
        
        //목록보기
        function backToList(obj){
            obj.action="${contextPath }/questions/questionsList.do";
            obj.submit();
        }
        
        //이미지파일 추가
		function readURL(input) {
      		if (input.files && input.files[0]) {
      			var fileName = $("#imageFileName").val();
		      	var reader = new FileReader();

                var realfileName = fileName.split('\\').pop().toLowerCase();

                if(checkFileName(realfileName)){
                    reader.onload = function (e) { 
                        $('#preview').attr('src', e.target.result);
                    }
                    $(".upload-name").val(fileName);
                    reader.readAsDataURL(input.files[0]);
                }else{
                    $("#imageFileName").val("");
                }
      		}
  		}
        
        //textarea 글 작성시 자동 크기조정
		function resize(obj) {
            obj.style.height = '1px';
            obj.style.height = (12 + obj.scrollHeight) + 'px';
		}

        function checkFileName(str){
            //확장자 체크
            var ext =  str.split('.').pop().toLowerCase();
            if($.inArray(ext, ['bmp', 'jpg', 'png', 'jpeg', 'gif']) == -1) {
                alert(ext+'파일은 업로드 하실 수 없습니다.');
                return false;
            }

            //파일명 길이 체크
            if(str.length>=70){
                alert('파일명이 너무 길어 업로드 하실 수 없습니다.');
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="atc_wrap">
        <div class="title_wrap">
            <div></div>
            <p class="titie">문의하기</p>
        </div>   


        <form name="articleForm" method="post" action="${contextPath }/questions/addNewQuestion.do"  enctype="multipart/form-data">

            <ul class="atc_tb">
                <li class="user_name">
                    <span>${user.name }</span> 님!  무엇을 도와드릴까요?
                </li>
                <li class="atc_title">
                    <p>글제목</p>
                    <input type="text" name="title" spellcheck="false" maxlength="50" placeholder="제목을 입력해주세요." />
                </li>
                <li class="atc_content">
                    <textarea id="questionsCommendBox"name="content" spellcheck="false" maxlength="1000" placeholder="내용을 입력해주세요." onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
                  
   	         	<div id="questionscommentLengh"><span id="questionsCommentInfo">0</span>/1000</div>
                </li>
                <li class="atc_imageFile">
                	<div class="imageFile_wrap">
                		<label for="imageFileName">이미지 파일</label>
                		<input class="upload-name" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL(this);"  disabled >
	                	<input type="file" id="imageFileName" name="imageFileName"  onchange="readURL(this);"/>
                		<img id="preview" src="#" height=350 onerror="this.src='${contextPath}/resources/img/no_img.png'"/>
                	</div>
                </li>
            </ul>
            <div class="bt_wrap">
                <input type="submit" value="문의하기" />
                <input type=button value="목록보기"onClick="backToList(this.form)" />
            </div>
        </form>

    </div>
</body>
</html>