
<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");

%>     -->



<html>

<head>
    <meta charset="UTF-8">
    <title>호텔 예약창(예약단계1)</title>
    <style>

    	*{
    		margine:10%
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


        #btn_addpet {
            margin-top: 10px;
            text-align: center;
        }

        #btn_pet1 {
            margin-top: 50px;
            text-align: center;
        }

        #btn_pet2 {
            margin-top: 50px;
            text-align: right;
        }

        #wrap {
            text-align: center;


        

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

        .reservationBox {}

        #btn_pet1 {
            margin-top: 50px;
            text-align: right;
        }

        #btn_pet1_1, #btn_pet2_1, #btn_pet2_2 {
        color: #444444;
        background: #F3F3F3;
        border: 1px #DADADA solid;
        padding: 5px 10px;
        border-radius: 2px;
        font-weight: bold;
        font-size: 9pt;
        outline: none;
        }

        #btn_pet1_1:hover, #btn_pet2_1:hover, #btn_pet2_2:hover {
        border: 1px #C6C6C6 solid;
        box-shadow: 1px 1px 1px #EAEAEA;
        color: #333333;
        background: #F7F7F7;
        }

        #btn_pet1_1:active, #btn_pet2_1:active, #btn_pet2_2:active {
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
        	  var table = document.getElementById('pet_table');
        	  
        	  // 새 행(Row) 추가 (테이블 중간에)
        	  var newRow = table.insertRow();
        	  
        	  // 새 행(Row)에 Cell 추가
        	  var Cell1 = newRow.insertCell();
        	  var Cell2 = newRow.insertCell();
        	  var Cell3 = newRow.insertCell();
        	  var Cell4 = newRow.insertCell();
        	  var Cell5 = newRow.insertCell();
        	  
        	  // Cell에 텍스트 추가
        	  Cell1.innerText = 'Pet Name';
        	  Cell2.innerText = 'Pet Age';
        	  Cell3.innerHTML = '<td><input type="selectbox" name="Pet Sex"/></td>';
        	  Cell4.innerHTML = '<input type="selectbox" name="Pet Sex"/>';
        	  Cell5.innerHTML = '<input type="selectbox" name="Pet Sex"/>';
        	}
        


        // function tableCreate() {
        // 	var html = '';
        	
        // 	var name = $("#Pet_Name").val();
        // 	var age = $("#Pet_Age").val();
        // 	var sex = $("#Pet_Sex").val();
        // 	var room = $("#Pet_Room").val();
        // 	var beauty = $("#Pet_Beauty").val();
        	
        // 	html += '<tr>';
        // 	html += '<td>'+name+'</td>';
        // 	html += '<td>'+age+'</td>';
        // 	html += '<tr>'+sex+'</td>';
        // 	html += '<tr>'+room+'</td>';
        // 	html += '<tr>'+beauty+'</td>';
        // 	html += '</tr>';
        // }
    }
    </script>
</head>

<body>


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
    </div>
</body>

</html>