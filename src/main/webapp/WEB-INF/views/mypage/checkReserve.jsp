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
		 	maxDate: 1,
		 	onClose: function(selectedDate){
		 		$("#endDate").datepicker("option", "minDate",selectedDate);
		 		$("#startDate").datepicker("option", "maxDate",selectedDate);
		 	}
		});
		
		$('#datepicker').datepicker('setDate', 'today');
		
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
			 	maxDate: 1,
			 	onClose: function(selectedDate){
			 		$("#endDate").datepicker("option", "minDate",selectedDate);
			 		$("#startDate").datepicker("option", "maxDate",selectedDate);
			 	}
			});
			$("#startDate").datepicker();
			$("#endDate").datepicker();
			$("#startDate").datepicker('setDate', 'today');
			$("#endDate").datepicker('setDate', '+1D');
		});
			
	$(document).ready(function () {
		
    	if(${startDate != null && startDate !="" && endDate != null && endDate != ""} ){
    		$("#startDate").val("${startDate}");
    		$("#endDate").val("${endDate}");
    	}
    	
    	if( ${colName != null && colName != ""} && 
    		${searchWord != null && searchWord != ""} ) {
    		$("input[user_name=searchWord]").val("${searchWord}");
    		$("#colName").val("${colName}");
    	}

		$("#btnSearch").click(function(){
			goSearch();
		});
		
		$("input[user_name=searchWord]").keydown(function(event){
			var code = event.keyCode;
			if(code == 13){
				goSearch();
			}
		});
	});
	
    function goSearch(){
/* 		var searchWord = $("input[user_name=searchWord]").val().trim();
		var colName = $("#colName").val();
		
		if( "" == colName){
			alert("검색조건을 선택하세요.");
			$("input[name=searchWord]").val("");
			$("input[name=searchWord]").focus();
			return;
		}else if ("" == searchWord){
			alert("검색어를 입력해 주세요.");
			return;
		} */
		
		var frm = document.searchFrm;
		frm.method = "GET";
		frm.action = "checkReserve.do";
		frm.submit();
		
	}
    function fn_cancel_reserve(res_num){
    	var answer=confirm("예약을 취소하시겠습니까?");
    	if(answer==true){	
    		var formObj=document.createElement("form");
    		var i_reserve_num = document.createElement("input"); 
    	    
    	    i_reserve_num.name = "res_num";
    	    i_reserve_num.value = res_num;
    		
    	    formObj.appendChild(i_reserve_num);
    	    document.body.appendChild(formObj); 
    	    formObj.method = "post";
    	    formObj.action ="${contextPath}/mypage/cancelMyReserve.do";
    	    formObj.submit();	
    	}
    }
	</script>
</head>
<body>
	<div id="wrap">
		 <div id="container">
			<h2>예약 조회</h2>
			<div id="searchFrm">
				<form name="searchFrm">
					<div id="calendar">
						<input type="text" name="startDate" id="startDate">
						<input type="text" name="endDate" id="endDate">
					</div>
					<div id="search_text">
						<select name="colName" id="colName">
							<option value="">검색</option>
							<option value="user_name">예약명</option>
							<option value="pet_name">펫이름</option>
							<option value="user_tel">전화번호</option>
						</select>
						<input type="text" id="searchWord" name="searchWord"/> <br/><br/>
						<input type="text" style="display: none;" />
						<input type="image" id="btnSearch" src="${contextPath}/resources/img/search.png">
					</div>
				</form>
			</div>
			<div id="reserve_list">
				<h3>예약 내역</h3>
			 </div>  
			 <div class="detail_reserve">
				<table>
				   <tr class="detail-center">
					  <td width="10%">Date</td>
					  <td width="20%">Name</td>
					  <td width="20%">PetName</td>
					  <td width="20%">Phone Number</td>
					  <td width="20%">Status</td>
					  <td width="10%">Cancel</td>
				  </tr>
	            <c:choose>
	            	<c:when test="${empty myReserveList }">
		               <tr class="detail-list">
		                  <td colspan=6>
		                  	<strong>예약하신 내역이 없습니다.</strong>
		                  </td>
		               </tr>
					</c:when>
					<c:when test="${not empty myReserveList}">
						<c:forEach var="reserves" items="${myReserveList }" varStatus="res_st">
							<tr class="detail-list">
								<td>
									<c:choose>
										<c:when test="${reserves.res_state=='N' }">
											<a href="${contextPath}/mypage/myRserveDetail.do?reservation_st=${reserves.res_st }">${reserves.res_st }</a>
										</c:when>
										<c:otherwise>
											<a href="${contextPath}/mypage/myRserveDetail.do?reservation_st=${reserves.res_st }">${reserves.res_st }</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${reserves.user_name }</td>
								<td>${reserves.pet_name }</td>
								<td>${reserves.user_tel }</td>
								<td>
									<c:choose>
										<c:when test="${reserves.res_state=='N'}">
											이용 전
										</c:when>
										<c:when test="${reserves.res_state=='Y'}">
											이용 완료
										</c:when>
										<c:when test="${reserves.res_state=='C'}">
											예약 취소
										</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${reserves.res_state == 'N'}">
											<input type="image" src="${contextPath}/resources/img/close.png" onClick="fn_cancel_reserve('${reserves.res_num}')" value="예약취소"  />
										</c:when>
										<c:otherwise>
											<input type="image" src="${contextPath}/resources/img/close.png" onClick="fn_cancel_reserve('${reserves.res_num}')" value="예약취소" disabled />
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