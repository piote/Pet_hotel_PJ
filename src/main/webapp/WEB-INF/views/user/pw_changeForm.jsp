<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>  

<!DOCTYPE html>
<html>

	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>회원정보 수정</title>
	
	    <link rel="stylesheet" href="${contextPath}/resources/css/password.css">
	 	<c:choose>
			<c:when test="${result=='passwordFailed' }">
		 		  <script> 
				    window.onload=function(){
				      alert("비밀번호가 틀립니다.다시 입력하세요!");
				    }
			  </script>
			</c:when> 
		</c:choose>
	</head>
	<body>
		 <form method="post"  action="${contextPath}/pw_change.do">
		    <div id="wrap">
		        <section class="pw_wrap">
		             <div class="pw_tit">
		                <h3>회원정보 수정</h3>
			                <p class="pw">비밀번호를 입력해 주세요</p>
			                <p>애니텔 회원님의 개인정보를 안전하게 보호하고 있습니다.<br> 정보 수정을 위해 비밀번호를 한번 더 입력해주세요.</p>
	            	</div>
		            <div class="pw_change">
		                <label for="">비밀번호</label><br>
		                <input type="password" name="password" size="10">
		            </div>
		            <div class="pw_btn">
		                <!-- <a href="modMember.do"><p>정보 수정하기</p></a> -->
		                <input type="submit" id= "box" value= "정보 수정하기">
		            </div>
		        </section>
		    </div>
	    </form>
	</body>
</html>