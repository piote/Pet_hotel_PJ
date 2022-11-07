<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%
  request.setCharacterEncoding("UTF-8");
%>   
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${contextPath}/resources/img/anitel.ico">
    <title>Anitel</title>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js'></script>
    <script src="${contextPath}/resources/js/scrollscript.js"> </script>
    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    <style>
        /* slider */
        .slider_wrap{
            width: 100%; height: 100vh;
            position: relative;
            margin-top: -200px;
            min-width: 1270px;
            overflow: hidden;
        }
        .slider_con{
            width: 100%;
            height: 100%;
            position: relative;
            z-index: -5;
            left: 0;
        }
        .slider_arrow{
            transform: scale(1.5);
            position: absolute;
            top: 55vh;
            fill: #000;
            opacity: 0.2;
            transition: opacity 0.2s;
            cursor: pointer;
        }
        .slider_arrow:hover{
            opacity: 0.5;
        }
        #left_arrow{
            left: 50px;
        }
        #right_arrow{
            right: 50px;
        }
        .slider{
            width: 100%; height: 100%;
            display: block;
            background-size: cover;
            position: absolute;
            top: 0; left: 0;
            opacity: 0;
            transition: opacity 0.5s;
        }
        .able_slider{
            opacity: 1 !important;
        }
        .slider[s_num-data="1"]{
            background-image: url('${contextPath}/resources/img/slidermain_1.png');
        }
        .slider[s_num-data="2"]{
            background-image: url('${contextPath}/resources/img/slidermain_2.png');
        }
        .txt_wrap{
            width: 1000px;
            height: 230px;
            position: absolute;
            margin-left: 50%; left: -500px;
            bottom: 100px;
        }
        .txt_wrap p:nth-child(1){
            font-size: 75px;
            font-weight: 800;
            text-align: right;
        }
        .txt_wrap p:nth-child(2){
            font-size: 45px;
            font-weight: 100;
            margin-top: -10px;
            text-align: right;
        }
        .slider_bt{
            width: 170px; height: 40px;
            border: 1px solid #030303;
            border-radius: 15px;
            font-size: 22px; line-height: 40px;
            text-align: center;
            margin-top: 40px;
            float: right;
            transition: all 0.3s;
            cursor: pointer;
        }
        .slider_bt:hover{
            background-color: rgba(255, 255, 255,0.5);
        }
        /* slider end */

        /* section */
        section{
            width: 1270px; height: 650px;
            margin: 150px auto;
            position: relative;
        }
        .bar{
            width: 160px; height: 10px;
            background-color: #e59f5a;
            border-radius: 30px;
        }
        .sec_title{
            font-size: 30px;   
            font-weight: 800;
            margin-top: 15px; 
        }
        .sec_p{
            font-size: 15px;   
            letter-spacing:-0.5px;
            color: #909090;
            margin-top: 20px; 
            line-height: 30px;
        }
        .more{
            font-size: 15px;
            letter-spacing:-0.5px;
            color: #909090;
            float: right;
        }
        .more:hover{
            color:#e59f5a;
            font-weight: 800;
        }


        /* introduce */
        .txt_introduce{
            width: 400px; height: 150px;
            background-color: #fff;
            position: relative;
            top: 130px; left: 200px;
        }
        .txt_introduce .sec_title{
            margin-left: 50px;
        }
        .txt_introduce .sec_p{
            margin-left: 80px;
        }

        .intro_con_wrap{
            position: relative;
            width: 500px; height: 200px;
            top: 180px; left: 200px;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }
        .con{
            width: 150px; height: 200px;
            background-image: url(${contextPath}/resources/img/con_1.png);
            transition: transform 0.3s;
            font-size: 15px; font-weight: 800;
            text-align: center;
        }
        .con span{
            display: inline-block;
            margin-top: 40px; margin-bottom: 5px;
            color: #fff;
        }
        .con p{
            font-size: 25px;
            margin-top: 50px;
            color:#e59f5a;
        }
        .con:last-child p{
            margin-top: 40px;
        }
        .con:hover{
            transform: scale(1.05);
        }
        .intro_img_wrap{
            width: 480px; height: 650px;
            display: block;
            position: relative;
            top: -350px; left: 700px;
        }
        /* introduce end */

        /* facilities */
        .fac_img_wrap{
            width: 650px; height: 465px;
            position: relative;
            left: 150px;
            overflow: hidden;
        }
        .fac_img_wrap img{
            transition: transform 0.3s;
        }
        .fac_img_wrap img:hover{
            transform: scale(1.05);
        }
        .txt_facilities{
            width: 280px; height: 225px;
            position: relative;
            float: right;
            top: -230px; right: 120px;
        }
        .txt_facilities .bar{
            margin-left: 50px;
        }
        .txt_facilities .sec_p{
            margin-left: 40px;
        }
        .txt_facilities .more{
            margin-top: 70px;
        }
        /* facilities end */
		
		/* review */
        .txt_review{
            width: 400px; height: 150px;
            position: relative;
            top: 100px; left: 100px;
        }
        .txt_review .sec_title{
            margin-left: 80px;
        }
        .txt_review .sec_p{
            margin-left: 120px;
        }
        .review_box{
            width: 850px; height: 100%;
            position: absolute;
            top: 0; right: 20px;
        }
        .preview{
            width: 400px; height: 400px;
            position: absolute;
            bottom: 50%; left: 0;
            margin-bottom: -200px;
            text-align: right;
        }
        .review_id{
            margin-top: 200px;
            font-size: 15px;
            color: #909090;
        }
        .review_scope{
            margin-top: 20px;
            font-size: 20px;
            color: #ffc041;
        }
        .review_content{
            font-size: 17px;
        }
        .review_box .more{
            position: absolute;
            bottom: 20px;
            right: 0;
        }
        .gallery{
            width: 400px; height: 100%;
            position: absolute;
            top: 0; right: 0;
        }
        .pic{
            width: 400px; height: 400px;
            position: absolute;
            background-color: #fff;
            transition: all .3s;
            background-size: cover;
            background-position: center;
            cursor: pointer;
            background-color:gray;
            bottom: 130px;
        }
        .pic[data-num="1"]{
            transform: scale(1) translateY(0);
            opacity: 1;
            filter: blur(0px);
            -webkit-filter: blur(0px);
        }
        .pic[data-num="2"]{
            transform: scale(.9) translateY(-100px);
            opacity: .5;
            filter: blur(5px);
            -webkit-filter: blur(5px);
        }
        .pic[data-num="3"]{
            transform: scale(.8) translateY(-200px);
            opacity: .2;
            filter: blur(5px);
            -webkit-filter: blur(5px);
        }
        .pic[data-num="4"]{
            transform: scale(.7) translateY(-300px);
            opacity: .1;
            filter: blur(5px);
            -webkit-filter: blur(5px);
        }
        .pic[data-num="1"]:hover{
            transform: scale(1.03) translateY(0);
        }.pic[data-num="2"]:hover{
            transform: scale(.93) translateY(-100px);
        }.pic[data-num="3"]:hover{
            transform: scale(.83) translateY(-200px);
        }.pic[data-num="4"]:hover{
            transform: scale(.73) translateY(-300px);
        }
        /* review end */
        
        /* experience */
        .experience{
            margin-bottom: 150px;
        }
        .scroll_bar{
            width: 320px; height: 10px;
            background-color: #ddd;
            border-radius: 30px;
            margin: 0 auto; margin-bottom: 50px;
        }
        .scroll_bar_in{
            width: 160px; height: 10px;
            background-color: #e59f5a;
            border-radius: 30px;
            position: relative;
        }
        .roll_banner{
            width: 1000px; height: 280px;
            margin: 0 auto;
            overflow-y: hidden;
            overflow-x: scroll;
            -ms-overflow-style: none;
        }
        .roll_banner::-webkit-scrollbar{
            display:none;
        }
        .roll_banner_in {
            width: 1510px; height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            position: relative;
            /* left: -510px; */
        }
        .roll_banner_in img{
            height: 280px;
        }
        .txt_experience{
            width: 240px; height: 150px;
            text-align: center;
            margin: 0 auto;
            margin-top: 70px;
        }
        /* experience end */
        /* section end */

    </style>
    <% String stmsgcheck = (String)request.getAttribute("stmsgcheck"); %>
    <% String stmsg = (String)request.getAttribute("stmsg"); %>
    <script>
    	var stmsgcheck= "${stmsgcheck}";
    	var stmsg = "<c:out value='${stmsg}'/>";
	    if(stmsgcheck == '1'){
	   		alert(stmsg);
	   		history.pushState(null, null, 'main.do')
	   	}
        
		//갤러리 이동기능
        function click_pic(obj){
            var num = $(obj).data('num');

            if(num==1){
                location.href='${contextPath}/reviewBoard.do';
            }else{
                $('.pic[data-num="1"]').remove();
                $('.pic[data-num="2"]').attr('data-num',1);
                $('.pic[data-num="3"]').attr('data-num',2);
                $('.pic[data-num="4"]').attr('data-num',3);
                $('.gallery').prepend('<div class="pic" data-num="4" onclick="click_pic(this)"></div>')
                now_reviewNum++;
                inputReviewData();

            }
        }

        // 리뷰js
        
        var totalReviewData;
        var review_data=[];
        var now_reviewNum=0;

        $(function(){

            $('#review_info').empty();

            $.ajax({
                url: "/returnReview.do",
                type: "GET", 
                success : function(data){
                    //총데이터 수 저장
                    totalReviewData = data.length;

                    //user_data에 받아온 데이터 저장
                    review_data = [totalReviewData];
                    for(i=0;i<data.length;i++){
                        review_data[i]=data[i];
                    }
                    inputReviewData();

                    $(data).each(function(){});
                    },
                error :function(){
                    alert("request error!");
                    }
            });
            
        });
        function inputReviewData(){
        	 $('#review_info').empty();
        	 
             if(now_reviewNum>totalReviewData-1){
                now_reviewNum=0;
            }

            var star = parseInt(review_data[now_reviewNum].REVIEW_STAR);
            var starString='';
            for(i=0;i<star;i++){
                starString+='★';
            }

            var html = '<p class="review_id">'+review_data[now_reviewNum].USER_ID+'님의 리뷰</p>'+
                        '<p class="review_scope">'+starString+'</p>'+
                        '<p class="review_content">'+review_data[now_reviewNum].REVIEW_TITLE+'</p>';

            $('#review_info').append(html);
            $('.pic[data-num="1"]').css('background-image','url("${contextPath}/'+review_data[now_reviewNum].REVIEW_IMAGE_URL+'")');
            
            // 갤러리 이미지
            if(now_reviewNum+3>totalReviewData-1){
                $('.pic[data-num="2"]').css('background-image','url("${contextPath}/'+review_data[now_reviewNum+1].REVIEW_IMAGE_URL+'")');
                $('.pic[data-num="3"]').css('background-image','url("${contextPath}/'+review_data[now_reviewNum+2].REVIEW_IMAGE_URL+'")');
                $('.pic[data-num="4"]').css('background-image','url("${contextPath}/'+review_data[0].REVIEW_IMAGE_URL+'")');
            }else if(now_reviewNum+2>totalReviewData-1){
                $('.pic[data-num="2"]').css('background-image','url("${contextPath}/'+review_data[now_reviewNum+1].REVIEW_IMAGE_URL+'")');
                $('.pic[data-num="3"]').css('background-image','url("${contextPath}/'+review_data[0].REVIEW_IMAGE_URL+'")');
                $('.pic[data-num="4"]').css('background-image','url("${contextPath}/'+review_data[1].REVIEW_IMAGE_URL+'")');
            }else if(now_reviewNum+1>totalReviewData-1){
                $('.pic[data-num="2"]').css('background-image','url("${contextPath}/'+review_data[0].REVIEW_IMAGE_URL+'")');
                $('.pic[data-num="3"]').css('background-image','url("${contextPath}/'+review_data[1].REVIEW_IMAGE_URL+'")');
                $('.pic[data-num="4"]').css('background-image','url("${contextPath}/'+review_data[2].REVIEW_IMAGE_URL+'")');
            }else{
                $('.pic[data-num="2"]').css('background-image','url("${contextPath}/'+review_data[now_reviewNum+1].REVIEW_IMAGE_URL+'")');
                $('.pic[data-num="3"]').css('background-image','url("${contextPath}/'+review_data[now_reviewNum+2].REVIEW_IMAGE_URL+'")');
                $('.pic[data-num="4"]').css('background-image','url("${contextPath}/'+review_data[now_reviewNum+3].REVIEW_IMAGE_URL+'")');
            }
        }   

        var slider_num = 1;
        var slider_count = 3;
        
        function slider_left(){
            --i;
            if(i<=0){
                i=3;
            }
            $('[s_num-data="'+(i+1)+'"]').removeClass('able_slider');
            $('[s_num-data="'+i+'"]').addClass('able_slider');
        }

    </script>

