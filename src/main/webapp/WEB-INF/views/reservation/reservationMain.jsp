<!--
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>     
-->


<html>

<head>
    <meta charset="UTF-8">
    <title>호텔 예약창(예약단계1)</title>
    <style>
        

        #fullWrap {
            
            width: 100%;
            text-align: center;
            align-content: center;
            border: 1px solid;
            margin: 0 auto;
            /* margin-top: 400px; */
            
        }
        #wrap {
            margin: 0 auto;
            border: 1px solid;
            width: 80%;
        }

        h2 {
            text-align: center;
            color: brown;
            font-size: 50px;
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


<<<<<<< HEAD

        
=======
        #btn_pet1 {
            margin-top: 50px;
            text-align: right;
        }

        #wrap {
            text-align: center;

        }
>>>>>>> parent of 1a55eaf (jsp 14:56 수정)

        #wrap li,
        #wrap ul {
            display: inline-block;
            

        }
        #wrap li{
            width: 32%;
        }

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


        .reservationtext {
            margin: 15px;
        }

<<<<<<< HEAD
        .reservationBox {}

        #btn_pet1 {
            margin-top: 50px;
            text-align: right;
        }
    </style>
=======
        button {
        color: #444444;
        background: #F3F3F3;
        border: 1px #DADADA solid;
        padding: 5px 10px;
        border-radius: 2px;
        font-weight: bold;
        font-size: 9pt;
        outline: none;
        }

        button:hover {
        border: 1px #C6C6C6 solid;
        box-shadow: 1px 1px 1px #EAEAEA;
        color: #333333;
        background: #F7F7F7;
        }

        button:active {
        box-shadow: inset 1px 1px 1px #DFDFDF;   
        }
    </style>
    <script>
        var test1 = document.getElementById('beauty');
        var test2 = document.getElementById('spa');

        var test1Result = test1.getAttribute("checked")
        var test2Result = test2.getAttribute("checked")

        function handleOnChange(e) {
        const value = e.value;
        
        function addRow() {
        	  // table element 찾기
        	  const table = document.getElementById('pet_table');
        	  
        	  // 새 행(Row) 추가 (테이블 중간에)
        	  const newRow = table.insertRow(0);
        	  
        	  // 새 행(Row)에 Cell 추가
        	  const newCell1 = newRow.insertCell(0);
        	  const newCell2 = newRow.insertCell(1);
        	  const newCell3 = newRow.insertCell(1);
        	  const newCell4 = newRow.insertCell(1);
        	  const newCell5 = newRow.insertCell(1);
        	  
        	  // Cell에 텍스트 추가
        	  newCell1.innerText = ' ';
        	  newCell2.innerText = ' ';
        	  newCell2.innerText = ' ';
        	  newCell2.innerText = ' ';
        	  newCell2.innerText = ' ';
        	}
        
    </script>
>>>>>>> parent of 1a55eaf (jsp 14:56 수정)
</head>

<body>
    <div id="fullWrap">
        <h2>
            예약하기
        </h2>
     

<<<<<<< HEAD
        <div id="wrap">
            <ul>
                <li id="checkinBox" class="reservationBox">
                    <div id="checkin" class="reservationtext reservationtext1">| CHECK IN |</div>
                    <div id="checkin2" class="reservationtext reservationtext2"><span>현재 날짜(달력연동)</span></div>
                </li>
                <li id="checkoutBox" class="reservationBox">
                    <div id="mypet" class="reservationtext reservationtext1">| CHECK OUT |</div>
                    <div id="checkout2" class="reservationtext reservationtext2"><span>다음 날짜(달력연동)</span></div>
                </li>
                <li id="mypetBox" class="reservationBox">
                    <div id="mypet" class="reservationtext reservationtext1">| MY PET |</div>
                    <div id="mypet2" class="reservationtext reservationtext2"><span>데려오기(펫정보db)</span></div>
                </li>
            </ul>
        </div>
     
        <table align="center" width="80%">
            <tr align="center" bgcolor="bisque">
                <td><b>Pet Name</b></td>
                <td><b>Pet Age</b></td>
                <td><b>Pet Gender</b></td>
                <td><b>Room</b></td>
                <td><b>Service</b></td>
                <td><b>　　　　</b></td>
            </tr>

            <c:forEach var="member" items="${membersList}">
                <tr align="center">
                    <td>${Pet.Name}</td>
                    <td>${Pet.Age}</td>
                    <td>${Pet.Gender}</td>
                    <td>${Room}</td>
                    <!-- 체크박스 -->
                    <td>${Service}</td>
                    <td><a href="${contextPath}/member/removeMember.do?id=${member.id }">삭제하기</a></td>
                </tr>
            </c:forEach>
        </table>
        <hr>
        </hr>
        <div id="btn_pet1">
            <button id="petcomment">요청사항</button>
            <button id="next">다음</button>
        </div>
=======
    <div id="wrap">
        <ul>
            <li id="checkinBox" class="reservationBox">
                <div id="checkin" class="reservationtext reservationtext1">| CHECK IN |</div>
                <div id="checkin2" class="reservationtext reservationtext2"><span>현재 날짜(달력연동)</span></div>
            </li>
            <li id="checkoutBox" class="reservationBox">
                <div id="mypet" class="reservationtext reservationtext1">| CHECK OUT |</div>
                <div id="checkout2" class="reservationtext reservationtext2"><span>다음 날짜(달력연동)</span></div>
            </li>
            <li id="mypetBox" class="reservationBox">
                <div id="mypet" class="reservationtext reservationtext1">| MY PET |</div>
                <div id="mypet2" class="reservationtext reservationtext2"><span>데려오기(펫정보db)</span></div>
            </li>
        </ul>
    </div>
    <hr>
    </hr>
    <table id='pet_table' align="center" width="80%">
        <tr align="center" bgcolor="bisque">
            <td><b>Pet Name</b></td>
            <td><b>Pet Age</b></td>
            <td><b>Pet sex</b></td>
            <td><b>Room</b></td>
            <td><b>Service</b></td>
            <td><b>　　　　</b></td>
        </tr>

        <c:forEach var="member" items="${membersList}">
            <tr align="center">
                <td>${Pet.Name}</td>
                <td>${Pet.Age}</td>
                <td>${Pet.Sex}</td>
                <td>
                    <select name="petroom" id="petroom" onchange="handleOnChange(this)">
                        <option>Standard</option>
                        <option>Superior</option>
                        <option>Deluxe</option>
                    </select>
                </td>
                <!-- 체크박스 -->
                <td>미용<input id="beauty" type="checkbox"> 
                    스파<input id="spa" type="checkbox"></td>
                <td><a href="${contextPath}/member/removeMember.do?id=${member.id }">삭제하기</a></td>
            </tr>
        </c:forEach>
    </table>
    <hr>
    </hr>
    <div>
    	<tr>
    		<td><input type="text" placeholder="" id="Pet Name"></td>
    		<td><input type="text" placeholder="" id="Pet Age"></td>
    		<td><select name="petsex" id="pesex" onchange="handleOnChange(this)">
            	<option>male</option>
            	<option>female</option>
            </select></td>
    		<td><select name="petroom" id="petroom" onchange="handleOnChange(this)">
            	<option>Standard</option>
            	<option>Superior</option>
            	<option>Deluxe</option>
            </select></td>
    		<td>미용<input id="beauty" type="checkbox"> 
                스파<input id="spa" type="checkbox"></td>
    	</tr>
    </div>
    <br>
    <div id="btn_pet1" class="button">
    	<input type='button' value='요청사항' onclick=' '/>
    	<input type='button' value='다음' onclick=' '/>
>>>>>>> parent of 1a55eaf (jsp 14:56 수정)
    </div>
</body>

</html>