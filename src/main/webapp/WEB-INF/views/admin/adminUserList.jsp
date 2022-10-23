<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<c:set  var="questionsList"  value="${questionsMap.questionsList}" />

<c:set  var="totUser"  value="${questionsMap.totArticles}" />
<c:set  var="section"  value="${questionsMap.section}" />
<c:set  var="pageNum"  value="${questionsMap.pageNum}" />
<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자페이지_회원조회</title>
    <style>
        .con_wrap{
            width: 1270px; height: auto;
            position: relative;
            margin: 100px auto;
        }   
        .adm_title{
            width: 1000px; height: 65px;
            margin: 0 auto;
            border-bottom: 1px solid #ccc;
        }
        .adm_title p{
            font-size: 17px;
            font-weight: 800;
            text-align: center;
        }
        .y_txt{
            color: #E59F5A;
        }
        .info_wrap{
            width: 100%; height: auto;
            position: relative;
            margin-top: 60px;
        }
        .list_left{
            width: 270px; height: 500px;
        }
        .list_nav{
            width: 100%; height: 155px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            font-size: 14px;
        }
        .sideNav{
            color: #989898;
        }
        .sideNav:hover{
            color: #333;
        }
        .current{
            color: #333;
        }
        .list_wrap{
            width: 1000px; height: auto;
            position: absolute; 
            top: 0; right: 0;
        }
        .list_option{
            width: 100%;
            height: 30px;
            background-color: #fff;
            margin-bottom: 30px;
            position: relative;
            display: flex;
            flex-direction: row;
        }
        .search_wrap{
            margin-left: 10px;
            width: 315px;
            position: relative;
        }
        #search_op{
            width: 85px; height: 20px;
            border: 1px solid #bababa;
            border-radius: 4px;
            padding-left: 2px;
            font-size: 13px;
            box-sizing: border-box;
        }
        #search_op:focus{
            border: 1px solid #bababa;
            outline: none;
        }
        .search_txt{
            width: 220px; height: 25px;
            border: 0;
            background-color: #f1f1f1;
            transition: background-color 0.2s;
            padding-left: 10px;
            box-sizing: border-box;
            font-size: 13px;
            color: #606060;
        }
        .search_txt:focus{
            border: 0;
            outline: none;
            background-color: #eaeaea;
        }
        .seh_icon{
            width: 17px;height: 17px;
            display: block;
            position: absolute;
            right: 10px;
            top: 5px;
            background: none;
            border: none;
            cursor: pointer;
        }
        .grade_option,.res_option{
            font-size: 14px;
            color: #606060;
            line-height: 30px;
        }
        .grade_option{
            margin-left: 50px;
        }
        .res_option{
            margin-left: 35px;
        }
        .grade_option input[type=checkbox], .res_option input[type=checkbox]{
            accent-color: #ffa245;
            color: #ffa245;
            transform: scale(0.9);
            margin: 0 5px;
            position: relative;
            top: 2px;
        }
        .hr{
            height: 100%; width: 1px;
            background-color: #ccc;
            transform: scaleY(0.6);
            margin-left: 30px;
        }
        .grade_option label,.res_option label{
            margin: 0 10px;
        }
        .list_tb{
            border-collapse: collapse;
            width: 1000px;
            text-align: center;
        }
        .list_tb tr{
            height: 40px;
            border-bottom: 1px solid #d6d6d6;
        }
        .list_tb td{
            font-size: 13px;
            color: #606060;
        }
        .tb_title{
            background-color: #f1f1f1;
        }
        .tb_title td{
            font-size: 14px;
            font-weight: bold;
            color: #030303;
        }
        .user_id,.user_name,.user_grade,.user_resState{
            width: 13%;
        }
        .user_joinDate{
            width: 14%;
        }
        .user_email{
            width: 18%;
        }
        .user_tel{
            width: 16%;
        }
        .page_num{
            margin-top: 50px;
            text-align: center;
        }
        .pageNO{
            display: inline-block;
            margin: 0 5px;
            cursor: pointer;
            font-size: 14px;
            color: #999999;
        }
        .select_number{
            color: #030303;
        }
    </style>
	<script type="text/javascript">

        let totalData; //총 데이터 수
        let dataPerPage=10; // 한 페이지에 나타날 데이터 수
        let pageCount = 10; //페이징에 나타낼 페이지 수
        let globalCurrentPage=1; //현재 페이지
        let user_data = []; 

		$(document).ready(function(){
			$.ajax({
				url: "/returnAllUser.do",
				type: "GET", 
				success : function(data){
                    //총데이터 수 저장
                    totalData = data.length;
                    //페이지 버튼 출력
                    page_num_view(totalData);

                    //user_data에 받아온 데이터 저장
                    user_data = [totalData];
                    for(i=0;i<data.length;i++){
                        user_data[i]=data[i];
                    }

                    //첫 화면 출력
                    clickNO(globalCurrentPage);

					$(data).each(function(){});
					},
				error :function(){
					alert("request error!");
					}
			});
		});

        
        //페이지 버튼 함수
        function page_num_view(totalData){
            
            //총 페이지 수
            var totPageNo = totalData/dataPerPage;

            //페이지가 10이상일때
            if(totPageNo>pageCount){
                if(globalCurrentPage>1){
                    $('.page_num').append('<li class="pageNO" onClick="pageDown('+totPageNo+')">pre</li>');
                }
                for(i=1;i<=pageCount;i++){
                    var pageI =i + ((globalCurrentPage-1)*10);
                    if(pageI<=totPageNo){
                        $('.page_num').append('<li class="pageNO num'+pageI+'" onClick="clickNO('+pageI+')">'+pageI+'</li>');
                    }
                }
                if(globalCurrentPage<=totPageNo/pageCount){
                    $('.page_num').append('<li class="pageNO" onClick="pageUP('+totPageNo+')">next</li>');
                }
                
            }else{ //페이지가 10 이하일때
                for(i=1;i<=totPageNo;i++){
                    $('.page_num').append('<li class="pageNO num'+i+'" onClick="clickNO('+i+')">'+i+'</li>');
                }
            }
        }

        //페이지 버튼 누를때 호출
        function clickNO(pageNo){
            //버튼 선택 효과
            $('.pageNO').removeClass('select_number');
            $('.num'+pageNo).toggleClass('select_number');
            //테이블 안의 정보 비우기
            $('.list_tb').empty();

            var html = '<tr class="tb_title">'
						+'<td class="user_id">아이디</td>'
						+'<td class="user_name">이름</td>'
						+'<td class="user_grade">멤버쉽등급</td>'
						+'<td class="user_joinDate">가입일</td>'
						+'<td class="user_email">이메일</td>'
						+'<td class="user_tel">전화번호</td>'
						+'<td class="user_resState">예약여부</td></tr>'; 
            
            for(i=0;i<dataPerPage;i++){
                //글 번호 지정 (페이지에 맞게)
                var listNO = i + ((pageNo-1)*10);

                html += '<tr>';
                html += '<td class="user_id">'+user_data[listNO].id+'</td>';
                html += '<td class="user_name">'+user_data[listNO].name+'</td>';
                html += '<td class="user_grade">'+user_data[listNO].grade+'</td>';
                
                var joinDate = user_data[listNO].joinDate;
                var joinDate_s = joinDate.substring(0, 10);
                
                html += '<td class="user_joinDate">'+joinDate_s+'</td>';
                html += '<td class="user_email">'+user_data[listNO].email+'</td>';
                html += '<td class="user_tel">'+user_data[listNO].tel+'</td>';
                html += '<td class="user_resState">'+user_data[listNO].resState+'</td>';
                html += '</tr>';  
            }
            $('.list_tb').append(html);
        }

        // next버튼 누를때
        function pageUP(totPageNo){
            $('.page_num').empty();
            ++globalCurrentPage;
            page_num_view(totalData);

        }

        // pre버튼 누를때
        function pageDown(totPageNo){
            $('.page_num').empty();
            --globalCurrentPage;
            page_num_view(totalData);
            
        }

	</script>
