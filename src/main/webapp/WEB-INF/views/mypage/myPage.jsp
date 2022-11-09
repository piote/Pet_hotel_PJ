<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	 
<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
   <link rel="stylesheet" href="${contextPath}/resources/css/mypage.css">
   <meta charset="utf-8"  />
   <title>마이페이지</title>
</head>
<body>
   <div id="wrap">
      <div id="container">
         <h2>My Page</h2>
         <div class="mypage_info">
            <table>
               <tr>
                  <td>
                  	<c:choose>
                  		<c:when test="${not empty user.img_name }">
				  	 		<img class="img_info" src="${contextPath}/resources/user/user_image/${user.img_name}" alt="회원 이미지">	
                  		</c:when>
                  		<c:otherwise>
                  			<img class="img_info" src="${contextPath}/resources/img/user.png" alt="회원이미지">
                  		</c:otherwise>
                  	</c:choose>
                  </td>
                  <td>
	      	          <c:choose>
		                  <c:when test="${user.grade eq 'Bronze'}">
                 		  		<img src="${contextPath}/resources/img/bronze_medal.png" width="60px" height="60px" class="benefit">
		                  </c:when>
		                  <c:when test="${user.grade eq 'Silver'}">
		                  		<img src="${contextPath}/resources/img/silver_medal.png" width="60px" height="60px" class="benefit">
		                  </c:when>
		                  <c:when test="${user.grade eq 'Gold'}">
		                  		<img src="${contextPath}/resources/img/gold_medal.png" width="60px" height="60px" class="benefit">
		                  </c:when>
		                  <c:otherwise>
		                  		<div class="normal_medal"></div>
		                  </c:otherwise>
	                  </c:choose>
                  </td>
                  <td>
                     <h3 class="user_info">${user.name }님</h3>
                     <p class="user_info">멤버쉽 등급은 <b>${user.grade}</b>입니다.</p>
                  </td>
                  <td></td>
                  <td>
                     <a href="${contextPath}/pw_changeForm.do"><img src="${contextPath}/resources/img/identification-card.png" alt="정보수정">정보 수정</a>
                     <a href="${contextPath}/membership.do"><img src="${contextPath}/resources/img/crown.png" alt="멤버쉽">멤버쉽</a>
                  </td>
                  <td>
                     <a href="${contextPath}/mypage/checkReserve.do"><img src="${contextPath}/resources/img/checklist.png" alt="예약 내역">예약 내역</a>
                     <a href="${contextPath}/questions/questionsList.do"><img src="${contextPath}/resources/img/faq.png" alt="고객센터">고객센터</a>
                  </td>
               </tr>
            </table>
         </div>
         <div id="reserve">
            <h3>최근 예약 내역</h3>
            <a href="${contextPath}/mypage/checkReserve.do"><img src="${contextPath}/resources/img/plus.png" alt="더보기">more</a>
         </div>  
         <div class="mypage_reserve">
            <table>
				<tr class="reserve-center">
				    <td width="10%">No</td>
				    <td width="25%">PayMent Date</td>
				    <td width="15%">PetName</td>
				    <td width="25%">Reserved Date</td>
				  	<td width="25%">End Date</td>
				</tr>
	            <c:choose>
	            	<c:when test="${empty myReserveList }">
		               <tr class="reserve-list">
		                  <td colspan=5>
		                  	<strong>예약하신 내역이 없습니다.</strong>
		                  </td>
		               </tr>
					</c:when>
					<c:when test="${not empty myReserveList }">
						<c:forEach var="reserves" items="${myReserveList }" begin="0" end="2" step="1" varStatus="res_num">
							<tr class="reserve-list">
				              	<td>${res_num.count}</td>
								<td>${reserves.payTime }</td>
								<td>${reserves.pet_name }</td>
								<td>${reserves.res_st }</td>
								<td>${reserves.res_end }</td>
							</tr>
						</c:forEach>
					</c:when>
               </c:choose>
            </table>
         </div>
         <div id="review">  
            <h3>최근 나의 후기</h3>
            <a href="${contextPath}/review/checkReview.do"><img src="${contextPath}/resources/img/plus.png" alt="더보기">more</a>
         </div>
         <div class="mypage_review">
            <table>
               <tr class="review-center">
                  <td width="8%">NO</td>
                  <td width="15%">Date</td>
                  <td width="77%">Subject</td>
                  
              </tr>
	            <c:choose>
	            	<c:when test="${empty myReviewList }">
		               <tr class="review-list">
		                  <td colspan=3>
		                  	<strong>등록하신 리뷰가 없습니다.</strong>
		                  </td>
		               </tr>
					</c:when>
					<c:when test="${not empty myReviewList }">
						<c:forEach var="reviews" items="${myReviewList}" begin="0" end="2" step="1" varStatus="q_num">
							<tr class="review-list">
								<td>${reviews.reviewNO }</td>
								<td>${reviews.date }</td>
								<td>${reviews.title }</td>
							</tr>
						</c:forEach>
					</c:when>
               </c:choose>
            </table>
         </div>
      </div>
   </div>
</body>
</html>

