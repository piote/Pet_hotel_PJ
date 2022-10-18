<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("UTF-8"); %>


<html>

<head>
    <meta charset="UTF-8">
    <title>호텔 예약창(예약단계1)</title>
    <style>
        /* * {
            margine: 10%
        } */

        #reservationForm {
            align-items: center;
        }

        /* 소제목태그 */
        #under {
            margin-top: 10px;
            border: 2px solid gray;
            width: 260px;
            margin-left: 17%;
        }

        .reservationtag {
            margin-top: 291px;
            text-align: left;
            font-size: 25px;
            margin-left: 17%;
        }

        /* 여기까지 */

        /* 테이블 */
        #pet_table {
            margin: auto;
            text-align: center;
            width: 69%;
            height: 40px;
            table-layout: fixed;
        }

        #pet_table td {
            height: 30px;
        }

        #pet_table1 {
            margin: auto;
            text-align: center;
            width: 69%;
            table-layout: fixed;
        }

        #pet_table2 {
            margin: auto;
            text-align: center;
            width: 69%;
            table-layout: fixed;
        }

        /* 여기까지 */

        #checkin {
            margin-left: 10%;
            margin-right: 10%;
        }

        #checkin2 {
            margin-left: 10%;
            margin-right: 10%;
            cursor: pointer;
        }

        #checkout {
            margin-left: 10%;
            margin-right: 10%;
        }

        #checkout2 {
            margin-left: 10%;
            margin-right: 10%;
            cursor: pointer;
        }

        #mypet {
            margin-left: 10%;
            margin-right: 10%;
        }

        #mypet2 {
            margin-left: 10%;
            margin-right: 10%;
            cursor: pointer;
        }

        #btn_addpet {
            margin-top: 10px;
            text-align: center;
        }

        #btn_pet1 {
            margin-top: 50px;
            text-align: center;
        }

        .btn_pet2 {
            margin-left: auto;
            margin-right: auto;
            width: 68%;
            margin-top: 50px;
            text-align: right;
        }

        #checkwrap {
            text-align: center;
        }

        #checkwrap li,
        #checkwrap ul {
            display: inline-block;

        }

        /* 결제상황창 */
        #petpayment {
            width: 68.8%;
            margin: auto;
            text-align: center;
            table-layout: fixed;
        }

        #petpayment li ul {
            display: inline-block;
        }

        #petpayment li {
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            list-style: none;
            text-align: center;
        }

        /* 여기까지 */


        /* 결제정보창 */
        .paymentinfo2 {
            margin: auto;
            width: 100%;
            height: 20%;
            text-align: center;
            table-layout: fixed;
            display: none;
        }

        /* 여기까지 */

        .reservationtext1 {
            list-style: none;
            display: inline-block;
            color: brown;
            font-size: 20px;
        }

        .reservationtext2 {
            list-style: none;
            display: inline-block;
            color: black;
            font-size: 20px;
        }

        #div1 ul li {
            list-style: none;
            display: inline-block;
            color: brown;
            font-size: 20px;

        }

        #div2 ul li {
            list-style: none;
            display: inline-block;
            color: black;
            font-size: 20px;
        }

        .reservationtext {
            margin: 15px;
        }


        /* 버튼 */
        #btn_pet1_1,
        #btn_pet2_1,
        #btn_pet2_2,
        #btn_pet2_3 {
            color: #444444;
            background: #F3F3F3;
            border: 1px #DADADA solid;
            padding: 5px 10px;
            border-radius: 2px;
            font-weight: bold;
            font-size: 9pt;
            outline: none;
        }

        #btn_pet1_1:hover,
        #btn_pet2_1:hover,
        #btn_pet2_2:hover,
        #btn_pet2_3:hover {
            border: 1px #C6C6C6 solid;
            box-shadow: 1px 1px 1px #EAEAEA;
            color: #333333;
            background: #F7F7F7;
        }

        #btn_pet1_1:active,
        #btn_pet2_1:active,
        #btn_pet2_2:active,
        #btn_pet2_3:active {
            box-shadow: inset 1px 1px 1px #DFDFDF;
        }
        /* 여기까지 */

        /* 요청사항 */
        .petcomment {
            margin: auto;
            border-radius: 10px;
            text-align: center;
            height: 140px;
            display: none;
        }

        .click {
            display: block;
        }

        .petcomment>input {
            border: 1px solid black;
            box-sizing: border-box;
            border-radius: 15px;
            width: 69%;
            height: 80%;
            padding: 10px 20px;
            margin: 5px 0;
        }

        /* 여기까지 */

        .paymentinfo1 tr {
            position: relative;
        }

        .totalpayment {
            display: block;
            width: 160px;
            height: 25px;
            position: absolute;
            right: 240px;
            top: 10px;
        }

        .membership {
            display: block;
            width: 2300px;
            height: 25px;
            position: absolute;
            left: -970px;
            top: 10px;
        }
        
        #bronzeimg {
            display: block;
            position: absolute;
            top: 5px;
            left: 10px;
        }

        .totalcost {
            display: block;
            position: absolute;
            top: 10px;
            right: 20px;
        }
    </style>

    <link rel="stylesheet" href="${contextPath}/resources/css/calendar.css">
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    
    <script type="text/javascript" src="${contextPath}/resources/js/reservationCal.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/reservation.js"></script>
    <script>
    	function reservationSubmit(obj){
	    	obj.submit();
     	}
    </script>
