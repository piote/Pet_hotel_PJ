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
<html lang="ko">
<head>
    <title>문의하기</title>

    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        .membership{
            width: 1000px; height: auto;
            margin: 0 auto;
            overflow: hidden;
            letter-spacing :-0.5px;
        }
        .smallfont{
            font-size: 13px;
            color: #666;
        }
        .orange{
            color: #FF862F;
            font-weight: 800;
        }
        .title{
            margin-top: 50px; margin-bottom: 80px;
            position: relative;
        }
        .title h2{
            font-size: 20px;
            font-weight: 800;
        }
        .title div{
            width: 200px; height: 1px;
            background-color: #333;
            position: absolute;
            top: 15px; left: 200px;
        }
        .title p{
            font-size: 13px;
            color: #666;
            margin-top: 20px;
        }
        .title img{
            width: 100px;
            position: absolute;
            top: -20px; right: 10px;
        }
        .borderbox{
            width: 100%;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .membership_box{
            height: 210px;
            display: flex;
            justify-content: space-around;
        }
        .membership_box img{
            width: 75px; height: 75px;
            margin-top: 65px;
        }
        .txt1, .txt2{
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .txt1{
            width: 171px;
        }
        .txt1 p:nth-child(1){
            font-size: 15px;
            color: #666;
        }
        .txt1 p:nth-child(2){
            margin-top: 10px;
            font-size: 25px;
            font-weight: 800;
        }
        .txt2{
            width: 191px;
        }
        .txt2 p:nth-child(2){
            font-size: 15px;
        }
        .membership_box button{
            width: 200px; height: 30px;
            margin-top: 90px;
            border: 1px solid #666;
            background-color: #fff;
            font-size: 13px;
            line-height: 29px;
            transition: background-color 0.2s;
        }
        .membership_box button:hover{
            background-color: #eee;
        }
        .grade_wrap{
            margin: 180px 0;
        }
        .grade_wrap>p{
            font-size: 15px;
            font-weight: 800;
            margin-bottom: 20px;
        }
        .grade_box{
            height: 120px;
            margin-bottom: 40px;
            display: flex;
            justify-content: space-around;
        }
        .normal_medal{
            width: 20px; height: 3px;
            background-color: #D9D9D9;
            margin-top: 60px;
        }
        
        #normal_medal {
		    width: 20px;
		    height: 3px;
		    background-color: #D9D9D9;
		    margin-top: 100px;
	    }
    
        .grade_box img{
            width: 60px; height: 60px;
            margin-top: 30px;
        }
        .grade_box p{
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .grade_box p:nth-child(2){
            font-size: 15px;
            font-weight: 800;
        }
        .grade_box p:nth-child(4){
            display: block;
            font-size: 15px;
            width: 200px;
        }
        #normal{
            padding-left: 90px;
            padding-right: 415px;
            justify-content: space-between;
        }
        #normal p:nth-child(2){
            margin-left: 20px;
        }
        #bronze p:nth-child(4){
            margin-top: 48px;
        }
        #silver p:nth-child(4), #gold p:nth-child(4){
            margin-top: 38px;
        }
        .my_grade{
            border: 2px solid #FF862F !important;
        }

        .borderbox:hover img{
            transform: scale(1.02) scaleZ(1deg);
        }

        /* modal */
        .modal-bg{
            position: fixed;
            width: 100vw; height: 100%;
            background-color: #00000070;
            z-index: 50;
            top: 0;
            display: none;
        }
        .modal-wrap{
            position: absolute;
            width: 900px; height: 900px;
            background-color: #fff;
            top: 200px; left: calc(50% - 450px);
            z-index: 51;
            display: none;
        }
        #close_BT{
            position: absolute;
            top: 40px; right: 45px;
        }
        .modal-wrap_in{
            width: 700px;
            margin: 0 auto;
            padding-top: 110px;
        }
        .modal_title p:nth-child(1){
            font-size: 15px;
            color: #666;
        }
        .modal_title p:nth-child(2){
            margin-top: 5px;
            font-size: 25px;
            font-weight: 800;
        }
        .modal_mygrade{
            margin-top: 20px;
            height: 120px;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .modal_mygrade p:nth-child(2){
            font-size: 15px;
            font-weight: 600;
        }
        .graph_wrap{
            margin-top: 50px;
        }
        .graph_wrap>p{
            font-size: 15px;
            font-weight: 800;
        }
        .graph_box{
            width: 100%; height: 10px;
            background-color: #D9D9D9;
            margin-top: 10px;
            position: relative;
        }
        #graph{
            width: calc(100% / 10 * 7);
            height: 100%;
            background-color: #FFA96A;
            position: absolute;
            left: 0;
        }
        .graph_txt{
            margin-top: 10px;
            width: 100%; height: 13px;
            display: flex;
            justify-content: space-between;
        }
        .grade_count{
            text-align: center;
            margin-top: 30px;
            margin-bottom: 110px;
        }
        #count_{
            font-weight: 800;
        }
        .info_box{
            height: 55px;
            margin-bottom: 20px;
            display: flex;
            position: relative;
            justify-content: space-between;
            padding-left: 25px;
            padding-right: 300px;
        }
        .info_box img{
            width: 30px; height: 30px;
            margin-top: 12px;
        }
        .info_box p{
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .info_box p:nth-child(2){
            font-size: 15px;
            font-weight: 800;
        }
        .grade_count_info{
            display: inline-block !important;
            position: absolute;
            right: 55px; top: 15px;
            font-size: 15px;
        }
        .b{
            font-weight: 800;
        }
    </style>

    <script>
        function popUp(id){
            $('.modal-bg').show();
            $('.modal-wrap').show();
            $('#count').empty();
            $('#count_').empty();
            $('#count_bronze').empty();
            $('#count_silver').empty();
            $('#count_gold').empty();
            $('.modal_mygrade borderbox').empty();
            
            var count ;
            
            $.ajax({
                url: "/memberShipMod.do",
                type: "GET", 
                data : {"id":id},
                dataType : 'json',
                success : function(data){

                	console.log(data);
                	
                	count=data.count;
                	console.log(data.count);
                	$('#count').append(count);
                	
                	if(count<5){
                		var next = 5 - count;
                	}else if(count<10){
                		var next = 10 - count;
                	}else if(count<20){
                		var next = 20 - count;
                	}else{
                		var next = 0;
                	}
           
                	$('#count_').append(next);
                	
                	if(count<5) {
                		var front = 5 - count;
 	               		$('#count_bronze').append(front);
                	}else{
                		$('#count_bronze').append(' - ');
                	}
                	
                	if(count<10){
                		var front = 10 - count;
                		$('#count_silver').append(front);
                	}else{
                		$('#count_silver').append(' - ');
                	}
                	
                	if(count<20) {
                		var front = 20 - count;
                		$('#count_gold').append(front);
                	}else{
                		$('#count_gold').append(' - ');
                	}
                  },
                    
                error :function(){
                    alert("request error!");
                    }
            });
            
        }
        function popClose(){
            $('.modal-bg').hide();
            $('.modal-wrap').hide();
        }
    </script>
</head>
<body>
    <div class="membership">
        <div class="title">
            <h2>Anitel 멤버쉽 안내</h2>
            <div></div>
            <p class="smallfont">고객님께 더 만족스러운 서비스를 제공하기 위해<br>
                연간 이용횟수에 따라 할인 프로그램을 제공하고 있습니다.</p>
            <img src="${contextPath}/resources/img/bonus_icon.png" alt="bonus_icon">
        </div>
        <div class="membership_box borderbox">
        	<c:choose>
		        <c:when test="${user.grade eq 'Bronze'}">
	            	<img src="${contextPath}/resources/img/bronze_medal.png" alt="bronze_medal">
	            </c:when>
	            <c:when test="${user.grade eq 'Silver'}">
	            	<img src="${contextPath}/resources/img/silver_medal.png" alt="silver_medal">
	            </c:when>
	            <c:when test="${user.grade eq 'Gold'}">
	            	<img src="${contextPath}/resources/img/gold_medal.png" alt="gold_medal">
	            </c:when>
	             <c:otherwise>
	             	<div id="normal_medal"></div>
	             </c:otherwise>
            </c:choose>
            <div class="txt1">
                <p>${user.name} 님의 멤버쉽 등급은</p>
                <p>${user.grade}</p>
             <%--  <c:choose>
                <c:when test="${user.grade == 'Bronze'}">
                	<p>Bronze</p>
                </c:when>
                <c:when test="${user.grade == 'Silver'}">
                	<p>Silver</p>
                </c:when>
                <c:when test="${user.grade == 'Gold'}">
                	<p>Gold</p>
                </c:when>
                <c:otherwise>
                	<p>Normal</p>
                </c:otherwise>
              </c:choose> --%>
            </div>
            <div class="txt2">
                <c:choose>
		            <c:when test="${user.grade == 'Bronze'}">
		                <p class="smallfont">연간 이용횟수 5회 이상</p>
	                	<p>1회 이용금액의 <span class="orange">2%</span> 할인</p>
		            </c:when>
	                <c:when test="${user.grade == 'Silver'}">
		                <p class="smallfont">연관 이용횟수 10회 이상</p>
		                <p>
		                    1회 이용금액의 <span class="orange">5%</span> 할인<br>
		                    미용서비스 <span class="orange">1회</span> 제공
	                	</p>
	                </c:when>
	                 <c:when test="${user.grade == 'Gold'}">
		                <p class="smallfont">연간 이용횟수 20회 이상</p>
		                <p>
		                    1회 이용금액의 <span class="orange">10%</span> 할인<br>
		                    미용 및 목욕서비스 <span class="orange">각 1회</span> 제공
		                </p>
	                </c:when>
	                <c:otherwise>
		               	<p class="smallfont">연간 이용횟수 5회 미만</p>
		            </c:otherwise>
	            </c:choose>
            </div>
            <button type="button" onclick="popUp('${user.id}')">멤버쉽 더 알아보기 ></button>
        </div>
        <div class="grade_wrap">
            <p>등급별 혜택</p>
            <div id="normal" class="grade_box borderbox">
                <div class="normal_medal"></div>
                <p>Normal</p>
                <p class="smallfont">연간 이용횟수 5회 미만</p>
            </div>
            <div id="bronze" class="grade_box borderbox my_grade">
                <img src="${contextPath}/resources/img/bronze_medal.png" alt="bronze_medal">
                <p>Bronze</p>
                <p class="smallfont">연간 이용횟수 5회 이상</p>
                <p>1회 이용금액의 <span class="orange">2%</span> 할인</p>
            </div>
            <div id="silver" class="grade_box borderbox">
                <img src="${contextPath}/resources/img/silver_medal.png" alt="silver_medal">
                <p>Silver</p>
                <p class="smallfont">연간 이용횟수 10회 이상</p>
                <p>
                    1회 이용금액의 <span class="orange">5%</span> 할인<br>
                    미용서비스 <span class="orange">1회</span> 제공
                </p>
            </div>
            <div id="gold" class="grade_box borderbox">
                <img src="${contextPath}/resources/img/gold_medal.png" alt="gold_medal">
                <p>Gold</p>
                <p class="smallfont">연간 이용횟수 20회 이상</p>
                <p>
                    1회 이용금액의 <span class="orange">10%</span> 할인<br>
                    미용 및 목욕서비스 <span class="orange">각 1회</span> 제공
                </p>
            </div>
        </div>
    </div>
    <div class="modal-bg"></div>
    <div class="modal-wrap">
        <div id="close_BT" onclick="popClose()">
            <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12 11.293l10.293-10.293.707.707-10.293 10.293 10.293 10.293-.707.707-10.293-10.293-10.293 10.293-.707-.707 10.293-10.293-10.293-10.293.707-.707 10.293 10.293z"/></svg>
        </div>
        <div class="modal-wrap_in">
            <div class="modal_title">
                <p>${user.name}님의 멤버쉽 등급은</p>
                <p>${user.grade}</p>
            </div>
            <div class="modal_mygrade borderbox" >
	            <c:choose>
		            <c:when test="${user.grade == 'Bronze'}">
		                <p class="smallfont">연간 이용횟수 5회 이상</p>
	                	<p>1회 이용금액의 <span class="orange">2%</span> 할인</p>
		            </c:when>
	                <c:when test="${user.grade == 'Silver'}">
		                <p class="smallfont">연관 이용횟수 10회 이상</p>
		                <p>
		                    1회 이용금액의 <span class="orange">5%</span> 할인<br>
		                    미용서비스 <span class="orange">1회</span> 제공
	                	</p>
	                </c:when>
	                 <c:when test="${user.grade == 'Gold'}">
		                <p class="smallfont">연간 이용횟수 20회 이상</p>
		                <p>
		                    1회 이용금액의 <span class="orange">10%</span> 할인<br>
		                    미용 및 목욕서비스 <span class="orange">각 1회</span> 제공
		                </p>
	                </c:when>
	                <c:otherwise>
		               	<p class="smallfont">연간 이용횟수 5회 미만</p>
		            </c:otherwise>
	            </c:choose>
            </div>
            <div class="graph_wrap">
                <p>총 <span id="count">7</span>회 이용</p>
                <div class="graph_box">
                    <div id="graph"></div>
                </div>
                <div class="graph_txt">
                    <p class="smallfont">Bronze</p>
                    <p class="smallfont">Silver</p>
                </div>
            </div>
            <p class="grade_count">다음 단계까지 <span id="count_">3</span>회 남았습니다.</p>
            <div class="modal_mygrade_info">
                <div class="info_box borderbox">
                    <img src="${contextPath}/resources/img/bronze_medal.png" alt="bronze_medal">
                    <p>Bronze</p>
                    <p class="smallfont">연간 이용횟수 5회 이상</p>
                    <p class="grade_count_info">앞으로 <span id="count_bronze" class="b">3</span>회</p>
                </div>
                <div class="info_box borderbox">
                    <img src="${contextPath}/resources/img/silver_medal.png" alt="bronze_medal">
                    <p>Silver</p>
                    <p class="smallfont">연간 이용횟수 10회 이상</p>
                    <p class="grade_count_info">앞으로 <span id="count_silver" class="b">3</span>회</p>
                </div>
                <div class="info_box borderbox">
                    <img src="${contextPath}/resources/img/gold_medal.png" alt="bronze_medal">
                    <p>Gold</p>
                    <p class="smallfont">연간 이용횟수 20회 이상</p>
                    <p class="grade_count_info">앞으로 <span id="count_gold" class="b">3</span>회</p>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>