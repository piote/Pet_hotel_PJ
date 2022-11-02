<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="article" value="${articleMap.article}" />
<c:set var="imageFileList" value="${articleMap.imageFileList}" />  

<%
  request.setCharacterEncoding("UTF-8");
%>   

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
        <title>시설 소개</title>
        <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
        <script src="${contextPath}/resources/js/scrollscript.js"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js'></script>
   		<script type="text/javascript">
		 	/* 수정완료 버튼을 눌렀을 때의 동작 */
		 	function fn_modify_facilities(obj) {
			 	obj.action="${contextPath}modfacilities.do";
			 	obj.submit();
		 	}
   			/* 수정취소 버튼을 눌렀을 때의 동작 */
			function backToList(obj){
				obj.action="${contextPath}facilities.do";
			   	obj.submit();
		    }
		    /* 수정하기 버튼을 눌렀을 때의 동작 */
			function fn_enable(obj) {
				document.getElementById("index_mod1").disabled=false;
                document.getElementById("index_mod1").style.border="1px solid #030303";
				document.getElementById("index_mod2").disabled=false;
                document.getElementById("index_mod2").style.border="1px solid #030303";
				document.getElementById("index_mod3").disabled=false;
                document.getElementById("index_mod3").style.border="1px solid #030303";
				document.getElementById("index_mod4").disabled=false;
                document.getElementById("index_mod4").style.border="1px solid #030303";
                document.getElementById("caution_mod1").disabled=false;
                document.getElementById("caution_mod1").style.border="1px solid #030303";             
				document.getElementById("caution_mod2").disabled=false;
				document.getElementById("caution_mod2").style.border="1px solid #030303";
                document.getElementById("title_mod7").disabled=false;
                document.getElementById("title_mod7").style.border="1px solid #030303";             
				document.getElementById("contents_mod7").disabled=false;
				document.getElementById("contents_mod7").style.border="1px solid #030303";
                document.getElementById("title_mod8").disabled=false;
                document.getElementById("title_mod8").style.border="1px solid #030303";             
				document.getElementById("contents_mod8").disabled=false;
				document.getElementById("contents_mod8").style.border="1px solid #030303";
	            document.getElementById("title_mod9").disabled=false;
	            document.getElementById("title_mod9").style.border="1px solid #030303";             
				document.getElementById("contents_mod9").disabled=false;
				document.getElementById("contents_mod9").style.border="1px solid #030303";
	            document.getElementById("title_mod10").disabled=false;
	            document.getElementById("title_mod10").style.border="1px solid #030303";             
				document.getElementById("contents_mod10").disabled=false;
				document.getElementById("contents_mod10").style.border="1px solid #030303";
	            document.getElementById("title_mod11").disabled=false;
	            document.getElementById("title_mod11").style.border="1px solid #030303";             
				document.getElementById("contents_mod11").disabled=false;
				document.getElementById("contents_mod11").style.border="1px solid #030303";
	            document.getElementById("title_mod12").disabled=false;
	            document.getElementById("title_mod12").style.border="1px solid #030303";             
				document.getElementById("contents_mod12").disabled=false;
				document.getElementById("contents_mod12").style.border="1px solid #030303";
	            document.getElementById("title_mod13").disabled=false;
	            document.getElementById("title_mod13").style.border="1px solid #030303";             
				document.getElementById("contents_mod13").disabled=false;
				document.getElementById("contents_mod13").style.border="1px solid #030303";	
				document.getElementById("tr_btn_modify").style.display="block";
                document.getElementById("tr_btn").style.display="none";
//				document.getElementById("tr_file_upload").style.display="block";
			}
			/* 버튼닫기 버튼을 눌렀을 때의 동작 */ 
			function fn_close(obj) {
				document.getElementById("index_mod1").disabled=true;
				document.getElementById("index_mod1").style.border="1px solid rgb(231,226,219)";
				document.getElementById("index_mod2").disabled=true;
				document.getElementById("index_mod2").style.border="1px solid rgb(231,226,219)";
				document.getElementById("index_mod3").disabled=true;
				document.getElementById("index_mod3").style.border="1px solid rgb(231,226,219)";
				document.getElementById("index_mod4").disabled=true;
				document.getElementById("index_mod4").style.border="1px solid rgb(231,226,219)";
				document.getElementById("caution_mod1").disabled=true;
				document.getElementById("caution_mod1").style.border="1px solid white";
				document.getElementById("caution_mod2").disabled=true;
				document.getElementById("caution_mod2").style.border="1px solid white";
				document.getElementById("title_mod7").disabled=true;
				document.getElementById("title_mod7").style.border="1px solid white";
				document.getElementById("contents_mod7").disabled=true;
				document.getElementById("contents_mod7").style.border="1px solid white";
				document.getElementById("title_mod8").disabled=true;
				document.getElementById("title_mod8").style.border="1px solid white";
				document.getElementById("contents_mod8").disabled=true;
				document.getElementById("contents_mod8").style.border="1px solid white";				
				document.getElementById("title_mod9").disabled=true;
				document.getElementById("title_mod9").style.border="1px solid white";
				document.getElementById("contents_mod9").disabled=true;
				document.getElementById("contents_mod9").style.border="1px solid white";
				document.getElementById("title_mod10").disabled=true;
				document.getElementById("title_mod10").style.border="1px solid white";
				document.getElementById("contents_mod10").disabled=true;
				document.getElementById("contents_mod10").style.border="1px solid white";
				document.getElementById("title_mod11").disabled=true;
				document.getElementById("title_mod11").style.border="1px solid white";
				document.getElementById("contents_mod11").disabled=true;
				document.getElementById("contents_mod11").style.border="1px solid white";
				document.getElementById("title_mod12").disabled=true;
				document.getElementById("title_mod12").style.border="1px solid white";
				document.getElementById("contents_mod12").disabled=true;
				document.getElementById("contents_mod12").style.border="1px solid white";	
				document.getElementById("title_mod13").disabled=true;
				document.getElementById("title_mod13").style.border="1px solid white";
				document.getElementById("contents_mod13").disabled=true;
				document.getElementById("contents_mod13").style.border="1px solid white";	
				document.getElementById("tr_btn_modify").style.display="none";
				document.getElementById("tr_btn").style.display="block";
//				document.getElementById("tr_file_upload").style.display="none";
			}
 		</script>        
        <style>
            /* common 공통 시작 */
            /* 관리자 수정 버튼 시작 */
            /* 버튼 누르기 전  */
            #tr_btn {
            	position: relative;
            }
            /* 버튼 누른 후  */
            #tr_btn_modify {
            	display: none;
            	position: relative;
            }
            .button {
             	background-color: white;
             	top: -4600px;
    			left: 800px; 
    			border: 1px solid;
    			width: 100px;
    			height: 30px;
    			font-size: 20px;
    			position: relative;
            }
            /* 관리자 수정 버튼 끝 */
            /* 공통 섹션 */
            section {
                width: 1270px; 
                height: 650px;
                margin: 200px auto;
                position: relative;
                /* border: 1px solid red; */
            }
            html {
                scroll-behavior: smooth;
            }
            /* 노란색 바 */
            .bar {
                width: 160px; height: 10px;
                background-color: #e59f5a;
                border-radius: 30px;
            }
            /* 제목 */
            .sec_title{
                font-size: 30px;   
                font-weight: 800;
                margin-top: 15px; 
            }
            /* 내용 */
            .sec_p {
                font-size: 15px;   
                letter-spacing:-0.5px;
                color: #909090;
                margin-top: 20px; 
                line-height: 30px;
            }
            /* common 공통 끝 */
            .header_box_back {
	   			bottom: 200px; 
                margin: 0;
                position: relative;
                width: 100%;
                height: 160px;
                background-color: white;
            }
            /* index 시작 */
            .index {
                margin: 0;
                list-style: none;
                height: 210px;
                width: 180px;
                position: fixed;
                left: 60px;
                bottom: 300px;
                background-color: rgb(231, 226, 219);
                /* border: 1px double #e59f5a; */
                border-radius: 20px;
                z-index: 5;
            }
            .index .txt_index {
                text-align: center;
            }
            .index .bar {
                position: relative;
                left: 10px;
            }
            .index .txt_index .sec_title {
                position: relative;
                top: -8px;
            }
			.index_style {
				position: relative;
			    font-family: 'NanumSquare';
			    font-size: 18px;
			    color: #030303;
			    letter-spacing: -0.5px;
			    border: 1px solid rgb(231, 226, 219);
			    background-color: rgb(231, 226, 219);
			    resize: none;
			    width: 100px;
			    height: 29px;
			    right: 2px;
			    text-align: center;
			    top: -3px;
            }
            /* index 끝 */
            /* facilities_inside 시작 */
            .facilities_inside{
                margin-bottom: 150px;
                position: relative;
                top: -300px;
            }
            .scroll_bar{
                width: 320px; 
                height: 10px;
                background-color: #ddd;
                border-radius: 30px;
                margin: 0 auto; 
                margin-bottom: 50px;
            }
            .scroll_bar_in{
                width: 160px; 
                height: 10px;
                background-color: #e59f5a;
                border-radius: 30px;
                position: relative;
            }
            .roll_banner{ 
                width: 1200px; 
                height: 500px;
                margin: 0 auto;
                overflow-y: hidden;
                overflow-x: scroll;
                -ms-overflow-style: none;
                /* border: 1px solid blue; */
            }
            .roll_banner::-webkit-scrollbar{
                display:none;
            }
            .roll_banner_in {
                width: 1510px; 
                height: 100%;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                position: relative;
                /* border: 1px solid green; */
                /* left: -510px; */
            }
            .roll_banner_in img{
                height: 500px;
            }
            .txt_facilities_inside{
                width: 500px; 
                height: 150px;
                text-align: center;
                margin: 0 auto;
                margin-top: 40px;
            }
            /* 내부 시설 소개 제목 수정 시작 */
            #title_mod7 {
			    position: relative;
			    font-family: 'NanumSquare';
			    color: #030303;
			    font-size: 30px;
			    font-weight: 800;
			    max-height: 45px;
			    max-width: 250px;
			    border: 1px solid white;
			    background-color: white;
			    resize: none;
			    right: -27px;
			}
            /* 내부 시설 소개 제목 수정 끝 */
            /* 내부 시설 소개 내용 수정 시작 */
			#contents_mod7 {
			    position: relative;
			    font-family: 'NanumSquare';
			    font-size: 15px;
			    color: #909090;
			    letter-spacing: -0.5px;
			    width: 450px;
			    height: 262px;
			    text-align: center;
			    line-height: 30px;
			    border: 1px solid white; 
			    background-color: white;
			    resize: none;
			}
            /* 내부 시설 소개 내용 수정 끝 */
            /* facilities_inside 끝 */
            /* facilities_outside 시작 */
            .facilities_outside{
                margin-bottom: 150px;
                position: relative;
                top: -200px;
            }
            .scroll_bar{
                width: 320px; 
                height: 10px;
                background-color: #ddd;
                border-radius: 30px;
                margin: 0 auto; 
                margin-bottom: 50px;
            }
            .scroll_bar_in{
                width: 160px; 
                height: 10px;
                background-color: #e59f5a;
                border-radius: 30px;
                position: relative;
            }
            .roll_banner{ 
                width: 1200px; 
                height: 500px;
                margin: 0 auto;
                overflow-y: hidden;
                overflow-x: scroll;
                -ms-overflow-style: none;
                /* border: 1px solid blue; */
            }
            .roll_banner::-webkit-scrollbar{
                display:none;
            }
            .roll_banner_in {
                width: 1510px; 
                height: 100%;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                position: relative;
                /* border: 1px solid green; */
                /* left: -510px; */
            }
            .roll_banner_in img{
                height: 500px;
                border: 5px solid white;
            }
            .txt_facilities_outside{
                width: 500px; 
                height: 150px;
                text-align: center;
                margin: 0 auto;
                margin-top: 40px;
            }
			/* 외부 시설 소개 제목 수정 시작 */
            #title_mod8 {
			    position: relative;
			    font-family: 'NanumSquare';
			    color: #030303;
			    font-size: 30px;
			    font-weight: 800;
			    max-height: 45px;
			    max-width: 250px;
			    border: 1px solid white;
			    background-color: white;
			    resize: none;
			    right: -27px;
			}
            /* 외부 시설 소개 제목 수정 끝 */
            /* 외부 시설 소개 내용 수정 시작 */
			#contents_mod8 {
			    position: relative;
			    font-family: 'NanumSquare';
			    font-size: 15px;
			    color: #909090;
			    letter-spacing: -0.5px;
			    width: 450px;
			    height: 115px;
			    text-align: center;
			    line-height: 30px;
			    border: 1px solid white; 
			    background-color: white;
			    resize: none;
			}
            /* 외부 시설 소개 내용 수정 끝 */            
            /* facilities_outside 끝 */   
            /* caution 주의 문구 시작 */           
            .caution {
                color: crimson;
                font-size: 13px;
                font-weight: 700;
                line-height: 30px;
                position: relative;
                right: -40px;
                bottom: -5px;
            }
            .caution2 {
                color: crimson;
                font-weight: 700;
                font-size: 13px;
                line-height: 30px;
                position: relative;
                right: -660px;
                bottom: 330px;
                width: 440px;
            }
			/* 주의 문구 수정 시작 */             
            #caution_mod1 {
            	position: relative;
			    font-family: 'NanumSquare';
			    color: crimson;
			    border: 1px solid white; 
			    background-color: white;
			    resize: none;
			    text-align: left;
			    font-weight: 700;
                font-size: 13px;
                line-height: 30px;
                height: 30px;
    			width: 500px;
    			top: 13px;  
            }
            #caution_mod2 {
                position: relative;
			    font-family: 'NanumSquare';
			    color: crimson;
			    border: 1px solid white; 
			    background-color: white;
			    resize: none;
			    text-align: left;
			    font-weight: 700;
                font-size: 13px;
                line-height: 30px;
                height: 30px;
    			width: 500px;
    			top: 1px;
    			left: -12px;
            }
            /* 주의 문구 수정 끝 */  
            /* caution 주의 문구 끝 */
            /* room 시작 */
            .room{
                margin-bottom: 150px;
                position: relative;
                top: -250px;
                /* border: 1px solid red; */
            }
            .scroll_bar_no{
                width: 320px; 
                height: 10px;
                background-color: #ddd;
                border-radius: 30px;
                margin: 0 auto; 
                margin-bottom: 50px;
                right: -35px;
                /* border: 1px green solid; */
            }
            .scroll_bar_in_no{
                width: 320px; 
                height: 10px;
                background-color: #e59f5a;
                border-radius: 30px;
                position: relative;
            }
            /* .roll_banner_no{ 
                width: 1200px; 
                height: 500px;
                margin: 0 auto;
                overflow-y: hidden;
                overflow-x: scroll;
                -ms-overflow-style: none;
                
            } */
            .roll_banner_no::-webkit-scrollbar{
                display:none;
            }
            .roll_banner_in_no {
                width: 1200px; 
                height: 100%;
                display: flex;
                right: -35px;
                flex-direction: row;
                justify-content: space-between;
                position: relative;
                /* border: 1px solid green; */
                /* left: -510px; */
            }
            .roll_banner_in_no img{
                position: relative;
                height: 500px;
                border: 5px solid white;
            }
            .txt_deluxe {
                width: 300px; 
                height: 150px;
                text-align: center;
                margin: 0 auto;
                margin-top: 40px;
                /* border: 1px solid red; */
                top: -20px;
                position: relative;
                right: 390px
            }
            .txt_deluxe .sec_p {
                position: relative;
                top: -15px; 
            }
            .txt_suite {
                width: 300px; 
                height: 150px;
                text-align: center;
                margin: 0 auto;
                margin-top: 40px;
                /* border: 1px solid red; */
                top: -205px;
                position: relative;
            }
            .txt_suite .sec_p {
                position: relative;
                top: -15px;
            }
            .txt_superior {
                width: 300px; 
                height: 150px;
                text-align: center;
                margin: 0 auto;
                margin-top: 40px;
                /* border: 1px solid red; */
                top: -395px;
                position: relative;
                left: 410px;
            }
            .txt_superior .sec_p {
                position: relative;
                top: -15px;
            }
            /* room - Deluxe 제목 수정 시작 */
            #title_mod9 {
				position: relative;
			    font-family: 'NanumSquare';
			    color: #030303;
			    font-size: 30px;
			    font-weight: 800;
			    max-height: 45px;
			    max-width: 166px;
			    border: 1px solid white;
			    background-color: white;
			    resize: none;
			    right: -27px;
			}
			/* room - Deluxe 제목 수정 끝 */
            /* room - Deluxe 내용 수정 시작 */
            #contents_mod9 {
			    position: relative;
			    font-family: 'NanumSquare';
			    font-size: 15px;
			    color: #909090;
			    letter-spacing: -0.5px;
			    width: 380px;
			    height: 165px;
			    text-align: center;
			    line-height: 30px;
			    border: 1px solid white;
			    background-color: white;
			    resize: none;
			    right: 50px;
			    bottom: 21px;
			}
			/* room - Deluxe 내용 수정 끝 */
            /* room - Suite 제목 수정 시작 */
            #title_mod10 {
				position: relative;
			    font-family: 'NanumSquare';
			    color: #030303;
			    font-size: 30px;
			    font-weight: 800;
			    max-height: 45px;
			    max-width: 166px;
			    border: 1px solid white;
			    background-color: white;
			    resize: none;
			    right: -38px;
			}
			/* room - Suite 제목 수정 끝 */
            /* room - Suite 내용 수정 시작 */
            #contents_mod10 {
			    position: relative;
			    font-family: 'NanumSquare';
			    font-size: 15px;
			    color: #909090;
			    letter-spacing: -0.5px;
			    width: 380px;
			    height: 165px;
			    text-align: center;
			    line-height: 30px;
			    border: 1px solid white;
			    background-color: white;
			    resize: none;
			    right: 50px;
			    bottom: 23px;
			}
			/* room - Suite 내용 수정 끝 */ 	
            /* room - Superior 제목 수정 시작 */
            #title_mod11 {
				position: relative;
			    font-family: 'NanumSquare';
			    color: #030303;
			    font-size: 30px;
			    font-weight: 800;
			    max-height: 45px;
			    max-width: 166px;
			    border: 1px solid white;
			    background-color: white;
			    resize: none;
			    right: -26px;
    			bottom: 4px;
			}
			/* room - Superior 제목 수정 끝 */
            /* room - Superior 내용 수정 시작 */
            #contents_mod11 {
			    position: relative;
			    font-family: 'NanumSquare';
			    font-size: 15px;
			    color: #909090;
			    letter-spacing: -0.5px;
			    width: 380px;
			    height: 165px;
			    text-align: center;
			    line-height: 30px;
			    border: 1px solid white;
			    background-color: white;
			    resize: none;
			    right: 33px;
			    bottom: 23px;
			}
			/* room - Superior 내용 수정 끝 */  			 			            
            /* room 끝 */
            /* cut 시작 */
            .cut{
                margin-bottom: 150px;
                position: relative;
                top: -250px;
                /* border: 1px solid red; */
            }
            .scroll_bar_cut{
                width: 320px; 
                height: 10px;
                background-color: #ddd;
                border-radius: 30px;
                margin: 0 auto; 
                margin-bottom: 50px;
                right: -35px;
                /* border: 1px green solid; */
            }
            .scroll_bar_in_cut{
                width: 320px; 
                height: 10px;
                background-color: #e59f5a;
                border-radius: 30px;
                position: relative;
            }
            /* .roll_banner_no{ 
                width: 1200px; 
                height: 500px;
                margin: 0 auto;
                overflow-y: hidden;
                overflow-x: scroll;
                -ms-overflow-style: none;
                
            } */
            .roll_banner_cut::-webkit-scrollbar{
                display:none;
            }
            .roll_banner_in_cut {
                width: 1200px; 
                height: 100%;
                display: flex;
                right: -35px;
                flex-direction: row;
                justify-content: space-between;
                position: relative;
                top: 30px;
                /* border: 1px solid green; */
                /* left: -510px; */
            } 
            .roll_banner_in_cut img{
                position: relative;
                height: 500px;
                /* border: 1px solid red; */
                left: 50px;
            }
            .cut_price {
                /* border: 1px solid red; */
                position: relative;
                width: 650px;
                right: -550px;
                top: -480px;
            }
            .txt_cut {
                width: 300px; 
                height: 150px;
                text-align: left;
                margin: 0 auto;
                margin-top: 40px;
                /* border: 1px solid red; */
                top: -520px;
                position: relative;
                right: -80px
            }
            .txt_cut .sec_p {
                position: relative;
                top: -15px; 
            }
			/* 커트 제목 수정 시작 */
            #title_mod12 {
				position: relative;
			    font-family: 'NanumSquare';
			    color: #030303;
			    font-size: 30px;
			    font-weight: 800;
			    height: 84px;
			    max-width: 182px;
			   	border: 1px solid white; 
			    background-color: white;
			    resize: none;
			    right: 2px;
			}
            /* 커트 제목 수정 끝 */
            /* 커트 내용 수정 시작 */
			#contents_mod12 {
			    position: relative;
			    font-family: 'NanumSquare';
			    font-size: 15px;
			    color: #909090;
			    letter-spacing: -0.5px;
			    width: 404px;
			    height: 168px;
			    text-align: left;
			    line-height: 30px;
			    border: 1px solid white;
			    background-color: white;
			    resize: none;
			    top: -13px;
			}
            /* 커트 내용 수정 끝 */            
            /* cut 끝 */
            /* spa 시작 */
            .spa{
                margin-bottom: 150px;
                position: relative;
                top: -350px;
                /* border: 1px solid red; */
            }
            .scroll_bar_spa{
                width: 320px; 
                height: 10px;
                background-color: #ddd;
                border-radius: 30px;
                margin: 0 auto; 
                margin-bottom: 50px;
                right: -35px;
                /* border: 1px green solid; */
            }
            .scroll_bar_in_spa{
                width: 320px; 
                height: 10px;
                background-color: #e59f5a;
                border-radius: 30px;
                position: relative;
            }
            /* .roll_banner_no{ 
                width: 1200px; 
                height: 500px;
                margin: 0 auto;
                overflow-y: hidden;
                overflow-x: scroll;
                -ms-overflow-style: none;
                
            } */
            .roll_banner_spa::-webkit-scrollbar{
                display:none;
            }
            .roll_banner_in_spa {
                width: 1200px; 
                height: 100%;
                display: flex;
                right: -35px;
                flex-direction: row;
                justify-content: space-between;
                position: relative;
                top: 30px;
                /* border: 1px solid green; */
                /* left: -510px; */
            } 
            .roll_banner_in_spa img{
                position: relative;
                /* height: 500px; */
                /* border: 1px solid red; */
                left: 50px;
            }
            .spa_price {
                /* border: 1px solid red; */
                position: relative;
                width: 650px;
                right: -550px;
                top: -140px;
            }
            .txt_spa {
                width: 300px; 
                height: 150px;
                text-align: right;
                margin: 0 auto;
                margin-top: 40px;
                /* border: 1px solid red; */
                top: -580px;
                position: relative;
                left: -310px
            }
            .txt_spa .sec_p {
                position: relative;
                top: -15px; 
            }
            .spa_move {
                position: relative;
                left: 100px;
            }
            /* 스파 제목 수정 시작 */
            #title_mod13 {
			    position: relative;
			    font-family: 'NanumSquare';
			    color: #030303;
			    font-size: 30px;
			    font-weight: 800;
			    height: 43px;
			    max-width: 121px;
			    border: 1px solid white;
			    background-color: white;
			    resize: none;
			    right: -62px;
			    top: -7px;
			}
            /* 스파 제목 수정 끝 */
            /* 스파 내용 수정 시작 */
			#contents_mod13 {
			    position: relative;
			    font-family: 'NanumSquare';
			    font-size: 15px;
			    color: #909090;
			    letter-spacing: -0.5px;
			    width: 404px;
			    height: 225px;
			    text-align: right;
			    line-height: 30px;
			    border: 1px solid white;
			    background-color: white;
			    resize: none;
			    top: -13px;
			    left: -107px;
			}
            /* 스파 내용 수정 끝 */  
            /* spa 끝 */         
        </style>
    </head>
    <body>
        <form name="frmFacilities" method="post" action="${contextPath}" enctype="multipart/form-data">	
        	<section class="header_box_back">
        	</section>
    		<table border="0" align="center">
				<!-- 관리자 모드로 접근하면 나타나는 수정버튼 생성 및 시작 -->
    			<tr id="tr_btn_modify" align="center">
					<td colspan="3">
						<input type="button" class="button" value="수정완료" onClick="fn_modify_facilities(frmFacilities)">
						<input type="button" class="button" value="수정취소" onClick="backToList(frmFacilities)">
					    <input type="button" class="button" value="버튼닫기" onClick="fn_close(this.form)">
					</td>   
				</tr>
				<tr id="tr_btn" align="center">
				   	<td colspan="1">
						<c:if test="${member.id == article.id }">
							<input type="button" class="button" value="수정하기" onClick="fn_enable(this.form)">
						</c:if>
				   	</td>
				</tr>
				<!-- 관리자 모드로 접근하면 나타나는 수정버튼 끝 -->        
        		<!-- index 시작 -->
        		<section class="index">
            		<div class="txt_index">
                		<div class="bar"></div>
                		<a href="#"><p class="sec_title">목차</p></a>
                		<ul class="gnb">
		                    <li>
		                    	<a href="#facilitiesindex">
		                    		<textarea id="index_mod1" name="fac_idx1" class="index_style" disabled maxlength="5">${facilities.fac_idx1}</textarea>
		                    	</a>
		                    </li>
		                    <li>
		                    	<a href="#roomindex">
		                    		<textarea id="index_mod2" name="fac_idx2" class="index_style" disabled maxlength="5">${facilities.fac_idx2}</textarea>
		                    	</a>
		                    </li>
		                    <li>
		                    	<a href="#cutindex">
		                    		<textarea id="index_mod3" name="fac_idx3" class="index_style" disabled maxlength="5">${facilities.fac_idx3}</textarea>
		                    	</a>
		                    </li>
		                    <li>
		                    	<a href="#spaindex">
		                    		<textarea id="index_mod4" name="fac_idx4" class="index_style" disabled maxlength="5">${facilities.fac_idx4}</textarea>
		                    	</a>
		                    </li>
	                	</ul>
            		</div>
        		</section>
        		<!-- index 끝 -->
        		<!-- facilities_inside 시작 -->
        		<section class="facilities_inside" id="facilitiesindex">
	            	<div class="scroll_bar">
	                	<div class="scroll_bar_in"></div>
	            	</div>
	            	<div class="roll_banner">
	                	<div class="roll_banner_in">
		                    <img src="${contextPath}/resources/img/inside1.PNG" alt="inside1" width="525">
		                    <input type="hidden" name="fac_inimg1" value="${facilities.fac_inimg1}">
		                    <img src="${contextPath}/resources/img/inside2.PNG" alt="inside2" width="525">
		                    <input type="hidden" name="fac_inimg2" value="${facilities.fac_inimg2}">
		                    <img src="${contextPath}/resources/img/inside3.PNG" alt="inside3" width="500">
		                    <input type="hidden" name="fac_inimg3" value="${facilities.fac_inimg3}">
		                    <img src="${contextPath}/resources/img/inside4.PNG" alt="inside4" width="500">
		                    <input type="hidden" name="fac_inimg4" value="${facilities.fac_inimg4}">
	                	</div>
	            	</div>
	            	<div class="txt_facilities_inside">
		                <p class="sec_title">
		                	<textarea id="title_mod7" name="fac_intitle" disabled maxlength="10">${facilities.fac_intitle}</textarea>
		                </p>
		                <p class="sec_p">
		                	<textarea id="contents_mod7" name="fac_incontents" disabled>${facilities.fac_incontents}</textarea>
		                </p>
		            </div>
	        	</section>
        		<!-- facilities_inside 끝 -->
        		<!-- facilities_outside 시작 -->
        		<section class="facilities_outside">
            		<div class="scroll_bar">
                		<div class="scroll_bar_in"></div>
            		</div>
            		<div class="roll_banner">
                		<div class="roll_banner_in">
		                    <img src="${contextPath}/resources/img/outside1.jpg" alt="outside1" width="600">
		                    <input type="hidden" name="fac_outimg1" value="${facilities.fac_outimg1}">
		                    <img src="${contextPath}/resources/img/outside2.jpg" alt="outside2" width="600">
		                    <input type="hidden" name="fac_outimg2" value="${facilities.fac_outimg2}">
		                    <img src="${contextPath}/resources/img/outside3.jpg" alt="outside3" width="600">
		                    <input type="hidden" name="fac_outimg3" value="${facilities.fac_outimg3}">
                		</div>
            		</div>
            		<div class="txt_facilities_outside">
		                <p class="sec_title">
		                	<textarea id="title_mod8" name="fac_outtitle" disabled maxlength="10">${facilities.fac_outtitle}</textarea>
		                </p>
		                <p class="sec_p">
		                	<textarea id="contents_mod8" name="fac_outcontents" disabled>${facilities.fac_outcontents}</textarea>
		                </p>	
            		</div>
        		</section>
        		<!-- facilities_outside 끝 -->
        <!-- room 시작 -->
        <section class="room" id="roomindex">
            <div class="scroll_bar_no">
                <div class="scroll_bar_in_no"></div>
            </div>
            <p class="caution">
            	<textarea id="caution_mod1" name="fac_rmcau" disabled>${facilities.fac_rmcau}</textarea>
            </p>
            <div class="roll_banner_no">
                <div class="roll_banner_in_no">
                    <img src="${contextPath}/resources/img/deluxe.jpg" alt="deluxe" width="400">
                    <input type="hidden" name="fac_rmimg1" value="${facilities.fac_rmimg1}">
                    <img src="${contextPath}/resources/img/suite.jpg" alt="suite" width="400">
                    <input type="hidden" name="fac_rmimg2" value="${facilities.fac_rmimg2}">
                    <img src="${contextPath}/resources/img/superior.PNG" alt="superior" width="400">
                    <input type="hidden" name="fac_rmimg3" value="${facilities.fac_rmimg3}">
                </div>
            </div>
            <div class="txt_deluxe">
                <p class="sec_title">
                	<textarea id="title_mod9" name="fac_rmtitle1" disabled maxlength="10">${facilities.fac_rmtitle1}</textarea>	
                </p>
                <p class="sec_p">
                	<textarea id="contents_mod9" name="fac_rmcontents1" disabled>${facilities.fac_rmcontents1}</textarea>                        
                </p>
            </div>
            <div class="txt_suite">
                <p class="sec_title">
                	<textarea id="title_mod10" name="fac_rmtitle2" disabled maxlength="10">${facilities.fac_rmtitle2}</textarea>
                </p>
                <p class="sec_p">
                	<textarea id="contents_mod10" name="fac_rmcontents2" disabled>${facilities.fac_rmcontents2}</textarea>                              
                </p>
            </div>
            <div class="txt_superior">
                <p class="sec_title">
                	<textarea id="title_mod11" name="fac_rmtitle3" disabled maxlength="10">${facilities.fac_rmtitle3}</textarea>
                </p>
                <p class="sec_p">
                	<textarea id="contents_mod11" name="fac_rmcontents3" disabled>${facilities.fac_rmcontents3}</textarea>                              
                </p>
            </div>
        </section>
        <!-- room 끝 -->   
        <!-- cut 시작 -->
        <section class="cut" id="cutindex">
            <div class="scroll_bar_cut">
                <div class="scroll_bar_in_cut"></div>
            </div>
            <div class="roll_banner_cut">
                <div class="roll_banner_in_cut">
                    <img src="${contextPath}/resources/img/cut1.jpg" alt="cut1" width="400">
                    <input type="hidden" name="fac_cutimg1" value="${facilities.fac_cutimg1}">
                </div>
            </div>
            <div class="cut_price">
                <img src="${contextPath}/resources/img/cut2.PNG" alt="" width="650">
                <input type="hidden" name="fac_cutimg2" value="${facilities.fac_cutimg2}">
            </div>
            <div class="txt_cut">
                <p class="sec_title">
                	<textarea id="title_mod12" name="fac_cuttitle" disabled maxlength="25">${facilities.fac_cuttitle}</textarea>
				</p>
                <p class="sec_p">
                	<textarea id="contents_mod12" name="fac_cutcontents" disabled>${facilities.fac_cutcontents}</textarea>                           
                </p>
            </div>
        </section>
        <!-- cut 끝 -->            
        <!-- spa 시작 -->
        <section class="spa" id="spaindex">
            <div class="scroll_bar_spa">
                <div class="scroll_bar_in_spa"></div>
            </div>
            <div class="spa_move">
                <div class="roll_banner_spa">
                    <div class="roll_banner_in_spa">
                        <img src="${contextPath}/resources/img/spa2.PNG" alt="spa1" width="400">
                        <input type="hidden" name="fac_spaimg2" value="${facilities.fac_spaimg2}">
                    </div>     
                </div>
                <div class="spa_price">
                    <img src="${contextPath}/resources/img/spa1.jpg" alt="" width="400">
                    <input type="hidden" name="fac_spaimg1" value="${facilities.fac_spaimg1}">
                </div>
                <div class="txt_spa">
                    <p class="sec_title">
                    	<textarea id="title_mod13" name="fac_spatitle" disabled maxlength="10">${facilities.fac_spatitle}</textarea>
                    </p>
                    <p class="sec_p">
                    	<textarea id="contents_mod13" name="fac_spacontents" disabled>${facilities.fac_spacontents}</textarea>
                    </p>
                </div>
            </div>
            <p class="caution2">
            	<textarea id="caution_mod2" name="fac_spacau" disabled>${facilities.fac_spacau}</textarea>
            </p>
        </section>
        <!-- spa 끝 -->
       		</table>  
		</form>
    </body>
</html>