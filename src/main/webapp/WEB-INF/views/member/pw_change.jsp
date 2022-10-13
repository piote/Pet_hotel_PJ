<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/password.css">
</head>
	<body>
		<form method="post"   action="${contextPath}/member/modMember.do">
		    <div id="wrap">
		        <section class="pw_wrap">
		             <div class="pw_tit">
		                <h3>회원정보 수정</h3>
			                <p class="pw">비밀번호를 입력해 주세요</p>
			                <p>애니텔 회원님의 개인정보를 안전하게 보호하고 있습니다.<br> 정보 수정을 위해 비밀번호를 한번 더 입력해주세요.</p>
	            	</div>
		            <div class="pw_change">
		                <label for="">비밀번호</label><br>
		                <input type="password" name="" size="10">
		            </div>
		            <div class="pw_btn">
		                <a href="#"><p>정보 수정하기</p></a>
		            </div>
		        </section>
		    </div>
	    </form>
	</body>
</html>