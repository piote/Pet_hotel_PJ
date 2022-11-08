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

#reviewForm fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
    }

    #reviewForm fieldset legend{
        text-align: right;
    }
    
    #reviewForm input[type=radio]{
        display: none;
    }
    
    #reviewForm label{
        font-size: 2em;
        color: transparent;
        text-shadow: 0 0 0 #f0f0f0;
        text-shadow: 0 0 0 rgba(211, 211, 211, 0.8);
        
    }
    #reviewForm label:hover{
        text-shadow: 0 0 0 rgba(255, 211, 0, 0.66);
    }
    #reviewForm label:hover ~ label{
        text-shadow: 0 0 0 rgba(255, 211, 0, 0.66);
    }
    #reviewForm input[type=radio]:checked ~ label{
        text-shadow: 0 0 0 rgba(255, 211, 0, 0.66);
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
  function backToList(obj){0
    obj.action="${contextPath}/review/reviewDetail_1.do";
    obj.submit();
  }
  
  var cnt=1;
  function fn_addFile(){
	  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	  cnt++;
  }  
  var Cell3 = newRow.insertCell();
  

</script>
<!--  <title>글쓰기창</title> -->
</head>
<body>

<form name="frmReview" method="post"  action="${contextPath}"  enctype="multipart/form-data">
<table  border=0  align="center">
<tr>
 <td width=150 align="center" bgcolor=#FF9933>
    글번호
 </td>
 <td >
  <input type="text"  value="${review.reviewNO }"  disabled />
  <input type="hidden" name="reviewNO" value="${review.reviewNO }"  />
 </td>
</tr>
<tr>
  <td width="150" align="center" bgcolor="#FF9933">
    작성자 아이디
 </td>
 <td >
  <input type=text value="${review.id }" name="writer"  disabled />
 </td>
</tr>
<tr>
  <td width="150" align="center" bgcolor="#FF9933">
    리뷰
 </td>
 <td>
  <input type=text value="${review.title }"  name="title"  id="i_title" />
 </td>   
</tr>
<tr>
  <td width="150" align="center" bgcolor="#FF9933">
    내용
 </td>
 <td>
  <textarea rows="20" cols="60"  name="content"  id="i_content"  disabled />${review.date }</textarea>
 </td>  
</tr>

<c:if test="${not empty review.image && review.image != 'null'}">
	  
		    <tr>
			    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
			      이미지${status.count }
			   </td>
			   <td>
			     <input  type= "hidden"   name="originalFileName" value="${review.image}" />
			    <img src="${contextPath}/${review.image}" id="preview" width="450" /><br>
			   </td>   
			  </tr>  
			  <tr>
			    <td>
			       <input  type="file"  name="imageFileName " id="i_imageFileName"   onchange="readURL(this);"   />
			    </td>
			 </tr>
		
</c:if>
	   
	 
<c:choose> 
<c:when test="${not empty review.imageFileName && review.imageFileName!='null' }">
	<tr>
    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
      이미지
   </td>
   <td>
     <input  type= "hidden"   name="originalFileName" value="${review.image }" />
    <img src="${contextPath}/${review.image}" width="150" height="150" id="preview" /><br>
   </td>   
  </tr>  
  <tr>
     <td ></td> 
    <td>
       <input  type="file"  name="imageFileName " id="i_imageFileName"    onchange="readURL(this);"   />
    </td>
  </tr> 
 </c:when>
 <c:otherwise>
    <tr  id="tr_file_upload" >
		    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
		      이미지
		    </td>
		    <td>
		      <input  type= "hidden"   name="originalFileName" value="${review.image }" />
		    </td>
	    </tr>
	    <tr>
		    <td ></td>
		    <td>
		       <img id="preview"  /><br>
		       <input  type="file"  name="imageFileName" id="i_imageFileName"   disabled   onchange="readURL(this);"   />
		    </td>
	  </tr>
 </c:otherwise>
</c:choose>
<tr>
	   <td width="150" align="center" bgcolor="#FF9933">
	      등록일자
	   </td>
	   <td>
	    <input type=text value="<fmt:formatDate value="${review.date}" />" disabled />
	   </td>   
</tr>

  
<tr  id="tr_btn"    >
 <td colspan="2" align="center">
    
	      <input type=button value="수정하기" onClick="fn_modify_article(frmReview)">
	   
	 
	    <input type=button value="리스트로 돌아가기"  onClick="backToList(this.form)">
	
 </td>
</tr>
</table>
</form>
<script>
function fn_modify_article(obj){
	 obj.action="${contextPath}/review/modReview.do";
	 obj.submit();
}
</script>
</body>
</html>
