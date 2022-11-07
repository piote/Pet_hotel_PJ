//달력
		$( "#datepicker" ).datepicker({
		 	dateFormat: "yy-mm-dd",
		 	showOtherMonths: true,
		 	showMonthAfterYear: true,
			showButtonPanel: false,
			changeMonth: true,
			changeYear: true,
			showOn: "both",
			buttonImage: "/resources/img/cale.png",
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
				buttonImage: "/resources/img/cale.png",
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
		
// 기간 별 조회		
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
       
//서치 기능			
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
	
// 취소 기능
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
        	    formObj.action ="/mypage/cancelMyReserve.do";
			    setTimeout(() => formObj.submit(), 800);
            }
        })
    }
