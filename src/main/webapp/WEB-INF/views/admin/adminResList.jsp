<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="item_res"  value="${totalresnum}" /><!--총 데이터베이스 아이템 수  -->
<c:set var="resList"  value="${adminResReed}" /><!--가져온 예약 리스트 -->
<c:set var="P"  value="0" /><!--페이지 현재 -->
<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자페이지_예약조회</title>
    <style>
        #adm_res{
        	color: #333;
        }
        .list_wrap{
            width: 1000px; height: auto;
           margin-left: 250px;
        }
        .list_option{
            width: 100%;
            height: 30px;
            background-color: #fff;
            margin-bottom: 30px;
            position: relative;
            display: flex;
            flex-direction: row;
        }
        .search_wrap{
            margin-left: 10px;
            width: 315px;
            position: relative;
        }
        #search_op{
            width: 85px; height: 20px;
            border: 1px solid #bababa;
            border-radius: 4px;
            padding-left: 2px;
            font-size: 13px;
            box-sizing: border-box;
        }
        #search_op:focus{
            border: 1px solid #bababa;
            outline: none;
        }
        .search_txt{
            width: 220px; height: 25px;
            border: 0;
            background-color: #f1f1f1;
            transition: background-color 0.2s;
            padding-left: 10px;
            box-sizing: border-box;
            font-size: 13px;
            color: #606060;
        }
        .search_txt:focus{
            border: 0;
            outline: none;
            background-color: #eaeaea;
        }
        .seh_icon{
            width: 17px;height: 17px;
            display: block;
            position: absolute;
            right: 10px;
            top: 5px;
            background: none;
            border: none;
            cursor: pointer;
        }
        .sort_option,.res_option{
            font-size: 14px;
            color: #606060;
            line-height: 30px;
            display: flex;
            flex-direction: row;
        }
        .sort_option{
            margin-left: 0;
        }
        .res_option{
            margin-left: 25px;
        }
        .sort_option input[type=radio], .res_option input[type=checkbox]{
            accent-color: #ffa245;
            color: #ffa245;
            transform: scale(0.9);
            margin: 0 5px;
            position: relative;
            top: 2px;
        }
        .hr{
            height: 100%; width: 1px;
            background-color: #ccc;
            transform: scaleY(0.6);
            margin-left: 15px;
        }
        .sort_option label,.res_option label{
            margin: 0 10px;
        }
        
        
        .res_Item_Num{
        	font-size: 13px;
            color: #606060;
        }
        
        
        .list_tb{
            border-collapse: collapse;
            width: 1000px;
            text-align: center;
        }
        .list_tb tr{
            height: 40px;
            border-bottom: 1px solid #d6d6d6;
        }
        .list_tb td{
            font-size: 13px;
            color: #606060;
        }
        .tb_title{
            background-color: #f1f1f1;
        }
        .tb_title td{
            font-size: 14px;
            font-weight: bold;
            color: #030303;
        }
        .res_num,.res_name,.res_petCount,.resState{
            width: 12%;
        }
        .res_cost{
            width: 13%;
        }
        .res_Date{
            width: 17%;
        }
        .res_payTime{
            width: 15%;
        }
        .modRes{
            width: 56px;
            height: 20px;
            font-size: 10px;
            border: 1px solid #bbb;
            border-radius: 3px;
            font-weight: 600;
        }
        .modRes:hover{
            background-color: #ddd;
        }.modRes:active{
            background-color: #ccc;
        }
        .page_num{
            margin-top: 50px;
            text-align: center;
        }
        .pageNO{
            display: inline-block;
            margin: 0 5px;
            cursor: pointer;
            font-size: 14px;
            color: #999999;
        }
        .pageNOW{
            color: red;
        }
        
        .pageNumberF{/* 페이징 숫자.*/
        	/*  */
        }
        
        .select_number{
            color: #030303;
        }
        
        /*템 없을 때  출력 데이터  */
        .notResItem{
        	text-align: center;
        	height: 100px;
        }
        
        #res_content_box{
        	height: 0px;
        	width: 100%;
        	overflow:hidden;
        	background-color: #bbb;
        	
        	transition: height 0.6s;
        }
		#res_content_box>td{
			opacity: 0;
		}

        
        .res_Date_Veiw_Box li{
        	display: inline-block;
        	width: 40%;
        	text-align: center;
        }
        
        .res_Date_Veiw_Box ul li .check_Date{
        	font-size: 16px;
        }
        
        .res_Date_Veiw_Box .date_Cal_Text{
        	width: 8%;
        }
        
        .pet_Cost_Box{
        	text-align: left;
        	margin-left: 40px;
        }
        
        .pet_Cost_table{
        	border:2px solid black;
        	border-collapse:collapse;
        	height: 85px;
   	 		width: 230px;
    		text-align: center;
    		margin: 0 auto;
        	
        }
        
        .list_tb .pet_Cost_table tr{
        	height: 25px;   	
        }
        
        .pet_Cost_table tr th,.pet_Cost_table tr tb {
        	border:1px solid black;
        	width: 20%;
        	
        }
        
        .pet_Cost_Box li:nth-child(2){
        	text-align: right;
        	
        }
        
        .membershipImg{
        	display: inline;
		    vertical-align: middle;
		    width: 15px;
		    height: 15px;
        }
        .pet_Comment_Box{
        	text-align: right;
        }
        
        #pet_Comment{
        	resize: none;
        	width: 90%;
        }
        
       
                
        .petTB_List_Box{
        	overflow: hidden;
        	border: 1px solid black;
        	background-color: gainsboro;
        	height:220px;
        	width: 96%;
		    margin: 0 auto;
		    margin-top: 10px;
		    margin-bottom: 10px;
        	
        }
        
        .petTB_List{
        	overflow: scroll;
        	height:215px;
		    width: 568px;
		    white-space: nowrap;
		    margin-right: -1000px;
		    padding-top: 5px;
		    padding-right: 8px;
		    padding-left: 8px;
		    
        }
        
        .petTB_List>li{
        	display: inline-block;
        	margin: 3px;
        	
        }
        
        .petTB_Item_Box{
        	height: 150px;
		    width: 125px;
		    border: 2px solid black;
		    border-radius: 15%;
		    padding: 15px;
		    background-color: lightgrey;
		    overflow: hidden;
        }
        
        .petTB_Item_Box>li{
        	height: 25px;
        	text-align: center;
        }
        
        /*동물 아이템 삭제  */
        .petTB_Item_Box>li:nth-child(6){
        
        	text-align: right;
        }
        
        .spaT+input{
        	width: 20%;
        }
        
        .petTB_Item_Box_Add{
        	height: 150px;
    		width: 125px;
		    border: 2px solid black;
    		border-radius: 15%;
    		padding: 15px;
		    background-color: lightgrey;
		    overflow: hidden;

        }
        .petTB_Item_Box_Add li{
        	line-height: 225px;
        	height: 100%;
    		width: 100%;
        }
        
        .petTB_Item{
        	width: 115px;
        }
        
       
        
         /* 펫 아이템 삭제 이미지 아이콘*/

      	.petUsed{
        	content:url("${contextPath}/resources/img/close.png");
        }
        
        .petTB_Bt_Box{
        	display:flex;
        	direction: rtl; 
        	width: 98%;
        }
        .petTB_Bt_Box button{
        	width: 70px;
		    height: 25px;
		    margin-bottom: 10px;
		    margin-left: 0px;
        }
        
        /* 화살표 아이콘 뒤집기  */
        .res_arrow_bt {
        	position: relative;
		    left: 23%;
		    height: 40px;
		    width: 40px;
		    transform: rotate(90deg);
		    transition: transform 0.6s;
           	
        }
        .res_R_arrow_bt {
        	position: relative;
		    left: 23%;
		    height: 40px;
		    width: 40px;
		    transform: rotate(-90deg);
		    transition: transform 0.6s;
           
        }
          /* 화살표 아이콘 뒤집기 end */

   
        
        .petAdd_Bt{
        	content:url("${contextPath}/resources/img/add-button.png");
        	height: 90px;
    		width: 90px;
        	
        }

        
    </style>
    
    <script>	
    	
    	var state_ck = {};
    	var sort_ck = null;

    	window.onload = function () {
    		petTClose()

    	}
		
    	var petTableInfo;
    	var petItemSum = 0;
    
    	
    	//상세보기 저장하고 닫기
    	function petTClose(){
    		petTableInfo = $('.res_content_box').children();
    		$('.res_content_box').empty()
    	}
    	
    	
    	//펫 요청사항 텍스트 범위 세기
    	function petcommentTextLength(obj){

    	        $('#pet_Comment_Info').html($('#pet_Comment').val().length);
    	}
    	
    	function closeResContentBox(obj){

   			if($(obj).attr('class') == 'res_R_arrow_bt'){
       			//박스 안보임
       			//$('.res_content_box').css('display', 'none');
       			$('.res_content_box').children('td').css('opacity', '0');
    			$('.res_content_box').empty()
       			$('.res_content_box').css('height', '0px');
    			//회살표
       			$(obj).addClass('res_arrow_bt');
       			$(obj).removeClass('res_R_arrow_bt');
       		}else{
       			
       			//이미 열려있다면 이전거 닫기
        		if($('.res_content_box').css('height') != '0px'){
        			//$('.res_content_box').css('display', 'none');
					$('.res_content_box').children('td').css('opacity', '0');
    				$('.res_content_box').empty()
        			$('.res_content_box').css('height', '0px');
    				//화살표
    				$('.res_R_arrow_bt').addClass('res_arrow_bt');
        			$('.res_R_arrow_bt').removeClass('res_R_arrow_bt');			
        		}	
       			//박스 보임
       			$('.res_content_box').insertAfter($(obj).parent().parent());//선택한 위치에 밑으로 res_content_box 이동
       			//non이면 테이블보이기
       			if($('.res_content_box').css('display') != 'table-row'){
       				$('.res_content_box').css('display', 'table-row');
       			}
       			$('.res_content_box').css('height', '278px');
       			console.log(petTableInfo);
       			//시간후 테이블 표시
       			tableView(obj);
       			//화살표
           		$(obj).addClass('res_R_arrow_bt');
       			$(obj).removeClass('res_arrow_bt');
       		}	
			
			// 클릭한 요소 예약번호 받아오기
			var reserNum =  $(obj).parent().parent().children('.res_num').text();

			// 요소추가 시간때문에, 셋타임아웃 설정
			setTimeout(function(){
				searchResInfo(reserNum,obj);
			},200)
			

    	}
    	
    	//펫 아이템 추가
		function pet_Add(obj){
    		
    		//이미 있는 갯수를 세서 갯수를 이용해 id 생성
			petItemSum = $('.petTB_Item_Box').length;
			
			var petTB_Item_Box = '<li class="pet_item_li">'
				+'<ul class="petTB_Item_Box" id="petTB_Item_'+petItemSum+'">'
				+'<li><input name="petname" class="petTB_Item" type="text" placeholder="이름"></li>'
				+'<li><select name="petsex" class="petTB_Item"><option value="male" >male</option><option value="female">female</option></select></li>'
				+'<li><select name="petroom" class="petTB_Item" onchange="change_form()"><option value="Deluxe">Deluxe(소형견)</option><option value="Sweet">Sweet(중형견)</option><option value="Superior">Superior(대형견)</option></select></li>'
				+'<li><select name="beauty" class="petTB_Item" onchange="change_form()"><option value="N">이용안함</option><option value="Clipping">Clipping</option><option value="Scissoring">Scissoring</option></select></li>'
				+'<li><span class="spaT">SPA</span><input name="spa" class="petTB_Item spaCK" type="checkbox" value="Y" onchange="change_form()"><input type="hidden" name="spa"  id="" value="N"/></li>'
				+'<li><input type="image" id="petTB_Item_Delete" class="petUsed" onclick="petItemDelet(this)" value="예약취소"></li>'
				+'</ul>'
				+'</li>'
			$(petTB_Item_Box).insertBefore($('.petTB_Item_Box_Add').parent());

			//표함수
			change_form()

			//let $box1 = $('.box1').clone();
			//$('.box_wrapper').append($box1);
    	}
    	
    	//펫 테이블 삭제
		function petItemDelet(obj){
			$(obj).parent().parent().parent().remove();
			//표함수
			change_form()
		}
		
		//테이블안에 요소 추가.
		function tableView(obj){
			setTimeout(function() {
				//조건문 빨리 두번 눌러서 뜨면 안되는 경우
				if($(obj).attr('class')!='res_arrow_bt'){
					$('.res_content_box').append(petTableInfo);
					$('.res_content_box').children('td').animate({opacity: "1"}, 500);
				}
			}, 200);
		}
		
		//페이징 ajax
		function reslistPage(P){ 
			
			var searchMap = new Object();
		    //input 안 정보 가지고 오기
		    var search_op = $('#search_op').val();
		    var keyword = $('#keyword').val();
		    
			searchMap.P=P;
		    searchMap.search_op = search_op;
		    searchMap.keyword = keyword;
		    searchMap.state_ck=state_ck;
		    searchMap.sort_ck=sort_ck;
			
			$.ajax({
				url : "/ResPageAjax.do",
				type : "post",
				dataType: "text",
		        processData: true,
		        contentType: "application/json; charset=UTF-8",
		        data: JSON.stringify(searchMap),
				cache : false
		    }).done(function(result) {
				//임시 html생성 임시로 만든 div태그안에 넣어서 보관
	     		var html = $('<div>').html(result);
				
				//page/ResPageAjax.jsp에 요소인 테이블의 ID indexListAjax를 불러온다.
				var contents = html.find("#indexListAjax").html();
				$("#res_List_Tb").html(contents);

				//테이블에 html로 만든 것들 넣기
				
				
				//새로생긴 html 부분에 상세보기 저장하고 닫기
				petTClose();
				
				//페이징
				var pageNumber = html.find("#PageAjax").html();
				$("#page_num").html(pageNumber);
				
				
				
				
			}).fail(function (jqXHR, textStatus, errorThrown) {
				console.log("에러");
				console.log(jqXHR);
				console.log(textStatus);
				console.log(errorThrown);
			});
		}

		

		$(document).ready(function(){
		    
		    //getAllList();

		    //검색창에 엔터 눌렀을때
		    $("#keyword").keydown(function(key) {
		        //13번은 엔터키
		        if (key.keyCode == 13) {
		        	reslistPage(0);
		        }
		    });
		    
		    //체크박스 눌렀을때
		    $('input[type=checkbox]').change(function(){
		        searchOption();
		    });
		    $('input[type=radio]').change(function(){
		    	searchOption();
		    });

//		    $('html').click(function(e){
//		    	if($(e.target).parents('.list_tb').length < 1){
//		            deleteTr();
//		        }
//		    });
		});
		
		//체크박스 옵션
		function searchOption(){

		    //체크된 값 받아오기
		    $('.res_option input[type=checkbox]').each(function (index) {
		        if($('#Complete').is(":checked")==true){
		            state_ck.Complete='Y';
		        }else{delete state_ck.Complete;}
		        if($('#Before').is(":checked")==true){
		        	state_ck.Before='N';
		        }else{delete state_ck.Before;}
		        if($('#Cancel').is(":checked")==true){
		        	state_ck.Cancel='C';
		        }else{delete state_ck.Cancel;}
		    });
		    
		    sort_ck=$('.sort_option input[name="sort"]:checked').val();
		    
		    console.log(state_ck)
		    console.log(sort_ck)

		    //체크박스 클릭 시 검색
		    reslistPage(0);

		}
		
		// 상세 tr 에 데이터 출력
		function searchResInfo(reserNum,obj){
			$('.pet_item_li').remove();

			$.ajax({
    			url:'/SearchReservationNum.do',
    			method:'post',
    			data:{ "reserNum": reserNum },
    			type:'post',
    			async:true,
    			dataType:'json',
    			success:function(data){
    				
    				//resNum
    				
    				$('#view_Res_Num').val(reserNum);
    				$('#view_User_Id').val(data.reservation.id);
					//CheckIn, CheckOut
					var st= data.reservation.res_st;
					var ed= data.reservation.res_end;
					$('#res_st').val(st);
					$('#res_end').val(ed);
					
					$('#dateCalText').text(dateCal(st, ed)+'박');	
					$('#dateCalText').val(dateCal(st, ed));	
					
					$('#res_TotalCost').text(data.reservation.totalCost.toLocaleString()+' 원');
					$('#res_TotalCost').val(data.reservation.totalCost);
					$(".membershipImg").val('');
					//요청사항
					$('#pet_Comment').val(data.reservation.res_comment)


					// //펫테이블
					for(i=0;i<data.petservice.length;i++){
						pet_Add(obj);
						$("#petTB_Item_"+(i+1)+" input[name='petname']").val(data.petservice[i].pet_name)
						$("#petTB_Item_"+(i+1)+" select[name='petsex']").val(data.petservice[i].pet_gender).prop("selected", true);
						$("#petTB_Item_"+(i+1)+" select[name='petroom']").val(data.petservice[i].room_grade).prop("selected", true);
						$("#petTB_Item_"+(i+1)+" select[name='beauty']").val(data.petservice[i].service_beauty).prop("selected", true);
						if(data.petservice[i].service_spa.startsWith('Y')){
							$("#petTB_Item_"+(i+1)+" .spaCK").prop('checked',true);
						}
					}
					//표 함수
					change_form()
				}
			});
		}
	
		//숙박일 구하기
		function dateCal(indate, outdate) {

            var date = new Date(indate);

            var year = date.getFullYear();
            var month = date.getMonth();
            var day = date.getDate();

            var stDate = new Date(year, month, day);

            var date = new Date(outdate);

            var year = date.getFullYear();
            var month = date.getMonth();
            var day = date.getDate();

            var endDate = new Date(year, month, day);

            var btMs = endDate.getTime() - stDate.getTime();
            var btDay = btMs / (1000 * 60 * 60 * 24);
            
            return btDay;
        }

		//표 함수
		function change_form(){
			
			var sr =0, mr =0, lr =0;
			var sc =0, mc =0, lc =0;
			var ss =0, ms =0, ls =0;
			var ssp =0, msp =0, lsp =0;

			$('.pet_Cost_table').find('td').empty(); //이전 표 안 데이터 지우기

			$(".pet_item_li").each(function(){
				
				//소형견
				if($(this).find("select[name='petroom']").val() == "Deluxe"){
					sr++;
					if($(this).find("select[name='beauty']").val()=='Clipping'){ sc++; }
					else if($(this).find("select[name='beauty']").val()=='Scissoring'){ ss++; }
					if($(this).find(".spaCK").is(':checked')){ ssp++; }
				}//중형견
				else if($(this).find("select[name='petroom']").val() == "Sweet"){
					mr++;
					if($(this).find("select[name='beauty']").val()=='Clipping'){ mc++; }
					else if($(this).find("select[name='beauty']").val()=='Scissoring'){ ms++; }
					if($(this).find(".spaCK").is(':checked')){ msp++; }
				}//대형견
				else if($(this).find("select[name='petroom']").val() == "Superior"){
					lr++;
					if($(this).find("select[name='beauty']").val()=='Clipping'){ lc++; }
					else if($(this).find("select[name='beauty']").val()=='Scissoring'){ ls++; }
					if($(this).find(".spaCK").is(':checked')){ lsp++; }
				}
			})

			$('.sr').append(sr); $('.sc').append(sc); $('.ss').append(ss); $('.ssp').append(ssp);
			$('.mr').append(mr); $('.mc').append(mc); $('.ms').append(ms); $('.msp').append(msp);
			$('.lr').append(lr); $('.lc').append(lc); $('.ls').append(ls); $('.lsp').append(lsp);
			
			//날짜 계산
			if($("input[name='res_st']").val() != null && $("input[name='res_end']").val() != null){
				var st = $("input[name='res_st']").val();
				var ed = $("input[name='res_end']").val();

				if(dateCal(st, ed) <= 0){
	            	alert("숙박일 1일 이상")
	            	$("input[name='res_st']").val();
	            	$("input[name='res_end']").val();
	            }
				
				$('#dateCalText').text(dateCal(st, ed)+'박');	
				$('#dateCalText').val(dateCal(st, ed));	
			}
			
			
			//가격계산
			var total = sr * 35000 + mr * 45000 + lr * 55000 ;
			dayCal = $('#dateCalText').val();
	        total *= dayCal;
	        total += sc * 35000 + mc * 45000 + lc * 60000 + ss * 70000 + ms * 80000 + ls * 100000;
	        total += ssp * 50000 + msp * 80000 + lsp * 120000;
	        
	        
	        $("#res_TotalCost").text(membership(total).toLocaleString()  + ' 원');
		}
		
		
		
		function membership(total) {//조건 이미 할인된 가격을 불러올것
			//맴버쉽 없는 초기상태 계산
			if($(".membershipImg").val()==""|| $(".membershipImg").val()==null){
	       		var disTotal = $("#res_TotalCost").val();
	       	 	dis = (total-disTotal)/(total/100)//할인율
	       	 	
	        	if(dis == 2){
					$(".membershipImg").val("Bronze");
					console.log($(".membershipImg").attr('src', '/resources/img/bronze_medal.png'));
				}else if(dis == 5){
					$(".membershipImg").val("Silver");
					console.log($(".membershipImg").attr('src', '/resources/img/silver_medal.png'));
				}else if(dis == 10){
					$(".membershipImg").val("Gold");
					console.log($(".membershipImg").attr('src', '/resources/img/gold_medal.png'));
				}else{
					$(".membershipImg").val("");
					console.log($(".membershipImg").attr('src', '/resources/img/none.png'));
				}
				
			}
	              
	        if($(".membershipImg").val()=='Gold' && total != 0){
				var disTotal = total * (1 - 10 / 100);//10퍼 할인
				$(".totalcost").text(total.toLocaleString()  + ' 원'+'=>'+disTotal.toLocaleString()  + ' 원');
				$("#totalcost").val(disTotal);
				return disTotal;
			
	        }else if($(".membershipImg").val()=='Silver' && total != 0){
				var disTotal = total * (1 - 5 / 100);//5퍼 할인
				$(".totalcost").text(total.toLocaleString()  + ' 원'+'=>'+disTotal.toLocaleString()  + ' 원');
				$("#totalcost").val(disTotal);
				return disTotal;
			
			}else if($(".membershipImg").val()=='Bronze' && total != 0){
				var disTotal = total * (1 - 2 / 100);//2퍼 할인
				$(".totalcost").text(total.toLocaleString()  + ' 원'+'=>'+disTotal.toLocaleString()  + ' 원');
				$("#totalcost").val(disTotal);
				return disTotal;
			}else{
				//0원일시
				$(".totalcost").text(total.toLocaleString()  + ' 원');
				$("#totalcost").val(total);
				return total;
			}
		}
		//페이징 next PI 총 페이지수. P 현재페이지-1  5씩 페이지 증가 끝이면 PI-1로 페이지 이동
		function pageUP(PI,P) {
			
			if(P<PI-5){
				reslistPage(P+5);			
			}else{
				reslistPage(PI-1);	
			}
		}
		//페이징 pre P 현재페이지-1  5씩 페이지 감소 끝이면 최초 0페이지 이동
		function pageDown(P) {
			if(P>4){
				reslistPage(P-5);			
			}else{
				reslistPage(0);	
			}
		}
		
		//예약확인
		function resCheck(P){
			//
			var result = confirm("예약을 확인하시겠습니까?");
			
			if(result){
				var res_num = $("#view_Res_Num").val();
				//userId 받도록 만들기 jsp
				var user_Id = $("#view_User_Id").val();
				
				var resState = $("#resState_"+res_num).text();
				
				if(resState == 'Y') {
					alert("이미 완료된 예약입니다.");
				}else if(resState == 'C') {
					alert("이미 취소된 예약입니다.");
				}else {
				
				$.ajax({
	    			url:'/ReservaitionCheckY.do',
	    			method:'post',
	    			data:{ "res_num": res_num,
	    					"user_Id": user_Id },
	    			type:'post',
	    			dataType:'json',
	    			success:function(data){
	    				alert("예약이 확인되었습니다.");
	    				reslistPage(P);
					},
					error : function(error) {
				        alert("Error!");
				    }		
				});
				}
			}	
		}
		
		//예약취소
		function resCheck2(P){
			//
			var result = confirm("예약을 취소하시겠습니까?");
			if(result){
				var res_num = $("#view_Res_Num").val();
				//userId 받도록 만들기 jsp
				var user_Id = $("#view_User_Id").val();
				var resState = $("#resState_"+res_num).text();

				if(resState == 'Y') {
					alert("이미 완료된 예약입니다.");
				}else if(resState == 'C') {
					alert("이미 취소된 예약입니다.");
				}else {
					$.ajax({
		    			url:'/ReservaitionCheckC.do',
		    			method:'post',
		    			data:{ "res_num": res_num,
		    					"user_Id": user_Id },
		    			type:'post',
		    			dataType:'json',
		    			success:function(data){
		    				alert("예약이 취소되었습니다.");
		    				reslistPage(P);
						},
						error : function(error) {
					        console.log("Error!");
					    }		
					});
				}
				
			}	
		}
		
		//수정하기 -> 수정 확인
		function resMod(res_num){
			
		}
		function resModCheck(res_num){
			
		}
    </script>
