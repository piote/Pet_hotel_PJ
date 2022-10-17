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
   <style>
    ul, li{
        list-style: none;
    }
    .view_table li p{
        display: inline-block;
        font-size: 14px;
        
    }
    .view_table li {
        height: 35px;
        border-bottom: 1px solid #ddd;

    }
     #tr_file_upload{
       display:none;
     }
     #tr_btn_modify{
       display:none;
     }
     #wrap{
        width: 1000px;
        height: auto;
        margin: 0 auto; 
     }
     .title{
       color: #9F814F;
       display: block;
       width: 1000px;
       margin: 20px auto;
     }
	#imagebox{
	padding: 15px;
	height:250px;
	}
    #i_content{
    width: 800px;
    height: 300px;
    }

    .view_table{
     border: 1px;
      width:100%;
    }
    .content_box{
    padding: 15px;
    }
    .textbox{
        border: 0;
        background: none;
        font-size: 14px;
    }
   </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
    function backToList(obj){
	    obj.action="${contextPath}/board/listArticles.do";
	    obj.submit();
    }
	 function fn_enable(obj){
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_file_upload").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/board/modArticle.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,articleNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","articleNO");
	     articleNOInput.setAttribute("value", articleNO);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
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
	 
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
	 }  
 </script>
</head>
<body>
<div id="wrap">
    <h4 class="title">Question Board</h4>
    <h6>문의사항을 작성해주세요:)</h6>
  <form name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
  <ul class="view_table"  >
    <li >
        <p>제목</p> 
        <input type=text value="${article.q_title }"  name="title"  id="i_title" class="textbox" disabled />
    </li>
    <li>
        <p >아이디</p>     
        <input type=text value="${article.id }" name="writer" class="textbox" disabled />
    </li>
    <li>
	    <p >작성일</p>  
	    <input type=text value="<fmt:formatDate value="${article.q_Date}" />" class="textbox" disabled />
    </li> 




<c:choose> 
    <c:when test="${not empty article.imageFileName && article.imageFileName!='null' }">
        <li id="imagebox">
        <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
        <img src="${contextPath}/download.do?articleNO=${article.q_num}&imageFileName=${article.imageFileName}" id="preview" /><br>
       <!--  <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />--> 
        </li>
    </c:when>
    <c:otherwise>
        <li id="tr_file_upload" > 이미지
        <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />

        <img class="imagebox"  /><br>
        <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
        </li>
    </c:otherwise>
</c:choose>


<li class="content_box">
    <textarea  class="textbox"  name="content"  id="i_content"  disabled />${article.q_content }</textarea> 
</li>  

</ul>


  <li   id="tr_btn_modify"  align="center"  >
	       <input type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
           <input type=button value="취소"  onClick="backToList(frmArticle)">	    
    </li>
    
  <div  id="tr_btn"    >
   		 <input type=button value="목록"  onClick="backToList(this.form)">
	     <input type=button value="답글쓰기"  onClick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.q_num})">
       <c:if test="${member.id == article.id }">
	      <input type=button value="수정하기" onClick="fn_enable(this.form)">
	      <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.q_num})">
	    </c:if>	    
 
 </div>
 </form>
 </div>
</body>
</html>