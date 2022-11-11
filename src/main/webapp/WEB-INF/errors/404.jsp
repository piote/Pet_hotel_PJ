<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>404_Error!</title>
		
		<link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
		    
    <style>
        .errorpage{
            width: 100vw;
            height: 100vh;
        }

        .textbox{
            width: 100vw;
            height: 40vh;
            /* min-height: px; */
        }

        .picbox{
            width: 100vw;
            height: 60vh;
            /* min-height: 900px; */
            background-image: url('${contextPath}/resources/img/404bg.png');
            overflow: hidden;
            background-size: 70%;
            background-position: bottom;
            background-repeat: no-repeat;
        }

        .textbox{
            text-align: center;
        }
        
        .textbox h1{
            font-size: 75px;
            font-weight: bold;
        }

        .textbox h2{
            font-size: 32px;
        }
    </style>
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <script>
	    window.onload = function () {
	        var timer = 6;
	        
	        setInterval(function ChangeTimer() {
	        	timer--;
	            $('.time_count').html(timer);
	        },1000)
	        
	        setTimeout(function goHome() {
	            location.href="/main.do";
	            
	        },5000)
	
	        
	    }
    </script>
    
	</head>
	<body>
	    <div class="errorpage">
	        <div class="textbox">
	            <br><br><br><br><br><br><br>
	            <h1>
	                ERROR 404
	            </h1>
	            <br><br>
	            <h2>
	                <span class="time_count">6</span> 초 후에 메인홈페이지로 이동합니다. 
	            </h2>
	        </div>
	        <div class="picbox">
	        </div>
	    </div>
	</body>
</html>