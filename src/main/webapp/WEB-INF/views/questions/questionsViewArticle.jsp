<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%-- 
<c:set var="article"  value="${articleMap.article}"  />
<c:set var="imageFileList"  value="${articleMap.imageFileList}"  />
 --%>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
   <meta charset="UTF-8">
   <title>글보기</title>

   <link rel="stylesheet" href="reset.css">

   <style>
    ul, li{
        list-style: none;
    }
    #wrap{
    width: 1000px;
    height: auto;
    margin: 0 auto;
    position: relative;
    margin-bottom: 200px;
  }
  .title_wrap{
    width: 100%; height: 300px;
    position: relative;
    margin-top: -40px;
  }
  .title_text {
    width: 300px; height: auto;
    position: absolute;
    left: 50px; top: 100px;
  }
  .title_text div{
    width: 150px; height: 2px;
    background-color: #aaa;
  }
  .title_text h1{
    display: block;
    font-size: 40px;
    letter-spacing :-2px;
    font-weight: 800;
  }
  .title_text p{
    font-size: 15px;
    color: #666;
    padding-left: 10px;
  }
  .title_wrap img{
    position: absolute;
    width: 200px; height: auto;
    right: 20px; top: 50px;
  }
    .view_table{
        width: 100%; height: auto;
        margin: 0 auto;
        margin-bottom: 50px;
    }
  
    .view_table li p{
        display: inline-block;
        width: 50px;
        font-size: 15px;
        margin-right: 50px;
        color: #999;
    }
    .view_table li {
        height: 50px;
        border-bottom: 1px solid #ddd;
        line-height: 50px;
    }
    #i_title{
    	width: 700px;
	    height: 70%;
	    padding-left: 10px;
	    }
	#imagebox{
        padding: 15px;
        height:400px;
	}
	#preview{
		margin-top: 20px;
		height: 350px;
	}
    #i_content{
        width: 800px;
        height: auto;
        box-sizing: border-box;
        padding: 20px;
    }
    li.content_box{
        box-sizing: border-box;
        padding: 15px;
        height: auto;
    }
    .textbox{
        border: 0;
        background: none;
        font-size: 14px;
        height: auto;
        transition: background-color 0.2s;
        resize: none;
        -ms-overflow-style: none; /* IE and Edge */
    	scrollbar-width: none; /* Firefox */
    }
    .textbox:focus{
        background-color: #eee;
        outline: none;
   	}
   	.textbox::-webkit-scrollbar {
		display: none; /* Chrome, Safari, Opera*/
	}
   	.qDate, .userid{
   		padding-left: 10px
   	}
    #tr_file_upload{
       display:none;
       height: auto;
       padding-left: 20px;
   	   box-sizing: border-box;
     }
     
     #tr_file_upload label{
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
        #tr_file_upload label:hover{
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
        #tr_file_upload input[type="file"] {
		    position: absolute;
		    width: 0;
		    height: 0;
		    padding: 0;
		    overflow: hidden;
		    border: 0;
		}
    #tr_btn_modify{
       display:none;
       float: right;
    }
    #tr_btn {
        float: right;
    }
    #tr_btn input, #tr_btn_modify input{
        width: 100px; height: 30px;
        border: 1px solid #999;
        border-radius: 20px;
        background-color: #fff;
    }
    #tr_btn input:hover, #tr_btn_modify input:hover{
        border-color: #e59f5a;
        background-color: #e59f5a;
        color: #fff;
    }
   </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
   
   //목록보기
    function backToList(obj){
	    obj.action="${contextPath }/questions/questionsList.do";
	    obj.submit();
    }
    
    //글 수정하기 클릭 시, 숨겨진 버튼 보이기
	 function fn_enable(obj){
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_file_upload").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
		 document.getElementById("i_content").style.resize="vertical";
		 document.getElementById("i_content").style.backgroundColor="#eee";
         
	 }
	 
	 //글 수정
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/questions/modQuestionsArticle.do";
		 obj.submit();
	 }
	 
	 //글 삭제
	 function fn_remove_article(url,q_num){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","q_num");
	     articleNOInput.setAttribute("value", q_num);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
	 //답글쓰기
	 function fn_reply_form(url, parentNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","hidden");
	     parentNOInput.setAttribute("name","parentNO");
	     parentNOInput.setAttribute("value", parentNO);
		 
	     form.appendChild(parentNOInput);
	     document.body.appendChild(form);
		 form.submit();
	 }
	 
	//이미지파일 미리보기
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	    	 var fileName = $("#i_imageFileName").val();
             var reader = new FileReader();
             
             var realfileName = fileName.split('\\').pop().toLowerCase();

                if(checkFileName(realfileName)){
                    reader.onload = function (e) { 
                        $('#preview').attr('src', e.target.result);
                    }
                    $(".upload-name").val(fileName);
                    reader.readAsDataURL(input.files[0]);
                }else{
                    $("#i_imageFileName").val("");
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
        <div id="wrap">
            <div class="title_wrap">
                <div class="title_text">
                <div></div>
                <h1>Question Board</h1>
                <p>무엇이든 물어보세요.<br>신속하고 친절하게 답변해드립니다.</p>
                </div>
                <img src="${contextPath}/resources/img/q_list01.jpg" alt="Question title">
            </div>

            <form name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
                <ul class="view_table"  >
                    <li >
                        <p>제목</p> 
                        <input type=text value="${article.q_title }"  name="q_title"  id="i_title" class="textbox" spellcheck="false" disabled maxlength='50'/>
                    </li>
                    <li>
                        <p>아이디</p> 
                        <input type=text value="${article.user_id }" name="writer" class="textbox userid" disabled />
                    </li>
                    <li>
                        <p>작성일</p>  
                        <input type=text value="<fmt:formatDate value="${article.q_Date}" />" class="textbox qDate" disabled />
                    </li> 

                    <c:choose> 
                        <c:when test="${not empty article.imageFileName && article.imageFileName!='null' }">
                            <li id="imagebox">
                                <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
                                <img src="${contextPath}/resources/questions/questions_image/${article.q_num}/${article.imageFileName}" id="preview" onerror="this.src='${contextPath}/resources/img/no_img.png'" /><br>
                            </li>
                        </c:when>
                        <c:otherwise>
                            
                        </c:otherwise>
                    </c:choose>
                    <li id="tr_file_upload" > 
                            	<c:if test="${empty article.imageFileName || article.imageFileName=='null' }">
                            		<img id="preview" src="#" height=350 onerror="this.src='${contextPath}/resources/img/no_img.png'"/>
                            	</c:if>
                                <input type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
                                <input type= "hidden"   name="q_num" value="${article.q_num }" />
                                <label for="i_imageFileName">이미지 파일</label>
                				<input class="upload-name" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL(this);"  disabled >
                				<input type="file" id="i_imageFileName" name="imageFileName"  onchange="readURL(this);"/>
                            </li>
                    <li class="content_box">
                        <textarea  class="textbox"  name="q_content"  id="i_content" spellcheck="false" disabled onkeydown="resize(this)" onkeyup="resize(this)" maxlength='1000'>${article.q_content }</textarea> 
                    </li>  
                </ul>
					<script>
					    var txtArea = $(".textbox");
					    if (txtArea) {
					        txtArea.each(function(){
					            $(this).height(this.scrollHeight);
					        });
					    }
					</script>
				
                <div id="tr_btn_modify" >
                    <input type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
                    <input type=button value="취소"  onClick="backToList(frmArticle)">	    
                </div>

                <div id="tr_btn">
                    <input type=button value="목록"  onClick="backToList(this.form)">
                    <c:if test="${user.id == 'admin' }">
                   	 <input type=button value="답글쓰기"  onClick="fn_reply_form('${contextPath}/questions/replyForm.do', ${article.q_num})">
                   	 </c:if>	
                  		 <c:if test="${user.id == article.user_id }">
	                        <input type=button value="수정하기" onClick="fn_enable(this.form)">
	                        <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/questions/removeArticle.do', ${article.q_num})">
                    </c:if>	    
                </div>
            </form>
        </div>
    </body>
</html>