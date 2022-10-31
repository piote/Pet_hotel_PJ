
let totalData; //총 데이터 수
let dataPerPage=10; // 한 페이지에 나타날 데이터 수
let pageCount = 10; //페이징에 나타낼 페이지 수
let globalCurrentPage=1; //현재 페이지
let user_data = []; 
var grade_ck={};
var res_ck;

$(document).ready(function(){
    
    getAllList();

    //검색창에 엔터 눌렀을때
    $("#keyword").keydown(function(key) {
        //13번은 엔터키
        if (key.keyCode == 13) {
            search();
        }
    });
    
    //체크박스 눌렀을때
    $('input[type=checkbox]').change(function(){
        searchOption();
    });

    $('html').click(function(e){
    	if($(e.target).parents('.list_tb').length < 1){
        	$('.addTr').remove();
            $('.modBT').css('transform','scale(1) rotate(0deg)');
        }
    });
});

function getAllList(){
    $('.list_tb').empty();
    $.ajax({
        url: "/returnAllUser.do",
        type: "GET", 
        success : function(data){
            //총데이터 수 저장
            totalData = data.length;
            //페이지 버튼 출력
            page_num_view(totalData);

            //user_data에 받아온 데이터 저장
            user_data = [totalData];
            for(i=0;i<data.length;i++){
                user_data[i]=data[i];
            }

            //첫 화면 출력
            clickNO(globalCurrentPage);

            $(data).each(function(){});
            },
        error :function(){
            alert("request error!");
            }
    });
}

//페이지 버튼 함수
function page_num_view(totalData){
    $('.page_num').empty();
    //총 페이지 수
    var totPageNo = Math.ceil(totalData/dataPerPage);

    //페이지가 10이상일때
    if(totPageNo>pageCount){
        if(globalCurrentPage>1){
            $('.page_num').append('<li class="pageNO" onClick="pageDown('+totPageNo+')">pre</li>');
        }
        for(i=1;i<=pageCount;i++){
            var pageI =i + ((globalCurrentPage-1)*10);
            if(pageI<=totPageNo){
                $('.page_num').append('<li class="pageNO num'+pageI+'" onClick="clickNO('+pageI+')">'+pageI+'</li>');
            }
        }
        if(globalCurrentPage<=totPageNo/pageCount){
            $('.page_num').append('<li class="pageNO" onClick="pageUP('+totPageNo+')">next</li>');
        }
        
    }else{ //페이지가 10 이하일때
        for(i=1;i<=totPageNo;i++){
            $('.page_num').append('<li class="pageNO num'+i+'" onClick="clickNO('+i+')">'+i+'</li>');
        }
    }
}

//페이지 버튼 누를때 호출
function clickNO(pageNo){
    if ($('.addTr').length) {
        $('.addTr').remove();
        $('#content').css('height','0');
    }
    //버튼 선택 효과
    $('.pageNO').removeClass('select_number');
    $('.num'+pageNo).toggleClass('select_number');
    //테이블 안의 정보 비우기
    $('.list_tb').empty();

    var html = '<tr class="tb_title">'
                +'<td class="user_id">아이디</td>'
                +'<td class="user_name">이름</td>'
                +'<td class="user_grade">멤버쉽등급</td>'
                +'<td class="user_joinDate">가입일</td>'
                +'<td class="user_email">이메일</td>'
                +'<td class="user_tel">전화번호</td>'
                +'<td class="user_resState">예약여부</td>'
                +'<td class="user_mod"></td></tr>'; 
    
    var dataNo;
    if(dataPerPage<=totalData){
        if(dataPerPage*pageNo<=totalData){
            dataNo=dataPerPage;
        }else{
            dataNo=totalData%dataPerPage;
        }
    }else{
        dataNo=totalData;
    }

    for(i=0;i<dataNo;i++){
        //글 번호 지정 (페이지에 맞게)
        var listNO = i + ((pageNo-1)*10);

        var active = user_data[listNO].active;
        if(active=='N'){
            var activeState= '<span class="red_color">(탈퇴)</span>';
            html += '<tr style="background:#eee">';
        }else{
            var activeState=''
            html += '<tr d-data='+listNO+'>';
        }
        html += '<td class="user_id">'+user_data[listNO].id +'</td>';
        html += '<td class="user_name">'+activeState+' '+user_data[listNO].name+'</td>';
        html += '<td class="user_grade">'+user_data[listNO].grade+'</td>';
        
        var joinDate = user_data[listNO].joinDate;
        var joinDate_s = joinDate.substring(0, 10);
        
        html += '<td class="user_joinDate">'+joinDate_s+'</td>';
        html += '<td class="user_email">'+user_data[listNO].email+'</td>';
        html += '<td class="user_tel">'+user_data[listNO].tel+'</td>';
        html += '<td class="user_resState">'+user_data[listNO].resState+'</td>';
		html += '<td class="user_mod"><svg class="modBT" onclick="addModRow(this)" data-num='+listNO+' width="12" height="12" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M23.245 4l-11.245 14.374-11.219-14.374-.781.619 12 15.381 12-15.391-.755-.609z"/></svg></td>'
        html += '</tr>';  
    }
    $('.list_tb').append(html);
}

// next버튼 누를때
function pageUP(totPageNo){
    $('.page_num').empty();
    ++globalCurrentPage;
    page_num_view(totalData);

}

// pre버튼 누를때
function pageDown(totPageNo){
    $('.page_num').empty();
    --globalCurrentPage;
    page_num_view(totalData);
    
}