</head>
<body>
    
            <div class="list_wrap">
                <div class="list_option">
                    <div class="search_wrap" id="searchForm" name="searchForm" onSubmit="reslistPage(0)" >
                        <select name="search_op" id="search_op" aria-label="search">
                            <option value="search_name">예약자</option>
                            <option value="search_res_num">예약번호</option>
                        </select>
                        <input type="text" name="keyword" id="keyword" class="search_txt" placeholder="검색">
                        <button type="button" class="seh_icon" onclick="reslistPage(0)" ><svg width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M15.853 16.56c-1.683 1.517-3.911 2.44-6.353 2.44-5.243 0-9.5-4.257-9.5-9.5s4.257-9.5 9.5-9.5 9.5 4.257 9.5 9.5c0 2.442-.923 4.67-2.44 6.353l7.44 7.44-.707.707-7.44-7.44zm-6.353-15.56c4.691 0 8.5 3.809 8.5 8.5s-3.809 8.5-8.5 8.5-8.5-3.809-8.5-8.5 3.809-8.5 8.5-8.5z"/></svg></button>
                    </div>
                    <div class="sort_option">
                        <label><input type="radio" name="sort" id="sort_num" value="sort_num" checked="checked">예약번호 순</label>
                        <label><input type="radio" name="sort" id="sort_res" value="sort_res" checked="checked">예약일 순</label>
                        <label><input type="radio" name="sort" id="sort_pay" value="sort_pay" checked="checked">주문일 순</label>
                    </div>
                    <div class="hr"></div>
                    <div class="res_option">
                        예약상태 :
                        <label><input type="checkbox" name="state" id="Complete" value="Complete">이용완료</label>
                        <label><input type="checkbox" name="state" id="Before" value="Before">이용전</label>
                        <label><input type="checkbox" name="state" id="Cancel" value="Cancel">취소</label>
                    </div>
                </div>
				<span class="res_Item_Num">총 ${item_res}개의 예약</span>
				
				<!-- 테이블 -->
                <table id="res_List_Tb" class="list_tb">
                    <tr class="tb_title">
                        <td class="res_num">예약번호</td>
                        <td class="res_name">예약자</td>
                        <td class="res_Date">예약일</td>
                        <td class="res_petCount">총 마리수</td>
                        <td class="res_payTime">주문일</td>
                        <td class="res_cost">총 가격</td>
                        <td class="resState">예약상태</td>
                        <td class="res_modBt"></td>
                    </tr>
                    <c:choose>
                    	<c:when test="${resList != null}">

	                    	<c:forEach var="reservation" items="${resList}" varStatus="status" begin="${P*10}" end="${P*10+9}">
                    			<tr>
		                 			<td class="res_num">${reservation.res_num}</td>
					                <td class="res_name">${reservation.name}</td>
					                <td class="res_Date">${reservation.res_st} ~ ${reservation.res_end}</td>
					                <td class="res_petCount">${reservation.total_pet}마리</td>
					                <td class="res_payTime">${reservation.payTime}</td>
					                <td class="res_cost">${reservation.totalCost}</td>
					                <td id="resState_${reservation.res_num}" class="resState">${reservation.res_state}</td>
					                <td class="res_modBt res_modBt_bt" onclick="">
					                    <img class="res_arrow_bt" alt="button" src="${contextPath}/resources/img/Arrow.png" onclick="closeResContentBox(this)">
					                </td>					  
				            	</tr>
                    			
                    		</c:forEach>
                    	</c:when>
                    	<c:otherwise>
                 
                 			<tr>
                 			
                 				<td class="notResItem" colspan="8">예약기록이 존재하지 않습니다!</td>
                 				
                 			</tr>
                    	</c:otherwise>
                    </c:choose>
                    
                    <!--상세보기용  -->
                    <tr id="res_content_box" class="res_content_box">
				            	<td colspan="3">
				            		<ul>
				            			<li class="res_Date_Veiw_Box">
				            				<input type="hidden" id="view_Res_Num">
				            				<input type="hidden" id="view_User_Id">
				            				<input type="hidden" id="view_Res_State">
				            				<ul>
				            					<li><span class="check_Date">Check In</span></li>
				            					<li class="date_Cal_Text"></li>
				            					<li><span class="check_Date">Check Out</span></li>
				            				</ul>
				            				<ul>
				            					<li><input type="date" name="res_st" id="res_st" onchange="change_form()"></li>
				            					<li class="date_Cal_Text"><span id="dateCalText">0박</span></li>
				            					<li><input type="date" name="res_end" id="res_end" onchange="change_form()"></li>
				            				</ul>	
				            			<li>
				            			<br>
				            			<li>
				            				<ul class="pet_Cost_Box">
				            					<li>
					            					<table class="pet_Cost_table">
													  <tr>
													    <th>*</th>
													    <th>R</th>
													    <th>C</th>
													    <th>S</th>
													    <th>SP</th>
													  </tr>
													  <tr>
													    <th>소</th>
													    <td class="sr">0</td>
													    <td class="sc">0</td>
													    <td class="ss">0</td>
													    <td class="ssp">0</td>
													  </tr>
													  <tr>
													    <th>중</th>
													    <td class="mr">0</td>
													    <td class="mc">0</td>
													    <td class="ms">0</td>
													    <td class="msp">0</td>
													  </tr>
													  <tr>
													    <th>대</th>
													    <td class="lr">0</td>
													    <td class="lc">0</td>
													    <td class="ls">0</td>
													    <td class="lsp">0</td>
													  </tr>
													</table>
												</li>
				            					<li><img class="membershipImg" src="${contextPath}/resources/img/gold_medal.png"> TotalCost = <span id="res_TotalCost">0원</span></li>
				            				</ul>
				            				<br>
				            				<ul>
				            					<li class="pet_Comment_Box">
				            						<textarea id="pet_Comment" name="petcomment" spellcheck="false" maxlength="500" placeholder="요청사항을 적어주세요." onkeyup="petcommentTextLength(this);" rows="3"></textarea>
				            						<span id="pet_Comment_Info">0</span>/500
				            					</li>
				            				</ul>
				            			<li>
				            		</ul>
				            		<ul>
				            			<li><li>
				            		</ul>
				            	</td>
				            	<td colspan="5">
				            		<ul>
				            			<li class="petTB_List_Box">
				            				<ul  class="petTB_List">
				            						            					
				            					<li>
				            						<ul class="petTB_Item_Box petTB_Item_Box_Add">
				            							<li onclick="pet_Add(this);">
				            								<input type="image" id="petTB_Item_Add" class="petAdd_Bt" value="펫 추가" >
				            							</li>
				            						</ul>
				            					</li>
				            				</ul>
				            			</li>
				            			<li class="petTB_Bt_Box">
				            				<button>예약 수정</button>
				            				<button onclick="resCheck2(${P})">예약 취소</button>
				            				<button onclick="resCheck(${P})">예약 확인</button>
				            			</li>
				            		</ul>
				            	</td>
				            </tr>
                    
                    
                </table>
                
                <!-- 페이지수 구하기 -->
				<c:if test="${item_res % 10 != 0 and item_res > 10}"><!-- 나머지가 있을경우 1페이지가 더 필요하다. ex)68, 62 개 아이템은 7페이지 -->
				
					<c:set var="Float" value="${item_res / 10}"/> <!-- 페이지수 구하기. 소수점으로 나누기 때문에 정수로 바꿔야함 -->
					<fmt:parseNumber var="PI" value="${Float+(1-(Float%1))%1}" integerOnly="true" scope="request"/> <!-- 소수점올림 -->
					
				</c:if>
				
				<!-- 10으로 나누어떨어짐 70개 = 7페이지-->
				<c:if test="${item_res % 10 == 0 and item_res > 10}">
					<fmt:parseNumber var="PI" value="${item_res/10}" integerOnly="true" scope="request"/>
				</c:if>
				
				<!-- 아이템이 적어 페이지를 만들 이유가 없음 -->
				<c:if test="${item_res <= 10}">
					<c:set var="PI" value="${0}" scope="request" />
				</c:if>
				
				
                <div id="page_num" class="page_num">
	                <c:choose>
					 	<c:when test="${PI > 5}">
					 		<c:forEach varStatus="i" begin="1" end="5">
							<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다. -->
								<c:choose>
								 	<c:when test="${P == i.count-1}">
								 		<!-- 현재페이지 색표시 총페이지 -->
								 		<li class="pageNO pageNOW pageNumberF" onClick="reslistPage(${i.count-1})">${i.count}</li>
								 	</c:when>
								 	<c:otherwise>
								 		<li class="pageNO pageNumberF" onClick="reslistPage(${i.count-1})">${i.count}</li>
								 	</c:otherwise>
								</c:choose>
							</c:forEach>
								<li class="pageNO pageUp" onClick="pageUP(${PI},${P})">next</li>
					 	</c:when>
					 	<c:otherwise>
					 		<c:forEach varStatus="i" begin="1" end="${PI}">
							<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다. -->
								<c:choose>
								 	<c:when test="${P == i.count-1}">
								 		<!-- 현재페이지 색표시 총페이지 -->
								 		<li class="pageNO pageNOW pageNumberF" onClick="reslistPage(${i.count-1})">${i.count}</li>
								 	</c:when>
								 	<c:otherwise>
								 		<li class="pageNO pageNumberF" onClick="reslistPage(${i.count-1})">${i.count}</li>
								 	</c:otherwise>
								</c:choose>
							</c:forEach>
					 	</c:otherwise>
					</c:choose>

	                
                </div>
            </div>
            
</body>
</html>