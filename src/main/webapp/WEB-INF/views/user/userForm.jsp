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
  width: 500px;
  height: 835px;
  padding: 20px 0;
  margin: 20px auto;
  border-radius: 15px;
  position: relative;
}
.form-wrapper button {
  cursor: pointer;
  font-weight: bold;
  width: 460px;
  margin: 0 20px 0 20px;
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
#user_id{
	margin-bottom: 40px
}
.mail2{
	position: absolute;
    right: -11px;
    top: 435px;
}
.message_label{
	margin-left: 40px;
	margin-left: 40px;
    margin-bottom: 20px;
}
.message_label input{
	margin-left: 20px;	
}
#overlappedID {
		background-color: GhostWhite; width: 30%; height: 35px;
	    position: absolute;
	    top: 130px;
	    right: 30px;
	    font-weight: 400;
}
		.olmessagef {color: red; position: absolute; top: 184px; right: 300px; top: 178px; left: 40px; width: 400px;}
		.olmessaget {color: blue; position: absolute; top: 184px; right: 300px; top: 178px; left: 40px; width: 400px;}

#confirmMsg{
	position: absolute;
	top: 325px;
    left: 40px;
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
        
        //회원가입 아이디중복확인 기능
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
        // 비밀번호 확인 기능 추가
        function passConfirm() {
	/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
	/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
	/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
		var password = document.getElementById('pw');					//비밀번호 
		var passwordConfirm = document.getElementById('passwordcheck');	//비밀번호 확인 값
		var confrimMsg = document.getElementById('confirmMsg');				//확인 메세지
		var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
		var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
		
		if(password.value == passwordConfirm.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			confirmMsg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		}else{
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML ="비밀번호 불일치";
		}
	}
        
        // 취소 버튼 클릭시 로그인 화면으로 이동
        function goLoginForm() {
            location.href="loginForm.do";     
        }

    </script>
    
</head>
<body>
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
       
        <form  method="post" action="${contextPath}/addUser.do" name="userInfo" id="userInfo" >
        	<div class="root">
  				<div class="signin-wrapper form active">
 				   <div class="form-wrapper">
   				   <h5>Anitel 회원가입</h5>

						<input type="text" id="user_id" name="id" placeholder="UserID" class="form-field" maxlength="20" required autofocus required>
						<button id="overlappedID" type="button" onclick="lappedID()">중복확인</button>
						<input type="hidden" id="idcheck" value="false">
						<span id="olmessage"></span>
						
                        <input type="password" name="pw" id="pw" maxlength="50" class="form-field" placeholder="UserPw"> 
                        <input type="password" name="passwordcheck" id="passwordcheck" maxlength="50" class="form-field" placeholder="UserPwCheck" onkeyup="passConfirm()">
						<span id="confirmMsg"></span><br>
              
                        <input type="text" name="name" maxlength="20" class="form-field" placeholder="UserName">
                        <input type="text" name="email" maxlength="30" class="form-field"placeholder="UserEmail">
                        <select name="mail2" class="form-field mail2">
                            <option>@naver.com</option>
                            <option>@daum.net</option>
                            <option>@gmail.com</option>
                            <option>@nate.com</option>                        
                        </select>
                   		<input type="number" name="tel" id="tel" placeholder="핸드폰번호 입력" maxlength="13" class="form-field" placeholder="UserCellPhone" >               
                        <input type="number" name="tel_sub" id="tel_sub" placeholder="비상시 핸드폰번호 입력" maxlength="13" class="form-field" placeholder="UserCellPhone" >                
                     	<label class="message_label">이메일 수신 발송에 동의하십니까?<input type="checkbox"  name="message"  value="Y"></label>
                        <input type="date" name="birth" class="form-field" placeholder="UserBirth" > 
                                 
          			    <button  type="submit" id="signup"  class="button primary"  onclick="checkValue()">가입</button>
          			    <button  class="button secondary" onclick="goLoginForm()">돌아가기</button>
            		</div>
    			</div>
   			 </div>
   			 <br><br><br>
        </form>
</body>
</html>
