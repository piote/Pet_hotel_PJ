<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
   <link rel="stylesheet" href="${contextPath}/resources/css/mypage.css">
   <script src="/js/scriptTest.js" type="text/javascript"></script>
   <meta charset="utf-8"  />
   <title>My Page</title>
</head>
<body>
   <div id="wrap">
      <div id="container">
         <h2>My Page</h2>
         <div class="mypage_info">
            <table>
               <tr>
                  <td>
                     <img class="img_info" src="${contextPath}/resources/img/user.png" alt="회원이미지">
                  </td>
                  <td>
                     <h4>테스트${memberInfo.name }님</h4>
                     <br>
                     <br>
                     <p>전화: 010-0000-0000${memberInfo.tel}</p>
                     <br>
                     <p>이메일: testtesttest@naver.com${memberInfo.email} </p>
                  </td>
                  <td>
                     <a href="${contextPath}/pw_change.do">회원정보수정</a>

                     <a href="#">고객센터</a>
                     <a href="#">#</a>
                  </td>
                  <td>
                     <a href="#">#</a>
                     <a href="#">#</a>
                  </td>
                  <td>
                     <img class="img_membership" src="${contextPath}/resources/img/crown.png" alt="My 혜택">
                     <a class="membership" href="#">MemberShip</a>
                     <img class="img_point" src="${contextPath}/resources/img/point.png" alt="포인트">
                     <a class="point" href="#">0 Point</a>
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
				    <td>Date</td>
				    <td>Name</td>
				    <td>PetName</td>
				    <td>Phone Number</td>
				</tr>
	            <c:choose>
	            	<c:when test="${empty myReserveList }">
		               <tr>
		                  <td colspan=4>
		                  	<strong>예약하신 내역이 없습니다.</strong>
		                  </td>
		               </tr>
					</c:when>
					<c:when test="${not empty myReserveList }">
						<c:forEach var="i" items="${myReserveList }" begin="0" end="2" step="1">
							<tr>
								<td>${myReserveList[i].user_joinDate }</td>
								<td>${myReserveList[i].user_name }</td>
								<td>${myReserveList[i].pet_name }</td>
								<td>${myReserveList[i].user_tel }</td>
							</tr>
						</c:forEach>
					</c:when>
               </c:choose>
            </table>
         </div>
         <div id="review">  
            <h3>최근 나의 후기</h3>
            <a href="#"><img src="${contextPath}/resources/img/plus.png" alt="더보기">more</a>
         </div>
         <div class="mypage_review">
            <table>
               <tr class="review-center">
                  <td>Date</td>
                  <td>Subject</td>
                  <td>Contents</td>
              </tr>
<%-- 	            <c:choose> --%>
<%-- 	            	<c:when test="${empty myReviewList }"> --%>
		               <tr>
		                  <td colspan=4>
		                  	<strong>등록하신 리뷰가 없습니다.</strong>
		                  </td>
		               </tr>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${not empty myReviewList }"> --%>
<%-- 						<c:forEach var="i" begin="0" end="2" step="1"> --%>
<!-- 							<tr> -->
<%-- 								<td>${myReviewList[i].review_date }</td> --%>
<%-- 								<td>${myReviewList[i].review_title }</td> --%>
<%-- 								<td>${myReviewList[i].review_con }</td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<%-- 					</c:when> --%>
<%--                </c:choose> --%>
            </table>
         </div>
      </div>
   </div>
</body>
</html>

