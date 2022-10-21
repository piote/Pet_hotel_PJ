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
            <table>
                <tr>
					<td id="title">아이디</td>
					<td>
						<input type="text" id="user_id" name="id" placeholder="영어로 작성하시오"  maxlength="20" required autofocus required>
						<input type="hidden" id="idcheck" value="false">
						<button id="overlappedID" type="button" onclick="lappedID()" >중복확인</button><br>
						<span id="olmessage"></span>
					</td>
                    
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="pw" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="20">
                    </td>
                </tr>
                  <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="email" maxlength="30">@
                        <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                   <td id="title">휴대전화</td>
                    <td>
                    <input type="number" name="tel" id="tel" placeholder="핸드폰번호 입력" maxlength="13" />
                    </td>
                </tr>
                 <tr>
                    <td id="title">휴대전화_2</td>
                    <td>
                       <input type="number" name="tel_sub" id="tel_sub" placeholder="핸드폰번호 입력" maxlength="13" />
                    </td>
                </tr>
                <tr>
                   <td id="title">메세지동의</td>
                    <td>
                     	<input type="checkbox" name="message" value="Y"> 이메일 수신 발송에 동의하십니까? 
                    </td>
                </tr>
                 <tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <!-- <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" >
                        <select name="birthmm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" > -->
                        
                       <input type="date" name="birth" >
                        
                    </td>
                </tr>
            </table>
            <br>
            
            <input type="button" id="signup" value="가입" onclick="checkValue()" >  
            <input type="button" value="취소" onclick="goLoginForm()">
        </form>
    </div>
</body>
</html>
