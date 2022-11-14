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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
<title>아이디 찾기</title>

<script type="text/javascript">

$(document).ready(function() {
	  
    $(".phone").focus(focused); //input에 focus일 때
    $(".phone").blur(blured);   //focus out일 때
    
  });

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
</script>
</head>
<body>
<br><br>
<form name="frmfind_pw" method="post"  action="${contextPath}/find_pw.do">
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			
				<div class="w3-center w3-large w3-margin-top">
					<h3>비밀번호 찾기</h3>
				</div>
				<div>
					<p>
						<label>ID</label>
						<input type="text" id="id" name="id" required>
						
						<label>TEL</label>
						<input type="number" name="tel" id="tel"  maxlength="13" class="form-field phone" ng-focus="chkPhoneType('focus')"
						ng-blur="chkPhoneType('blur');" min="0" required> 
					</p>
					<p class="w3-center">
						<button style="background-color:#0F3758; color:white;" type="submit" id=findBtn class="w3-button w3-block  w3-ripple w3-margin-top w3-round">find</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block  w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</div>
			</div>
	</div>
	<br><br><br><br><br>
			</form>
</body>
</html>