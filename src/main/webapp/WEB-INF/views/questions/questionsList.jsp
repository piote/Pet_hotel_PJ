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
    #wrap{
        width: 1000px;
        height: auto;
        margin: 0 auto;
    }
  .title{
    color: #9F814F;
    display: block;
    width: 1000px;
    margin: 20px auto;
  }
  .content{
    width:100%;
    border:1px;
    font-size: 15px;
    border-collapse: collapse;
  }
  .content tr{
    height: 40px;
    border-bottom: 1px solid #ddd;
    border-collapse: collapse;
  }
  .content_title{
    background-color: snow; 
    text-align: center;
   }
   .sf{
      font-size: 13px;
      color: #aaa;
   }

   .cls1 {text-decoration:none;}
   .cls2{
   text-align:right; 
   font-size:16px;
   background-color: #ffffff;
   color: #9F814F;
   }
   .search_wrap{
    width: 200px;
    position: relative;
    margin: 0 auto;
    margin-top: 50px;
   }
   #seh{
    width: 200px;
    height: 30px;
    border: 0;
    border-bottom: 2px solid #ddd;
    margin: 10px 0;
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
    right: 0;
    top: 15px;
   }


  </style>
  <meta charset="UTF-8">

  <title>글목록창</title>

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
    <h4 class="title">Question Board</h4>

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
                    <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
                  </c:when>
                  <c:otherwise>
                    <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
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
            <a href="#" ><img src="${contextPath}/resources/img/search.png" alt="검색">
        </div>
    </form>

    <a  class="cls1"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
    '${contextPath}/member/loginForm.do')"><p class="cls2">글쓰기</p></a>
   
    

 </div>

</body>
</html>