//검색
function search(){
    var searchMap = new Object();
    //input 안 정보 가지고 오기
    var search_op = $('#search_op').val();
    var keyword = $('#keyword').val();

    searchMap.search_op = search_op;
    searchMap.keyword = keyword;
    searchMap.grade_ck=grade_ck;
    if(res_ck=="X" || res_ck=="O"){
        searchMap.res_ck=res_ck;
    }

    $.ajax({
        url: "/adminSearchUser.do",
        type: "POST",
        dataType: "json",
        processData: true,
        contentType: "application/json; charset=UTF-8",
        data: JSON.stringify(searchMap),
        success : function(data){
            //총데이터 수 저장
            totalData = data.length;
            //페이지 버튼 출력
            page_num_view(totalData);

            //user_data에 받아온 데이터 저장
            user_data = [totalData];
            for(i=0;i<data.length;i++){
                user_data[i]=data[i];
            }
            //첫 화면 출력
            clickNO(globalCurrentPage);

            },
        error :function(){
            alert("request error!");
            }
    });
}

//체크박스 옵션
function searchOption(){

    //체크된 값 받아오기
    $('.grade_option input[type=checkbox]').each(function (index) {
        if($('#Normal').is(":checked")==true){
            grade_ck.Normal='Normal';
        }else{delete grade_ck.Normal;}
        if($('#Bronze').is(":checked")==true){
            grade_ck.Bronze='Bronze';
        }else{delete grade_ck.Bronze;}
        if($('#Silver').is(":checked")==true){
            grade_ck.Silver='Silver';
        }else{delete grade_ck.Silver;}
        if($('#Gold').is(":checked")==true){
            grade_ck.Gold='Gold';
        }else{delete grade_ck.Gold;}
    });
    $('.res_option input[type=checkbox]').each(function (index) {
        if(($('#res_O').is(":checked") && $('#res_X').is(":checked")) || (!$('#res_O').is(":checked") && !$('#res_X').is(":checked"))){
            res_ck= null;
        }else if($('#res_X').is(":checked")==true){
            res_ck= "X";
        }else if($('#res_O').is(":checked")==true){
            res_ck= "O";
        }else{
            res_ck= null;
        }
        
    });

    //체크박스 클릭 시 검색
    search();

}


function addModRow(obj){
    if ($('.addTr').length) {
        if($(obj).data('num')!=$('.addTr').data('num')){
            $('.addTr').remove();
            
        }
        $('.addTr').remove();
        $(obj).removeClass('modBT_push');
        $(obj).css('transform','scale(1) rotate(0deg)');
        
    }else{
        $(obj).css('transform','scale(1) rotate(180deg)');
        var num = $(obj).data('num');
        console.log(num)

        var birth = user_data[num].birth;
        var birth_s = birth.substring(0, 10);

        var message = user_data[num].message;
        if(message=='Y'){
            var message_s = '&nbsp;&nbsp;&nbsp;<input type="radio" name="message" value="Y" checked="checked" >&nbsp;Y &nbsp;&nbsp;<input type="radio" name="message" value="N">&nbsp;N</span>'
        }else{
            var message_s = '&nbsp;&nbsp;&nbsp;<input type="radio" name="message" value="Y" >&nbsp;Y &nbsp;&nbsp;<input type="radio" name="message" value="N" checked="checked">&nbsp;N</span>'
        }
        grade=user_data[num].grade;
        if(grade=='Normal'){
            var crown_color='#c2dcff'
        }else if(grade=='Bronze'){
            var crown_color='#ed9d5d'
        }else if(grade=='Silver'){
            var crown_color='#ddd'
        }else if(grade=='Gold'){
            var crown_color='#efc75e'
        }

        var html = '<tr class="addTr" data-num='+num+'>'+
        '<form action="#">'+
            '<td colspan="2">'+
                '<span class="info_box info_id">아이디 : <input type="text" name="id" id="id" value= "'+user_data[num].id+'"></span>'+
                '<span class="info_box info_pw">비밀번호 : <input type="text" name="pw" id="pw" value= "'+user_data[num].pw+'"></span>'+
                '<span class="info_box info_name">이름 : <input type="text" name="name" id="name" value= "'+user_data[num].name+'"></span>'+
                '<span class="info_box info_id">생년월일 : <input type="date" name="birth" id="birth" value= "'+birth_s+'"></span>'+
            '</td>'+
            '<td colspan="3">'+
                '<span class="info_box info_pw">이메일 : <input type="text" name="email" id="email" value="'+user_data[num].email+'"></span>'+
                '<span class="info_box info_name">휴대전화 : <input type="text" name="tel" id="tel" value="'+user_data[num].tel+'"></span>'+
                '<span class="info_box info_name">비상전화 : <input type="text" name="tel_sub" id="tel_sub"'+user_data[num].sub_tel+'"></span>'+
                '<span class="info_box info_name">메세지 수신여부 : '+message_s+
            '</td>'+
            '<td colspan="2">'+
                '<span class="info_box info_grand">멤버쉽 등급 :&nbsp;<svg class="crown" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill:'+crown_color+'"><path d="M3 16l-3-10 7.104 4 4.896-8 4.896 8 7.104-4-3 10h-18zm0 2v4h18v-4h-18z"/></svg>&nbsp; '+user_data[num].grade+'</span>'+
                '<input type="hidden" name="">'+
                '<button type="button" id="">수정</button>'+
                '<button type="button" id="">탈퇴</button>'+
            '</td></form></tr>';
        $(obj).parent().parent().after(html);
    }
}
