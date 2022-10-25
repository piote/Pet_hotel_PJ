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
	   <link rel="stylesheet" href="${contextPath}/resources/css/member.css">
	   <meta charset="UTF-8">
	   <title>회원 수정창</title>
	   <script>
			function checkOnlyOne(element) {
		  
			  const checkboxes 
			      = document.getElementsByName("emailsts_yn");
			  
			  checkboxes.forEach((cb) => {
			    cb.checked = false;
			  })
		  
		  		element.checked = true;
			}
			
			function deleteUser(url,id) {
				if(window.confirm("탈퇴하시겠습니까?")){

					var form = document.createElement("form");
					 form.setAttribute("method", "post");
					 form.setAttribute("action", url);
				     var idInput = document.createElement("input");
				     idInput.setAttribute("type","hidden");
				     idInput.setAttribute("name","id");
				     idInput.setAttribute("value", id);
					 
				     form.appendChild(idInput);
				     document.body.appendChild(form);
					 form.submit();
					 
				}
				
			}
			
		</script>
		
			
		 		<!--  <script> 
		 		 
		 		function updateUser(id)
		 		
				    window.onload=function(){
				      alert("정보 수정이 완료 됐습니다.!");
				    }
			  </script> -->

	</head>
	<body>
		<form method="post" action="${contextPath}/modMember.do"> 
		   <div id="wrap">
			   	<section class="container">
			      <h3>회원 정보 수정</h3>
			      <div class="modCon">
				      <table>
				         <tr>
					            <td><p align="center">아이디</td>
					            <td><input class="txtBox" type="text" name="id" value="${user.id }" readonly/> </td>
				         </tr>
				         <tr>
					            <td><p align="center">비밀번호</td>
					            <td><input class="txtBox" type="password" name="pw"  value="${user.pw }" /></td>
				         </tr>
				         <tr>
					            <td><p align="center">이름</P></td>
					            <td><input class="txtBox" type="text" name="name"  value="${user.name }" readonly/></td>
				         </tr>
				 		 <tr>
					            <td><p align="center">이메일</P></td>
					            <td><input class="txtBox" type="text" name="email"  value="${user.email }"></td>
				         </tr>
				          <tr>
				                <td><p align="center">휴대전화</P></td>
				                <td><input class="txtBox" type="text" name="tel"  value="${user.tel }"></td>
				         </tr>
				          <tr>
				                <td><p align="center">비상전화</P></td>
				                <td><input class="txtBox" type="text" name="tel_sub" value="${user.tel_sub}"></td>
				          </tr>
				          <tr>
				               <td><p align="center">수신여부</P></td>
				               <td>
				                 <input type="checkbox" name="emailsts_yn"  value="Y" onclick= 'checkOnlyOne(this)'  />Yes
				                 <input type="checkbox" name="emailsts_yn"  value="N" onclick= 'checkOnlyOne(this)' />No	
				               </td>
			               </tr>
				           <tr>
				               <td><p align="center">생년월일</P></td> 
				               
				               <%-- <td><input class="txtBox" type="text" name="birth" value="${user.birth }" ></td> --%>
				               <td>
				               <input class="txtBox"  type="date" name="birth_string" value="${birth}" ></td>
			               </tr>
				         <tr>
					           <td><p align="center">가입일</td>
					           <td><input class="txtBox" type="text" name="joinDate" size="20" value="${user.joinDate}"  disabled/></td>
				         </tr>
				         
				     </table>
				     
			         <ul>
			            <%-- <li><a href= "${contextPath}/mypage/myPage.do"><input class="btn1" type="button" name="mod_1"  value="수정하기" onClick= "mod();"></a></li> --%>
<%-- 			           <button type="button" onclick="updateUser('${contextPath}/modMember.do','${user.id }');"> 수정하기 </button> --%>
						<input type="submit" name= 'mod' value="수정하기" >
				        <li><a href= "${contextPath}/modMemberForm.do"><input class="btn2" type="button" name="cal_1" value="수정취소" onClick= "cal();"></a></li>
				     </ul>
				     	<p>아이디, 이름, 가입일은 수정이 불가능합니다.</p>
				    <%-- <div><a href= "${contextPath}/main.do">탈퇴하기<input class="btn3" type="button" name="leave_1"  value="탈퇴하기" onClick="leave();"></a>
						</div> --%>
						<div>
							<%-- <a href= "${contextPath}/main.do"><input class="btn3" type="button" name="leave_1"  value="탈퇴하기" onClick="leave();"></a> --%>
							<button type="button" onclick="deleteUser('${contextPath}/retiring.do','${user.id }');"> 탈퇴하기 </button>
						</div>
			   	</section>
		   </div>
	   </form>
	</body>
</html>