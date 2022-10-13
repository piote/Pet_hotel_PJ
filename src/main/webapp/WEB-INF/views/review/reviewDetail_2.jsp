<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 -->

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set  var="articlesList"  value="${articlesMap.articlesList}" />
<c:set  var="totArticles"  value="${articlesMap.totArticles}" />
<c:set  var="section"  value="${articlesMap.section}" />
<c:set  var="pageNum"  value="${articlesMap.pageNum}" />

<!--
<%
  request.setCharacterEncoding("UTF-8");
%>  
-->
<!DOCTYPE html>
<html>
<head>
  <style>
  
  .review {
     margin-top: -40px;
     text-align: left; font-size: 25px;
     margin-left: 17%;
     
     }    
  #under {
   margin-top: 10px;
   border: 2px solid gray;
    width: 260px;
    margin-left: 17%;
    
  }

  .all {
     margin-top: 250px;
  }
  
   

     
      
 </style> 

<meta charset="UTF-8">

<title>리뷰 게시판</title>
</head>

<body>


<div class="all">
      
   <br><br><br><br>
   
      <h2 class="review">소형견 Review</h2>
      <p id="under"></p>
      <br><br><br>
      <!--방에 맞는 이미지 사용-->
       
 
      <br><br><br><br><br>

</div>



</body>
</html>