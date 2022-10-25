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

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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

  
</script>
<!--  <title>글쓰기창</title> -->
</head>
<body>
<h1 style="text-align:center">글쓰기</h1>
  <form name="reviewForm" id="reviewForm" method="post"   action="${contextPath}/review/addNewReview.do"   enctype="multipart/form-data">
    <table border="0" align="center">

      <tr>
					<td align="right"> 작성자</td>
					<td colspan=2  align="left"><input type="text" size="20" maxlength="100"  value="${user.id }" readonly/> </td>
			</tr>
	     <tr>
			   <td align="right">글제목: </td>
			   <td colspan="2"><input type="text" size="67"  maxlength="500" name="title" /></td>
		 </tr>
	 		<tr>
				<td align="right" valign="top">
						<span class="text-bold">별점을 선택해주세요</span>
				  
				</td>
				<td colspan=2>
					
						<fieldset>
							
							<input type="radio" name="rate" class="rate" value="5" id="rate1"><label
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
     </tr>	
 	<tr>
	<td align="right" valign="top"><br>추천: </td>
	<td colspan=2><textarea name="rec" rows="10" cols="65" maxlength="50"></textarea> </td>
</tr>
     <tr>
		<!--  <td align="right">이미지파일 첨부:  </td>
			  <td><input type="file" name="imageFileName"  onchange="readURL(this);" /></td>
			  <td><img  id="preview" src="#" alt="이미지 파일"  width=200 height=200/></td> -->
			  
			  
 			  <td align="right">이미지파일 첨부</td> 
 			  <td align="left"> <input type="button" value="파일 추가" onClick="fn_addFile()"/></td> 
				
				
	   </tr>
	   <tr>
	      <td colspan="4"><div id="d_file"></div></td>
	   </tr>
	    <tr>
	      <td align="right"> </td>
	      <td colspan="2">
	       <input type="submit" id="save" value="글쓰기" />
	       <input type=button value="목록보기"onClick="backToList(this.form)" />
	      </td>
     </tr>
    </table>
  </form>
</body>
</html>
