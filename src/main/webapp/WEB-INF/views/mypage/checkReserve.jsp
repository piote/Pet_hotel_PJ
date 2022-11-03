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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
	<link rel="stylesheet" href="sweetalert2.min.css">
	
	<!-- 예약 수정 -->
	<link rel="stylesheet" href="${contextPath}/resources/css/calendar.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/reservationUpdate.css">
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    
    <script type="text/javascript" src="${contextPath}/resources/js/reservationCalUpdate.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/reservationUpdate.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/reservationUpdateAjaxP.js"></script>
    <!-- 예약 수정 end-->
    
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
    	Swal.fire({
            title: '정말로 예약을 취소 하시겠습니까?',
            text: "예약을 취소하시면 다시 되돌릴 수 없습니다.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: 'black',
            cancelButtonColor: 'lightgray',
            confirmButtonText: 'Yes'
            }).then((result) => {
            if (result.isConfirmed) {
        		var formObj=document.createElement("form");
        		var i_reserve_num = document.createElement("input"); ;

        		Swal.fire('예약 취소 완료.',)
        	    
        	    i_reserve_num.type = "hidden";
        	    i_reserve_num.name = "res_num";
        	    i_reserve_num.value = res_num;
        		
        	    formObj.appendChild(i_reserve_num);
        	    document.body.appendChild(formObj); 
        	    formObj.method = "post";
        	    formObj.action ="${contextPath}/mypage/cancelMyReserve.do";
			    setTimeout(() => formObj.submit(), 800);
            }
        })
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
		                  <td colspan=8>
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
											<a onclick="popup(${reserves.res_num })"<%-- href="${contextPath}/reservationUpdate.do?reservation_num=${reserves.res_num }" --%>>
												<img src="${contextPath}/resources/img/revision.png"/>
											</a>
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
	<!--예약 업뎃  -->
	<div id="lay_pop">
			<div id="pop_content">
			<h1 id="asd">예약 변경</h1>
			<br>
				<ul>
		        	<li id="checkinBox" class="reservationBox">
		            	<div id="checkin" class="reservationtext reservationtext1">| CHECK IN |</div>
		            	<div id="checkin2" class="reservationtext reservationtext2">
		            		<span id="start_dayBox">0000. 00. 00.</span>
		            		<input type="hidden" name="checkinDate" id="checkinDate">
		            	</div>
		            </li>
		            <li id="checkoutBox" class="reservationBox">
		            	<div id="checkout" class="reservationtext reservationtext1">| CHECK OUT |</div>
		            	<div id="checkout2" class="reservationtext reservationtext2">
		            		<span id="end_dayBox">0000. 00. 00.</span>
		            		<input type="hidden" name="checkoutDate" id="checkoutDate">
		                </div>
		            </li>
		        </ul>
		    </div>
		    <br>
		    <div>
		    	<table id="ch_pet_table" align="center" width="79%">
		    		<tr align="center" bgcolor="#e5e4e2" height="40px">
		    			<td><b>Pet Name</b></td>
		    			<td><b>Pet sex</b></td>
				        <td><b>Room</b></td>
				        <td><b>Beauty</b></td>
				        <td><b>Spa</b></td>
				        <td><b>이용여부</b></td>
				    </tr>
				<div id="calendarForm"></div>
				</table>
			</div>
			
			<div id="btn_pet1">
				<input type='button' value='추가하기' id="btn_pet1_1" onclick='addRow()' />
			</div>
			<br><br>
			
            <div class="paymentinfo1">
            <table id="pet_table1" align="center" width="79%">
                <tr align="center" bgcolor="white" height="40px">
                    <td colspan="10" align="center" bgcolor="#e5e4e2"><b id="dateResult">Reservation Detail</b></td>
                </tr>
                <tr align="center" bgcolor="white">
                    <td rowspan="6" align="center" bgcolor="white"><b>Room</b></td>
                    <td rowspan="2" align="center" bgcolor="white">Deluxe<br><div class="dogname">(소형견)</div></td>              
                    <td id="S_R" rowspan="2" align="center" bgcolor="white">0 원</td>
                    <td rowspan="6" align="center" bgcolor="white"><b>Beauty</b></td>
                    <td rowspan="3" align="center" bgcolor="white">Clipping</td>
                    <td>소형견</td>
                    <td id="S_BC">0 원</td>
                    <td rowspan="6" align="center" bgcolor="white"><b>Spa</b></td>
                    <td rowspan="2" align="center" bgcolor="white">소형견</td>
                    <td id="S_S" rowspan="2" align="center" bgcolor="white">0 원</td>
                </tr>
                <tr align="center" bgcolor="white">
                    <td>중형견</td>
                    <td id="M_BC">0 원</td>
                </tr>
                <tr align="center" bgcolor="white">
                    <td rowspan="2" align="center" bgcolor="white">Suite<br><div class="dogname">(중형견)</div></td>
                    <td id="M_R" rowspan="2" align="center" bgcolor="white">0 원</td>
                    <td>대형견</td>
                    <td id="L_BC">0 원</td>
                    <td rowspan="2" align="center" bgcolor="white">중형견</td>
                    <td  id="M_S" rowspan="2" align="center" bgcolor="white">0 원</td>
                </tr>
                <tr align="center" bgcolor="white">
                    <td rowspan="3" align="center" bgcolor="white">Scissoring</td>
                    <td>소형견</td>
                    <td id="S_BS">0 원</td>
                </tr>
                <tr align="center" bgcolor="white">
                    <td rowspan="2" align="center" bgcolor="white">Superior<br><div class="dogname">(대형견)</div></td>
                    <td id="L_R" rowspan="2" align="center" bgcolor="white">0 원</td>
                    <td>중형견</td>
                    <td id="M_BS">0 원</td>
                    <td rowspan="2" align="center" bgcolor="white">대형견</td>
                    <td id="L_S" rowspan="2" align="center" bgcolor="white">0 원</td>
                </tr>
                <tr align="center" bgcolor="white">
                    <td>대형견</td>
                    <td id="L_BS">0 원</td>
                </tr>
                <tr align="center" bgcolor="white" height="40px">                  
                    <td colspan="10" bgcolor="#e5e4e2">        
                   		<img src="${contextPath}" width="30px" height="30px" id="bronzeimg">
                   		<b class="membership"></b>
                        <input id="membership" type="hidden" value="">
                        <b class="totalpayment"> Total Payment : </b>
                        <b class="totalcost">0 원</b>
                        <input type="hidden" name="totalcost" id="totalcost" />
                    </td>
                </tr>
                <td rowspan="6" align="center" bgcolor="white"><b></b></td>
                <td rowspan="2" align="center" bgcolor="white"></td>
                <td rowspan="2" align="center" bgcolor="white"></td>
                <td rowspan="6" align="center" bgcolor="white"><b></b></td>
                <td rowspan="3" align="center" bgcolor="white"></td>
                <td></td>
                <td></td>
            </table>
        </div>
		
        <div class="btn_pet2">
        	<input type='button' value='가격안내' id="btn_pet2_3" onclick="addcost()" />
        </div>

	    <div class="paymentinfo2">
	        <table id="pet_table2" align="center">
	            <tr align="center" bgcolor="white" height="40px">
	                <td colspan="10" align="center" bgcolor="#e5e4e2"><b>Payment Detail</b></td>
	            </tr>
	            <tr align="center" bgcolor="white">
	                <td rowspan="6" align="center" bgcolor="white"><b>Room</b></td>
	                <td rowspan="2" align="center" bgcolor="white">Deluxe<br><div class="dogname">(소형견)</div></td>
	                <td rowspan="2" align="center" bgcolor="white">35,000 원</td>
	                <td rowspan="6" align="center" bgcolor="white"><b>Beauty</b></td>
	                <td rowspan="3" align="center" bgcolor="white">Clipping</td>
	                <td>소형견</td>
	                <td>35,000 원</td>
	                <td rowspan="6" align="center" bgcolor="white"><b>Spa</b></td>
	                <td rowspan="2" align="center" bgcolor="white">소형견</td>
	                <td rowspan="2" align="center" bgcolor="white">50,000 원</td>
	
	            </tr>
	            <tr align="center" bgcolor="white">
	
	                <td>중형견</td>
	                <td>45,000 원</td>
	            </tr>
	            <tr align="center" bgcolor="white">
	
	                <td rowspan="2" align="center" bgcolor="white">Suite<br><div class="dogname">(중형견)</div></td>
	                <td rowspan="2" align="center" bgcolor="white">45,000 원</td>
	                <td>대형견</td>
	                <td>60,000 원</td>
	                <td rowspan="2" align="center" bgcolor="white">중형견</td>
	                <td rowspan="2" align="center" bgcolor="white">80,000 원</td>
	            </tr>
	            <tr align="center" bgcolor="white">
	
	                <td rowspan="3" align="center" bgcolor="white">Scissoring</td>
	                <td>소형견</td>
	                <td>70,000 원</td>
	            </tr>
	            <tr align="center" bgcolor="white">
	
	                <td rowspan="2" align="center" bgcolor="white">Superior<br><div class="dogname">(대형견)</div></td>
	                <td rowspan="2" align="center" bgcolor="white">55,000 원</td>
	                <td>중형견</td>
	                <td>80,000 원</td>
	                <td rowspan="2" align="center" bgcolor="white">대형견</td>
	                <td rowspan="2" align="center" bgcolor="white">120,000 원</td>
	            </tr>
	            <tr align="center" bgcolor="white">
	
	                <td>대형견</td>
	                <td>100,000 원</td>
	            </tr>
	        </table>
	    </div>
	    
	    <div class="btn_pet2">
	    	<input type='button' value='요청사항' id="btn_pet2_1" onclick="addtext()" />	                               		
	    	<a href="javascript:;" id="pop_end1" onclick="layerClose('lay_pop','all_body')">완료</a>
	    </div>

	    <div class="petcomment">
	   	 	<textarea id="petcommentBox" name="petcomment" spellcheck="false" maxlength="500" placeholder="요청사항을 적어주세요."></textarea>
	   	 	<br>
	   	 	<div id="petcommentLengh"><span id="petcommentinfo">0</span>/500</div>
	        <!-- <input type="text" name="petcomment"> -->
        </div>
		<br><br>
		</div>
		<!--예약 업뎃  -->
</body>
</html>