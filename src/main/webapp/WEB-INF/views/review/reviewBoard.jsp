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
 
  .img_wrap {
         width: 400px; height: 400px; line-height: 400px;
        
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
  .img_wrap>a {
          background-size: cover;
        display: inline-block;
        font-size: 20px;
        width: 100%; height: 100%;
        transition: all 0.7s;
        text-decoration: none;
       
     }
  
      .room_name{
    	  font-size: 20px;
    	  text-decoration: none;
    	  color: black;
    	  margin-top: 15px;
    	  line-height: 40px;
      
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

  .img_wrap>a:hover {
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
     margin-top: 250px;
  }
  .img_c {
      text-align: center;
        overflow: hidden;
    }
   
     .w_wrap:nth-child(1)>.img_wrap>a {
         background-image: url(${contextPath}/resources/img/pet_room_1.jpg);
     }
     .w_wrap:nth-child(2)>.img_wrap>a {
         background-image: url(${contextPath}/resources/img/pet_room_3.jpg);
         
     }
     .w_wrap:nth-child(3)>.img_wrap>a {
         background-image: url(${contextPath}/resources/img/pet_room_2.PNG);
     }
   
     .gnb_w {
    	 width: 1270px;
    	 height: 500px;
    	 margin: 0 auto;
    	 display: flex;
    	 flex-direction: row;
    	 justify-content: space-between;
    	 
     }
     .w_wrap{
    	 width:400px;
    	 height: 100%;
     }
     
     .w_review {
    	 position: absolute;
    	 margin-top: -40px;
    	 text-align: left; font-size: 25px;
    	margin-left: 50%;
     }
     
     .btn-open {
    	    width: 110px; height: 30px;
    	    border: 1px solid #999;
    	    border-radius: 20px;
    	    background-color: #fff;
    	    font-size:14px;
    	    text-align: center;
    	    line-height: 30px;
    	    position: absolute; right: 20%; top: 35%;
    	  }
    	  .btn-open:hover{
    	    border-color: #e59f5a;
    	    background-color: #e59f5a;
    	    color: #fff;
    	  }

    	        .btn-open {
    	          text-decoration: none;
    	        }
    	       

    	        .btn-box .btn-open span {
    	            color: #000;
    	            
    	        }
    	        
    	        /* 팝업 스타일 */
    	        .modal-bg {
    	          display:none;
    	          width:100%;
    	          height:100%;
    	          position:fixed;
    	          top:0;left:0;right:0;
    	          background: rgba(0, 0, 0, 0.6);
    	          z-index:999;
    	        
    	        }
    	       
    	       
    	        .modal-wrap {
    	          display:none;
    	          position:absolute;
    	          top:50%;
    	          left:50%;
    	          transform:translate(-50%,-50%);
    	          width:600px;
    	          height:800px;
    	          background:#fff;
    	          z-index:1000;
    	          border-radius:15px;
    	          padding: 5px;
    	        
    	          }

		       .detail_reserve{
		    	   margin: 0 auto;
		    	   width: 80%;
		    	   height: 35px;
		    	   line-height: 30px;
		    	   border-top: 1px solid black;
		    	   border-bottom: 1px solid rgba(200, 200, 200, 0.5);
		    	   position: relative;
		    	   top: 110px;
		    	   background-color: rgb(231, 226, 219);
		    	}
		
		    	.w_table {
		    	  width: 100%;
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
      
      <div class="w_review">
      <input type="button" id="btn_pet2_4" value="리뷰 쓰기" onclick="popup()">
   // <a href="${contextPath}/review/reviewForm.do?res_num=${res_num}">글쓰기(임시)</a>
      </div>
      
      <br><br><br>
      <!-- 전체 레이아웃 -->
      <div id="wrap">
       <!-- Content -->
       <section class="content">
           <div class="container">
               <!-- 팝업용 임시 버튼입니다. -->
               <div class="btn-box">
                   <a href="#" class="btn-open" onClick="javascript:popOpen();">
                       <span>리뷰 쓰기</span>
                   </a>
               </div>
               <!-- //팝업용 임시 버튼입니다. -->
           </div>
       </section>
       <!-- //Content -->       
     </div>
     <!-- //전체 레이아웃 -->

     <!-- modal 영역 -->
     <div class="modal-bg" onClick="javascript:popClose();"></div>
     <div class="modal-wrap">
       <div class="detail_reserve">
         <table class="w_table">
           <tr class="detail-center">
             <td width="15%">No</td>
             <td width="15%">Date</td>   
             <td width="25%">PetName</td>
             <td width="25%">Status</td>
             <td width="20%">Review</td>
           </tr>
         </table>
       </div>  
     <button class="modal-close" onClick="javascript:popClose();">닫기</button>
     </div>
     <!-- //modal 영역 -->

      
      <!--방에 맞는 이미지 사용-->
       <div class="img_c">
         
        <div class="gnb_w">
        	<div class="w_wrap">
	        	<div class="img_wrap">
	           	<a href="${contextPath}/review/reviewDetail_1.do"></a>
	           	</div>
	           	<a href="${contextPath}/review/reviewDetail_1.do" class="room_name">소형견(임시)</a>
        	</div>
        	<div class="w_wrap">
	           	<div class="img_wrap">
	           		<a href="${contextPath}/review/reviewDetail_2.do"></a>
	           	</div>
	           	<a href="${contextPath}/review/reviewDetail_2.do" class="room_name">중형견(임시)</a>
           	</div>
           	<div class="w_wrap">
	           	<div class="img_wrap">
	           		<a href="${contextPath}/review/reviewDetail_3.do"></a>
	           	</div> 
	           	<a href="${contextPath}/review/reviewDetail_3.do" class="room_name">대형견(임시)</a>
	        </div>   
          </div>
       
       </div>
 
      <br><br><br><br><br>

</div>

<script>
function popOpen() {

var modalPop = $('.modal-wrap');
var modalBg = $('.modal-bg'); 

$(modalPop).show();
$(modalBg).show();

}

function popClose() {
var modalPop = $('.modal-wrap');
var modalBg = $('.modal-bg');

$(modalPop).hide();
$(modalBg).hide();

}
    </script>

</body>
</html>

