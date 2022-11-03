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
	    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	    <title>회원정보 수정</title>
	 	<%-- <c:choose>
			<c:when test="${result=='passwordFailed' }">
		 		  <script> 
				    window.onload=function(){
				      alert("비밀번호가 틀립니다.다시 입력하세요!");
				    }
			  </script>
			</c:when>
			</c:choose> --%>
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
				<!-- <script>
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
					});
				</script> -->
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
			                <input type="password" placeholder="Password" name="password" size="10">
			                 <!-- <div class="eyes">
  								<i class="fa fa-eye fa-lg"></i>
  							</div> -->
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