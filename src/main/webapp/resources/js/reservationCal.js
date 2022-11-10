
window.onload = function () {

	addRow();
	
	$("#petcommentBox").on('keyup', function (event) {
        var currentString = $("#petcommentBox").val()
        $("#petcommentinfo").html(currentString.length);
    });
    
    
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
	
	
}
var dayCal;

var nowDate = new Date();
function calendarMaker(target, date) {

    var start_day;
    var end_day;

    //날짜 변수 비었는지 확인 비었다면 생성
    if (date == null || date == undefined) {
        date = new Date();
    }
    nowDate = date;

    if ($(target).length > 0) {
        var year = nowDate.getFullYear();
        var month = nowDate.getMonth() + 1;
        $(target).empty().append(assembly(year, month));
    } else {
        console.error($(target).length + "custom_calendar Target is empty!!!");
        return;
    }

    var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
    var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);


    var tag = "<tr class='weekTr'>";
    var cnt = 0;
    //빈 공백 만들어주기
    for (i = 0; i < thisMonth.getDay(); i++) {
        tag += "<td></td>";
        cnt++;
    }

    //날짜 채우기
    for (i = 1; i <= thisLastDay.getDate(); i++) {
        if (cnt % 7 == 0) { tag += "<tr class='weekTr'>"; }
        //tb로 날짜를 만들며 id를 CalDate[해당날짜]  형식으로 만든다.
        tag += "<td id='CalDate" + i + "' class='CalDate'>" + i + "</td>";
        cnt++;
        if (cnt % 7 == 0) {
            tag += "</tr>";
        }
    }

    $(target).find("#custom_set_date").append(tag);
    calMoveEvtFn();

    //년과 달을 입력받아 달력 테이블 생성
    function assembly(year, month) {
        var calendar_html_code =
            "<table class='custom_calendar_table' style='height:400px'>" +
            "<colgroup>" +
            "<col style='width:100px'/>" +
            "<col style='width:100px'/>" +
            "<col style='width:100px'/>" +
            "<col style='width:100px'/>" +
            "<col style='width:100px'/>" +
            "<col style='width:100px'/>" +
            "<col style='width:100px'/>" +
            "</colgroup>" +
            "<thead class='cal_date'>" +
            "<th><button type='button' class='prev'><</button></th>" +
            "<th colspan='5'><p><span id='year'>" + year + "</span>년 <span id='month'>" + month + "</span>월</p></th>" +
            "<th><button type='button' class='next'>></button></th>" +
            "</thead>" +
            "<thead  class='cal_week'>" +
            "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
            "</thead>" +
            "<tbody id='custom_set_date'>" +
            "</tbody>" +
            "</table>" +
            "<div class='calTip'><span >*원하시는 예약 날짜 두개를 클릭해주세요.</span></div>" +
            "<br>"
        return calendar_html_code;
    }


    function calMoveEvtFn() {

        if (new Date() < nowDate) {
            $(".custom_calendar_table").on("click", ".prev", function () {
                nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
                calendarMaker($(target), nowDate);
            });
        }
        //다음달 클릭
        $(".custom_calendar_table").on("click", ".next", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
        });
        //일자위에 마우스를 올리면 색 표시
        $(".custom_calendar_table").on("mouseover", ".CalDate", function () {
            
            //날짜가 현재날짜보다 같거나 적으면 표시  X
            var selectDay = new Date($("#year").text(), $("#month").text() - 1, $(this).text());

            if (new Date() <= selectDay  ) {
               
                $(".custom_calendar_table .select_day").removeClass("select_day");
                $(".custom_calendar_table .to_day").removeClass("to_day");
                $(this).removeClass("select_day").addClass("select_day");
               

            }else{
                $(".custom_calendar_table .select_day").removeClass("select_day");
                $(".custom_calendar_table .to_day").removeClass("to_day");
            }
        });
        //마우스 사라지면 색 표시 제거
        $(".custom_calendar_table").on("mouseout", ".CalDate", function () {
                  
                $(".custom_calendar_table .select_day").removeClass("select_day");
                $(".custom_calendar_table .to_day").removeClass("to_day");
 
        });

        //일자 선택 클릭시

        $(".custom_calendar_table").on("click", ".CalDate", function () {

            //선택한 날짜 정보
            var selectDay = new Date($("#year").text(), $("#month").text() - 1, $(this).text());//month는 0~11까지를 인식하기에 값으로 사용할때는 1을 빼줄것

            //선택한 날짜가 현재 날짜보다 미래일것
            if (new Date() <= selectDay) {

                //만약 달을 바꿔서 이전 날짜가 있다면
                if ($("#start_dayBox").text() != "0000. 00. 00." && start_day == null && $("#end_dayBox").text() == "0000. 00. 00.") {

                    //
                    start_day = new Date($("#start_dayBox").text());
                    console.log(start_day)

                    $(this).addClass("end_day");

                    end_day = new Date(selectDay);
                    console.log("end select = " + $(this).text());



                    if (start_day < end_day) {
                        console.log("start_day < end_day");

                        settingDay = new Date(start_day)
                        //선택 날짜 사이에 날짜를 지정하여 녹색으로 표시
                        for (between_day = 1; between_day < end_day.getDate(); between_day++) {
                            $("#CalDate" + between_day).addClass("between_day");
                            console.log(between_day);
                        }

                    }
					
                    $("#end_dayBox").text(end_day.toLocaleDateString());
                    $("#checkoutDate").val(end_day.toLocaleDateString());

                    dayCal = dateCal(start_day, end_day)
                    //차수출력
                    dateCal(start_day, end_day);

                } else if (start_day == null && end_day == null && $("#end_dayBox").text() == "0000. 00. 00.") {

                    $(this).addClass("start_day");
                    start_day = new Date(selectDay);
                    console.log("start select = " + $(this).text());
                    //텍스트에 날짜 정보

                    $("#start_dayBox").text(start_day.toLocaleDateString());
                    $("#checkinDate").val(start_day.toLocaleDateString());
					
                    //checkout 날짜 선택
                } else if (start_day != null && end_day == null && start_day < selectDay) {

                    end_day = new Date(selectDay);

                
                    $(this).addClass("end_day");

                    console.log(end_day);
                    console.log("end select = " + $(this).text());
                    //비교할때 숫자로 바꾸기

                    console.log("start_day < end_day");
                    settingDay = new Date(start_day)
                    //선택 날짜 사이에 날짜를 지정하여 표시
                    for (between_day = new Date(settingDay.setDate(settingDay.getDate() + 1)); between_day < end_day; between_day.setDate(between_day.getDate() + 1)) {
                        $("#CalDate" + between_day.getDate()).addClass("between_day");

                    }

                    $("#end_dayBox").text(end_day.toLocaleDateString());
                    $("#checkoutDate").val(end_day.toLocaleDateString());
                    //차수 출력
                    dateCal(start_day, end_day);

                } else {
                    //오류일 경우 초기화 
                    $(".start_day").removeClass("start_day");
                    $(".end_day").removeClass("end_day");
                    $(".one_day").removeClass("one_day");
                    $(".between_day").removeClass("between_day");
                    start_day = null;
                    end_day = null;
                    //텍스트 초기화

                    $("#start_dayBox").text("0000. 00. 00.");
                    $("#end_dayBox").text("0000. 00. 00.");
                    $("#checkinDate").val("");
                    $("#checkoutDate").val("");
                    
                    //달력 초기화 
                    // $(".custom_calendar_table").remove();
                    
                    //박수 초기화
                    $("#dateResult").text("Reservation Detail");
                    $("#dateResult").val('');

                    //결과 창 초기화
                    costTB(servicemap,false)
                    
                }

                console.log(selectDay.toLocaleDateString());
            }else{
                //미래가 아닐경우.
                alert("이후의 날짜를 선택하여 주세요");
            }

            //숙박일수 계산
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
                console.log(start_day.toLocaleDateString()+'-'+end_day.toLocaleDateString());
                $("#dateResult").text(' || '+start_day.toLocaleDateString() + ' - ' + end_day.toLocaleDateString() + '  ||  ' + btDay + '박');
                $("#dateResult").val(btDay);

                if(servicemap !=null){
                    costTB(servicemap, true)
                }
            }


        });
    }

    //최초 생성시 오늘에 해당되는 날짜를 선택
    $("#CalDate" + nowDate.getDate()).addClass("to_day");

}
