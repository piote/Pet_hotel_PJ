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
  	
  .back {
    width: 100%;
    height: 800px;
    margin-top: -195px;
    position: absolute;
    z-index: -1;
  }

  .top {
	  margin-top: 50px;
	  text-align: center; font-size: 30px;}
  .review {
	  margin-top: -40px;
	  text-align: left; font-size: 25px;
	  margin-left: 17%;
	  
  	}
 
  .gnb_w>li {
	      width: 350px; height: 350px; line-height: 350px;
	     
	      display: inline-block;
	      list-style: none;
	      border-radius: 5%;
	      font-size: 30px;
	      text-align: center;
	      margin-right: 20px;
	      overflow: hidden;
	      background-size: cover;
          background-position: center;
          transition: all 0.7s;
	  }
  .gnb_w>li>a {
	  	  background-size: cover;
		  display: inline-block;
		  font-size: 20px;
		  width: 100%; height: 100%;
		  transition: all 0.7s;
		  text-decoration: none;
		 
	  }
  
  	 .room_name_1 {
      font-size: 25px;
      text-decoration: none;
      color: black;
      position: absolute;
      left: 26%;
      margin-top: 15px;
      
     }
     .room_name_2 {
      font-size: 25px;
      text-decoration: none;
      color: black;
      position: absolute;
      left: 46%;
      margin-top: 15px;
     }
     .room_name_3 {
      font-size: 25px;
      text-decoration: none;
      color: black;
      position: absolute;
      left: 66%;
      margin-top: 15px;
     }

	/*  img {width: 25%;
	  height: 350px;
	  object-fit: cover;
	  margin-top: 50px;
	  margin-right: 10px;
	  display: inline;
	  border-radius: 5%;
	  transition: all 0.2s linear;
	}
	  img {
          width: 100%; height: 100%;
          opacity: 0; 
          transition: all 1s;
          overflow: hidden;
          border-radius: 5%;
      }*/

  .gnb_w>li>a:hover {
		  transform: scale(1.2);
		  overflow: hidden;
      }
	  
  #under {
	margin-top: 10px;
	border: 2px solid gray;
    width: 260px;
    margin-left: 17%;
    
  }

  .all {
	  margin-top: 150px;
  }
  .img_c {
      text-align: center;
  		overflow: hidden;
    }
   
	  .gnb_w>li:nth-child(1)>a {
	      background-image: url(${contextPath}/resources/img/pet_room_1.jpg);
	  }
	  .gnb_w>li:nth-child(2)>a {
	      background-image: url(${contextPath}/resources/img/pet_room_2.PNG);
	      
	  }
	  .gnb_w>li:nth-child(3)>a {
	      background-image: url(${contextPath}/resources/img/pet_room_3.jpg);
	  }
	
	  .gnb_w {
		  overflow: hidden;
	  }
      
 </style> 

<meta charset="UTF-8">

<title>리뷰 게시판</title>
</head>

<body>


<div class="all">
		
	<br><br><br><br>
	
		<h2 class="review"> Customer Review</h2>
		<p id="under"></p>
		<br><br><br>
		<!--방에 맞는 이미지 사용-->
		 <div class="img_c">
			
		  <ul class="gnb_w">
	        <li><a href="${contextPath}/reviewDetail_1.do"></a></li>
	        <li><a href="${contextPath}/reviewDetail_2.do"></a></li>
	        <li><a href="${contextPath}/reviewDetail_3.do"></a></li>   
	       </ul>
	       
	       <a href="${contextPath}/reviewDetail_1.do" class="room_name_1">소형견(임시)</a>
	       <a href="${contextPath}/reviewDetail_2.do" class="room_name_2">중형견(임시)</a>   
	       <a href="${contextPath}/reviewDetail_3.do" class="room_name_3">대형견(임시)</a>   
	      
       
		 </div>
 
		<br><br><br><br><br>

</div>



</body>
</html>


