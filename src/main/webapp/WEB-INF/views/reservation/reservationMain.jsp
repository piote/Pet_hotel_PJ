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

        #pet_table {
            margin: auto;
            text-align: center;
            width: 69%;
            table-layout: fixed;
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
        #petpayment{
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
            background-color: bisque;
            list-style: none;
            text-align: center;
        }
        /* 여기까지 */
  
        
        /* 결제정보창 */
        .paymentinfo2{
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
        
        /* 요청사항 */
        .petcomment{
            margin: auto;
            border-radius: 10px;
            text-align: center;
            height: 140px;
            display: none;
        }
        .click{
            display: block;
        }

        .petcomment>input{
            border: 1px solid black;
            box-sizing: border-box;
            border-radius: 15px;
            width: 69%;
            height: 80%;            
            padding: 10px 20px;
            margin: 5px 0;
        }
        /* 여기까지 */

    </style>

    <link rel="stylesheet" href="${contextPath}/resources/css/calendar.css">

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/reservationCal.js"></script>


    <script>
        //예약시 임시 펫 번호.
        var petTableNum = 0;

        var test1 = document.getElementById('beauty');
        var test2 = document.getElementById('spa');
        var test1Result = test1.getAttribute("checked")
        var test2Result = test2.getAttribute("checked")
        function handleOnChange(e) {
            const value = e.value;
        }
        function addRow() {

            // table element 찾기
            var table = document.getElementById('pet_table');

            // 새 행(Row) 추가 (테이블 중간에)
            var newRow = table.insertRow();

            // 새 행(Row)에 Cell 추가
            var Cell1 = newRow.insertCell();
            var Cell2 = newRow.insertCell();
            var Cell3 = newRow.insertCell();
            var Cell4 = newRow.insertCell();
            var Cell5 = newRow.insertCell();
            var Cell6 = newRow.insertCell();

            // Cell에 텍스트 추가

            Cell1.innerHTML = '<input name="petname" id="Pet_Name' + petTableNum + '" type="textbox" style="text-align:center; width:80%;">';
            Cell2.innerHTML = '<select name="petsex" id="Pet_Sex' + petTableNum + '" onchange="handleOnChange(this)"><option>male</option><option>female</option></select>';
            Cell3.innerHTML = '<select name="petroom" id="Pet_Room' + petTableNum + '" onchange="handleOnChange(this)"><option>Deluxe(소형견)</option><option>Superior(중형견)</option><option>Suite(대형견)</option></select>';
            Cell4.innerHTML = '<select name="beauty" id="petbeauty' + petTableNum + '" onchange="handleOnChange(this)"><option>Clipping</option><option>Scissoring</option></select>';
            Cell5.innerHTML = '스파 <input id="spa' + petTableNum + '" type="checkbox">';
            Cell6.innerHTML = '<input type="button" id="' + petTableNum + '" class="petUsed" value="X" >';


            petTableNum++;

            $(".petUsed").on("click", this, function () {

                $(this).parent().parent().remove();
            });

        }

        function addtext(){
            $(".petcomment").toggleClass('click');
        }
        
        function addcost(){
            $(".paymentinfo2").toggleClass('click');
        }
    </script>
</head>

<body>


    <div id="reservationWrap">
        <form id="reservationForm" action="#">
            <div id="checkwrap">
                <ul>
                    <li id="checkinBox" class="reservationBox">
                        <div id="checkin" class="reservationtext reservationtext1">| CHECK IN |</div>
                        <div id="checkin2" class="reservationtext reservationtext2"><span id="start_dayBox">0000. 00.
                                00.</span></div>
                    </li>
                    <li id="checkoutBox" class="reservationBox">
                        <div id="mypet" class="reservationtext reservationtext1">| CHECK OUT |</div>
                        <div id="checkout2" class="reservationtext reservationtext2"><span id="end_dayBox">0000. 00.
                                00.</span></div>
                    </li>
                    <li id="mypetBox" class="reservationBox">
                        <div id="mypet" class="reservationtext reservationtext1">| MY PET |</div>
                        <div id="mypet2" class="reservationtext reservationtext2"><span>데려오기(펫정보db)</span>
                        </div>
                    </li>
                </ul>
            </div>

            <table id="pet_table" align="center" width="79%">
                <tr align="center" bgcolor="bisque">
                    <td><b>Pet Name</b></td>
                    <td><b>Pet sex</b></td>
                    <td><b>Room</b></td>
                    <td><b>Beauty</b></td>
                    <td><b>Spa</b></td>
                    <td><b>Use</b></td>
                </tr>
                <div id="calendarForm"></div>
                <c:forEach var="member" items="${membersList}">
                    <tr align="center">
                        <td>${Pet.Name}</td>
                        <td>${Pet.Sex}</td>
                        <td>
                            <select name="petroom" id="Pet_Room" onchange="handleOnChange(this)">
                                <option>Deluxe(소형견)</option>
                                <option>Superior(중형견)</option>
                                <option>Suite(대형견)</option>
                            </select>
                        </td>
                        <td>
                            <select name="beauty" id="petbeauty" onchange="handleOnChange(this)">
                                <option>Clipping</option>
                                <option>Scissoring</option>
                            </select>
                        </td>
                        <td>
                            스파 <input id="spa" type="checkbox">
                        </td>
                        <!-- <td>
	                <select name="pet" id="Pet_Room" onchange="handleOnChange(this)">
	                    <option>Used</option>
	                    <option>Not Used</option>
	                </select>
	            </td> -->
                        <td>
                            Not Used <input id="petuse" type="checkbox">
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
                <tr align="center" bgcolor="bisque" height="40px">
                    <td colspan="10" align="center" bgcolor="bisque"><b>결제창</b></td>
                </tr>
                <tr align="center" bgcolor="bisque">
                    <td rowspan="6" align="center" bgcolor="bisque"><b>Room</b></td>
                    <td rowspan="2" align="center" bgcolor="bisque">Deluxe(소형견)</td>
                    <td rowspan="2" align="center" bgcolor="bisque"></td>
                    <td rowspan="6" align="center" bgcolor="bisque"><b>Beauty</b></td>
                    <td rowspan="3" align="center" bgcolor="bisque">Clipping</td>
                    <td>소형견</td>
                    <td></td>
                    <td rowspan="6" align="center" bgcolor="bisque"><b>Spa</b></td>
                    <td rowspan="2" align="center" bgcolor="bisque">소형견</td>
                    <td rowspan="2" align="center" bgcolor="bisque"></td>
                </tr>
                <tr align="center" bgcolor="bisque">
                    <td>중형견</td>
                    <td></td>
                </tr>
                <tr align="center" bgcolor="bisque">
                    <td rowspan="2" align="center" bgcolor="bisque">Superior(중형견)</td>
                    <td rowspan="2" align="center" bgcolor="bisque"></td>
                    <td>대형견</td>
                    <td></td>
                    <td rowspan="2" align="center" bgcolor="bisque">중형견</td>
                    <td rowspan="2" align="center" bgcolor="bisque"></td>
                </tr>
                <tr align="center" bgcolor="bisque">
                    <td rowspan="3" align="center" bgcolor="bisque">Scissoring</td>
                    <td>소형견</td>
                    <td></td>
                </tr>
                <tr align="center" bgcolor="bisque">
                    <td rowspan="2" align="center" bgcolor="bisque">Suite(대형견)</td>
                    <td rowspan="2" align="center" bgcolor="bisque"></td>
                    <td>중형견</td>
                    <td></td>
                    <td rowspan="2" align="center" bgcolor="bisque">대형견</td>
                    <td rowspan="2" align="center" bgcolor="bisque"></td>
                </tr>
                <tr align="center" bgcolor="bisque">
                    <td>대형견</td>
                    <td></td>
                </tr>
                <tr align="center" bgcolor="bisque" height="40px">
                    <td colspan="10" align="center" bgcolor="bisque"><b>최종금액창</b></td>
                </tr>
            </table>
        </div>
            
            <div class="btn_pet2">
            	<input type='button' value='가격안내' id="btn_pet2_3" onclick="addcost()" />
            </div>
            
            <div class="paymentinfo2">
                <table id="pet_table2" align="center" width="79%">
                    <tr align="center" bgcolor="bisque">
                        <td rowspan="6" align="center" bgcolor="bisque"><b>Room</b></td>
                        <td rowspan="2" align="center" bgcolor="bisque">Deluxe(소형견)</td>
                        <td rowspan="2" align="center" bgcolor="bisque">100,000 원</td>
                        <td rowspan="6" align="center" bgcolor="bisque"><b>Beauty</b></td>
                        <td rowspan="3" align="center" bgcolor="bisque">Clipping</td>
                        <td>소형견</td>
                        <td>35,000 원</td>
                        <td rowspan="6" align="center" bgcolor="bisque"><b>Spa</b></td>
                        <td rowspan="2" align="center" bgcolor="bisque">소형견</td>
                        <td rowspan="2" align="center" bgcolor="bisque">50,000 원</td>

                    </tr>
                    <tr align="center" bgcolor="bisque">

                        <td>중형견</td>
                        <td>45,000 원</td>
                    </tr>
                    <tr align="center" bgcolor="bisque">

                        <td rowspan="2" align="center" bgcolor="bisque">Superior(중형견)</td>
                        <td rowspan="2" align="center" bgcolor="bisque">150,000 원</td>
                        <td>대형견</td>
                        <td>60,000 원</td>
                        <td rowspan="2" align="center" bgcolor="bisque">중형견</td>
                        <td rowspan="2" align="center" bgcolor="bisque">80,000 원</td>
                    </tr>
                    <tr align="center" bgcolor="bisque">

                        <td rowspan="3" align="center" bgcolor="bisque">Scissoring</td>
                        <td>소형견</td>
                        <td>70,000 원</td>
                    </tr>
                    <tr align="center" bgcolor="bisque">

                        <td rowspan="2" align="center" bgcolor="bisque">Suite(대형견)</td>
                        <td rowspan="2" align="center" bgcolor="bisque">200,000 원</td>
                        <td>중형견</td>
                        <td>80,000 원</td>
                        <td rowspan="2" align="center" bgcolor="bisque">대형견</td>
                        <td rowspan="2" align="center" bgcolor="bisque">120,000 원</td>
                    </tr>
                    <tr align="center" bgcolor="bisque">

                        <td>대형견</td>
                        <td>100,000 원</td>
                    </tr>
                </table>
            </div>

            <div class="btn_pet2">
                <input type='button' value='요청사항' id="btn_pet2_1" onclick="addtext()" />
                <input type='button' value='다음' id="btn_pet2_2" onclick=' ' />
            </div>
        </form>
    </div>
    
    <div class="petcomment">
    	<input type="text">
    </div>
    <br></br>


</body>

</html>