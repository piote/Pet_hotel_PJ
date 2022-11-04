function reservationSubmit(obj){
			
			if($("#checkoutDate").val() != null && $("#checkoutDate").val() != ""){//날짜가 있으면
				
				if(totalTableNum != 0){//테이블이 존재하면
						
					if($("#totalcost").val()!="0" && $("#totalcost").val()!=null){//가격이 있으면
						
						obj.submit();
					}else{
						alert("맡기실 아이를 선택해주세요.");	
					}
				}else{
					alert("맡기실 아이를 추가해주세요.");
				}
			}else{
				alert("날짜를 선택해주세요.");
			}
			
	 	}
		
    	function pushLayer(){
    		var $width=parseInt($("#lay_pop").css("width"));
    		var $height=parseInt($("#lay_pop").css("height"));
    		var left=($(window).width()-$width)/2;
    		var sctop=$(window).scrollTop()*2;
    		var top=($(window).height()-$height+sctop)/2;
    		var height=document.getElementsByTagName("body")[0].scrollHeight;
    		$("#lay_pop").css("left",left);
    		$("#lay_pop").css("top",top);
    		$("#lay_pop").css("display","block");
    		$("#lay_pop").css("z-index","555");
    		$("#all_body").css("display","block");
    		$("#all_body").css("width",$(window).width());
    		$("#all_body").css("height",height);
    		$("#all_body").css("opacity","0.5");
    		

    	}
    	function popup(resnum){
    		pushLayer();
    		reserView(resnum);
    		
    	}
    	
    	function layerClose(lay1,lay2){
    		$("#"+lay1).css("display","none");
    		$("#"+lay2).css("display","none");
    		resetRow();
    		
    	}
    	
    	
    	
    	
    	function reservationSubmit(){
    		var form = $("#reservationUpdateForm");
			if($("#checkoutDate").val() != null && $("#checkoutDate").val() != ""){//날짜가 있으면
				
				if(totalTableNum != 0){//테이블이 존재하면
						
					if($("#totalcost").val()!="0" && $("#totalcost").val()!=null){//가격이 있으면
						
						form.submit();
					}else{
						alert("맡기실 아이를 선택해주세요.");	
						return false;
					}
				}else{
					alert("맡기실 아이를 추가해주세요.");
					return false;
				}
			}else{
				alert("날짜를 선택해주세요.");
				return false;
			}
    		
     	}
    	
    	//조회했을때 날짜가 수정가능한지 체크
    	//체크인 날짜가 현재보다 미래일경우 수정가능하게, 아닐경우  달력 수정 금지
    	function viewDayCheck(res_st_data){
    		var now = new Date();
    		if(now <= res_st_data){
    			$("#checkin2").on("click", function () {
    		        $("#start_dayBox").text("0000. 00. 00.");
    		        $("#end_dayBox").text("0000. 00. 00.");
    		        
    		        (function () {
    		            calendarMaker($("#calendarForm"), new Date());
    		        })();
    		    });
    			$("#checkout2").on("click", function () {
    		        $("#start_dayBox").text("0000. 00. 00.");
    		        $("#end_dayBox").text("0000. 00. 00.");

    		        (function () {
    		            calendarMaker($("#calendarForm"), new Date());
    		        })();
    		    });
    			$(".custom_calendar_table").remove();
    		}else{
    			//미래가 아닐경우 이벤트 삭제
    			$("#checkin2").off("click"); 
    			$("#checkout2").off("click"); 
    		}
    	}
    	
    	function reserView(resnum){
    		var reserNum = resnum;
    		$.ajax({
    			url:'/SearchReservationNum.do',
    			method:'post',
    			data:{
    				"reserNum": reserNum
    			},
    			type:'post',
    			async:true,
    			dataType:'json',
    			
    			success:function(data){
    				console.log(data);
    				console.log(data.petservice.length);
					//초기화
    				$(".tbnum").remove()//html 삭제
    				resetRow();
    				
    				
    				//html에 적용
    				//예약번호
    				$("#resNum").val(reserNum);
    				//체크인
    				var res_st_data = new Date(data.reservation.res_st);
    				$("#start_dayBox").text(res_st_data.toLocaleDateString());
    				$("#checkinDate").val(res_st_data.toLocaleDateString());

    				//체크아웃
    				var res_end_data = new Date(data.reservation.res_end);
    				$("#end_dayBox").text(res_end_data.toLocaleDateString());
    				$("#checkoutDate").val(res_end_data.toLocaleDateString());
    				
    				//수정가능한 날짜 체크
    				viewDayCheck(res_st_data);
    				
    				//숙박일 계산
    				dateCal(res_st_data,res_end_data);
    				
    				//가격
    				$("#totalcost").val(data.reservation.totalCost);
    				
    				//추가사항 
    				addtext();
    				$("#petcommentBox").text(data.reservation.res_comment);
    		        $("#petcommentinfo").html($("#petcommentBox").val().length);
    				
    				//펫 테이블
    				for(var i = 0; i<data.petservice.length; i++){
    					addRow();
    					$("#Pet_Name"+i).val(data.petservice[i].pet_name);//html 적용
    					petmap.set("Pet_Name"+i, data.petservice[i].pet_name);//petmap 값 변동 인식
    					
    					$("#Pet_Sex"+i).val(data.petservice[i].pet_gender);
    					petmap.set("Pet_Sex"+i, data.petservice[i].pet_gender);
    					
    					$("#Pet_Room"+i).val(data.petservice[i].room_grade);
    					petmap.set("Pet_Room"+i, data.petservice[i].room_grade);
    					
    					$("#pet_Beauty"+i).val(data.petservice[i].service_beauty);
    					petmap.set("pet_Beauty"+i, data.petservice[i].service_beauty);
    					
    					//체크박스 스파
    					var spa = false;
    					if(data.petservice[i].service_spa == "Y    "){
    						$("#pet_Spa"+i).prop("checked", true);
    						petmap.set("pet_Spa"+i, true);
    						
    						spa = true;
    				        
    						if($("#pet_Spa"+i).prop("checked")){
    							$("#pet_Spa"+i+'_hidden').attr("disabled", true);
    						}else{
    							$("#pet_Spa"+i+'_hidden').attr("disabled", false);
    						}
    					}
    					//map
    					var petservice = [data.petservice[i].pet_name, data.petservice[i].pet_gender, data.petservice[i].room_grade, data.petservice[i].service_beauty, spa, i];
    				    console.log(petservice);
    				    servicemap.set('service' + i, petservice);
    				    console.log(servicemap);
                        
    				}
    				costTB(servicemap,true);
    			
    			},
    			
    			error:function(){
    				console.log("이런");
    			}
    		});
    	}