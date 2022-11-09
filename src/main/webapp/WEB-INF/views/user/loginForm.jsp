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
<style>
.root {
  display: flex;
  width: 100%;
  height: 100%;
}


.signin-wrapper {
  flex-grow: 1;
  background: #d5d5d5;
  transition: all 0.32s ease-in;
}

.signup-wrapper {
  flex-grow: 1;
  background: #0F3758;
  transition: all 0.32s ease-in-out;
}

.form {
  z-index: 5;
}


html, body {
  font-family: "Roboto";
  height: 100vh;
  padding: 0;
  margin: 0;
}

h5 {
  color: #212121;
  font-size: 20px;
  margin: 15px 0 30px 0;
  text-align: center;
}

.form, .form-wrapper {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.form-wrapper {
  background-color: white;
  width: 300px;
  height: 500px;
  padding: 20px 0;
  margin: 20px auto;
  border-radius: 15px;
  box-shadow: 10px 5px 10px #a89c86;
}
.form-wrapper button {
  cursor: pointer;
  font-weight: bold;
  width: 230px;
  margin: 0 35px 20px;
  height: 45px;
  padding: 6px 15px;
  border-radius: 5px;
  outline: none;
  border: none;
  font-size: 14px;
}
.form-wrapper button.primary {
  color: white;
  background: #0F3758;
}
.form-wrapper button.primary:hover {
  opacity: 0.9;
}
.form-wrapper button.secondary {
  background: white;
  color: #0F3758;
}
.form-wrapper button.secondary:hover {
  background: #f5f5f5;
}
.form-wrapper .form-field {
  font-weight: bold;
  width: 200px;
  margin: 0 35px 20px;
  height: 35px;
  padding: 6px 15px;
  border-radius: 5px;
  outline: none;
  border: none;
  background: #f5f5f5;
  color: #748194;
  font-size: 14px;
}
.form-wrapper p {
  color: #424242;
  font-size: 14px;
  text-align: center;
}
.form-wrapper p a {
  cursor: pointer;
  color: #0F3758;
}
.form-wrapper p a:hover {
  color: #009688;
}
</style>
  <meta charset="UTF-8">
<title>로그인창</title>
<c:choose>
	<c:when test="${result=='loginFailed' }">
	  <script>
	    window.onload=function(){
	      alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
	    }
	  </script>
	</c:when>
</c:choose>  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/icons.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadingoverlay.min.js"></script>

<script type="text/javascript">

if(!confirm("등록하시겠습니까?")){
		return false;
} 
	
$.LoadingOverlay("show", {
	background       : "rgba(0, 0, 0, 0.5)",
	image            : "",
	maxSize          : 60,
	fontawesome      : "fa fa-spinner fa-pulse fa-fw",
	fontawesomeColor : "#FFFFFF",
});

</script>
</head>

<body>
<form name="frmLogin" method="post"  action="${contextPath}/login.do">
   <div class="root">
 	 <div class="signin-wrapper form active">
    	<div class="form-wrapper">
      		<h5>Welcome Back to ANITEL <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M11 23l-7.981.014v-10l8.981-8c3 2.668 6 5.319 9 7.986v10l-7.981.014v-2c0-.018.011-.72-.001-1.052-.027-.421-.29-.743-.634-.88-.237-.09-.5-.089-.73 0-.344.137-.627.425-.654.845-.013.351 0 1.073 0 1.073v2zm4-2h4l.019-7.098-7.019-6.212-7 6.232v7.078h4l.019-.986c.017-1.379.889-2.421 1.969-2.816.657-.244 1.405-.244 2.062 0 1.097.401 1.933 1.437 1.95 2.802v1zm-3.739-8h1.478c1.171.017 1.265-.986 2.261-.986.644 0 .996.524 1 1 .004.476-.28.826-.623.997.328.177.62.527.623 1.003.003.476-.348 1-1 1-.996 0-1.09-1.031-2.261-1.014h-1.465c-1.171-.017-1.278 1.014-2.274 1.014-.652 0-1.003-.524-1-1 .003-.476.295-.826.623-1.003-.343-.171-.627-.521-.623-.997.004-.476.357-1 1-1 .996 0 1.09 1.003 2.261.986m.739-12l12 10.674-1.31 1.481-10.68-9.494-10.681 9.494-1.329-1.495 12-10.66z"/></svg></h5>
     		<input type="text" placeholder="UserID" name="id" value="" class="form-field"></input>
      		<input  type="password" placeholder="Password" name="pw" value="" class="form-field"></input>
      		<button type="submit" class="button primary">로그인</button>
     		<button class="button secondary" id="click-signup" type="button" onclick = "location.href = '${contextPath}/userForm.do'" >회원가입</button>
   			<p>
		 	 <a href="${contextPath}/find_id_form.do">아이디 찾기</a>  | 
		  	 <a href="${contextPath}/find_pw_form.do">비밀번호 찾기</a>
    		</p>
   		 </div>
 	 </div>
   </div>   
</form>
</body>
</html>
