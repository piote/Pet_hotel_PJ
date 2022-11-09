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
	   <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
	
			/* function deleteUser(url,id) {
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
			 */
				function deleteUser(url,id){
					Swal.fire({
						  title: '확실합니까?',
						  text: "다시는 되돌릴 수 없습니다.",
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: 'Yes!'
						}).then((result) => {
						  if (result.isConfirmed) {
						    Swal.fire(
						      '애니텔 탈퇴가 완료되었습니다!',
						      '애니텔을 이용해 주셔서 감사합니다.',
						    )
						    var form = document.createElement("form");
							 form.setAttribute("method", "post");
							 form.setAttribute("action", url);
						     var idInput = document.createElement("input");
						     idInput.setAttribute("type","hidden");
						     idInput.setAttribute("name","id");
						     idInput.setAttribute("value", id);
						     form.appendChild(idInput);
						     document.body.appendChild(form);
						     setTimeout(() => form.submit(), 2000);
							 //form.submit();
						  }
						})
				}
			 const autoHyphen2 = (target) => {
				 target.value = target.value
				   .replace(/[^0-9]/g, '')
				  .replace(/^(\d{0,3})(\d{3,4})(\d{4,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
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
		<form method="post" action="${contextPath}/modMember.do" enctype="multipart/form-data"> 
		   <div id="wrap">
			   	<section class="container">
				   	<div class="petitle">
				   	<h3><img src="${contextPath}/resources/img/petel.png" alt="정보수정">&nbsp;회원 정보 수정</h3></div>
			      <div class="modCon">
				     <!-- <table border="1" width="50%" height="80%"> -->
				     <table>
				     	<%-- <tr>
					            <th>
                                    <div class="head-cell"><span class="empha">*</span>프로필</div>
                                </th>
					            <td>
					            	<input type="file" id="imageFileName" name="imageFileName"
									onchange="readURL(this);" /> <img id="preview" src="${contextPath}/resources/img/user.png"
									height=40
									onerror="this.src='${contextPath}/resources/img/no_img.png'" />
					            </td>
					            
				         </tr> --%>
				         <tr>
					            <th>
                                    <div class="head-cell"><span class="empha">*</span>프로필</div>
                                </th>
                                <td>
                                		<img id="preview" src="${contextPath}/resources/user/user_image/${user.img_name}" height=100 onerror="this.src='${contextPath}/resources/img/no_img.png'"/>
                                	<div class="fileMod">
	                               		<label for="imageFileName">이미지 파일</label>
				                		<input class="upload-name" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL(this);"  disabled >
					                	<input type="file" id="imageFileName" name="imageFileName"  onchange="readURL(this);"/>
					                	<input  type= "hidden"   name="oldFileName" value="${user.img_name}" />
					                </div>
			                	</td>
					           <%--  <td>
					            	<input class="upload-name" spellcheck="false" value="프로필 사진"
									onchange="readURL(this);" disabled><input class="txtBox" type="file" id="imageFileMod" name="imageFileNameMod" value="${user.img_name }" onchange="readURL(this);" />
					            	<img id="preview" src="${contextPath}/resources/img/user.png"
									height=40
									onerror="this.src='${contextPath}/resources/img/no_img.png'" />
					            </td> --%>
					            
				         </tr>
				         <tr>
					            <th>
                                    <div class="head-cell"><span class="empha">*</span>아이디</div>
                                </th>
					            <td>
					            	<div class="col-cell"><input class="txtBox" type="text" id="readonly" name="id" value="${user.id }" readonly/></div>
					            </td>
				         </tr>
				         <tr>
					            <th>
                                    <div class="head-cell"><span class="empha">*</span>비밀번호</div>
                                </th>
					            <td>
					            	<div class="col-cell"><input class="txtBox" placeholder="비밀번호를 입력하세요.!" type="password" name="pw"  value="${user.pw }" />
					            	<span class="idpw-info"><!-- &nbsp;&nbsp;* 영문 대소문자/숫자/특수문자를 혼용하여 2종류 10~16자 또는 3종류 8~16자 --></span></div>
					            </td>
				         </tr>
				         <tr>
					            <th>
                                    <div class="head-cell"><span class="empha">*</span>이름</div>
                                </th>
					            <td>
					            	<div class="col-cell"><input class="txtBox"  type="text" id="readonly" name="name"  value="${user.name }" readonly/></div>
					            </td>
				         </tr>
				          <tr>
				              	<th>
                                    <div class="head-cell"><span class="empha">*</span>생년월일</div>
                                </th> 
				               <%-- <td><input class="txtBox" type="text" name="birth" value="${user.birth }" ></td> --%>
				               <td>
				               		<div class="col-cell"><input class="txtBox"  type="date" name="birth_string" value="${birth}" ></div>
				               </td>
			              </tr>
				 		 <tr>
					            <th>
                                    <div class="head-cell"><span class="empha">*</span>이메일</div>
                                </th>
					            <td>
					            	<div class="col-cell"><input class="txtBox" type="text" name="email" placeholder="이메일을 입력하세요.!"  value="${user.email }"></div>
					            </td>
				         </tr>
				          <tr>
				                <th>
                                    <div class="head-cell"><span class="empha">*</span>휴대전화</div>
                                </th>
				                <td>
				                	<div class="col-cell"><input class="txtBox" type="text" name="tel" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" oninput="autoHyphen2(this)"  maxlength="13"  placeholder="전화번호를 입력하세요!" value="${user.tel }" required></div>
				                </td>
				         </tr>
				          <tr>
				                <th>
                                    <div class="head-cell"><span class="empha">*</span>비상전화</div>
                                </th>
				                <td>
				                	<div class="col-cell"><input class="txtBox" type="text" name="tel_sub" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" oninput="autoHyphen2(this)"  maxlength="13" placeholder="전화번호를 입력하세요!" value="${user.tel_sub}" required></div>
				                </td>
				          </tr>
				          <tr>
				               <th>
                                    <div class="head-cell"><span class="empha">*</span>수신여부</div>
                                </th>
				               <td>
				                 <div class="col-cell"><input type="checkbox" name="emailsts_yn"  value="Y" onclick= 'checkOnlyOne(this)'  />Yes
				                 <input type="checkbox" name="emailsts_yn"  value="N" onclick= 'checkOnlyOne(this)' />No</div>
				               </td>
			               </tr>
				         <tr>
					           <th>
                                    <div class="head-cell"><span class="empha">*</span>가입일</div>
                                </th>
					           <td>
					           		<input class="txtBox" id="readonly" type="text" name="joinDate" size="20" value="${user.joinDate}"  readonly/>
					           </td>
				         </tr>
				     </table>  
				     </div>
				     		<div class= "letter"><p><span class="symbol">*</span>아이디, 이름, 가입일은 수정이 불가능합니다.</p></div>
			         <div class= "btn_footer">		    
							<input type="submit" class="btn1" name="modbtn" value="수정하기" onClick= "mod()">
					        <a href= "${contextPath}/modMemberForm.do"><input class="btn2" type="button" name="cal_1" value="수정취소" onClick= "cal();"></a>
							<%-- <a href= "${contextPath}/main.do"><input class="btn3" type="button" name="leave_1"  value="탈퇴하기" onClick="leave();"></a> --%>
					</div>
					<div class="btn_footer1"><button type="button" class="btn3" onclick="deleteUser('${contextPath}/retiring.do','${user.id }');"> 탈퇴하기 </button></div>
							
				</section>
			</div>
	   </form>
	</body>
</html>