</head>
<body>
    <section class="con_wrap">
        <div class="adm_title">
            <p><samp class="y_txt">관리자</samp>님 반갑습니다.</p>
            
        </div>
        <div class="info_wrap">
            <div class="list_left">
                <ul class="list_nav">
                    <li><a class="current" href="#">회원조회</a></li>
                    <li><a class="sideNav" href="#">예약관리</a></li>
                    <li><a class="sideNav" href="#">리뷰게시판 관리</a></li>
                    <li><a class="sideNav" href="#">문의게시판 관리</a></li>
                    <li><a class="sideNav" href="#">소개페이지 관리</a></li>
                </ul>
            </div>
            
            <div class="list_wrap">
                <div class="list_option">
                    <div class="search_wrap">
                        <select name="search_op" id="search_op" aria-label="search">
                            <option value="search_id">아이디</option>
                            <option value="search_id">이름</option>
                            <option value="search_tel">전화번호</option>
                            <option value="search_email">이메일</option>
                        </select>
                        <input type="text" name="keyword" class="search_txt" placeholder="검색">
                        <button type="#" class="seh_icon" ><svg width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M15.853 16.56c-1.683 1.517-3.911 2.44-6.353 2.44-5.243 0-9.5-4.257-9.5-9.5s4.257-9.5 9.5-9.5 9.5 4.257 9.5 9.5c0 2.442-.923 4.67-2.44 6.353l7.44 7.44-.707.707-7.44-7.44zm-6.353-15.56c4.691 0 8.5 3.809 8.5 8.5s-3.809 8.5-8.5 8.5-8.5-3.809-8.5-8.5 3.809-8.5 8.5-8.5z"/></svg></button>
                    </div>
                    <div class="grade_option">
                        멤버쉽 :
                        <label><input type="checkbox" name="grade" value="Bronze">Bronze</label>
                        <label><input type="checkbox" name="grade" value="Silver">Silver</label>
                        <label><input type="checkbox" name="grade" value="Gold">Gold</label>
                    </div>
                    <div class="hr"></div>
                    <div class="res_option">
                        예약여부 :
                        <label><input type="checkbox" name="reservation" value="O">O</label>
                        <label><input type="checkbox" name="reservation" value="X">X</label>
                    </div>
                </div>

                <table class="list_tb">
                    <tr class="tb_title">
                        <td class="user_id">아이디</td>
                        <td class="user_name">이름</td>
                        <td class="user_grade">멤버쉽등급</td>
                        <td class="user_joinDate">가입일</td>
                        <td class="user_email">이메일</td>
                        <td class="user_tel">전화번호</td>
                        <td class="user_resState">예약여부</td>
                    </tr>
                    <c:choose>
                        <%-- <c:when test="${userList==null }" >
                            <tr>
                            <td colspan="7">
                                <p><b>등록된 회원이 없습니다.</b></p>
                            </td>  
                            </tr>
                        </c:when> --%>
                
                        <c:when test="${userList !=null }" >
                            <c:forEach  var="user" items="${userList }" varStatus="user_num" >
                            
                                <td class="user_id" >${user.id}</td>
                                <td class="user_name">${user.name}</td> 
                                <td class="user_grade">${user.grade}</td> 
                                <td class="user_joinDate">${user.joinDate}</td> 
                                <td class="user_email">${user.email}</td> 
                                <td class="user_tel">${user.tel}</td> 
                                <td class="user_resState">${user.resState}</td> 
                            
                            </c:forEach>
                        </c:when>
                        </c:choose>
                </table>
                <div class="page_num"></div>
            </div>
            
            <div class="page">
                <c:if test="${totArticles != null }" >
                        <c:choose>
                            <c:when test="${totArticles >100 }">  <!-- 글 개수가 100 초과인경우 -->
                                <c:forEach var="page" begin="1" end="10" step="1" >
                                <c:if test="${section >1 && page==1 }">
                                    <a class="no-uline" href="${contextPath }/questions/questionsList.do?section=${section-1}&pageNum=${(section-1)*10 +1 }&keyword=${keyword}">&nbsp; pre </a>
                                </c:if>
                                    <a class="no-uline" href="${contextPath }/questions/questionsList.do?section=${section}&pageNum=${page}&keyword=${keyword}">${(section-1)*10 +page } </a>
                                <c:if test="${page ==10 }">
                                    <a class="no-uline" href="${contextPath }/questions/questionsList.do?section=${section+1}&pageNum=${section*10+1}&keyword=${keyword}">&nbsp; next</a>
                                </c:if>
                                </c:forEach>
                
                            </c:when>
                            <c:when test="${totArticles ==100 }" >  <!--등록된 글 개수가 100개인경우  -->
                                <c:forEach   var="page" begin="1" end="10" step="1" >
                                <a class="no-uline"  href="#">${page } </a>
                                </c:forEach>
                            </c:when>
                        
                            <c:when test="${totArticles<100 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
                                <c:forEach   var="page" begin="1" end="${totArticles/10 +1}" step="1" >
                                <c:choose>
                                    <c:when test="${page==pageNum }">
                                        <a class="sel-page"  href="${contextPath }/questions/questionsList.do?section=${section}&pageNum=${page}&keyword=${keyword}">${page } </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="no-uline"  href="${contextPath }/questions/questionsList.do?section=${section}&pageNum=${page}&keyword=${keyword}">${page } </a>
                                    </c:otherwise>
                                </c:choose>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                </c:if>
            </div>
        </div>
    </section>
</body>
</html>
