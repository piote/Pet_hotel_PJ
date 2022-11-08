<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<c:set  var="reviewList"  value="${myReviewMap.myReviewList}" />
<c:set  var="totReview"  value="${myReviewMap.totReview}" />
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

.tb_title{
	   font-size: 14px;
     background-color: rgb(231, 226, 219);
 }
 .tb_title td{
     font-size: 25px;
     font-weight: bold;
     color: rgb(231, 226, 219);
     
 }

.list_tb{
    border-collapse: collapse;
    width: 1270px;
    margin: 0 auto;
    height: 40px;
    text-align: center;
    vertical-align; middle    
    
}
h2 {
    text-align: center;
    width: 1270px;
    height: 20px;
    margin: 0 auto;
}
.list_tb tr{
	 font-size: 35px;
	 height: 40px;
    border-bottom: 1px solid #d6d6d6;
    vertical-align; middle
}
.list_tb td{
    max-width: 100px;
    white-space: nowrap;
    text-overflow: ellipsis;
    font-size: 17px;
    color: #606060;
    margin-left: 50px;
    margin-right: 50px;
    overflow: hidden;
}	

.cls2 {
	margin-left : 47.5%;
    margin-top: 15px;
    margin-bottom: 15px;
}
.sel-page {
	font-size : 18px;
}
.no-uline {
	font-size : 18px;
}
.w_td_title{
	  margin-left: 50px;
	  margin-right: 50px;
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
  var Cell3 = newRow.insertCell();
  
</script>
<!--  <title>글쓰기창</title> -->
</head>
<body>
<div>
   <input id="user_id" type="hidden" value="${user_id}">
</div>
<div >
<h2>리뷰 조회</h2>
<br><br><br>
<table class="list_tb">
<tr class="tb_title" >
   <td >No</td>
   <td >ID</td>              
   <td >Review</td>
   <td >작성일</td>
   <td >수정</td>
   <td >삭제</td>
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
	<td width="7%">${reviewNum.count}</td>
	<td width="10%">${review.id}</td>
	<td width="59%" class="w_td_title">${review.title} </td>
	  <td  width="10%">${reviewDate}</td> 
	  <td width="7%"> <a class='cls1' href="${contextPath}/review/viewReview.do?reviewNO=${review.reviewNO}">수정</a> </td>
	  <td width="7%"> <input type=button value="삭제" onClick="fn_remove_review('${contextPath}/review/removeReview.do', ${review.reviewNO})"> </td>
	  </tr>
	  
	  
	  
  </c:forEach>
   </c:when>
  </c:choose>    
</table>
</div>

<div class="cls2">
<c:if test="${totReview != null }" >
     <c:choose>
       <c:when test="${totReview >100 }">  <!-- 글 개수가 100 초과인경우 -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	         <c:if test="${section >1 && page==1 }">
	          <a class="no-uline" href="${contextPath }/review/checkReview.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; pre </a>
	         </c:if>
	          <a class="no-uline" href="${contextPath }/review/checkReview.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
	         <c:if test="${page ==10 }">
	          <a class="no-uline" href="${contextPath }/review/checkReview.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
	         </c:if>
	      </c:forEach>
       </c:when>
       <c:when test="${totReview ==100 }" >  <!--등록된 글 개수가 100개인경우  -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	        <a class="no-uline"  href="#">${page } </a>
	      </c:forEach>
       </c:when>
       
       <c:when test="${totReview< 100 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
	      <c:forEach   var="page" begin="1" end="${totReview/10 +1}" step="1" >
	         <c:choose>
	           <c:when test="${page==pageNum }">
	            <a class="sel-page"  href="${contextPath }/review/checkReview.do?section=${section}&pageNum=${page}">${page } </a>
	          </c:when>
	          <c:otherwise>
	            <a class="no-uline"  href="${contextPath }/review/checkReview.do?section=${section}&pageNum=${page}">${page } </a>
	          </c:otherwise>
	        </c:choose>
	      </c:forEach>
       </c:when>
     </c:choose>
   </c:if>
 </div>   
 
<script>

function fn_remove_review(url,reviewNO){
	 var form = document.createElement("form");
	 form.setAttribute("method", "post");
	 form.setAttribute("action", url);
    var reviewNOInput = document.createElement("input");
    reviewNOInput.setAttribute("type","hidden");
    reviewNOInput.setAttribute("name","reviewNO");
    reviewNOInput.setAttribute("value", reviewNO);
	 
    form.appendChild(reviewNOInput);
    document.body.appendChild(form);
    form.submit();

}

</script>
</body>
</html>
