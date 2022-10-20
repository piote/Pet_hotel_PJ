<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 <c:set  var="reviewList"  value="${reviewMap.reviewList}" />
 <c:set  var="totArticles"  value="${reviewMap.totArticles}" />
 <c:set  var="section"  value="${reviewMap.section}" />
 <c:set  var="pageNum"  value="${reviewMap.pageNum}" />
 
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
       height: 1300px;
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
	  width:90%;
	    border:1px;
	    font-size: 17px;
	    border-collapse: collapse;
	    padding: 5px;
  }

  .w_tr {
            width: 100% !important;  
            height: 40px;
     
            border-collapse: collapse;
        } 

  .w_tr>.w_td {
   
    font-size: 17px !important ;
    height: 40px;
    
  }
  .w_date{
	  text-align: right;
	  
  }
  
  .w_margin1 {
	  border-top: 0px solid #ddd;
  }
  .w_margin2 {
	  border-bottom: 1px solid #ddd;
  }
  .w_margin3 {
	  border-bottom: 50px solid #fff;
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
        <c:choose>
        <c:when test="${reviewList ==null }" >
          <tr  height="10">
            <td colspan="4">
               <p align="center">
                  <b><span style="font-size:15pt;">등록된 글이 없습니다.</span></b>
              </p>
            </td>  
          </tr>
        </c:when>
        <c:when test="${reviewList !=null }" >
          <c:forEach  var="review" items="${reviewList }" varStatus="reviewNum" >
          <fmt:formatDate var="reviewDate" value="${review.date}" pattern="yyyy.MM.dd"/>
          
        <tr class="w_tr w_margin1">
          <td class="w_td" width="15%">${review.star}</td>
          <td class="w_td" width="50%" rowspan="2">${review.title}</td>
          <td class="w_td" width="20%" rowspan="2">${review.image}</td>
          <td class="w_td w_date"  width="15%" >${reviewDate}</td>
          
        </tr>
      
      <tr class="w_tr" class="w_tr2">
          <td class="w_td">${review.id}</td>	
          <td class="w_td" align=center >${review.rec}</td>
      </tr>  
      <tr class="w_margin2"></tr>
      <tr class="w_margin3"></tr>
      
    </c:forEach>
  </c:when>
 </c:choose>    
     </table>
            

       </div>

		<br><br><br><br><br>

</div>





</body>
</html>





