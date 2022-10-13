<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
	<head>
	   <link rel="stylesheet" href="${contextPath}/resources/css/member.css">
	   <meta charset="UTF-8">
	   <title>회원 수정창</title>
	</head>
	<body>
	   <div id="wrap">
	   <section class="container">
	      <form method="post">   <action="${contextPath}/member/modMember.do">
	      <h3>회원 정보 수정</h3>
	      <div class="modCon">
		      <table>
		         <tr>
			            <td><p align="center">아이디</td>
			            <td><input class="txtBox" type="text" name="id" value="${userInfo.id }" disabled/> </td>
		         </tr>
		         <tr>
			            <td><p align="center">비밀번호</td>
			            <td><input class="txtBox" type="password" name="pwd"  value="${userInfo.pw }" /></td>
		         </tr>
		         <tr>
			            <td><p align="center">이름</P></td>
			            <td><input class="txtBox" type="text" name="name"  value="${userInfo.name }" disabled/></td>
		         </tr>
		 		 <tr>
			            <td><p align="center">이메일</P></td>
			            <td><input class="txtBox" type="text" name="email"  value="${userInfo.email }"></td>
		         </tr>
		          <tr>
		                <td><p align="center">휴대전화</P></td>
		                <td><input class="txtBox" type="text" name="tel"  value="${userInfo.tel }"></td>
		         </tr>
		          <tr>
		                <td><p align="center">비상전화</P></td>
		                <td><input class="txtBox" type="text" name="tel_sub" value="${userInfo.tel_sub}"></td>
		          </tr>
		          <tr>
		               <td><p align="center">수신여부</P></td>
		               <td>
		                  <input type="checkbox" name="emailsts_yn"  value="N"  /> Yes
		                  <input type="checkbox" name="emailsts_yn"  value="N"  /> No	
		               </td>
	               </tr>
		           <tr>
		               <td><p align="center">생년월일</P></td>
		               <td><input class="txtBox" type="text" name="birth" ></td>
	               </tr>
		         <tr>
			           <td><p align="center">가입일</td>
			           <td><input class="txtBox" type="text" name="joinDate" size="20" value="${userInfo.joinDate}"  disabled/></td>
		         </tr>
		         
		     </table>
		     
	         <ul>
	            <li><input class="btn1" type="button" value="수정하기" onClick= " "></li>
		        <li><input class="btn2" type="button" value="수정취소" onClick= " "></li>
		     </ul>
		     <p>아이디, 이름, 가입일은 수정이 불가능합니다.</p>
		     <div><input class="btn3" type="button"  value="탈퇴하기" onClick=" "></div>
	        </div>
		   </form>
	   </section>
	   </div>
	</body>
</html>