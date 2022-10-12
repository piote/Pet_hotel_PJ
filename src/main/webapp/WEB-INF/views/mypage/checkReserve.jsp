<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html >
<html>
<head>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<meta charset="utf-8">
	<link rel="stylesheet" href="${contextPath}/resources/css/checkReserve.css">
	<script type="text/javascript">
		$( "#datepicker" ).datepicker({
		 	dateFormat: "yy-mm-dd",
		 	showOtherMonths: true,
		 	showMonthAfterYear: true,
			showButtonPanel: true,
			changeMonth: true,
			changeYear: true,
			showOn: "both",
			buttonImage: "${contextPath}/resources/img/cale.png",
			buttonImageOnly: true,
			buttonText: "Select date",
			closeText: "닫기",
			nextText: '다음 달',
		 	prevText: '이전 달',
		 	dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		 	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		 	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		 	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		 	maxDate: 1

		});
		$(function(){
			$.datepicker.setDefaults({
				dateFormat: "yy-mm-dd",
			 	showOtherMonths: true,
			 	showMonthAfterYear: true,
				showButtonPanel: true,
				changeMonth: true,
				changeYear: true,
				showOn: "both",
				buttonImage: "${contextPath}/resources/img/cale.png",
				buttonImageOnly: true,
				buttonText: "Select date",
				closeText: "닫기",
				nextText: '다음 달',
			 	prevText: '이전 달',
			 	dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			 	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			 	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			 	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			 	maxDate: 1
			});
			$("#startDate").datepicker();
			$("#endDate").datepicker();
			
			$("#startDate").datepicker('setDate', 'today');
			$("#endDate").datepicker('setDate', '+1D');
			
		    $.datepicker.setDefaults($.datepicker.regional['ko']);         //default셋팅
		    $("#txt_prodStart" ).datepicker();
		    $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'5px'});  //아이콘(icon) 위치
		    $('.ui-datepicker ').css({ "margin-left" : "141px", "margin-top": "-220px"});  //달력(calendar) 위치
		    $('img.ui-datepicker-trigger').attr('align', 'absmiddle');
		    $('img.ui-datepicker-trigger').css({'display': 'inline-block'});
		});
			
	$(document).ready(function () {
    	if( ${colName != null && colName != ""} &&
    		${searchWord != null && searchWord != ""}){
    		$("input[name=searchWord]").val("${searchWord}");
    		$("#colName").val("${colName}");
    	}

    	if(${endDate != null && endDate !="" && startDate != null && startDate != ""} ){
    		$("#startDate").val("${startDate}");
    		$("#endDate").val("${endDate}");
    	}
    	
		$("#btnSearch").click(function(){
			goSearch();
		});
		
		$("input[name=searchWord]").keydown(function(event){
			var code = event.keyCode;
			if(code == 13){
				goSearch();
			}
		});
	});
	
    function goSearch(){
		var searchWord = $("input[name=searchWord]").val().trim();
		var colName = $("#colName").val();
		
// 		if( "" == colName){
// 			alert("검색조건을 선택하세요.");
// 			$("input[name=searchWord]").val("");
// 			$("input[name=searchWord]").focus();
// 			return;
// 		}else if ("" == searchWord){
// 			alert("검색어를 입력해 주세요.");
// 			return;
// 		}
		
		var frm = document.searchFrm;
		frm.method = "GET";
		frm.action = "checkReserve.do";
		frm.submit();
		
	}
    function fn_cancel_reserve(reservation_num){
    	var answer=confirm("예약을 취소하시겠습니까?");
    	if(answer==true){
    		var formObj=document.createElement("form");
    		var i_order_id = document.createElement("input"); 
    	    
    	    i_order_id.name="reservation_num";
    	    i_order_id.value=reservation_num;
    		
    	    formObj.appendChild(i_reservation_num);
    	    document.body.appendChild(formObj); 
    	    formObj.method="post";
    	    formObj.action="${contextPath}/mypage/cancelMyReserve.do";
    	    formObj.submit();	
    	}
    }
	
	
	</script>
</head>
<body>
	<div id="wrap">
		 <div id="container">
			<h2>예약 조회 및 취소</h2>
			<div id="searchFrm">
				<form name="searchFrm">
					<select name="colName" id="colName">
						<option value="">검색</option>
						<option value="name">예약명</option>
						<option value="pet_name">펫이름</option>
						<option value="tel">전화번호</option>
					</select>
					<input type="text" id="searchWord" name="searchWord"/> <br/><br/>
					<div id="calendar">
						<input type="text" id="startDate">
						<input type="text" id="endDate">
					</div>
					<input type="text" style="display: none;" />
					<div id="btnSearch"><img src="${contextPath}/resources/img/search.png"></div>
				</form>
			</div>
			<div id="reserve_list">
				<h3>예약 내역</h3>
			 </div>  
			 <div class="detail_reserve">
				<table>
				   <tr class="detail-center">
					  <td>Date</td>
					  <td>Name</td>
					  <td>PetName</td>
					  <td>Phone Number</td>
					  <td>Status</td>
					  <td>Cancel</td>
				  </tr>
	            <c:choose>
	            	<c:when test="${empty myReserveList }">
		               <tr>
		                  <td colspan=4>
		                  	<strong>예약하신 내역이 없습니다.</strong>
		                  </td>
		               </tr>
					</c:when>
					<c:when test="${not empty myReserveList }">
						<c:forEach var="i" items="${myReserveList }">
							<tr>
								<td>${i.reservation_st }</td>
								<td>${i.reservation_name }</td>
								<td>${i.pet_name }</td>
								<td>${i.reservation_tel }</td>
								<td>
									<c:choose>
										<c:when test="${i.reservation_state == 'reservation_prepared' }">
											예약완료
										</c:when>
										<c:when test="${i.reservation_state == 'cancel_reserve' }">
											예약 취소
										</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${i.reservation_state == 'reservation_prepared'}">
											<input  type="button" onClick="fn_cancel_reserve('${i.reservation_num}')" value="주문취소"  />
										</c:when>
										<c:otherwise>
											<input  type="button" onClick="fn_cancel_reserve('${i.reservation_num}')" value="주문취소" disabled />
										</c:otherwise>
									</c:choose>
							    </td>	
							</tr>
						</c:forEach>
					</c:when>
               </c:choose>
				</table>
			 </div>
		</div>
	</div>
</body>
</html>