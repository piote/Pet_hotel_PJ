<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	
	isELIgnored="false"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set  var="myReserveList"  value="${myReserveMap.myReserveList}" />
<c:set  var="totReserves"  value="${myReserveMap.totReserves}" />
<c:set  var="section"  value="${myReserveMap.section}" />
<c:set  var="pageNum"  value="${myReserveMap.pageNum}" />
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
			showButtonPanel: false,
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
// 		 	maxDate: 1,
		 	onClose: function(selectedDate){
                var eleId = $(this).attr("id");
                var optionName = "";

                if(eleId.indexOf("StartDate") > 0) {
                    eleId = eleId.replace("StartDate", "EndDate");
                    optionName = "minDate";
                } else {
                    eleId = eleId.replace("EndDate", "StartDate");
                    optionName = "maxDate";
                }

                $("#"+eleId).datepicker( "option", optionName, selectedDate );        
                $(".searchDate").find(".chkbox2").removeClass("on"); 
		 	}
		});
		
// 		$('#datepicker').datepicker('setDate', 'today');
		
		$(function(){
			$.datepicker.setDefaults({
				dateFormat: "yy-mm-dd",
			 	showOtherMonths: true,
			 	showMonthAfterYear: true,
				showButtonPanel: false,
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
// 			 	maxDate: 1,
			 	onClose: function(selectedDate){
                    var eleId = $(this).attr("id");
                    var optionName = "";

                    if(eleId.indexOf("StartDate") > 0) {
                        eleId = eleId.replace("StartDate", "EndDate");
                        optionName = "minDate";
                    } else {
                        eleId = eleId.replace("EndDate", "StartDate");
                        optionName = "maxDate";
                    }

                    $("#"+eleId).datepicker( "option", optionName, selectedDate );        
                    $(".searchDate").find(".chkbox2").removeClass("on"); 
			 	}
			});
			$("#startDate").datepicker();
			$("#endDate").datepicker();
            $(".dateclick").dateclick();
            $(".searchDate").schDate(); 
// 			$("#startDate").datepicker('setDate', 'today');
// 			$("#endDate").datepicker('setDate', '+1D');
		});
		
		jQuery.fn.schDate = function(){
           var $obj = $(this);
           var $chk = $obj.find("input[type=radio]");
           $chk.click(function(){                
               $('input:not(:checked)').parent(".chkbox2").removeClass("on");
               $('input:checked').parent(".chkbox2").addClass("on");                    
           });
       };

       // DateClick
       jQuery.fn.dateclick = function(){
           var $obj = $(this);
           $obj.click(function(){
               $(this).parent().find("input").focus();
           });
           
       }    
       
       function setSearchDate(start){

           var num = start.substring(0,1);
           var str = start.substring(1,2);

           var today = new Date();

           //var year = today.getFullYear();
           //var month = today.getMonth() + 1;
           //var day = today.getDate();
           
           var endDate = $.datepicker.formatDate('yy-mm-dd', today);
           $('#endDate').val(endDate);
           
           if(str == 'd'){
               today.setDate(today.getDate() - num);
           }else if (str == 'w'){
               today.setDate(today.getDate() - (num*7));
           }else if (str == 'm'){
               today.setMonth(today.getMonth() - num);
               today.setDate(today.getDate() + 1);
           }

           var startDate = $.datepicker.formatDate('yy-mm-dd', today);
           $('#startDate').val(startDate);
                   
           // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
           $("#endDate").datepicker( "option", "minDate", startDate );
           
           // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
           $("#startDate").datepicker( "option", "maxDate", endDate );
			goSearch();
       }
			
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
					<div>
                        <ul class="searchDate">
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                                    <label for="dateType1">당일</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType2" onclick="setSearchDate('3d')"/>
                                    <label for="dateType2">3일</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('1w')"/>
                                    <label for="dateType3">1주</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
                                    <label for="dateType5">1개월</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
                                    <label for="dateType6">3개월</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
                                    <label for="dateType7">6개월</label>
                                </span>
                            </li>
                            <li>
								<span>
									<input type="reset" class="reset"/>
								</span>
                            </li>
                        </ul>
                    </div>
					<div id="calendar"> 결제일 :
						<input class="datepicker" type="text" name="startDate" id="startDate">
						<input class="datepicker" type="text" name="endDate" id="endDate">
					</div>
					<div id="search_text">
						<select name="colName" id="colName">
							<option value="">검색</option>
							<option value="pet_name">펫이름</option>
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
					  <td width="5%">No</td>
					  <td width="15%">PayMent Date</td>
					  <td width="10%">PetName</td>
					  <td width="15%">Reserved Date</td>
					  <td width="15%">End Date</td>
					  <td width="15%">Status</td>
					  <td width="10%">Update</td>
					  <td width="10%">Cancel</td>
				  </tr>
	            <c:choose>
	            	<c:when test="${empty myReserveList }">
		               <tr class="detail-list">
		                  <td colspan=7>
		                  	<strong>예약하신 내역이 없습니다.</strong>
		                  </td>
		               </tr>
					</c:when>
					<c:when test="${not empty myReserveList}">
						<c:forEach var="reserves" items="${myReserveList }" varStatus="res_num">
							<tr class="detail-list">
				              	<td>${res_num.count}</td>
								<td>${reserves.payTime }</td>
								<td>${reserves.pet_name }</td>
								<td>${reserves.res_st }</td>
								<td>${reserves.res_end }</td>
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
											<a href="${contextPath}/reservationUpdate.do?reservation_num=${reserves.res_num }">수정</a>
										</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${reserves.res_state == 'N'}">
											<input type="image" src="${contextPath}/resources/img/close.png" onClick="fn_cancel_reserve('${reserves.res_num}')" value="예약취소"  />
										</c:when>
										<c:otherwise>
