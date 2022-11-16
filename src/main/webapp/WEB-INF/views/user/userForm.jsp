<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">
.root {
	display: flex;
	width: 100%;
	height: 100%;
}
.signin-wrapper {
	background: #d5d5d5;
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
	box-shadow: 10px 5px 10px #a89c86;
	position: relative;
}
#profil_card{
   width: 198px;
    height: 247px;
    position: absolute;
    border-radius: 10px;
    top: 175px;
    right: 20px;

    box-sizing: border-box;
    box-shadow: 2px 2px 8px #00000020;
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

#user_id {
	margin-bottom: 40px
}

.mail2 {
	position: absolute;
	right: -11px;
	top: 435px;
}

.message_label {
	margin-left: 40px;
	margin-left: 40px;
	margin-bottom: 20px;
}

.message_label input {
	margin-left: 20px;
}

#overlappedID {
	background-color: GhostWhite;
	width: 30%;
	height: 35px;
	position: absolute;
	top: 125px;
	right: 30px;
	font-weight: 400;
}

.olmessagef {
	color: red;
	position: absolute;
	right: 300px;
	top: 175px;
	left: 40px;
	width: 400px;
}

.olmessaget {
	color: blue;
	position: absolute;
	right: 300px;
	top: 175px;
	left: 40px;
	width: 400px;
}

#confirmMsg {
	position: absolute;
	top: 325px;
	left: 40px;
}

input[type='date']::before {
	content: attr(data-placeholder);
	width: 100%;
}

input[type='date']:focus::before, input[type='date']:valid::before {
	display: none;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

img {
 display: block;
    margin: 0;
    padding: 0;
    width: 90px;
    height: 90px;
    position: relative;
    top: -90px;
    right: -50px;
   
    border-radius: 50%;
}
input#a {
    width: 100px;
    height: 36px;
    text-align: center;
    font-size: large;
    position: relative;
    top: 107px;
    right: 5px;
}

input.upload-name {
	position: relative;
    top: 189px;
    right: -14px;
}

input#imageFileName {
	position: relative;
    top: 125px;
    right: -12px;
    box-sizing: border-box;
    width: 155px;
}
input#profil_id {
    width: 100px;
    height: 28px;
    position: relative;
    top: 100px;
}
</style>
<title>회원가입 화면</title>

<!-- css 파일 분리 -->


