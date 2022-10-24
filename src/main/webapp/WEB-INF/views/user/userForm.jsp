<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%>     
<html>
<head>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<style type="text/css">
		#overlappedID {background-color: GhostWhite; width: 30%; height: 20px;}
		.olmessagef {color: red; font-style: Italic;}
		.olmessaget {color: blue; font-style: Italic;}
		.root {
  display: flex;
  width: 100%;
  height: 100%;
}

.mobile-root {
  flex-direction: column;
}
.mobile-root .inactive {
  display: none;
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

.active {
  flex-grow: 6;
}
.active.form {
  z-index: 5;
}

.inactive {
  pointer-events: none;
  filter: blur(2px) grayscale(80%);
  transform: scale(1.1);
}
.inactive .form-wrapper {
  filter: opacity(55%);
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
    <title>회원가입 화면</title>
  
    <!-- css 파일 분리 -->
   
 
    <script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            if(document.userInfo.idcheck.value=="false"){
                alert("아이디 중복확인 해주세요.");
                return false;
            }
            
            if(!document.userInfo.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.pw.value != document.userInfo.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
            if(!document.userInfo.name.value){
                alert("이름을 입력하세요.");
                return false;
            }
            if(!document.userInfo.email.value){
                alert("email를 입력하세요.");
                return false;
            }
            if(!document.userInfo.tel.value){
                alert("휴대전화번호를 입력하세요.");
                return false;
            }
            if(!document.userInfo.birth.value){
                alert("생년월일을 입력하세요.");
                return false;
            }
            $("#userInfo").submit()
        }
        
        //회원가입 중복확인 기능
        function lappedID(){

        	
    		const id = $("#user_id").val();
    		$.ajax({
    		type: "get",
    		async: false,
    		url: "http://localhost:8090/idCheck",
    		data: {id: id},
    		success: function (data) {
    		if(data == 1) {
    			$("#olmessage").text("이미 사용중인 ID 입니다.");
    			$("#olmessage").addClass("olmessagef");
    			$("#olmessage").removeClass("olmessaget");
    			$("#idcheck").attr("value","false");
    			}else {
    			$("#olmessage").text("사용 가능한 ID 입니다.");
    			$("#olmessage").addClass("olmessaget");
    			$("#olmessage").removeClass("olmessagef");
    			$("#idcheck").attr("value","true");
    			$("#signup").attr("type", "submit");
    			}
    			}
    		})
        }
        
        // 취소 버튼 클릭시 로그인 화면으로 이동
        function goLoginForm() {
            location.href="LoginForm.jsp";     
        }

    </script>
    
</head>
<body>
    <!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>
        
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
       
        <form  method="post" action="${contextPath}/addUser.do" name="userInfo" id="userInfo" >
        	<div class="root">
  				<div class="signin-wrapper form active">
 				   <div class="form-wrapper">
   				   <h5>Welcome Back  👊</h5>

						<input type="text" id="user_id" name="id" placeholder="영어로 작성하시오" class="form-field" maxlength="20" required autofocus required>
						<input type="hidden" id="idcheck" value="false">
						<button id="overlappedID" type="button" onclick="lappedID()" class="form-field">중복확인</button><br>
						<span id="olmessage"class="form-field"></span>
                        <input type="password" name="pw" maxlength="50" class="form-field">
                        <input type="password" name="passwordcheck" maxlength="50" class="form-field">
              
                        <input type="text" name="name" maxlength="20" class="form-field">
                        <input type="text" name="email" maxlength="30" class="form-field">@
                        <select name="mail2" class="form-field">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                   
                   		<input type="number" name="tel" id="tel" placeholder="핸드폰번호 입력" maxlength="13" class="form-field" />               
                        <input type="number" name="tel_sub" id="tel_sub" placeholder="핸드폰번호 입력" maxlength="13" class="form-field" />                
                     	<input type="checkbox" name="message" class="form-field" value="Y"> 이메일 수신 발송에 동의하십니까?                 
                        <input type="date" name="birth" class="form-field" >          
          			    <input type="button" id="signup" value="가입" onclick="checkValue()" >  
          			    <input type="button" value="취소" onclick="goLoginForm()">
            		</div>
    			</div>
   			 </div>
        </form>
</body>
</html>
