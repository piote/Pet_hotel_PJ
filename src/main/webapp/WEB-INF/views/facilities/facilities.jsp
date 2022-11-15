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
                document.getElementById("modcompl").style.color="red";
             	document.getElementById("fac_re").removeAttribute('href');
                document.getElementById("rm_re").removeAttribute('href');
                document.getElementById("cut_re").removeAttribute('href');
                document.getElementById("spa_re").removeAttribute('href');
                document.getElementById("in_btposition").style.display="block";
                document.getElementById("out_btposition").style.display="block";
                document.getElementById("rm_btposition").style.display="block";
                document.getElementById("cut_btposition").style.display="block";
                document.getElementById("spa_btposition").style.display="block";
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
                document.getElementById("fac_re").setAttribute('href','#facilitiesindex');
                document.getElementById("rm_re").setAttribute('href','#roomindex');
                document.getElementById("cut_re").setAttribute('href','#cutindex');
                document.getElementById("spa_re").setAttribute('href','#spaindex');
                document.getElementById("in_btposition").style.display="none";
                document.getElementById("out_btposition").style.display="none";
                document.getElementById("rm_btposition").style.display="none";
                document.getElementById("cut_btposition").style.display="none";
                document.getElementById("spa_btposition").style.display="none";
			}
			/* 이미지를 업로드하기 위함  */
			/* 내부 사진 버튼 시작 1 ~ 4 */
			function readURL1(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#fac_inimg1").val();
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
			    	 var fileName = $("#fac_inimg2").val();
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
			    	 var fileName = $("#fac_inimg3").val();
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
			    	 var fileName = $("#fac_inimg4").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview4').attr('src', e.target.result);
			         }
			         $(".upload-name4").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 } 		
			/* 내부 사진 버튼 끝 1 ~ 4 */
			/* 외부 사진 버튼 시작 5 ~ 7 */
			function readURL5(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#fac_outimg1").val();
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
			    	 var fileName = $("#fac_outimg2").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview6').attr('src', e.target.result);
			         }
			         $(".upload-name6").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 } 			
			function readURL7(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#fac_outimg3").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview7').attr('src', e.target.result);
			         }
			         $(".upload-name7").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 }		
			/* 외부 사진 버튼 끝 5 ~ 7 */
			/* 방 사진 버튼 시작 8 ~ 10 */
			function readURL8(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#fac_rmimg1").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview8').attr('src', e.target.result);
			         }
			         $(".upload-name8").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 } 
			function readURL9(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#fac_rmimg2").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview9').attr('src', e.target.result);
			         }
			         $(".upload-name9").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 } 			
			function readURL10(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#fac_rmimg3").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview10').attr('src', e.target.result);
			         }
			         $(".upload-name10").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 }		
			/* 방 사진 버튼 끝 8 ~ 10 */			
			/* 커트 사진 버튼 시작 11, 12 */
			function readURL11(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#fac_cutimg1").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview11').attr('src', e.target.result);
			         }
			         $(".upload-name11").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 } 
			function readURL12(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#fac_cutimg2").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview12').attr('src', e.target.result);
			         }
			         $(".upload-name12").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 } 				
			/* 커트 사진 버튼 끝 11, 12 */
			/* 스파 사진 버튼 시작 13, 14 */
			function readURL13(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#fac_spaimg1").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview13').attr('src', e.target.result);
			         }
			         $(".upload-name13").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			} 
			function readURL14(input) {
			     if (input.files && input.files[0]) {
			    	 var fileName = $("#fac_spaimg2").val();
			         var reader = new FileReader();
			         reader.onload = function (e) {
			             $('#preview14').attr('src', e.target.result);
			         }
			         $(".upload-name14").val(fileName);
			         reader.readAsDataURL(input.files[0]);
			     }
			 } 				
			/* 스파 사진 버튼 끝 13, 14 */				
 		</script>        
        <style>     	        	   	
            /* common 공통 시작 */
            /* 관리자 수정 버튼 시작 */
            /* 버튼 누르기 전  */
            #tr_btn {
            	position: relative;
				left: 50px;
    			top: 30px;
            }
            /* 버튼 누른 후  */
            #tr_btn_modify {
            	display: none;
            	position: relative;
            	left: 50px;
     			top: 30px;
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
        	#in_btposition {
    			position: relative;
    			left: 749px;
    			top: -888px;
    			width: 199px;
   	 			height: 430px;
    			display: none;
        	}
        	#out_btposition {
    			position: relative;
    			left: 749px;
    			top: -888px;
    			width: 199px;
   	 			height: 430px;
   	 			display: none;
        	}        	
        	#rm_btposition {
    			position: relative;
    			left: 749px;
    			top: -1282px;
    			width: 199px;
   	 			height: 430px;
   	 			display: none;
        	}     
        	#cut_btposition {
    			position: relative;
    			left: 749px;
    			top: -1140px;
    			width: 199px;
   	 			height: 430px;
   	 			display: none;
        	}  
        	#spa_btposition {
    			position: relative;
    			left: 749px;
    			top: -1185px;
    			width: 199px;
   	 			height: 430px;
   	 			display: none; 
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
            @media screen and (max-width: 1669px) {
        		.index {
        			display: none;
        		}
        	}
            .index {
                margin: 0;
                list-style: none;
                height: 210px;
                width: 180px;
                position: fixed;
                left: 60px;
                bottom: 450px;
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
        	<section class="header_box_back"></section>
    		<table border="0" align="center">
				<!-- 관리자 모드로 접근하면 나타나는 수정버튼 생성 및 시작 -->
    			<tr id="tr_btn_modify" align="center">
					<td colspan="3">
					    <input type="button" class="button" value="버튼닫기" onClick="fn_close(this.form)">
						<input type="button" id="modcompl" class="button" value="수정완료" onClick="fn_modify_facilities(frmFacilities)">
						<input type="button" class="button" value="수정취소" onClick="backToList(frmFacilities)">
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
        		<!-- index 시작 -->
        		<section class="index">
            		<div class="txt_index">
                		<div class="bar"></div>
                		<a href="#"><p class="sec_title">목차</p></a>
                		<ul class="gnb">
		                    <li>
		                    	<a href="#facilitiesindex" id="fac_re">
		                    		<textarea id="index_mod1" name="fac_idx1" class="index_style" disabled maxlength="5">${facilities.fac_idx1}</textarea>
		                    	</a>
		                    </li>
		                    <li>
		                    	<a href="#roomindex" id="rm_re">
		                    		<textarea id="index_mod2" name="fac_idx2" class="index_style" disabled maxlength="5">${facilities.fac_idx2}</textarea>
		                    	</a>
		                    </li>
		                    <li>
		                    	<a href="#cutindex" id="cut_re">
		                    		<textarea id="index_mod3" name="fac_idx3" class="index_style" disabled maxlength="5">${facilities.fac_idx3}</textarea>
		                    	</a>
		                    </li>
		                    <li>
		                    	<a href="#spaindex" id="spa_re">
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
			                <img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_inimg1}" alt="inside1" width="525" id="preview1">
	 		            	<input type="hidden" name="originalfac_inimg1" value="${facilities.fac_inimg1}" />
	   						<img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_inimg2}" alt="inside2" width="525" id="preview2">
	 		            	<input type="hidden" name="originalfac_inimg2" value="${facilities.fac_inimg2}" />
	   						<img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_inimg3}" alt="inside3" width="500" id="preview3">
	 		            	<input type="hidden" name="originalfac_inimg3" value="${facilities.fac_inimg3}" />							
							<img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_inimg4}" alt="inside4" width="500" id="preview4">
	 		            	<input type="hidden" name="originalfac_inimg4" value="${facilities.fac_inimg4}" />	
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
		            <!-- 내부 시설 사진 관리자 수정 버튼 시작 -->
        			<section id="in_btposition">
		        		<div>
		        			<p>내부 1번 사진</p>
							<input type="file" id="fac_inimg1" name="fac_inimg1" onchange="readURL1(this);"/><br>		                        		                
							<label for="fac_inimg1">파일 경로</label>
							<input class="upload-name1" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL1(this);" disabled />
						</div><br>
		        		<div>
		        			<p>내부 2번 사진</p>
							<input type="file" id="fac_inimg2" name="fac_inimg2" onchange="readURL2(this);"/><br>		                        		                
							<label for="fac_inimg2">파일 경로</label>
							<input class="upload-name2" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL2(this);" disabled />
						</div><br>
		        		<div>
		        			<p>내부 3번 사진</p>
							<input type="file" id="fac_inimg3" name="fac_inimg3" onchange="readURL3(this);"/><br>		                        		                
							<label for="fac_inimg3">파일 경로</label>
							<input class="upload-name3" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL3(this);" disabled />
						</div><br>
		        		<div>
		        			<p>내부 4번 사진</p>
							<input type="file" id="fac_inimg4" name="fac_inimg4" onchange="readURL4(this);"/><br>		                        		                
							<label for="fac_inimg4">파일 경로</label>
							<input class="upload-name4" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL4(this);" disabled />
						</div>	
					</section>
					<!-- 내부 시설 사진 관리자 수정 버튼 끝 -->	
	        	</section>
        		<!-- facilities_inside 끝 -->
        		<!-- facilities_outside 시작 -->
        		<section class="facilities_outside">
            		<div class="scroll_bar">
                		<div class="scroll_bar_in"></div>
            		</div>
            		<div class="roll_banner">
                		<div class="roll_banner_in">
			                <img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_outimg1}" alt="outside1" width="600" id="preview5">
	 		            	<input type="hidden" name="originalfac_outimg1" value="${facilities.fac_outimg1}" />  
			                <img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_outimg2}" alt="outside2" width="600" id="preview6">
	 		            	<input type="hidden" name="originalfac_outimg2" value="${facilities.fac_outimg2}" /> 
			                <img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_outimg3}" alt="outside3" width="600" id="preview7">
	 		            	<input type="hidden" name="originalfac_outimg3" value="${facilities.fac_outimg3}" /> 	 		            		 		            	  
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
		            <!-- 외부 시설 사진 관리자 수정 버튼 시작 -->
        			<section id="out_btposition">
		        		<div>
		        			<p>외부 1번 사진</p>
							<input type="file" id="fac_outimg1" name="fac_outimg1" onchange="readURL5(this);"/><br>		                        		                
							<label for="fac_inimg1">파일 경로</label>
							<input class="upload-name5" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL5(this);" disabled />
						</div><br>
		        		<div>
		        			<p>외부 2번 사진</p>
							<input type="file" id="fac_outimg2" name="fac_outimg2" onchange="readURL6(this);"/><br>		                        		                
							<label for="fac_outimg2">파일 경로</label>
							<input class="upload-name6" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL6(this);" disabled />
						</div><br>
		        		<div>
		        			<p>외부 3번 사진</p>
							<input type="file" id="fac_outimg3" name="fac_outimg3" onchange="readURL7(this);"/><br>		                        		                
							<label for="fac_outimg3">파일 경로</label>
							<input class="upload-name7" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL7(this);" disabled />
						</div>
					</section>
					<!-- 외부 시설 사진 관리자 수정 버튼 끝 -->            		
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
							<img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_rmimg1}" alt="deluxe" width="400" id="preview8">
	 		            	<input type="hidden" name="originalfac_rmimg1" value="${facilities.fac_rmimg1}" /> 		                
							<img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_rmimg2}" alt="suite" width="400" id="preview9">
	 		            	<input type="hidden" name="originalfac_rmimg2" value="${facilities.fac_rmimg2}" /> 			                
							<img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_rmimg3}" alt="superior" width="400" id="preview10">
	 		            	<input type="hidden" name="originalfac_rmimg3" value="${facilities.fac_rmimg3}" /> 		                
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
		            <!-- 방 사진 관리자 수정 버튼 시작 -->
        			<section id="rm_btposition">
		        		<div>
		        			<p>방 1번 사진</p>
							<input type="file" id="fac_rmimg1" name="fac_rmimg1" onchange="readURL8(this);"/><br>		                        		                
							<label for="fac_rmimg1">파일 경로</label>
							<input class="upload-name8" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL8(this);" disabled />
						</div><br>
		        		<div>
		        			<p>방 2번 사진</p>
							<input type="file" id="fac_rmimg2" name="fac_rmimg2" onchange="readURL9(this);"/><br>		                        		                
							<label for="fac_rmimg2">파일 경로</label>
							<input class="upload-name9" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL9(this);" disabled />
						</div><br>
		        		<div>
		        			<p>방 3번 사진</p>
							<input type="file" id="fac_rmimg3" name="fac_rmimg3" onchange="readURL10(this);"/><br>		                        		                
							<label for="fac_rmimg3">파일 경로</label>
							<input class="upload-name10" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL10(this);" disabled />
						</div>
					</section>
					<!-- 방 사진 관리자 수정 버튼 끝 -->		            
		        </section>
		        <!-- room 끝 -->   
		        <!-- cut 시작 -->
		        <section class="cut" id="cutindex">
		            <div class="scroll_bar_cut">
		                <div class="scroll_bar_in_cut"></div>
		            </div>
		            <div class="roll_banner_cut">
		                <div class="roll_banner_in_cut">
		                    <img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_cutimg1}" alt="cut1" width="400" id="preview11">
	 		            	<input type="hidden" name="originalfac_cutimg1" value="${facilities.fac_cutimg1}" /> 
		                </div>
		            </div>
		            <div class="cut_price">
		                <img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_cutimg2}" alt="cut2" width="650" height="266" id="preview12">
	 		        	<input type="hidden" name="originalfac_cutimg2" value="${facilities.fac_cutimg2}" /> 		                
		            </div>
		            <div class="txt_cut">
		                <p class="sec_title">
		                	<textarea id="title_mod12" name="fac_cuttitle" disabled maxlength="25">${facilities.fac_cuttitle}</textarea>
						</p>
		                <p class="sec_p">
		                	<textarea id="contents_mod12" name="fac_cutcontents" disabled>${facilities.fac_cutcontents}</textarea>                           
		                </p>
		            </div>
		            <!-- 커트 사진 관리자 수정 버튼 시작 -->
		            <section id="cut_btposition">
			        	<div>
			        		<p>커트 1번 사진</p>
							<input type="file" id="fac_cutimg1" name="fac_cutimg1" onchange="readURL11(this);"/><br>		                        		                
							<label for="fac_cutimg1">파일 경로</label>
							<input class="upload-name11" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL11(this);" disabled />
						</div><br>
			        	<div>
			        		<p>커트 2번 사진</p>
							<input type="file" id="fac_cutimg2" name="fac_cutimg2" onchange="readURL12(this);"/><br>		                        		                
							<label for="fac_cutimg2">파일 경로</label>
							<input class="upload-name12" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL12(this);" disabled />
						</div>
					</section>
					<!-- 커트 사진 관리자 수정 버튼 끝 -->		            
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
		                    	<img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_spaimg2}" alt="spa2" width="400" height="173" id="preview13">
	 		            		<input type="hidden" name="originalfac_spaimg2" value="${facilities.fac_spaimg2}" /> 		                        
		                    </div>     
		                </div>
		                <div class="spa_price">
		                    <img src="${contextPath}/resources/facilities/facilities_image/${facilities.fac_num}/${facilities.fac_spaimg1}" alt="spa1" width="400" height="600" id="preview14">
	 		            	<input type="hidden" name="originalfac_spaimg1" value="${facilities.fac_spaimg1}" /> 
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
		            <!-- 스파 사진 관리자 수정 버튼 시작 -->
		            <section id="spa_btposition">
			        	<div>
			        		<p>스파 1번 사진</p>
							<input type="file" id="fac_spaimg1" name="fac_spaimg1" onchange="readURL13(this);"/><br>		                        		                
							<label for="fac_spaimg1">파일 경로</label>
							<input class="upload-name13" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL13(this);" disabled />
						</div><br>
			        	<div>
			        		<p>스파 2번 사진</p>
							<input type="file" id="fac_spaimg2" name="fac_spaimg2" onchange="readURL14(this);"/><br>		                        		                
							<label for="fac_spaimg2">파일 경로</label>
							<input class="upload-name14" spellcheck="false" value="첨부파일" placeholder="첨부파일" onchange="readURL14(this);" disabled />
						</div>
					</section>
					<!-- 스파 사진 관리자 수정 버튼 끝 -->
		        </section>
		        <!-- spa 끝 -->
       		</table>  
		</form>
    </body>
</html>