<script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
        	var form = document.userInfo;
        	
        	
            if(!form.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
            if( !idReg.test( $("input[name=id]").val() ) ) {
                alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
                return false;
            }
  
            if(form.idcheck.value=="false"){
                alert("아이디 중복확인 해주세요.");
                return false;
            }
            
            if(!form.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(form.pw.value != document.userInfo.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
            if(!form.name.value){
                alert("이름을 입력하세요.");
                return false;
            }
            if(!form.email.value){
                alert("email를 입력하세요.");
                return false;
            }
          
            
            if(!form.tel.value){
                alert("휴대전화번호를 입력하세요.");
                return false;
            }
            if(!form.birth.value){
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
    		url: "/idCheck",
    		data: {id: id},
    		success: function (data) {
    			 if(!document.userInfo.id.value){
    				 $("#olmessage").text("아이디를 입력하세요.");
    				 $("#olmessage").addClass("olmessagef");
    	    		 $("#olmessage").removeClass("olmessaget");
    	                return false;
    	            }
    			 var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
    	            if( !idReg.test( $("input[name=id]").val() ) ) {
    	               // alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
    	                $("#olmessage").text("6~20자 영문자+숫자여야 합니다.");
    	    			$("#olmessage").addClass("olmessagef");
    	    			$("#olmessage").removeClass("olmessaget");
    	    			$("#idcheck").attr("value","false");
    	                return false;
    	            }
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
        function goLoginForm()
       {
            location.href="loginForm.do";     
        }
        
        $(document).ready(function() {
        	  
            $(".phone").focus(focused); //input에 focus일 때
            $(".phone").blur(blured);   //focus out일 때
            
            $("#b").keydown(function(){
                $('#a').val($(this).val());
            });

            $("#b").change(function(){
                $('#a').val($(this).val());
            });
          })

        function focused(){
          var input = $(this).val();
          
          //input안에서 하이픈(-) 제거
          var phone = input.replace( /-/gi, '');
          //number 타입으로 변경(숫자만 입력)
          $(this).prop('type', 'number');
          
          $(this).val(phone);
        }

        function blured(){
          var input = $(this).val();
          
          //숫자에 하이픈(-) 추가
          var phone = chkItemPhone(input);
          //text 타입으로 변경
          $(this).prop('type', 'text');
          
          $(this).val(phone);
        }


        //전화번호 문자(-)
        function chkItemPhone(temp) {
          var number = temp.replace(/[^0-9]/g, "");
          var phone = "";

          if (number.length < 9) {
            return number;
          } else if (number.length < 10) {
            phone += number.substr(0, 2);
                phone += "-";
                phone += number.substr(2, 3);
            phone += "-";
            phone += number.substr(5);
          } else if (number.length < 11) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 3);
            phone += "-";
            phone += number.substr(6);
          } else {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 4);
            phone += "-";
            phone += number.substr(7,4);
          }

          return phone;
        }
        function readURL(input) {
      		if (input.files && input.files[0]) {
      			var fileName = $("#imageFileName").val();
		      	var reader = new FileReader();
		      	reader.onload = function (e) {
		        	$('#preview').attr('src', e.target.result);
	          	}
		      	$(".upload-name").val(fileName);
	         	reader.readAsDataURL(input.files[0]);
      		}
  		}
    </script>
      
</head>
<body>
	<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->

	<form method="post" action="${contextPath}/adduserprofil_pic.do"
		name="userInfo" id="userInfo" onsubmit="return checkValue()"
		enctype="multipart/form-data">
		<div class="root">
			<div class="signin-wrapper form active">
				<div class="form-wrapper">
					<h5>Anitel 회원가입</h5>

					<input type="text" id="user_id" name="id" placeholder="UserID"
						class="form-field" maxlength="20" required autofocus required>
				<div id="profil_card">
				
					<ul>
						<li class="atc_imageFile">
							<div class="imageFile_wrap">
								<input class="upload-name" spellcheck="false" value="프로필 사진"
									onchange="readURL(this);" disabled> 
								<input type="text" id="a" placeholder="이름" class="form-field" maxlength="20" >
								<input type="file" id="imageFileName" name="imageFileName" onchange="readURL(this);" />
								<img id="preview" src="${contextPath}/resources/img/user.png" height=350 onerror="this.src='${contextPath}/resources/img/no_img.png'" />
							</div>
						</li>
					</ul>
				</div>
					<button id="overlappedID" type="button" onclick="lappedID()">중복확인</button>
					<input type="hidden" id="idcheck" value="false"> 
					<span id="olmessage"></span>
					<input type="password" name="pw" id="pw" maxlength="50" class="form-field" placeholder="UserPw">
					<input type="password" name="passwordcheck" id="passwordcheck" maxlength="50" class="form-field" placeholder="UserPwCheck" onkeyup="passConfirm()"> <span id="confirmMsg"></span>
					<br>
					<input type="text" id="b" name="name" maxlength="20" class="form-field" placeholder="UserName"> <input type="text" name="email" maxlength="30" class="form-field" placeholder="UserEmail">
					<select name="mail2" class="form-field mail2">
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@gmail.com</option>
						<option>@nate.com</option>
					</select> 
					<input type="date" name="birth" class="form-field" data-placeholder="UserBirth" required aria-required="true"
						 className={styles.selectDay}> 
						
					<input type="number" name="tel" id="tel" placeholder="핸드폰번호 입력" maxlength="13" class="form-field phone" ng-focus="chkPhoneType('focus')"
						ng-blur="chkPhoneType('blur');" min="0" required> 
						
					<input type="number" name="tel_sub" id="tel_sub" placeholder="비상시 핸드폰번호 입력" maxlength="13" class="form-field phone"
						ng-focus="chkPhoneType('focus')" ng-blur="chkPhoneType('blur');" min="0" >
						
					<label class="message_label">
						이메일수신 발송에 동의하십니까?<input type="checkbox" name="message" value="Y">
					</label>

					<button type="submit" id="signup" value="true"
						class="button primary" onclick="checkValue()">가입</button>
					<button type="button" class="button secondary"
						onclick="goLoginForm()">돌아가기</button>
				</div>
			</div>
		</div>
		<br> <br> <br>
	</form>
</body>
</html>
