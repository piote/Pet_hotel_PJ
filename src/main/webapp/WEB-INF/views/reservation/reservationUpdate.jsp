<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("UTF-8"); %>


<html>

<head>
    <meta charset="UTF-8">
    <title>호텔 예약 수정</title>
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
            margin-top: 286px;
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
            font-size: 30px;
        }

        #checkin2 {
            margin-left: 10%;
            margin-right: 10%;
            cursor: pointer;
            font-size: 30px;
        }

        #checkout {
            margin-left: 10%;
            margin-right: 10%;
            font-size: 30px;
        }

        #checkout2 {
            margin-left: 10%;
            margin-right: 10%;
            cursor: pointer;
            font-size: 30px;
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
        #btn_pet2_3,
        #pop_end1 {
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
        #btn_pet2_3:hover,
        #pop_end1:hover {
            border: 1px #C6C6C6 solid;
            box-shadow: 1px 1px 1px #EAEAEA;
            color: #333333;
            background: #F7F7F7;
        }

        #btn_pet1_1:active,
        #btn_pet2_1:active,
        #btn_pet2_2:active,
        #btn_pet2_3:active,
        #pop_end1:active {
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

        .petcomment>textarea {
            border: 1px solid black;
            box-sizing: border-box;
            border-radius: 15px;
            width: 69%;
            height: 80%;
            padding: 10px 20px;
            margin: 5px 0;
            resize: none;
            font-size: 18px;
            
        }
        #petcommentLengh{
        	margin: auto;
        	width: 69%;
        	text-align: right;
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
            width: 970px;
            height: 25px;
            position: absolute;
            left: -315px;
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
        
    	#lay_pop{
    		position:absolute;
    		z-index:500;
    		width:69%;
    		height:800px;
    		overflow-y:scroll;
    		display:none;
    		background-color:#ffffff;
    		border:2px solid #cccccc; 
    		text-align: center;
    		}
    	
    	#pop_content {
    		text-align: center;
    		margin-top:60px;
            display: inline-block;
    		}
    	
    	#pop_content ul li{
    		text-align: center;
            display: inline-block;
    		}
    		
    	#all_body{
    		position:absolute;
    		z-index:9;
    		display:block;
    		filter:alpha(opacity=50);
    		opacity:0.5;
    		-moz-opacity:0.5;
    		background-color:#000000;
    		left:0;
    		top:0;}
    	
    	#pop_end{
            margin-left: auto;
            margin-right: auto;
            width: 68%;
            margin-top: 50px;
            text-align: right;
    	}
    	
    	#asd{
    		margin-right:35px;
        	text-align: center;
    	}
    	
        #ch_pet_table {
            margin: auto;
            text-align: center;
            width: 69%;
            height: 40px;
            table-layout: fixed;
        }

        #ch_pet_table td {
            height: 30px;
        }
        
        .petUsed{
        	content:url("${contextPath}/resources/img/close.png")
        }
        
        .dogname{
        	font-size:14px;
        }
        
    </style>

    <link rel="stylesheet" href="${contextPath}/resources/css/calendar.css">
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    
    <script type="text/javascript" src="${contextPath}/resources/js/reservationCalUpdate.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/reservationUpdate.js"></script>
    <script>
    	
		function reservationSubmit(obj){
			
			if($("#checkoutDate").val() != null && $("#checkoutDate").val() != ""){//날짜가 있으면
				
				if(totalTableNum != 0){//테이블이 존재하면
						
					if($("#totalcost").val()!="0" && $("#totalcost").val()!=null){//가격이 있으면
						
						obj.submit();
					}else{
						alert("맡기실 아이를 선택해주세요.");	
					}
				}else{
					alert("맡기실 아이를 추가해주세요.");
				}
			}else{
				alert("날짜를 선택해주세요.");
			}
			
	 	}
		
    	function pushLayer(){
    		var $width=parseInt($("#lay_pop").css("width"));
    		var $height=parseInt($("#lay_pop").css("height"));
    		var left=($(window).width()-$width)/2;
    		var sctop=$(window).scrollTop()*2;
    		var top=($(window).height()-$height+sctop)/2;
    		var height=document.getElementsByTagName("body")[0].scrollHeight;
    		$("#lay_pop").css("left",left);
    		$("#lay_pop").css("top",top);
    		$("#lay_pop").css("display","block");
    		$("#lay_pop").css("z-index","555");
    		$("#all_body").css("display","block");
    		$("#all_body").css("width",$(window).width());
    		$("#all_body").css("height",height);
    		
    		

    	}
    	function popup(){
    		pushLayer();
    		reserView();
    		
    	}
    	
    	function layerClose(lay1,lay2){
    		$("#"+lay1).css("display","none");
    		$("#"+lay2).css("display","none");
    		resetRow();
    	}
    	
    	//조회했을때 날짜가 수정가능한지 체크
    	//체크인 날짜가 현재보다 미래일경우 수정가능하게, 아닐경우  달력 수정 금지
    	function viewDayCheck(res_st_data){
    		var now = new Date();
    		if(now <= res_st_data){
    			$("#checkin2").on("click", function () {
    		        $("#start_dayBox").text("0000. 00. 00.");
    		        $("#end_dayBox").text("0000. 00. 00.");
    		        
    		        (function () {
    		            calendarMaker($("#calendarForm"), new Date());
    		        })();
    		    });
    			$("#checkout2").on("click", function () {
    		        $("#start_dayBox").text("0000. 00. 00.");
    		        $("#end_dayBox").text("0000. 00. 00.");

    		        (function () {
    		            calendarMaker($("#calendarForm"), new Date());
    		        })();
    		    });
    			$(".custom_calendar_table").remove();
    		}else{
    			//미래가 아닐경우 이벤트 삭제
    			$("#checkin2").off("click"); 
    			$("#checkout2").off("click"); 
    		}
    	}
    	
    	function reserView(){
    		var reserNum = $("#reserNum").val();
    		$.ajax({
    			url:'/SearchReservationNum.do',
    			method:'post',
    			data:{
    				"reserNum": reserNum
    			},
    			type:'post',
    			async:true,
    			dataType:'json',
    			
    			success:function(data){
    				console.log(data);
    				console.log(data.petservice.length);
					//초기화
    				$(".tbnum").remove()//html 삭제
    				resetRow();
    				
    				//html에 적용
    				//체크인
    				var res_st_data = new Date(data.reservation.res_st);
    				$("#start_dayBox").text(res_st_data.toLocaleDateString());
    				$("#checkinDate").val(res_st_data.toLocaleDateString());

    				//체크아웃
    				var res_end_data = new Date(data.reservation.res_end);
    				$("#end_dayBox").text(res_end_data.toLocaleDateString());
    				$("#checkoutDate").val(res_end_data.toLocaleDateString());
    				
    				//수정가능한 날짜 체크
    				viewDayCheck(res_st_data);
    				
    				//숙박일 계산
    				dateCal(res_st_data,res_end_data);
    				
    				//가격
    				$("#totalcost").val(data.reservation.totalCost);
    				
    				//추가사항 
    				addtext();
    				$("#petcommentBox").text(data.reservation.res_comment);
    		        $("#petcommentinfo").html($("#petcommentBox").val().length);
    				
    				//펫 테이블
    				for(var i = 0; i<data.petservice.length; i++){
    					addRow();
    					$("#Pet_Name"+i).val(data.petservice[i].pet_name);//html 적용
    					petmap.set("Pet_Name"+i, data.petservice[i].pet_name);//petmap 값 변동 인식
    					
    					$("#Pet_Sex"+i).val(data.petservice[i].pet_gender);
    					petmap.set("Pet_Sex"+i, data.petservice[i].pet_gender);
    					
    					$("#Pet_Room"+i).val(data.petservice[i].room_grade);
    					petmap.set("Pet_Room"+i, data.petservice[i].room_grade);
    					
    					$("#pet_Beauty"+i).val(data.petservice[i].service_beauty);
    					petmap.set("pet_Beauty"+i, data.petservice[i].service_beauty);
    					
    					//체크박스 스파
    					var spa = false;
    					if(data.petservice[i].service_spa == "Y    "){
    						$("#pet_Spa"+i).prop("checked", true);
    						petmap.set("pet_Spa"+i, true);
    						
    						spa = true;
    				        
    						if($("#pet_Spa"+i).prop("checked")){
    							$("#pet_Spa"+i+'_hidden').attr("disabled", true);
    						}else{
    							$("#pet_Spa"+i+'_hidden').attr("disabled", false);
    						}
    					}
    					//map
    					var petservice = [data.petservice[i].pet_name, data.petservice[i].pet_gender, data.petservice[i].room_grade, data.petservice[i].service_beauty, spa, i];
    				    console.log(petservice);
    				    servicemap.set('service' + i, petservice);
    				    console.log(servicemap);
                        
    				}
    				costTB(servicemap,true);
    			
    			},
    			
    			error:function(){
    				console.log("이런");
    			}
    		});
    	}
    	
    
    	    	
    </script>

    	</head>

	    <body>
		<div id="lay_pop">
			<div id="pop_content">
			<h1 id="asd">예약 변경</h1>
			<br>
				<ul>
		        	<li id="checkinBox" class="reservationBox">
		            	<div id="checkin" class="reservationtext reservationtext1">| CHECK IN |</div>
		            	<div id="checkin2" class="reservationtext reservationtext2">
		            		<span id="start_dayBox">0000. 00. 00.</span>
		            		<input type="hidden" name="checkinDate" id="checkinDate">
		            	</div>
		            </li>
		            <li id="checkoutBox" class="reservationBox">
		            	<div id="checkout" class="reservationtext reservationtext1">| CHECK OUT |</div>
		            	<div id="checkout2" class="reservationtext reservationtext2">
		            		<span id="end_dayBox">0000. 00. 00.</span>
		            		<input type="hidden" name="checkoutDate" id="checkoutDate">
		                </div>
		            </li>
		        </ul>
		    </div>
		    <br>
		    <div>
		    	<table id="ch_pet_table" align="center" width="79%">
		    		<tr align="center" bgcolor="#e5e4e2" height="40px">
		    			<td><b>Pet Name</b></td>
		    			<td><b>Pet sex</b></td>
				        <td><b>Room</b></td>
				        <td><b>Beauty</b></td>
				        <td><b>Spa</b></td>
				        <td><b>이용여부</b></td>
				    </tr>
				<div id="calendarForm"></div>
				</table>
			</div>
			
			<div id="btn_pet1">
				<input type='button' value='추가하기' id="btn_pet1_1" onclick='addRow()' />
			</div>
			<br><br>
			
            <div class="paymentinfo1">
            <table id="pet_table1" align="center" width="79%">
                <tr align="center" bgcolor="white" height="40px">
                    <td colspan="10" align="center" bgcolor="#e5e4e2"><b id="dateResult">Reservation Detail</b></td>
                </tr>
                <tr align="center" bgcolor="white">
                    <td rowspan="6" align="center" bgcolor="white"><b>Room</b></td>
                    <td rowspan="2" align="center" bgcolor="white">Deluxe<br><div class="dogname">(소형견)</div></td>              
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
                    <td rowspan="2" align="center" bgcolor="white">Superior<br><div class="dogname">(중형견)</div></td>
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
                    <td rowspan="2" align="center" bgcolor="white">Suite<br><div class="dogname">(대형견)</div></td>
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
                   		<img src="${contextPath}" width="30px" height="30px" id="bronzeimg">
                   		<b class="membership"></b>
                        <input id="membership" type="hidden" value="">
                        <b class="totalpayment"> Total Payment : </b>
                        <b class="totalcost">0 원</b>
                        <input type="hidden" name="totalcost" id="totalcost" />
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
	                <td rowspan="2" align="center" bgcolor="white">Deluxe<br><div class="dogname">(소형견)</div></td>
	                <td rowspan="2" align="center" bgcolor="white">35,000 원</td>
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
	
	                <td rowspan="2" align="center" bgcolor="white">Superior<br><div class="dogname">(중형견)</div></td>
	                <td rowspan="2" align="center" bgcolor="white">45,000 원</td>
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
	
	                <td rowspan="2" align="center" bgcolor="white">Suite<br><div class="dogname">(대형견)</div></td>
	                <td rowspan="2" align="center" bgcolor="white">55,000 원</td>
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
	    	<a href="javascript:;" id="pop_end1" onclick="layerClose('lay_pop','all_body')">완료</a>
	    </div>

	    <div class="petcomment">
	   	 	<textarea id="petcommentBox" name="petcomment" spellcheck="false" maxlength="500" placeholder="요청사항을 적어주세요."></textarea>
	   	 	<br>
	   	 	<div id="petcommentLengh"><span id="petcommentinfo">0</span>/500</div>
	        <!-- <input type="text" name="petcomment"> -->
        </div>
		<br><br>
		</div>
		
		<div id="all_body"></div>
			<input type="button" id="btn_pet2_4" value="팝업테스트" onclick="popup()">
			<input type="number" id="reserNum">
		</body>
</html>