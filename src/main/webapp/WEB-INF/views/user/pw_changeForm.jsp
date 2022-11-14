<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>  

<html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="${contextPath}/resources/css/password.css">
	    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	    <title>회원정보 수정</title>
		<c:choose>
			<c:when test="${result=='passwordFailed' }">
				   <script> 
					window.onload=function SweetAlert(){
						Swal.fire({
							  icon: 'error',
							  title: '',
							  text: '비밀번호가 틀립니다.다시 입력하세요!!',
							})
					}
					</script>
			</c:when>
		</c:choose>
			<script>
				$(function(){
					  // 눈표시 클릭 시 패스워드 보이기
					  $('.eyes').on('click',function(){
					    $('.pw_change').toggleClass('active');
					
					    if( $('.pw_change').hasClass('active') == true ){
					    	$(this).find('.fa-eye').attr('class',"fa fa-eye-slash fa-lg").parents('.pw_change').find('#password').attr('type',"text");
					    				// i 클래스                // 텍스트 보이기 i 클래스
					    }
					    else{
					    	$(this).find('.fa-eye-slash').attr('class',"fa fa-eye fa-lg").parents('.pw_change').find('#password').attr('type','password');
					    }
					  });
					  
					  $("#password").focus(function(){
					  		$('.eyes').show();
					  	}); //input에 focus일 때
					  	
					  $('html').click(function(e){
					    	if($(e.target).parents('.pw_change').length < 1 && !$(e.target).hasClass('pw_change')){
					    		$('.eyes').hide();
					        }
					  }); 				 				  
					});
				</script>
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
			                <input type="password" placeholder="Password" size="10" name="password" id="password" class="form-input">
			                <div class="eyes">
							  	<i class="fa fa-eye fa-lg"></i>
						  		<svg width="26" height="26" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc.<path d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM432 256c0 79.5-64.5 144-144 144s-144-64.5-144-144s64.5-144 144-144s144 64.5 144 144zM288 192c0 35.3-28.7 64-64 64c-11.5 0-22.3-3-31.6-8.4c-.2 2.8-.4 5.5-.4 8.4c0 53 43 96 96 96s96-43 96-96s-43-96-96-96c-2.8 0-5.6 .1-8.4 .4c5.3 9.3 8.4 20.1 8.4 31.6z"/></svg>
							</div>
			            </div>
			            <div class="pw_btn">
			                <!-- <input type="submit" id= "box" value= "정보 수정하기"> -->
			               <button onclick = "SweetAlert()" id= "box"> 정보 수정하기</button>
			            </div>
			        </section>
			    </div>
		    </form>
		</body>
</html>