<%-- 											<input type="image" src="${contextPath}/resources/img/close.png" onClick="fn_cancel_reserve('${reserves.res_num}')" value="예약취소" disabled /> --%>
										</c:otherwise>
									</c:choose>
							    </td>	
							</tr>
						</c:forEach>
					</c:when>
               </c:choose>
				</table>
				
				<div class="page">
					<c:if test="${not empty totReserves }" >
						<c:choose>
							<c:when test="${totReserves >100 }">  <!-- 글 개수가 100 초과인경우 -->
								<c:forEach   var="page" begin="1" end="10" step="1" >
									<c:if test="${section >1 && page==1 }">
										<a class="no-uline" href="${contextPath }/mypage/checkReserve.do?section=${section-1}&pageNum=${(section-1)*10 +1 }&startDate=${startDate}&endDate=${endDate}&colName=${colName}&searchWord=${searchWord}">&nbsp; pre </a>
									</c:if>
									<a class="no-uline" href="${contextPath }/mypage/checkReserve.do?section=${section}&pageNum=${page}&startDate=${startDate}&endDate=${endDate}&colName=${colName}&searchWord=${searchWord}">${(section-1)*10 +page } </a>
									<c:if test="${page ==10 }">
										<a class="no-uline" href="${contextPath }/mypage/checkReserve.do?section=${section+1}&pageNum=${section*10+1}&startDate=${startDate}&endDate=${endDate}&colName=${colName}&searchWord=${searchWord}">&nbsp; next</a>
									</c:if>
								</c:forEach>
							</c:when>
							<c:when test="${totReserves ==100 }" >  <!--등록된 글 개수가 100개인경우  -->
								<c:forEach   var="page" begin="1" end="10" step="1" >
									<a class="no-uline"  href="#">${page } </a>
								</c:forEach>
							</c:when>
							
							<c:when test="${totReserves<100 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
								<c:forEach   var="page" begin="1" end="${totReserves/10 +1}" step="1" >
									<c:choose>
										<c:when test="${page==pageNum }">
											<a class="sel-page"  href="${contextPath }/mypage/checkReserve.do?section=${section}&pageNum=${page}&startDate=${startDate}&endDate=${endDate}&colName=${colName}&searchWord=${searchWord}">${page } </a>
										</c:when>
										<c:otherwise>
											<a class="no-uline"  href="${contextPath }/mypage/checkReserve.do?section=${section}&pageNum=${page}&startDate=${startDate}&endDate=${endDate}&colName=${colName}&searchWord=${searchWord}">${page } </a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
						</c:choose>
					</c:if>
				</div>    
			 </div>
		</div>
	</div>
</body>
</html>