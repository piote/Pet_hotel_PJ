<!-- https://xd.adobe.com/view/9c5bb8c9-f3b5-4e36-71b7-4f11b5566854-ea6a/screen/ebd0eb7b-6ffd-44c7-89ae-7278f8340449?fullscreen -->
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
   <!-- <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> -->
        <title>호텔 소개</title>
		<link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
        <script src="${contextPath}/resources/js/scrollscript.js"> </script>        
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js'></script>
   		<script type="text/javascript">
		 	/* 수정완료 버튼을 눌렀을 때의 동작 */
		 	function fn_modify_introduce(obj) {
			 	obj.action="${contextPath}modintroduce.do";
			 	obj.submit();
		 	}
   			/* 수정취소 버튼을 눌렀을 때의 동작 */
			function backToList(obj){
				obj.action="${contextPath}introduce.do";
			   	obj.submit();
		    }
		    /* 수정하기 버튼을 눌렀을 때의 동작 */
			function fn_enable(obj) {
				document.getElementById("title_mod1").disabled=false;
                document.getElementById("title_mod1").style.border="1px solid #030303";
				document.getElementById("contents_mod1").disabled=false;
				document.getElementById("contents_mod1").style.border="1px solid #030303";
				document.getElementById("title_mod2").disabled=false;
                document.getElementById("title_mod2").style.border="1px solid #030303";
				document.getElementById("contents_mod2").disabled=false;
				document.getElementById("contents_mod2").style.border="1px solid #030303";
				document.getElementById("title_mod3").disabled=false;
                document.getElementById("title_mod3").style.border="1px solid #030303";
				document.getElementById("contents_mod3").disabled=false;
				document.getElementById("contents_mod3").style.border="1px solid #030303";
				document.getElementById("title_mod4").disabled=false;
                document.getElementById("title_mod4").style.border="1px solid #030303";
				document.getElementById("contents_mod4").disabled=false;
				document.getElementById("contents_mod4").style.border="1px solid #030303";
				document.getElementById("title_mod5").disabled=false;
                document.getElementById("title_mod5").style.border="1px solid #030303";
				document.getElementById("contents_mod5").disabled=false;
				document.getElementById("contents_mod5").style.border="1px solid #030303";
				document.getElementById("title_mod6").disabled=false;
                document.getElementById("title_mod6").style.border="1px solid #030303";
				document.getElementById("contents_mod6").disabled=false;
				document.getElementById("contents_mod6").style.border="1px solid #030303";
				document.getElementById("img_mod1").disabled=false;
				document.getElementById("tr_btn_modify").style.display="block";
                document.getElementById("tr_btn").style.display="none";
                document.getElementById("modcompl").style.color="red";
                document.getElementById("bt_onoff1").style.display="block";
                document.getElementById("bt_onoff2").style.display="block";
                document.getElementById("bt_onoff3").style.display="block";
                document.getElementById("bt_onoff4").style.display="block";
                document.getElementById("bt_onoff5").style.display="block";
                document.getElementById("bt_onoff6").style.display="block";
			}
			/* 버튼닫기 버튼을 눌렀을 때의 동작 */ 
			function fn_close(obj) {
				document.getElementById("title_mod1").disabled=true;
				document.getElementById("title_mod1").style.border="1px solid white";
				document.getElementById("contents_mod1").disabled=true;
				document.getElementById("contents_mod1").style.border="1px solid white";
				document.getElementById("title_mod2").disabled=true;
				document.getElementById("title_mod2").style.border="1px solid white";
				document.getElementById("contents_mod2").disabled=true;
				document.getElementById("contents_mod2").style.border="1px solid white";
				document.getElementById("title_mod3").disabled=true;
				document.getElementById("title_mod3").style.border="1px solid white";
				document.getElementById("contents_mod3").disabled=true;
				document.getElementById("contents_mod3").style.border="1px solid white";
				document.getElementById("title_mod4").disabled=true;
				document.getElementById("title_mod4").style.border="1px solid white";
				document.getElementById("contents_mod4").disabled=true;
				document.getElementById("contents_mod4").style.border="1px solid white";
				document.getElementById("title_mod5").disabled=true;
				document.getElementById("title_mod5").style.border="1px solid white";
				document.getElementById("contents_mod5").disabled=true;
				document.getElementById("contents_mod5").style.border="1px solid white";
				document.getElementById("title_mod6").disabled=true;
				document.getElementById("title_mod6").style.border="1px solid white";
				document.getElementById("contents_mod6").disabled=true;
				document.getElementById("contents_mod6").style.border="1px solid white";
				document.getElementById("img_mod1").disabled=true;
				document.getElementById("tr_btn_modify").style.display="none";
				document.getElementById("tr_btn").style.display="block";
				document.getElementById("bt_onoff1").style.display="none";
				document.getElementById("bt_onoff2").style.display="none";
				document.getElementById("bt_onoff3").style.display="none";
				document.getElementById("bt_onoff4").style.display="none";
				document.getElementById("bt_onoff5").style.display="none";
				document.getElementById("bt_onoff6").style.display="none";
			}
			/* 이미지 업로드를 하기 위함  */
			function readURL1(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#intro_image1").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview1').attr('src', e.target.result);
			         }
			         $(".upload-name1").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 } 
			function readURL2(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#intro_image2").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview2').attr('src', e.target.result);
			         }
			         $(".upload-name2").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 }
			function readURL3(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#intro_image3").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview3').attr('src', e.target.result);
			         }
			         $(".upload-name3").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 } 
			function readURL4(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#intro_image4").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview4').attr('src', e.target.result);
			         }
			         $(".upload-name4").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 } 
			function readURL5(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#intro_image5").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview5').attr('src', e.target.result);
			         }
			         $(".upload-name5").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 } 
			function readURL6(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#intro_image6").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview6').attr('src', e.target.result);
			         }
			         $(".upload-name6").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 } 
 		</script>
        <style>       	        	        
            /* common 공용 시작 */
            /* 관리자 수정 버튼 시작 */
            /* 버튼 누르기 전  */
            #tr_btn {
            	position: relative;
            }
			#bt_onoff1 {
        		position: relative;
        		display:none;
        	}
        	#bt_onoff2 {
        		position: relative;
        		display:none;
        	}
        	#bt_onoff3 {
        		position: relative;
        		display:none;
        	}        	
        	#bt_onoff4 {
        		position: relative;
        		display:none;
        	}
        	#bt_onoff5 {
        		position: relative;
        		display:none;
        	}
        	#bt_onoff6 {
        		position: relative;
        		display:none;
        	} 
            /* 버튼 누른 후  */
            #tr_btn_modify {
            	display: none;
            	position: relative;
            }
            .button {
             	background-color: white;
             	top: -5250px;
    			left: 800px;
    			border: 1px solid;
    			width: 100px;
    			height: 30px;
    			font-size: 20px;
    			position: relative;
            }
            /* 관리자 수정 버튼 끝 */
            /* 섹션 */
            section {
                width: 1270px; 
                height: 650px;
                margin: 200px auto;
                position: relative;
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
            /* common 공용 끝 */
            /* outline 개요 시작 */
            .outline {
                margin: 0px;
                right: -324px;
                bottom: 20px;
            }
            .txt_outline{
                width: 400px; 
                height: 150px;
                background-color: #fff;
                position: relative;
                top: 100px; 
                left: 150px;
            }
            .outline .txt_outline .bar {   
                left: 230px;
                position: relative;
            }
            .txt_outline .sec_title{
                margin-left: 343px;
                right: -20px;
                position: relative;
            }
            .txt_outline .sec_p{
                margin-left: 80px;
                text-align: right;
            }
            .outline_con_wrap{
                position: relative;
                width: 500px; height: 200px;
                top: 180px; left: 200px;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }
            .outline_img_wrap {
                width: 480px; 
                height: 650px;
                display: block;
                position: relative;
                top: -153px; left: 700px;
            }
 			/* 개요 제목 수정 시작 */
 			#title_mod1 {
 				position:relative;
 				font-family: 'NanumSquare' ;
    			color: #030303;
    			font-size: 30px;   
                font-weight: 800;
				max-height: 45px;
    			max-width: 170px;
    			border: 1px solid white;
    			background-color: white;
    			resize: none;		
 			}
 			/* 개요 제목 수정 끝 */
 			/* 개요 내용 수정 시작 */
 			#contents_mod1 {
 				position:relative;
 				font-family: 'NanumSquare' ;
 				font-size: 15px;
    			color: #909090;
                letter-spacing:-0.5px;
                width: 400px; 
                height: 380px;
                text-align: right;
                line-height: 30px;
                left: -60px;
                border: 1px solid white;
    			background-color: white;
    			resize: none;	                        
 			}
 			/* 개요 내용 수정 끝 */
            /* outline 개요 끝 */
            /* feed 사료 시작 */
            .feed {
                bottom: 120px;
            }
            .feed_img_wrap{
                width: 550px; 
                height: 550px;
                position: relative;
                left: 150px;
                bottom: -200px;
            }
            .txt_feed{
                width: 280px; 
                height: 225px;
                position: relative;
                float: right;
                top: -230px; 
                right: 220px;
            }
            .txt_feed .bar{
                margin-left: 50px;
            }
            .txt_feed .sec_p{
                margin-left: 40px;
            }
            .txt_feed .sec_title{
                margin-left: 20px;
            }
            /* 사료 제목 수정 시작 */
 			#title_mod2 {
 				position:relative;
 				font-family: 'NanumSquare' ;
    			color: #030303;
    			font-size: 30px;   
                font-weight: 800;
				max-height: 45px;
    			max-width: 170px;
    			border: 1px solid white;
    			background-color: white;
    			resize: none;		
 			}
 			/* 사료 제목 수정 끝 */
 			/* 사료 내용 수정 시작 */
 			#contents_mod2 {
 				position:relative;
 				font-family: 'NanumSquare' ;
 				font-size: 15px;
    			color: #909090;
                letter-spacing:-0.5px;
                width: 400px; 
                height: 380px;
                text-align: left;
                line-height: 30px;
                left: -20px;
                top: -5px;
                border: 1px solid white;
    			background-color: white;
    			resize: none;	                        
 			}
 			/* 사료 내용 수정 끝 */
            /* feed 사료 끝 */
            /* spray 소독 시작 */
            .spray {
                bottom: 70px;
            }
            .txt_spray{
                width: 400px; 
                height: 150px;
                background-color: #fff;
                position: relative;
                top: 130px; 
                left: 150px;
            }
            .txt_spray .sec_title{
                margin-left: 130px;
                position: relative;
                right: -240px;
            }
            .spray .txt_spray .bar {
                left: 235px;
                position: relative;
            }
            .txt_spray .sec_p{
                margin-left: 80px;
                text-align: right;
            }
            .spray_con_wrap{
                position: relative;
                width: 500px; height: 200px;
                top: 180px; left: 200px;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }
            .spray_img_wrap {
                width: 480px; 
                height: 650px;
                display: block;
                position: relative;
                top: -153px; left: 700px;
            }
            /* 소독 제목 수정 시작 */
 			#title_mod3 {
 				position:relative;
 				font-family: 'NanumSquare' ;
    			color: #030303;
    			font-size: 30px;   
                font-weight: 800;
				max-height: 45px;
    			max-width: 170px;
    			border: 1px solid white;
    			background-color: white;
    			resize: none;		
 			}
 			/* 소독 제목 수정 끝 */
 			/* 소독 내용 수정 시작 */
 			#contents_mod3 {
 				position:relative;
 				font-family: 'NanumSquare' ;
 				font-size: 15px;
    			color: #909090;
                letter-spacing:-0.5px;
                width: 400px; 
                height: 380px;
                text-align: right;
                line-height: 30px;
                left: -60px;
                border: 1px solid white;
    			background-color: white;
    			resize: none;	                        
 			}
 			/* 소독 내용 수정 끝 */
            /* spray 소독 끝 */
            /* cctv 시작 */
            .cctv {
                bottom: 180px
            }
            .cctv_img_wrap{
                width: 550px; 
                height: 550px;
                position: relative;
                left: 250px;
                bottom: -200px;               
            }
            .txt_cctv{
                width: 280px; 
                height: 225px;
                position: relative;
                float: right;
                top: -230px; 
                right: 220px;
            }
            .txt_cctv .bar{
                margin-left: 50px;
                position: relative;
                left: 0px;
            }
            .txt_cctv .sec_p{
                margin-left: 40px;
            }
            .txt_cctv .sec_title{
                margin-left: 20px;
                position: relative;
                left: -20px;
            }
            /* cctv 제목 수정 시작 */
 			#title_mod4 {
 				position:relative;
 				font-family: 'NanumSquare' ;
    			color: #030303;
    			font-size: 30px;   
                font-weight: 800;
				max-height: 45px;
    			max-width: 170px;
    			border: 1px solid white;
    			background-color: white;
    			resize: none;		
 			}
 			/* cctv 제목 수정 끝 */
 			/* cctv 내용 수정 시작 */
 			#contents_mod4 {
 				position:relative;
 				font-family: 'NanumSquare' ;
 				font-size: 15px;
    			color: #909090;
                letter-spacing:-0.5px;
                width: 400px; 
                height: 380px;
                text-align: left;
                line-height: 30px;
                left: -20px;
                top: -5px;
                border: 1px solid white;
    			background-color: white;
    			resize: none;	                        
 			}
 			/* cctv 내용 수정 끝 */
            /* cctv 끝 */
            /* call 연락 시작 */
            .call {
                bottom: 0px;
            }
            .txt_call{
                width: 400px; 
                height: 150px;
                background-color: #fff;
                position: relative;
                top: 110px; 
                left: 170px;
            }
            .txt_call .sec_title{
                margin-left: 130px;
                position: relative;
                right: -220px;
            }
            .txt_call .sec_p{
                margin-left: 80px;
                text-align: right;
                position: relative;
                left: -30px;
            }
            .call .txt_call .bar {
                position: relative;
                right: -200px;
            }
            .call_con_wrap{
                position: relative;
                width: 500px; height: 200px;
                top: 180px; left: 200px;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }
            .call_img_wrap {
                width: 480px; 
                height: 650px;
                display: block;
                position: relative;
                top: -110px; 
                left: 680px;
            }
            /* 연락 제목 수정 시작 */
 			#title_mod5 {
 				position:relative;
 				font-family: 'NanumSquare' ;
    			color: #030303;
    			font-size: 30px;   
                font-weight: 800;
				max-height: 45px;
    			max-width: 155px;
    			border: 1px solid white;
    			background-color: white;
    			resize: none;		
 			}
 			/* 연락 제목 수정 끝 */
 			/* 연락 내용 수정 시작 */
 			#contents_mod5 {
 				position:relative;
 				font-family: 'NanumSquare' ;
 				font-size: 15px;
    			color: #909090;
                letter-spacing:-0.5px;
                width: 400px; 
                height: 380px;
                text-align: right;
                line-height: 30px;
                left: -60px;
                border: 1px solid white;
    			background-color: white;
    			resize: none;	                        
 			}
 			/* 연락 내용 수정 끝 */
            /* call 연락 끝 */
            /* walk 산책 시작 */
            .walk {
                bottom: 300px
            }
            .walk_img_wrap{
                width: 550px; 
                height: 550px;
                position: relative;
                left: 250px;
                bottom: -180px;
            }
            .txt_walk{
                width: 280px; 
                height: 225px;
                position: relative;
                float: right;
                top: -230px; 
                right: 230px;
            }
            .txt_walk .bar{
                margin-left: 50px;
            }
            .txt_walk .sec_p{
                margin-left: 40px;
            }
            .txt_walk .sec_title{
                margin-left: 20px;
                position: relative;
                right: 10px;
            }
            /* 산책 제목 수정 시작 */
 			#title_mod6 {
 				position:relative;
 				font-family: 'NanumSquare' ;
    			color: #030303;
    			font-size: 30px;   
                font-weight: 800;
				max-height: 45px;
    			max-width: 170px;
    			border: 1px solid white;
    			background-color: white;
    			resize: none;		
 			}
 			/* 산책 제목 수정 끝 */
 			/* 산책 내용 수정 시작 */
 			#contents_mod6 {
 				position:relative;
 				font-family: 'NanumSquare' ;
 				font-size: 15px;
    			color: #909090;
                letter-spacing:-0.5px;
                width: 400px; 
                height: 380px;
                text-align: left;
                line-height: 30px;
                left: -20px;
                top: -5px;
                border: 1px solid white;
    			background-color: white;
    			resize: none;	                        
 			}
 			/* 산책 내용 수정 끝 */
            /* walk 산책 끝 */
            .header_box_back {
	            bottom: 200px;
                margin: 0;
                position: relative;
                width: 100%;
                height: 160px;
                background-color: white;
            }
            /* 카카오맵 API 시작 */
            #map {
                position: relative;
                left: 500px;
                top: -200px; 
            }
            .map_wrap {
                position: relative;
                left: 900px;
                top: -240px; 
            }
            .map_wrap .bar {
                position: relative;
                left: 7px;
            }
            /* 카카오맵 API 끝 */
        </style>
    </head>
    <body>
    	<form name="frmIntroduce" method="post" action="${contextPath}" enctype="multipart/form-data">	
		    <section class="header_box_back"></section>
    		<table border="0" align="center">
    			<!-- 관리자 모드로 접근하면 나타나는 수정 버튼 생성 및 시작 -->
    			<tr id="tr_btn_modify" align="center">
					<td colspan="3">
				        <input type="button" class="button" value="버튼닫기" onClick="fn_close(this.form)">
						<input type="button" id="modcompl" class="button" value="수정완료" onClick="fn_modify_introduce(frmIntroduce)">
						<input type="button" class="button" value="수정취소" onClick="backToList(frmIntroduce)">
					</td>   
			  	</tr>
				<tr id="tr_btn" align="center">
			   		<td colspan="1">
				       	<c:if test="${user.id == 'admin'}">
					      	<input type="button" class="button" value="수정하기" onClick="fn_enable(this.form)">
					    </c:if>
			   		</td>
			  	</tr>
			  	<!-- 관리자 모드로 접근하면 나타나는 수정버튼 끝 -->
		        <!-- outline 개요 시작  -->
		        <section class="outline">
		            <div class="txt_outline">
		                <div class="bar"></div>
		                <p class="sec_title">
		                	<textarea id="title_mod1" name="intro_title1" disabled maxlength="5">${introduce.intro_title1}</textarea>
		                </p>
		                <p class="sec_p">
		                	<textarea id="contents_mod1" name="intro_contents1" disabled>${introduce.intro_contents1}</textarea>
		                </p>
		            </div>            
		            <div class="outline_img_wrap" id="img_mod1" disabled>
		            	<!-- 이미지를 기존이든, 새 것이든 출력하기 위함  -->
		                <img src="${contextPath}/resources/introduce/introduce_image/${introduce.intro_num}/${introduce.intro_image1}" alt="호텔" height="600" id="preview1">
						<!-- 기존의 이미지를 가져오기 -->
 		            	<input type= "hidden" name="originalintro_image1" value="${introduce.intro_image1}" />
                        <div id="bt_onoff1">
							<!-- 새로 이미지를 가져오기 -->
							<input type="file" id="intro_image1" name="intro_image1" onchange="readURL1(this);"/><br>		                        		                
		                	<label for="intro_image1">파일 경로</label>
							<input class="upload-name1" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL1(this);" disabled />
						</div>
		            </div>
				</section>
	        	<!-- outline 개요 끝 -->
	        	<!-- feed 사료 시작 -->
		        <section class="feed">
		            <div class="feed_img_wrap" id="img_mod2">
		                <img src="${contextPath}/resources/introduce/introduce_image/${introduce.intro_num}/${introduce.intro_image2}" alt="사료" width="500" height="450" id="preview2">
		                <input type= "hidden" name="originalintro_image2" value="${introduce.intro_image2}" />
		                <div id="bt_onoff2">
	                        <input type= "file" id="intro_image2" name="intro_image2" onchange="readURL2(this);"/><br>   		                
			                <label for="intro_image2">파일 경로</label>
							<input class="upload-name2" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL2(this);" disabled>
						</div>
		            </div>
		            <div class="txt_feed">
		                <div class="bar"></div>
		                <p class="sec_title">
		                 	<textarea id="title_mod2" name="intro_title2" disabled maxlength="5">${introduce.intro_title2}</textarea>
		                </p>
		                <p class="sec_p"> 
		                	<textarea id="contents_mod2" name="intro_contents2" disabled>${introduce.intro_contents2}</textarea>   
		                </p>
		            </div>
		        </section>
	        	<!-- feed 사료 끝 -->
	        	<!-- spary 소독 시작  -->
		        <section class="spray">
		            <div class="txt_spray">
		                <div class="bar"></div>
		                <p class="sec_title">
		                	<textarea id="title_mod3" name="intro_title3" disabled maxlength="5">${introduce.intro_title3}</textarea>
		                </p>
		                <p class="sec_p"> 
		                	<textarea id="contents_mod3" name="intro_contents3" disabled">${introduce.intro_contents3}</textarea>
		                </p>
		            </div>
		            <div class="spray_img_wrap" id="img_mod">
		                <img src="${contextPath}/resources/introduce/introduce_image/${introduce.intro_num}/${introduce.intro_image3}" alt="소독" height="600" id="preview3">
		               	<input type= "hidden" name="originalintro_image3" value="${introduce.intro_image3}" />
		               	<div id="bt_onoff3">
	                        <input type= "file" id="intro_image3" name="intro_image3" onchange="readURL3(this);"/><br>		                
			                <label for="intro_image3">파일 경로</label>
							<input class="upload-name3" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL3(this);" disabled>
		            	</div>
		            </div>
		        </section>
		        <!-- spray 소독 끝 -->
		        <!-- cctv 시작 -->
		        <section class="cctv">
		            <div class="cctv_img_wrap" id="img_mod">
		                <img src="${contextPath}/resources/introduce/introduce_image/${introduce.intro_num}/${introduce.intro_image4}" alt="CCTV" width="400" id="preview4">
		               	<input type= "hidden" name="originalintro_image4" value="${introduce.intro_image4}" />
                        <div id="bt_onoff4">
	                        <input type= "file" id="intro_image4" name="intro_image4" onchange="readURL4(this);"/><br>		                
			                <label for="intro_image4">파일 경로</label>
							<input class="upload-name4" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL4(this);" disabled>
		            	</div>
		            </div>
		            <div class="txt_cctv">
		                <div class="bar"></div>
		                <p class="sec_title"> 
		                	<textarea id="title_mod4" name="intro_title4" disabled maxlength="5">${introduce.intro_title4}</textarea>
		                </p>
		                <p class="sec_p"> 
		                	<textarea id="contents_mod4" name="intro_contents4" disabled>${introduce.intro_contents4}</textarea>   
		                </p>
		            </div>
		        </section>
		        <!-- cctv 끝 -->
		        <!-- call 연락 시작 -->
		        <section class="call">
		            <div class="txt_call">
		                <div class="bar"></div>
		                <p class="sec_title">
		                 	<textarea id="title_mod5" name="intro_title5" disabled maxlength="5">${introduce.intro_title5}</textarea>
		                </p>
		                <p class="sec_p">
		                	<textarea id="contents_mod5" name="intro_contents5" disabled>${introduce.intro_contents5}</textarea> 	                                  
		               	</p>
		            </div>
		            <div class="call_img_wrap" id="img_mod">
		                <img src="${contextPath}/resources/introduce/introduce_image/${introduce.intro_num}/${introduce.intro_image5}" alt="연락" height="400" id="preview5">
		                <input type= "hidden" name="originalintro_image5" value="${introduce.intro_image5}" />
		                <div id="bt_onoff5">
	                        <input type= "file" id="intro_image5" name="intro_image5" onchange="readURL5(this);"/><br>		                
			                <label for="intro_image5">파일 경로</label>
							<input class="upload-name5" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL5(this);" disabled>
		            	</div>
		            </div>
		        </section>
		        <!-- call 연락 끝 -->
		        <!-- walk 산책 시작 -->
		        <section class="walk">
		            <div class="walk_img_wrap" id="img_mod">
		                <img src="${contextPath}/resources/introduce/introduce_image/${introduce.intro_num}/${introduce.intro_image6}" alt="산책" width="400" id="preview6">
		                <input type= "hidden" name="originalintro_image6" value="${introduce.intro_image6}" />
		                <div id="bt_onoff6">
	                        <input type= "file" id="intro_image6" name="intro_image6" onchange="readURL6(this);"/><br>
			                <label for="intro_image6">파일 경로</label>
							<input class="upload-name6" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL6(this);" disabled>
		            	</div>
		            </div>
		            <div class="txt_walk">
		                <div class="bar"></div>
		                <p class="sec_title"> 
		                	<textarea id="title_mod6" name="intro_title6" disabled maxlength="5">${introduce.intro_title6}</textarea>
		                </p>
		                <p class="sec_p">
		                	<textarea id="contents_mod6" name="intro_contents6" disabled>${introduce.intro_contents6}</textarea>  
		               	</p>
		            </div>
		        </section>
		     </table>  
		</form>
	    <!-- walk 산책 끝 -->
	    <!-- 카카오 맵 API 시작 -->
	    <div class="map_wrap">
	    	<div class="bar"></div>
	        <p class="sec_title">찾아오시는 길</p>
	    </div>
	    <div id="map" style="width:1000px;height:400px;"></div>
	    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd7c1513375b2b6ac51ccdf37b0de2ea"></script>
	    <script>
			var mapContainer = document.getElementById('map'), 
	            mapOption = {
					center: new kakao.maps.LatLng(35.1567474688023,129.059888286246),
					level: 3, 
					mapTypeId : kakao.maps.MapTypeId.ROADMAP 
				}; 
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			var mapTypeControl = new kakao.maps.MapTypeControl();
	            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	
			var zoomControl = new kakao.maps.ZoomControl();
	            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			var marker = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(35.1567474688023,129.059888286246), 
					map: map 
	            });
			var infowindow = new kakao.maps.InfoWindow({
	                content : '<div style="padding:5px; font-size:25px; line-height:20px;">　　　　　Anitel</div><div style="padding:5px; font-size:17px; line-height:12px;">부산 부산진구 서전로10번길 28 오기빌딩</div><div style="padding:5px; font-size:15px; line-height:12px;">　　　　(우) 47291(지번) 부전동 156-28</div>'
				});
	            infowindow.open(map, marker);
		</script> 
		<!-- 카카오 맵 API 끝 -->
	</body>
</html>