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
   .all {
       position: relative;
       height: 1200px;
   }
   
   
   
 .w_review {
	  margin-top: -40px;
	  text-align: left; font-size: 25px;
	  margin-left: 17%;
	  
  	}
       
      #under {
	margin-top: 10px;
	border: 2px solid gray;
	width: 120px;
    margin-left: 17%;
   
  }
      .w_a {
          text-decoration: none;
          color: black;
          font-size: 25px;
      }   

  .w_contents_1 {
	width: 18.5%;
    margin-left: 17%;
    height: 800px;
    background-color: aquamarine;
    position: absolute;
    left: 0%;
    
  }

  .w_contents_2 {
    width:47.5%;
    
    height: 800px;
    background-color: burlywood;
    position: absolute;
    right: 17%;
 
  }
  .re_room1 {
  text-align: center;
  border-radius: 5%;

  }
  .re_p1 {
    font-size: 30px;
    text-align: center;
    margin-top: 10px;

  }
  .w_but {
    position: absolute;
    right: 20px;
    margin-top: 75%;
  }
  </style> 
 
 <meta charset="UTF-8">
 
 <title>리뷰</title>
 </head>
 
 <body>
 

<div class="all">
		
	<br><br><br><br>
	
	<h2 class="w_review"><a class="w_a" href="${contextPath}/reviewBoard.do" >Review</a></h2>
		<p id="under"></p>
		<br><br><br>
	
		 <div class="w_contents_1">
            <img class="re_room1" src="${contextPath}/resources/img/pet_room_1.jpg" alt="소형견 룸">
            <p class="re_p1">소형견</p>

		 </div>
		 
         <div class="w_contents_2">
            
        

        </div>
 
		<br><br><br><br><br>
		
</div>


 
 </body>
 </html>