</head>

<body>


    <div id="reservationWrap">
        <form id="reservationForm" action="${contextPath}/reservationAdd.do">
            <h2 class="reservationtag"> Reservation</h2>
            <p id="under"></p>
            <br><br>
            <div id="checkwrap">
                <ul>
                    <li id="checkinBox" class="reservationBox">
                        <div id="checkin" class="reservationtext reservationtext1">| CHECK IN |</div>
                        <div id="checkin2" class="reservationtext reservationtext2">
                        	<span id="start_dayBox">0000.00.00.</span>
                        	<input type="hidden" name="checkinDate" id="checkinDate">
                     	</div>
                    </li>
                    <li id="checkoutBox" class="reservationBox">
                        <div id="mypet" class="reservationtext reservationtext1">| CHECK OUT |</div>
                        <div id="checkout2" class="reservationtext reservationtext2">
                        	<span id="end_dayBox">0000.00.00.</span>
                            <input type="hidden" name="checkoutDate" id="checkoutDate">
                        </div>
                    </li>
                    <li id="mypetBox" class="reservationBox">
                        <div id="mypet" class="reservationtext reservationtext1">| MY PET |</div>
                        <div id="mypet2" class="reservationtext reservationtext2"><span id="com_mypet">데려오기</span>
                        </div>
                    </li>
                </ul>
            </div>

            <table id="pet_table" align="center" width="79%">
                <tr align="center" bgcolor="#e5e4e2" height="40px">
                    <td><b>Pet Name</b></td>
                    <td><b>Pet sex</b></td>
                    <td><b>Room</b></td>
                    <td><b>Beauty</b></td>
                    <td><b>Spa</b></td>
                    <td><b>이용여부</b></td>
                </tr>
                <div id="calendarForm"></div>
                <c:forEach var="member" items="${membersList}">
                    <tr align="center" height="30px">
                        <td>${Pet.Name}</td>
                        <td>${Pet.Sex}</td>
                        <td>
                            <select name="petroom" id="Pet_Room" onchange="handleOnChange(this)">
                                <option value="1">Deluxe(소형견)</option>
                                <option value="2">Superior(중형견)</option>
                                <option value="3">Suite(대형견)</option>
                            </select>
                        </td>
                        <td>
                            <select name="beauty" id="petbeauty" onchange="handleOnChange(this)">
                                <option>이용안함</option>
                                <option value="1">Clipping</option>
                                <option value="2">Scissoring</option>
                            </select>
                        </td>
                        <td>
                            <input id="spa" type="checkbox">
                        </td>
                        <td>
                            <input type="button" class="petUsed" value="X">
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div id="btn_pet1">
                <input type='button' value='추가하기' id="btn_pet1_1" onclick='addRow()' />
            </div>

            <br></br>

            <div class="paymentinfo1">
                <table id="pet_table1" align="center" width="79%">
                    <tr align="center" bgcolor="white" height="40px">
                        <td colspan="10" align="center" bgcolor="#e5e4e2"><b id="dateResult">Reservation Detail</b></td>
                    </tr>
                    <tr align="center" bgcolor="white">
                        <td rowspan="6" align="center" bgcolor="white"><b>Room</b></td>
                        <td rowspan="2" align="center" bgcolor="white">Deluxe(소형견)</td>
                        <td id="S_R" rowspan="2" align="center" bgcolor="white">0 원</td>
                        <td rowspan="6" align="center" bgcolor="white"><b>Beauty</b></td>
                        <td rowspan="3" align="center" bgcolor="white">Clipping</td>
                        <td>소형견</td>
                        <td id="S_BC">0 원</td>
                        <td rowspan="6" align="center" bgcolor="white"><b>Spa</b></td>
                        <td rowspan="2" align="center" bgcolor="white">소형견</td>
                        <td id="S_S" rowspan="2" align="center" bgcolor="white">0 원</td>
                    </tr>
                    <tr align="center" bgcolor="white">
                        <td>중형견</td>
                        <td id="M_BC">0 원</td>
                    </tr>
                    <tr align="center" bgcolor="white">
                        <td rowspan="2" align="center" bgcolor="white">Superior(중형견)</td>
                        <td id="M_R" rowspan="2" align="center" bgcolor="white">0 원</td>
                        <td>대형견</td>
                        <td id="L_BC">0 원</td>
                        <td rowspan="2" align="center" bgcolor="white">중형견</td>
                        <td  id="M_S" rowspan="2" align="center" bgcolor="white">0 원</td>
                    </tr>
                    <tr align="center" bgcolor="white">
                        <td rowspan="3" align="center" bgcolor="white">Scissoring</td>
                        <td>소형견</td>
                        <td id="S_BS">0 원</td>
                    </tr>
                    <tr align="center" bgcolor="white">
                        <td rowspan="2" align="center" bgcolor="white">Suite(대형견)</td>
                        <td id="L_R" rowspan="2" align="center" bgcolor="white">0 원</td>
                        <td>중형견</td>
                        <td id="M_BS">0 원</td>
                        <td rowspan="2" align="center" bgcolor="white">대형견</td>
                        <td id="L_S" rowspan="2" align="center" bgcolor="white">0 원</td>
                    </tr>
                    <tr align="center" bgcolor="white">
                        <td>대형견</td>
                        <td id="L_BS">0 원</td>
                    </tr>
                    <tr align="center" bgcolor="white" height="40px">
                        <td colspan="10" bgcolor="#e5e4e2">
	                        <c:choose>
	                        	<c:when test="${user.grade eq 'Bronze'}">
	                        		<img src="${contextPath}/resources/img/bronze_medal.png" width="30px" height="30px" id="bronzeimg">
                            		<b class="membership">Bronze Membership : Discount 2%</b>
	                        	</c:when>
	                        	<c:when test="${user.grade eq 'Silver'}">
	                        		<img src="${contextPath}/resources/img/silver_medal.png" width="30px" height="30px" id="bronzeimg">
                            		<b class="membership">Silver Membership : Discount 5%</b>
	                        	</c:when>
	                        	<c:when test="${user.grade eq 'Gold'}">
	                        		<img src="${contextPath}/resources/img/gold_medal.png" width="30px" height="30px" id="bronzeimg">
                            		<b class="membership">Gold Membership : Discount 10%</b>
	                        	</c:when>
	                        </c:choose>
                            <input id="membership" type="hidden" value="${user.grade}">
                            <b class="totalpayment"> Total Payment : </b>
                            <b class="totalcost">0 원</b>
                        </td>
                    </tr>
                    <td rowspan="6" align="center" bgcolor="white"><b></b></td>
                    <td rowspan="2" align="center" bgcolor="white"></td>
                    <td rowspan="2" align="center" bgcolor="white"></td>
                    <td rowspan="6" align="center" bgcolor="white"><b></b></td>
                    <td rowspan="3" align="center" bgcolor="white"></td>
                    <td></td>
                    <td></td>
                </table>
            </div>

            <div class="btn_pet2">
                <input type='button' value='가격안내' id="btn_pet2_3" onclick="addcost()" />
            </div>

            <div class="paymentinfo2">
                <table id="pet_table2" align="center">
                    <tr align="center" bgcolor="white" height="40px">
                        <td colspan="10" align="center" bgcolor="#e5e4e2"><b>Payment Detail</b></td>
                    </tr>
                    <tr align="center" bgcolor="white">
                        <td rowspan="6" align="center" bgcolor="white"><b>Room</b></td>
                        <td rowspan="2" align="center" bgcolor="white">Deluxe(소형견)</td>
                        <td rowspan="2" align="center" bgcolor="white">100,000 원</td>
                        <td rowspan="6" align="center" bgcolor="white"><b>Beauty</b></td>
                        <td rowspan="3" align="center" bgcolor="white">Clipping</td>
                        <td>소형견</td>
                        <td>35,000 원</td>
                        <td rowspan="6" align="center" bgcolor="white"><b>Spa</b></td>
                        <td rowspan="2" align="center" bgcolor="white">소형견</td>
                        <td rowspan="2" align="center" bgcolor="white">50,000 원</td>

                    </tr>
                    <tr align="center" bgcolor="white">

                        <td>중형견</td>
                        <td>45,000 원</td>
                    </tr>
                    <tr align="center" bgcolor="white">

                        <td rowspan="2" align="center" bgcolor="white">Superior(중형견)</td>
                        <td rowspan="2" align="center" bgcolor="white">150,000 원</td>
                        <td>대형견</td>
                        <td>60,000 원</td>
                        <td rowspan="2" align="center" bgcolor="white">중형견</td>
                        <td rowspan="2" align="center" bgcolor="white">80,000 원</td>
                    </tr>
                    <tr align="center" bgcolor="white">

                        <td rowspan="3" align="center" bgcolor="white">Scissoring</td>
                        <td>소형견</td>
                        <td>70,000 원</td>
                    </tr>
                    <tr align="center" bgcolor="white">

                        <td rowspan="2" align="center" bgcolor="white">Suite(대형견)</td>
                        <td rowspan="2" align="center" bgcolor="white">200,000 원</td>
                        <td>중형견</td>
                        <td>80,000 원</td>
                        <td rowspan="2" align="center" bgcolor="white">대형견</td>
                        <td rowspan="2" align="center" bgcolor="white">120,000 원</td>
                    </tr>
                    <tr align="center" bgcolor="white">

                        <td>대형견</td>
                        <td>100,000 원</td>
                    </tr>
                </table>
            </div>

            <div class="btn_pet2">
                <input type='button' value='요청사항' id="btn_pet2_1" onclick="addtext()" />
                <!--<button type="button" id="btn_pet2_2" onclick="location.href='${contextPath}/reservationComplete.do'">완료</button>-->
                <button type="button" id="btn_pet2_2" onclick="reservationSubmit(this.form)">완료</button>
            	
            </div>
    
    </div>

    <div class="petcomment">
        <input type="text" name="petcomment">
    </div>
     </form>
    <br></br>


</body>

</html>