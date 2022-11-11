<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 <c:set  var="reviewList"  value="${reviewMap.reviewList}" />
 <c:set  var="totReview"  value="${reviewMap.totReview}" />
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
 
 <script src="${contextPath}/resources/js/jquery.js" type="text/javascript" charset="utf-8"></script>
 <link rel="stylesheet" href="${contextPath}/resources/css/prettyPhoto.css" type="text/css" media="screen" charset="utf-8" />
 <script src="${contextPath}/resources/js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>


   
   

  
<style>
   .all {
       
       margin-top: 250px;
       height: 2200px;
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

    	  .cls2 {
    		  
    		  left: 30%;
    		  margin-top: 1900px;
    		  position: absolute;
    		  font-size: 20px;
    		  }
    	   
    	  .no-uline {text-decoration:none;}

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
   
    font-size: 15px ;
    height: 75px;
    
  }
  .w_date{
	  text-align: center;
	  
  }
  
  .w_margin1 {
	  border-top: 0px solid #ddd;
  }
 
  .w_margin3 {
	  border-bottom: 50px solid #fff;
  }
  .w_star {
	  width:100%;
	  height: 23px;
  }
  .w_td_title{
	  margin-left: 50px;
	  margin-right: 50px;
  }
  
  
  
  .w_tdz1 {
	  height: 15px;
	  border-bottom: 1px solid #ddd;
  }
  .w_tdz2 {
	  height: 15px;
	  
  }
  .re_image {
	  border-radius: 5%;
	  
  }
  .Y_heart{
	  content:url("${contextPath}/resources/img/r_heart.png");
	
  }
  
  .N_heart{
	  content:url("${contextPath}/resources/img/w_heart.png");
  }
  

  
  </style> 
 
 <meta charset="UTF-8">
 
 <title>리뷰</title>
 
 <script type="text/javascript">
 
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
 
 $(document).ready(function(){
     $("a[rel^='prettyPhoto']").prettyPhoto();
     
     var sort_ck = null;
     var searchMap = new Object();
     searchMap.sort_ck=sort_ck;
     
     sort_ck=$('.sort_option input[name="sort"]:checked').val();
     console.log(sort_ck);
     
   })
 

 	function changeType(){
 		var tmpType = $("input[name='sort']:checked").val();
 			// A Type 클릭 시 A 출력, B Type 클릭 시 B 출력
 	}
 
 
 
 /* 좋아요 */
 function like_func(N){

   var reviewNO = $('#reviewNO_'+N).val();

   $.ajax({
     url: "/like/like.do",
     type: "POST",
     cache: false,
     dataType: "json",
     data:  {"review_num":reviewNO},
     
     success: function(data) {
            
             //좋아요 이미지 변경 
       if(data. like_check == 'N'){
         
         $("#like_img_"+N).removeClass('N_heart');
         $("#like_img_"+N).addClass('Y_heart');
         
       } else {
         
         $("#like_img_"+N).removeClass('Y_heart');
         $("#like_img_"+N).addClass('N_heart');
         
       } 

       console.log(data.like_cnt);
       
       $('#like_cnt_'+N).text(data.like_cnt);
       $('#like_check').html(data.like_check);
       
       
     },
     error: function(request, status, error){
       alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
     }
   });
 }

 
 
 
 
 
 
 </script>
 
 
 </head>

 <body>


<div class="all">
	


	<br><br><br><br>
	
	<h2 class="w_review"><a class="w_a" href="${contextPath}/review/reviewBoard.do" >Deluxe Review</a></h2>
		<p id="under"></p>
		<br><br><br>
	
		 <div class="w_contents_1">
            <img class="re_room1" src="${contextPath}/resources/img/pet_room_1.jpg" alt="소형견 룸">
            <p class="re_p1">Deluxe</p>

		 </div>
		 
		 <div class="w_contents_2">
         <br>
        
         <!-- name 접근으로 value 값 체크 -->
	         
	         <div class="sort_option">
		         <input type="radio" id="sort_data" name="sort" value="sort_data" onchange="changeType()" checked><label for="sort_data" >최신순</label>
		         <input type="radio" id="sort_rec" name="sort" value="sort_rec" onchange="changeType()"><label for="sort_rec" >좋아요</label>
	         </div>
     
         
         <div>
   
