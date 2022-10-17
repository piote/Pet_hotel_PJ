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
       
       margin-top: 250px;
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
	width: 215px;
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
    	    height: 100%;
    	    
    	    position: absolute;
    	    left: 0%;
    	    display: inline-block;
    	    
    	  }

    	  .w_contents_2 {
    	    width:47.5%;
    	    
    	    height: 100%;
    	    
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



  .w_review2 {
    width: 90%;
   margin-bottom: 30px !important;
  
  }

  .w_tr {
            width: 100% !important;  
        } 

  .w_tr>.w_td {
    border: 0px solid rgba(107, 107, 107, 0.3) !important;
    font-size: 17px !important ;
    
  }
  
 
  
	
  </style> 
 
 <meta charset="UTF-8">
 
 <title>리뷰</title>
 </head>
 
 <body>
 

<div class="all">
		
	<br><br><br><br>
	
	<h2 class="w_review"><a class="w_a" href="${contextPath}/reviewBoard.do" >소형견 Review</a></h2>
		<p id="under"></p>
		<br><br><br>
	
		 <div class="w_contents_1">
            <img class="re_room1" src="${contextPath}/resources/img/pet_room_1.jpg" alt="소형견 룸">
            <p class="re_p1">소형견</p>

		 </div>
		 
		 <div class="w_contents_2">
         <br>

         <div>
         <table align="right" class="w_review2">
           <tr class="w_tr">
             <td class="w_td" width="15%">별점</td>
             <td class="w_td" width="50%" rowspan="2">컨텐츠</td>
             <td class="w_td" width="20%" rowspan="2">이미지</td>
             <td class="w_td" width="15%" >작성일</td>
         </tr>
         <tr class="w_tr">
             <td class="w_td">유저ID</td>
             <td class="w_td">좋아요</td>
         </tr>    
        </table>

        <table align="right" class="w_review">
        <c:choose>
        <c:when test="${articlesList !=null }" >
          <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
       
       
       
        <tr class="w_tr">
          <td class="w_td" width="15%">${article.star}</td>
          <td class="w_td" width="50%" rowspan="2">${article.title}</td>
          <td class="w_td" width="20%" rowspan="2">${article.image}</td>
          <td class="w_td" width="15%" >${article.writeDate}</td>
      </tr>
      <tr class="w_tr">
          <td class="w_td">${article.id}</td>
          <td class="w_td">${article.date}</td>
      </tr>    
    </c:forEach>
  </c:when>
 </c:choose>    
     </table>
            

       </div>

		<br><br><br><br><br>

</div>





</body>
</html>





