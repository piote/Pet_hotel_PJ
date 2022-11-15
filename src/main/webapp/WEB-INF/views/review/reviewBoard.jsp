<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 	%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 -->

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set  var="reviewList"  value="${reviewMap.reviewList}" />
<c:set  var="myReserveList"  value="${myReserveMap.myReserveList}" />
<c:set  var="totReserves"  value="${myReserveMap.totReserves}" />
<c:set var="item_res"  value="24"  />
<c:set  var="section"  value="${myReserveMap.section}" />
<c:set  var="pageNum"  value="${myReserveMap.pageNum}" />
<c:set var="user_id"  value="${myReserveMap.user_id}" />

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
    	   
    	    border: 1px solid #999;
    	    border-radius: 20px;
    	    background-color: #fff;
    	  
    	    text-align: center;
    	   
    	
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
    	        .if {
    	    
    	    	          
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
		       
		       .tb_title{
		    	   font-size: 14px;
		            background-color: rgb(231, 226, 219);
		        }
		        .tb_title td{
		            font-size: 25px;
		            font-weight: bold;
		            color: rgb(231, 226, 219);
		        }
		
		    	 .res_num { width: 10%;}
	             .res_date { width: 20%;}
	             .pet_name { width: 20%;}
	             .res_st { width: 25%;}
	             .re_review { width: 25%;}
		  
	             .list_tb{
	                 border-collapse: collapse;
	                 width: 80%;
	                 height: 40px;
	                 text-align: center;
	                 margin-left: 10%;
	                 margin-top: 50px;
	                 font
	             }
	             .list_tb tr{
	            	 font-size: 35px;
	            	 height: 40px;
	                 border-bottom: 1px solid #d6d6d6;
	             }
	             .list_tb td{
	                 font-size: 17px;
	                 color: #606060;
	             }	
      .welcome {
    	  font-size: 20px;
      }
      .w_col {
    	  color: #ff7f00;
      }
      .welcome {
    	  text-align: center;
    	  margin-left : -4%;
    	  margin-top: 50px;
      }
      .page_num{
          margin-top: 10px;
          text-align: center;
          
      }
      .pageNO{
          display: inline-block;
          margin: 0 5px;
          cursor: pointer;
          font-size: 18px;
         
      }
      .alert {
    	  color: #999999;
      }
      .modal_div{
    	  display: block;
    	  height: 30px;
    	  margin-right: 10%;
      }
      .modal-close {
    	background-color:  white;
  	    border: 2px solid #adb5bd;
  	    width: 70px; height: 25px;
  	    
  	    color: black; 
  	    text-align: center;
  	    text-decoration: none;
  	    display: inline-block;
  	    font-size: 16px;
  	    margin: 4px 2px;
  	    transition-duration: 0.4s;
  	    cursor: pointer;
  	    border-radius: 5%;
  	    float: right;
  	
      }
      
      .modal-close2 {
      	background-color:  white;
    	    border: 2px solid #adb5bd;
    	    width: 90px; height: 30px;
    	    line-height: 30px;
    	    color: black; 
    	    text-align: center;
    	    text-decoration: none;
    	    display: inline-block;
    	    font-size:14px;
    	    margin: 4px 2px;
    	    transition-duration: 0.4s;
    	    cursor: pointer;
    	    border-radius: 5%;
    	    position: absolute; 
    	    right: 17%;
    	    top: 35%;
    	
        }
     
      .modal-close:hover {
	    	background-color: #adb5bd;
	  	    color: white;
      }
      .modal-close2:hover {
	    	background-color: #adb5bd;
	  	    color: white;
    }
      
      
 </style> 

<meta charset="UTF-8">

<title>리뷰 게시판</title>
<script src="${contextPath}/resources/js/reviewPage.js"></script>
</head>

<body>
<script>


</script>


<div class="all">
      
   <br><br><br><br>
   
      <h2 class="review"> Customer Review</h2>
      <p id="under"></p>
   
      <br><br><br>
      <!-- 전체 레이아웃 -->
      <div id="wrap">
       <!-- Content -->
       <section class="content">
           <div class="container">
           <input id="user_id" type="hidden" value="${user_id}">
           <div> 
           
               <!-- 팝업용 임시 버튼입니다. -->
               <c:choose>
               <c:when test="${false == isLogOn}">
               
                <div class="btn-box">
               		<a href="#" class="modal-close2" onClick="javascript:notlog();">
	    		<span>리뷰 쓰기</span>
	    		</a>
	    		</div>
         		</c:when>
         		<c:when test="${null == isLogOn}">

                <div class="btn-box">
               		<a href="#" class="modal-close2" onClick="javascript:notlog();">
	    		<span>리뷰 쓰기</span>
	    		</a>
	    		</div>
         		</c:when>

         	    <c:otherwise>
         	    	<div class="btn-box">
         	    		<a href="#" class="modal-close2" onClick="javascript:popOpen();">
         	    		<span>리뷰 쓰기</span>
                   </a>
                   
                    </div>
                 
         		</c:otherwise>
         		</c:choose>
              
               
               <!-- //팝업용 임시 버튼입니다. -->
           </div>
       </section>
       <!-- //Content -->       
     </div>
     <!-- //전체 레이아웃 -->

     <!-- modal 영역 -->
     <div class="modal-bg" onClick="javascript:popClose();"></div>
     <div class="modal-wrap">
     <div class="list_wrap">
     <div class="list_option">
     <div class="welcome"> <span class="w_col"> ${user_id}</span>님 반갑습니다.</div>

		<!-- 테이블 -->
     <table class="list_tb">
         <tr class="tb_title">
             <td class="res_num">No</td>
             <td class="res_date">Date</td>
             <td class="pet_name">PetName</td>
             <td class="res_sta">Status</td>
             <td class="re_review">Review</td>
         </tr>
     </table>
     

				
             <div class="page_num">
             <li class="pageNO" onClick="pageDown()">pre</li>
	            <c:forEach varStatus="i" begin="0" end="${PI}">
				<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다. -->
					<li class="pageNO" onClick="clickNO(${i.count-1})">${i.count}</li>
				</c:forEach>
             <li class="pageNO" onClick="pageUP()">next</li></div>
        
  <div class="modal_div">   <button class="modal-close" onClick="javascript:popClose();">닫기</button></div>
 </div>
 </div>	
 </div>
     <!-- //modal 영역 -->

      
      <!--방에 맞는 이미지 사용-->
       <div class="img_c">
         
        <div class="gnb_w">
        	<div class="w_wrap">
	        	<div class="img_wrap">
	           	<a href="${contextPath}/review/reviewDetail_1.do"></a>
	           	</div>
	           	<a href="${contextPath}/review/reviewDetail_1.do" class="room_name">Deluxe</a>
        	</div>
        	<div class="w_wrap">
	           	<div class="img_wrap">
	           		<a href="${contextPath}/review/reviewDetail_2.do"></a>
	           	</div>
	           	<a href="${contextPath}/review/reviewDetail_2.do" class="room_name">Suite</a>
           	</div>
           	<div class="w_wrap">
	           	<div class="img_wrap">
	           		<a href="${contextPath}/review/reviewDetail_3.do"></a>
	           	</div> 
	           	<a href="${contextPath}/review/reviewDetail_3.do" class="room_name">Superior</a>
	        </div>   
          </div>
       
       </div>
 
      <br><br><br><br><br>

</div>
<script>

function notlog() {
	alert("로그인을 해주세요");
}




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
function callFunction(){
alert("이미 작성한 리뷰입니다.");
}



    </script>

</body>
</html>