<form name="frmReview" method="post"  action="${contextPath}"  enctype="multipart/form-data">
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
	         <td class="w_td" width="15%">  	
	          		<c:if test="${review.rate==5}">
	                    <img src="${contextPath}/resources/img/star_5.png" class="w_star">   
	                </c:if> 
	                <c:if test="${review.rate==4}">
	                    <img src="${contextPath}/resources/img/star_4.png" class="w_star" >    
	                </c:if>
	                <c:if test="${review.rate==3}">
	                    <img src="${contextPath}/resources/img/star_3.png" class="w_star">    
	                </c:if>    
	                <c:if test="${review.rate==2}">
	                    <img src="${contextPath}/resources/img/star_2.png" class="w_star">    
	                </c:if>  
	                <c:if test="${review.rate==1}">
	                    <img src="${contextPath}/resources/img/star_1.png" class="w_star">    
	                </c:if>   
	         </td>
	         
	         <td class="w_td" width="50%" rowspan="2"><div class="w_td_title" >${review.title} ${reviewNum.count}</div></td> 
	         <td class="w_td" width="50%" rowspan="2"><div class="w_td_title" >${review.like_cnt}</div></td> 
	         <td class="w_td" width="50%" rowspan="2"><div class="w_td_title" >${review.user_review_flg}</div></td> 
	         <td class="w_td" width="20%" rowspan="2">               
	           <c:choose>
	          
	         <c:when test="${review.image != null}"> 
	                   <a href="${contextPath}/${review.image}" rel="prettyPhoto" title="This is the description"><img class="re_image " src="${contextPath}/${review.image}" width="150" height="150" alt="This is the title" />
	                </c:when>
	               
	                <c:otherwise>
	                </c:otherwise>
	           </c:choose>   
	               
	         </td>
	          <td class="w_td w_date"  width="15%" >${reviewDate}</td>
	          </tr>      
	      <tr class="w_tr" class="w_tr2">
	          <td class="w_td" align=center >
	          <input type="hidden" id="reviewNO_${reviewNum.count}" name="reviewNO" value="${review.reviewNO }"/>
	          <input type="hidden" id="review_id_${reviewNum.count}" name="id" value="${review.id }"/>
	          
	          
	          ${review.id}
	          </td>	
	          <td class="w_td" align=center >
	       						
	       						
	       					<c:choose>
	       					  <c:when test="${null != isLogOn}">
	       					    <a href='javascript: like_func(${reviewNum.count});' id = "${reviewNum.count}"><img src="" id='like_img_${reviewNum.count}'  class="like_img ${review.user_review_flg}_heart" ><span id="like_cnt_${reviewNum.count}">${review.like_cnt}</span></a>
	       					  </c:when>
	       					  <c:otherwise>
	       					    <a href='javascript: notlog(${reviewNum.count});' id = "${reviewNum.count}"><img src="${contextPath}/resources/img/w_heart.png"><span>${review.like_cnt}</span></a>
	       					  </c:otherwise>
	       					</c:choose>			
	          </td>
	      </tr>  
	      <tr>
	      	<td class="w_tdz1" colspan="4">  </td>
	      
	      </tr>
	      <tr>
	      <td class="w_tdz2" colspan="4"></td>
	      </tr>
    
    </c:forEach>
  </c:when>
 </c:choose>    
     </table>
     </form>       
     
	
     
       </div>

    
       
		<br><br><br><br><br>

		


	<div class="cls2">
	<c:if test="${totReview != null }" >
	     <c:choose>
	       <c:when test="${totReview >100 }">  <!-- 글 개수가 100 초과인경우 -->
		      <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }">
		          <a class="no-uline" href="${contextPath }/review/reviewDetail_1.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; pre </a>
		         </c:if>
		          <a class="no-uline" href="${contextPath }/review/reviewDetail_1.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a class="no-uline" href="${contextPath }/review/reviewDetail_1.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
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
		            <a class="sel-page"  href="${contextPath }/review/reviewDetail_1.do?section=${section}&pageNum=${page}">${page } </a>
		          </c:when>
		          <c:otherwise>
		            <a class="no-uline"  href="${contextPath }/review/reviewDetail_1.do?section=${section}&pageNum=${page}">${page } </a>
		          </c:otherwise>
		        </c:choose>
		      </c:forEach>
	       </c:when>
	     </c:choose>
	   </c:if>
	 </div>    

</div>

<script>
function fn_modify_article(obj){
	 obj.action="${contextPath}/board/modArticle.do";
	 obj.submit();
}

function notlog() {
	alert("로그인을 해주세요");
}

			
		
		 
</script>


</body>
</html>
