<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("UTF-8"); %>


<html>

<head>
    <meta charset="UTF-8">
    <title>호텔 예약완료</title>
    <style>
        /* * {
            margine: 10%
        } */

        #reservationForm{
            align-items: center;
        }

        /* 소제목태그 */
        #under{
        margin-top: 10px;
        border: 2px solid gray;
        width: 260px;
        margin-left: 17%;    
        }
        
        .reservationtag {
            margin-top: 291px;
            text-align: left; font-size: 25px;
            margin-left: 17%;           
        }
        /* 여기까지 */

        /* 컨텐츠 */
        .success{
            border: 3px solid gray;
            border-radius: 15px;
            margin: auto;
            width: 69%;
            height: 430px;
            text-align: center;
            table-layout: fixed;
        }

        #success_table{
            margin: auto;
            font-size: 25px;
            text-align: center;
            width: 69%;
            table-layout: fixed;
        }
        
        #success_table a{
            margin: auto;
            text-align: center;
            width: 69%;
        }
        
        .success tr {
            position: relative;
        }
        
        #checkimg {
            display: block;
            position: relative;
            text-align: center;
            bottom: 30px
        }
        
        #star{
        	color : #0096FF;
        }

        /* 여기까지 */

        /* 버튼 */
        .btn_pet3 {
            margin-left: auto;
            margin-right: auto;
            width: 68%;
            margin-top: 50px;
            text-align: right;
        }

        #btn_pet3 {
            color: #444444;
            background: #F3F3F3;
            border: 1px #DADADA solid;
            padding: 5px 10px;
            border-radius: 2px;
            font-weight: bold;
            font-size: 9pt;
            outline: none;
        }

        #btn_pet3:hover {
            border: 1px #C6C6C6 solid;
            box-shadow: 1px 1px 1px #EAEAEA;
            color: #333333;
            background: #F7F7F7;
        }

        #btn_pet3:active {
            box-shadow: inset 1px 1px 1px #DFDFDF;
        }
        /* 여기까지 */
    </style>

    <link rel="stylesheet" href="${contextPath}/resources/css/calendar.css">
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    
    <script type="text/javascript" src="${contextPath}/resources/js/reservationCal.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/reservation.js"></script>

    <script>

    </script>
</head>

<body>


    <div id="reservationWrap">
        <form id="reservationForm" action="#">
            <h2 class="reservationtag"> Reservation</h2>
            <p id="under"></p>  
            <br><br>
            <div class="success">
                <table id="success_table" align="center" width="79%">
                    <br><br>
                    <tr align="center">
                    	<td>
                    		<img src="${contextPath}/resources/img/bluecheck.png" style="width:100px; height:100px;" id="checkimg">
                    	</td>
                    </tr>
                    <br><br><br>
                    <tr align="center">
                        <td align="center"><b><span id="star">${user.name}</span></b> 님의 예약이 완료되었습니다.</td>
                    </tr>
                    <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
                    <tr align="center">
                        <td align="center">자세한 내용은 ANITEL 고객센터로 문의해주시기 바랍니다.</td>
                    </tr>
                    <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
                    <tr align="center">
                        <td align="center">문의전화 : 000 - 0000 - 0000</td>
                    </tr>
                    <tr align="center">
                        <td align="center">상담시간 : 오전 09:00 ~ 오후 18:00</td>
                    </tr>
                </table>
            </div>
            <div class="btn_pet3">
            <button type="button" id="btn_pet3" onclick="location.href='${contextPath}/mypage/checkReserve.do'">예약조회 및 수정</button>
        	</div>
            <br><br><br><br>
        </form>
    </div>

</body>

</html>