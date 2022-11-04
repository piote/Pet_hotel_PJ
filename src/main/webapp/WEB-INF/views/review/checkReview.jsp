<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<c:set  var="reviewList"  value="${myReviewMap.myReviewList}" />
<c:set  var="totArticles"  value="${myReviewMap.totArticles}" />
<c:set  var="section"  value="${myReviewMap.section}" />
<c:set  var="pageNum"  value="${myReviewMap.pageNum}" />
<c:set var="user_id"  value="${myReviewMap.user_id}" />
<c:set  var="res_num"  value="${res_num}" />


<%
  request.setCharacterEncoding("UTF-8");
%> 
<html>
<head>
<style>

  
	
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
  var Cell3 = newRow.insertCell();
  
</script>
<!--  <title>글쓰기창</title> -->
</head>
<body>
<div>
   <input id="user_id" type="hidden" value="${user_id}">
</div>
<table align="center" border="1"  width="80%"  >
<tr height="10" align="center"  bgcolor="lightgreen">
   <td >글번호</td>
   <td >작성자</td>              
   <td >제목</td>
   <td >작성일</td>
   <td >수정하기</td>
   <td >삭제하기</td>
</tr>
<c:choose>
<c:when test="${reviewList ==null }" >
  <tr  height="10">
    <td colspan="6">
       <p align="center">
          <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
      </p>
    </td>  
  </tr>
</c:when>
<c:when test="${reviewList != null }" >
  <c:forEach  var="review" items="${reviewList }" varStatus="reviewNum" >
  <fmt:formatDate var="reviewDate" value="${review.date}" pattern="yyyy.MM.dd"/>
   <tr align="center">
	<td width="5%">${reviewNum.count}</td>
	<td width="10%">${review.id}</td>
	<td>${review.title} </td>
	  <td  width="10%">${reviewDate}</td> 
	  <td> <a class='cls1' href="${contextPath}/review/viewReview.do?reviewNO=${review.reviewNO}">수정하기</a> </td>
	  <td>삭제하기 ! </td>
	  </tr>
  </c:forEach>
   </c:when>
  </c:choose>    
</table>
<script>


</script>
</body>
</html>
