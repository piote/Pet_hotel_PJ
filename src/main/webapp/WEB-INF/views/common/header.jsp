<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%
  request.setCharacterEncoding("UTF-8");
%>   
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html lang="ko">
<head>

	<script>
		function fn_reservationForm(isLogOn,reservationForm,loginForm){
		  	if(isLogOn != '' && isLogOn != 'false'){
		    	location.href=reservationForm;
		  	}else{
		   		alert("로그인 후 예약해주세요.")
		    	location.href=loginForm+'?action=/reservationForm.do';
		  	}
		}
		
		$(function(){
			// header scroll
		    var $header = $('header');
		    var $nav = $('nav');

		    var $window = $(window);
		    var pageOffsetTop = 30;
		    
		    $window.on('scroll', function(){ //스크롤시
		        var scrolled = $window.scrollTop() >= pageOffsetTop;
		        $header.toggleClass('down', scrolled);
		        $nav.toggleClass('nav_down', scrolled);
				$('header').css('left', 0-$(this).scrollLeft());
		    });
		})
	    
		
	</script>

</head>
<body>
  <header>
    <div class="header_box">
        <a class="logo" href="${contextPath}/main.do">Anitel</a>
        <div class="log_wrap" id ="head_link">
        <c:choose>
          <c:when test="${isLogOn == true  && user!= null}">
            
            <p class="login_msg">환영합니다. ${user.name}님!</p>
            <c:choose>
	            <c:when test="${user.id == 'admin' }">
	            	<a id="mypage" href="${contextPath}/admin/adminUserList.do">관리페이지</a>
	            </c:when>
	            <c:otherwise>
	            	<a id="mypage" href="${contextPath}/mypage/myPage.do">마이페이지</a>
	            </c:otherwise>
            </c:choose> 
      			<a id="logout" href="${contextPath}/logout.do">로그아웃</a> 
          </c:when>
          <c:otherwise>
	          <a id="login" href="${contextPath}/loginForm.do">로그인</a>
	          <a id="signup" href="${contextPath}/userForm.do">회원가입</a>
	        </c:otherwise>
	      </c:choose>     
      </div>
        
        <div class="hr"></div>
        <nav>
            <div class="r_menu menu_wrap">
                <a href="${contextPath}/introduce.do" class="menu">호텔소개</a>
                <a href="${contextPath}/facilities.do" class="menu">시설소개</a>
                <a href="javascript:fn_reservationForm('${isLogOn}','${contextPath}/reservationForm.do','${contextPath}/loginForm.do')" class="menu">호텔예약</a>
                <a href="${contextPath}/review/reviewBoard.do" class="menu">리뷰게시판</a>
            </div>
            <div class="l_menu menu_wrap">
                <a href="${contextPath}/membership.do" class="menu">멤버십</a>
                <a href="${contextPath}/questions/questionsList.do" class="menu">고객센터</a>
            </div>
        </nav>
    </div>
</header>

</body>
</html>