</head>
<body>

  <div class="slider_wrap">
    <svg id="left_arrow" class="slider_arrow" onclick="slider_left()" width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M20 .755l-14.374 11.245 14.374 11.219-.619.781-15.381-12 15.391-12 .609.755z"/></svg>
    <svg id="right_arrow" class="slider_arrow" onclick="slider_wrap()" width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M4 .755l14.374 11.245-14.374 11.219.619.781 15.381-12-15.391-12-.609.755z"/></svg>
    <div class="txt_wrap">
        <p>Anitel</p>
        <p>펫 호텔 서비스</p>
        <a class="slider_bt" href="javascript:fn_reservationForm('${isLogOn}','${contextPath}/reservationForm.do','${contextPath}/loginForm.do')" >예약하기 ></a>
    </div>
    <div class="slider_con">
        <div class="slider able_slider" s_num-data="1"></div>
        <div class="slider" s_num-data="2"></div>
        <div class="slider" s_num-data="3"></div>
    </div>
  </div>

  <section class="introduce">
    <div class="txt_introduce">
        <div class="bar"></div>
        <p class="sec_title">Introduce</p>
        <p class="sec_p">반려동물의 행복을 최우선으로 생각하는<br>저희 호텔을 소개드립니다.</p>
        <a class="more" href="${contextPath}/introduce.do">더보기 +</a>
    </div>
    <div class="intro_con_wrap">
        <div class="con">
            <span>Room</span><br>
            <svg xmlns="http://www.w3.org/2000/svg" width="41.051" height="23.946" viewBox="0 0 41.051 23.946">
                <path id="패스_4" data-name="패스 4" d="M41.051,28.946V16.973a1.711,1.711,0,0,0-1.71-1.71H1.71A1.711,1.711,0,0,0,0,16.973V28.946H1.71V25.525H39.34v3.421ZM8.552,13.552v-1.71a1.711,1.711,0,0,1,1.71-1.71H17.1a1.711,1.711,0,0,1,1.71,1.71v1.71h3.421v-1.71a1.711,1.711,0,0,1,1.71-1.71h6.842a1.711,1.711,0,0,1,1.71,1.71v1.71H37.63V6.71A1.711,1.711,0,0,0,35.92,5H5.131a1.711,1.711,0,0,0-1.71,1.71v6.842Z" transform="translate(0 -5)" fill="#fff" fill-rule="evenodd"/>
            </svg>
            <p>23</p>
        </div>
        <div class="con">
            <span>Petsitter</span><br>
            <svg xmlns="http://www.w3.org/2000/svg" width="36.822" height="26.301" viewBox="0 0 36.822 26.301">
                <path id="패스_5" data-name="패스 5" d="M14.628,21.831C18.4,20.961,20.6,20.2,18.9,16.989,13.726,7.222,17.526,2,22.988,2c5.569,0,9.276,5.423,4.09,14.989-1.752,3.228.575,3.99,4.263,4.842,3.265.755,3.481,2.35,3.481,5.114V28.3H11.151C11.151,24.691,10.861,22.7,14.628,21.831ZM-2,28.3H8.269c-.046-10.753,4.519-6.987,4.519-14.633A4.7,4.7,0,0,0,7.859,8.575c-4.1,0-6.946,3.918-3.068,11.242C6.065,22.224,3.435,22.8.608,23.449-1.841,24.014-2,25.211-2,27.285V28.3Z" transform="translate(2 -2)" fill="#fff"/>
            </svg>
            <p>15</p>
        </div>
        <div class="con">
            <span>Services</span><br>
            <svg xmlns="http://www.w3.org/2000/svg" width="28.908" height="28.908" viewBox="0 0 28.908 28.908">
                <path id="패스_7" data-name="패스 7" d="M14.4,13.25c4.011,0,8.5,7.375,9.193,10.5s-1.2,5.7-4.2,4.953c-1.315-.326-3.917-1.574-4.941-1.555-1.114.019-2.865,1.007-4.321,1.508-3.2,1.1-5.682-1.545-4.83-4.906C6.236,20.073,10.7,13.25,14.4,13.25Zm13-5.288c1.431.649,1.962,3.4,1.077,6.348-.848,2.82-2.806,4.584-5.488,3.368-2.326-1.056-2.6-3.828-1.077-6.348C23.446,8.792,25.967,7.311,27.4,7.962Zm-26.46.85c-1.257.878-1.277,3.609.1,6.281,1.315,2.554,3.509,3.9,5.863,2.252,2.043-1.427,1.812-4.135-.1-6.281S2.2,7.934.938,8.812ZM19.78.029c1.594.3,2.8,2.925,2.628,6.1-.161,3.032-1.692,5.278-4.676,4.712-2.588-.49-3.539-3.2-2.627-6.1C16.022,1.826,18.188-.273,19.78.029ZM7.38.1C5.853.642,5.067,3.418,5.721,6.527c.625,2.971,2.484,4.955,5.344,3.938,2.481-.882,3-3.706,1.659-6.427C11.369,1.3,8.907-.444,7.38.1Z" transform="translate(0 0)" fill="#fff" fill-rule="evenodd"/>
            </svg>
            <p>various</p>
        </div>
    </div>
    <div class="intro_img_wrap">
        <img src="${contextPath}/resources/img/main_2.png" alt="dog" height="650">
    </div>
