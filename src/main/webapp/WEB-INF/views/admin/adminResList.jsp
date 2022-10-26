<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="item_res"  value="24"  /><!--총 데이터베이스 아이템 수  -->
<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자페이지_예약조회</title>
    <!-- <script src="${contextPath}/resources/js/adminPage.js"></script> -->
    <style>
        #adm_res{
        	color: #333;
        }
        .list_wrap{
            width: 1000px; height: auto;
            position: absolute; 
            top: 120px; right: 0;
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
        .sort_option,.res_option{
            font-size: 14px;
            color: #606060;
            line-height: 30px;
            display: flex;
            flex-direction: row;
        }
        .sort_option{
            margin-left: 0;
        }
        .res_option{
            margin-left: 25px;
        }
        .sort_option input[type=radio], .res_option input[type=checkbox]{
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
            margin-left: 15px;
        }
        .sort_option label,.res_option label{
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
        .res_num,.res_name,.res_petCount,.resState{
            width: 12%;
        }
        .res_cost{
            width: 13%;
        }
        .res_Date{
            width: 17%;
        }
        .res_payTime{
            width: 15%;
        }
        .modRes{
            width: 56px;
            height: 20px;
            font-size: 10px;
            border: 1px solid #bbb;
            border-radius: 3px;
            font-weight: 600;
        }
        .modRes:hover{
            background-color: #ddd;
        }.modRes:active{
            background-color: #ccc;
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
    <script>
    	
    </script>
</head>
<body>
    
            <div class="list_wrap">
                <div class="list_option">
                    <div class="search_wrap" id="searchForm" name="searchForm" onSubmit="search()" >
                        <select name="search_op" id="search_op" aria-label="search">
                            <option value="search_id">예약자</option>
                            <option value="search_name">예약번호</option>
                        </select>
                        <input type="text" name="keyword" id="keyword" class="search_txt" placeholder="검색">
                        <button type="button" class="seh_icon" onclick="search()" ><svg width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M15.853 16.56c-1.683 1.517-3.911 2.44-6.353 2.44-5.243 0-9.5-4.257-9.5-9.5s4.257-9.5 9.5-9.5 9.5 4.257 9.5 9.5c0 2.442-.923 4.67-2.44 6.353l7.44 7.44-.707.707-7.44-7.44zm-6.353-15.56c4.691 0 8.5 3.809 8.5 8.5s-3.809 8.5-8.5 8.5-8.5-3.809-8.5-8.5 3.809-8.5 8.5-8.5z"/></svg></button>
                    </div>
                    <div class="sort_option">
                        <label><input type="radio" name="sort" id="sort_num" value="sort_num" checked="checked">예약번호 순</label>
                        <label><input type="radio" name="sort" id="sort_res" value="sort_res">예약일 순</label>
                        <label><input type="radio" name="sort" id="sort_pay" value="sort_pay">주문일 순</label>
                    </div>
                    <div class="hr"></div>
                    <div class="res_option">
                        예약상태 :
                        <label><input type="checkbox" name="State" id="res_complete" value="complete">이용완료</label>
                        <label><input type="checkbox" name="State" id="res_before" value="before">이용전</label>
                        <label><input type="checkbox" name="State" id="res_cancel" value="cancel">취소</label>
                    </div>
                </div>
	
				<!-- 테이블 -->
                <table class="list_tb">
                    <tr class="tb_title">
                        <td class="res_num">예약번호</td>
                        <td class="res_name">예약자</td>
                        <td class="res_Date">예약일</td>
                        <td class="res_petCount">총 마리수</td>
                        <td class="res_payTime">주문일</td>
                        <td class="res_cost">총 가격</td>
                        <td class="resState">예약상태</td>
                        <td class="res_modBt"></td>
                    </tr>
                    <c:forEach var="reservation" items="${resList}" varStatus="status">
                    	<tr>
	                        <td class="res_num">1</td>
	                        <td class="res_name">aaa</td>
	                        <td class="res_Date">2010.10.10 ~ 2010.10.10</td>
	                        <td class="res_petCount">3마리</td>
	                        <td class="res_payTime">2010.10.10</td>
	                        <td class="res_cost">200,000원</td>
	                        <td class="resState">이용완료</td>
	                        <td class="res_modBt">
	                            <button type="button" class="modRes">예약변경</button>
	                        </td>
                    	</tr>
                    </c:forEach>
                    <tr>
                        <td class="res_num">1</td>
                        <td class="res_name">aaa</td>
                        <td class="res_Date">2010.10.10 ~ 2010.10.10</td>
                        <td class="res_petCount">3마리</td>
                        <td class="res_payTime">2010.10.10</td>
                        <td class="res_cost">200,000원</td>
                        <td class="resState">이용완료</td>
                        <td class="res_modBt">
                            <button type="button" class="modRes">예약변경</button>
                        </td>
                    </tr>
                </table>
                
                <!-- 페이지기능 -->
                
                <!-- 페이지당 10개의 예약을 출력한다. -->
                                
           	 	<!-- 페이지 만큼 나누어떨어지지만 그대로 계산하면 1페이지 더 생성되므로 주의 -->
                <c:if test="${item_res % 10 != 0 and item_res > 10}">
					<c:set var="PI" value="${item_res / 10}" scope="request"/>
									</c:if>
				
				 <!-- 페이지 만큼 나누어떨어지지만 그대로 계산하면 1페이지 더 생성되므로 주의 -->
				<c:if test="${item_res % 10 == 0 and item_res > 10}">
					<c:set var="PI" value="${item_res / 10-1}" scope="request"/>
				</c:if>
		
				<!-- 아이템이 적어 페이지를 만들 이유가 없음 -->
				<c:if test="${item_res <= 10}">
					<c:set var="PI" value="${0}" scope="request"/>
					3
				</c:if>
				
				
                <div class="page_num">
	                <li class="pageNO" onClick="pageDown()">pre</li>
		            <c:forEach varStatus="i" begin="0" end="${PI}">
					<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다. -->
						<li class="pageNO" onClick="clickNO(${i.count-1})">${i.count}</li>
					</c:forEach>
	                <li class="pageNO" onClick="pageUP()">next</li>
                </div>
            </div>
            
</body>
</html>