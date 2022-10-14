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
<style>
  a{
    color: #333;
  }
  #wrap{
    width: 1000px;
    height: auto;
    margin: 0 auto;
    position: relative;
  }

  .title_wrap{
    width: 100%; height: 300px;
    position: relative;
  }
  .title_text {
    width: 300px; height: auto;
    position: absolute;
    left: 50px; top: 100px;
  }
  .title_text div{
    width: 150px; height: 2px;
    background-color: #aaa;
  }
  .title_text h1{
    display: block;
    font-size: 40px;
    letter-spacing :-2px;
    font-weight: 800;
  }
  .title_text p{
    font-size: 15px;
    color: #666;
    padding-left: 10px;
  }
  .title_wrap img{
    position: absolute;
    width: 200px; height: auto;
    right: 20px; top: 50px;
  }
  .content{
    width:100%;
    border:1px;
    font-size: 15px;
    border-collapse: collapse;
  }
  .content tr{
    height: 40px;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    border-collapse: collapse;
  }
  .content_title{
    background-color: rgb(245, 245, 245); 
    text-align: center;
   }
  .sf{
    font-size: 13px;
    color: #aaa;
  }
  .search_wrap{
  width: 220px;
  position: relative;
  margin: 0 auto;
  margin-top: 50px;
  }
  #seh{
  box-sizing: border-box;
  width: 220px;
  height: 40px;
  border: 0;
  border-bottom: 2px solid #ddd;
  margin: 10px 0;
  padding-left: 15px;
  transition: all 0.2s;
  }
  #seh:focus {
          background-color: #eee;
          outline: none;
      }
  .search_wrap a{
  width: 17px;
  height: 17px;
  display: block;
  position: absolute;
  right: 10px;
  top: 20px;
  }

  .bottom_bt_wrap{
    width: 100%;
    height: 35px;
    position: relative;
    margin-bottom: 150px;
  }
  .tel{
    display: block; box-sizing: border-box;
    width: 30px; height: 30px;
    border:1px solid #aaa;
    padding-left: 30px;
    font-size: 15px; line-height: 30px;
    border-radius: 15px;
    overflow: hidden;
    transition: all 0.5s;
  }
  .tel:hover{
    width: 240px;
  }

  .bottom_bt_wrap svg{
    position: absolute;
    top: 3px; left: 4px;
    transform: scale(0.8);
    z-index: -5;
    fill: #333;
  }
  .cls1 {
    width: 110px; height: 30px;
    border: 1px solid #999;
    border-radius: 20px;
    background-color: #fff;
    text-align: center;
    line-height: 30px;
    position: absolute; right: 0; top: 0;
  }
  .cls1:hover{
    border-color: #e59f5a;
    background-color: #e59f5a;
    color: #fff;
  }


  </style>
  <meta charset="UTF-8">

  <title>문의게시판</title>

<script>
	function fn_articleForm(isLogOn,articleForm,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=articleForm;
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/board/articleForm.do';
	  }
	}
</script>
</head>

<body>

 <div id="wrap">
    <div class="title_wrap">
      <div class="title_text">
        <div></div>
        <h1>Question Board</h1>
        <p>무엇이든 물어보세요.<br>신속하고 친절하게 답변해드립니다.</p>
      </div>
      
      <img src="${contextPath}/resources/img/q_list01.jpg" alt="Question title">
    </div>

    <table class="content" align="center">
        <tr class="content_title">
            <td width="8%">NO</td>
            <td width="60%">제목</td>
            <td width="10%">작성자</td>
            <td width="10%">작성일</td>
        </tr>

      <c:choose>
        <c:when test="${articlesList ==null }" >
          <tr>
            <td colspan="4">
              <p align="center">
                <b>등록된 글이 없습니다.</b>
              </p>
            </td>  
          </tr>
        </c:when>

        <c:when test="${articlesList !=null }" >
          <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
            <tr align="center">
              <td class="sf">${articleNum.count}</td>
              <td align="left">
                <span style="padding-right:30px"></span>
                <c:choose>
                  <c:when test='${article.level > 1 }'>  
                    <c:forEach begin="1" end="${article.level }" step="1">
                      <span style="padding-left:10px"></span>    
                    </c:forEach>
                    <span>[답변]</span>
                    <a href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
                  </c:when>
                  <c:otherwise>
                    <a href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
                  </c:otherwise>
                </c:choose>
              </td>
            <td class="sf">${article.id }</td>
            <td class="sf">${article.writeDate}</td> 
            </tr>
          </c:forEach>
        </c:when>
      </c:choose>
    </table>
    <form action="#" method="post">
        <div class="search_wrap">
            <input type="text" id="seh" placeholder="Search">
            <a href="#" ><svg width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M15.853 16.56c-1.683 1.517-3.911 2.44-6.353 2.44-5.243 0-9.5-4.257-9.5-9.5s4.257-9.5 9.5-9.5 9.5 4.257 9.5 9.5c0 2.442-.923 4.67-2.44 6.353l7.44 7.44-.707.707-7.44-7.44zm-6.353-15.56c4.691 0 8.5 3.809 8.5 8.5s-3.809 8.5-8.5 8.5-8.5-3.809-8.5-8.5 3.809-8.5 8.5-8.5z"/></svg>
        </div>
    </form>

    <div class="bottom_bt_wrap">
      <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M20 22.621l-3.521-6.795c-.008.004-1.974.97-2.064 1.011-2.24 1.086-6.799-7.82-4.609-8.994l2.083-1.026-3.493-6.817-2.106 1.039c-7.202 3.755 4.233 25.982 11.6 22.615.121-.055 2.102-1.029 2.11-1.033z"/></svg>
      <a class="tel" href="tel:000-0000-0000">전화 상담 : 000-0000-0000</a>
      <a class="cls1" href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do','${contextPath}/member/loginForm.do')">
      문의글쓰기</a>
    </div>
 </div>

</body>
</html>