</section>

<section class="facilities">
    <div class="fac_img_wrap">
        <img src="${contextPath}/resources/img/main_3.png" alt="fac" width="650">
    </div>
    <div class="txt_facilities">
        <div class="bar"></div>
        <p class="sec_title">Facilities</p>
        <p class="sec_p">반려동물을 위한 특별하고 깔끔한 룸,<br>주요 시설들을 소개드립니다.</p>
        <a class="more" href="${contextPath}/facilities.do">더보기 +</a>
    </div>
</section>

<section class="review">
    <div class="txt_review">
        <div class="bar"></div>
        <p class="sec_title">Review</p>
        <p class="sec_p">소중한 고객님들이 직접 작성해주신<br>애니텔에서의 하루가 담긴 리뷰게시글 입니다.</p>
    </div>
    <div class="review_box">
        <div class="preview">
            <div id="review_info">
                <!-- 리뷰정보 -->
                <p class="review_id">aaa님</p>
                <p class="review_scope">★★★★★</p>
                <p class="review_content">
                    시설이 깨끗하고 서비스가 좋아요.
                </p>
            </div>
            <a class="more" href="${contextPath}/reviewBoard.do">더보기 +</a>
        </div>
        <div class="gallery">
            <div class="pic" data-num="4" onclick="click_pic(this)"></div>
            <div class="pic" data-num="3" onclick="click_pic(this)"></div>
            <div class="pic" data-num="2" onclick="click_pic(this)"></div>
            <div class="pic" data-num="1" onclick="click_pic(this)"></div>
            <!-- <div id="ex_pic" class="pic"></div> -->
        </div>
    </div>
</section>

<section class="experience">
    <div class="scroll_bar">
        <div class="scroll_bar_in"></div>
    </div>
    <div class="roll_banner">
        <div class="roll_banner_in">
            <img src="${contextPath}/resources/img/roll_1.png" alt="roll1">
            <img src="${contextPath}/resources/img/roll_2.png" alt="roll2">
            <img src="${contextPath}/resources/img/roll_3.png" alt="roll3">
            <img src="${contextPath}/resources/img/roll_4.png" alt="roll4">
        </div>
    </div>
    <div class="txt_experience">
        <p class="sec_title">Experience</p>
        <p class="sec_p">많은 경험을 토대로<br>여러분의 반려동물을 안전하고 자유롭게<br>행복한 하루를 만들어 드리겠습니다.</p>
    </div>

  </section>
</body>
</html>
