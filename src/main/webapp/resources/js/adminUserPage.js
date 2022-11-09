
let totalData; //총 데이터 수
let dataPerPage=10; // 한 페이지에 나타날 데이터 수
let pageCount = 10; //페이징에 나타낼 페이지 수
let globalCurrentPage=1; //현재 페이지
let user_data = []; 
var grade_ck={};
var res_ck;
let contextPath;

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
            deleteTr();
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
    if ($('#addTr').length) {
        $('#addTr').remove();
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

// 상세보기 row 추가
function addModRow(obj){
    // $('#addTr').length로 #addTr의 유무확인
    if ($('#addTr').length) {
        // 다른 화살표 클릭했을때
        if($(obj).data('num')!=$('#addTr').data('num')){
            $('#addTr').remove();
            setTimeout(function(){
                addTr(obj);
            },100)
            
        }else{
            deleteTr();
        }
    }else{
        addTr(obj);
    }
}

// tr을 addTr로 먼저 생성 후 modHtml로 내용추가

function addTr(obj){
    $(obj).css('transform','scale(1) rotate(180deg)');
    var num = $(obj).data('num');
    var html = '<tr id="addTr" data-num='+num+'></tr>'
    // 버튼(svg)기준 부모의 부모는 소속된 tr > tr 다음에 추가
    $(obj).parent().parent().after(html);
    $('#addTr').height(300);
    setTimeout(function(){ 
        modHtml(obj);
        $('#addTr td').animate({opacity: "1"}, 200);
    },100)
}
function deleteTr(){
    $('#addTr').height(0);
    $('#addTr td').animate({opacity: "0"}, 200);
    $('.modBT').css('transform','scale(1) rotate(0deg)');
    setTimeout(function(){ 
        $('#addTr').empty();
    },100)
    setTimeout(function(){
        $('#addTr').remove();
    },400)
    
}


// 한줄 생성 함수
function modHtml(obj){
    getContextPath()
        // 눌러진 화살표의 번호 받아오기
        var num = $(obj).data('num');

        var birth = user_data[num].birth;
        var birth_s = birth.substring(0, 10);

        //캐시로 이미지가 안변하는것을 방지하기위해
        //의미없는 숫자를 붙이려고 선언한 변수
        var tmpDate = new Date();

        var message = user_data[num].message;
        if(message.substring(0, 1)=='Y'){
            var message_s = '&nbsp;&nbsp;&nbsp;<input type="radio" name="message" value="Y" checked="checked" >&nbsp;Y &nbsp;&nbsp;<input type="radio" name="message" value="N">&nbsp;N</span>'
        }else{
            var message_s = '&nbsp;&nbsp;&nbsp;<input type="radio" name="message" value="Y" >&nbsp;Y &nbsp;&nbsp;<input type="radio" name="message" value="N" checked="checked">&nbsp;N</span>'
        }

        if (user_data[num].tel_sub==null){
            var tel_sub_s = '';
        }else{
            var tel_sub_s =user_data[num].tel_sub;
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
        var html =
            '<td colspan="2">'+
                '<div class="profil">'+
                    '<img id="preview" src="'+contextPath+'/resources/user/user_image/'+user_data[num].img_name+"?"+tmpDate.getTime()+'" alt="'+user_data[num].id+'profil" onerror="this.src=\''+contextPath+'/resources/img/user.png\';">'+
                '</div>'+
                '<input id="profil_img_name" type="file" name="img_name" onchange="readURL(this);">'+
                '<input id="old_img_name" type="hidden" name="old_img_name" value="'+user_data[num].img_name+'">'+
            	'<div class="bt_removeImg" onclick="removeImg()" >이미지삭제</div>'+
            '</td>'+
            '<td colspan="2">'+
                '<span class="info_box info_id">아이디 : <input type="text" name="id" id="id" value= "'+user_data[num].id+'" readonly></span>'+
                '<span class="info_box info_pw">비밀번호 : <input type="text" name="pw" id="pw" value= "'+user_data[num].pw+'"></span>'+
                '<span class="info_box info_name">이름 : <input type="text" name="name" id="name" value= "'+user_data[num].name+'"></span>'+
                '<span class="info_box info_birth">생년월일 : <input type="date" name="birth_string" id="birth" value= "'+birth_s+'"></span>'+
            '</td>'+
            '<td colspan="2">'+
                '<span class="info_box info_email">이메일 : <input type="text" name="email" id="email" value="'+user_data[num].email+'"></span>'+
                '<span class="info_box info_tel">휴대전화 : <input type="text" name="tel" id="tel" value="'+user_data[num].tel+'" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" oninput="autoHyphen2(this)"  maxlength="13" ></span>'+
                '<span class="info_box info_tel_sub">비상전화 : <input type="text" name="tel_sub" id="tel_sub" value="'+tel_sub_s+'" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" oninput="autoHyphen2(this)"  maxlength="13" ></span>'+
                '<span class="info_box info_message">메세지 수신여부 : '+message_s+
            '</td>'+
            '<td colspan="1">'+
                '<span class="info_box info_grand">멤버쉽 등급 :&nbsp;<svg class="crown" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill:'+crown_color+'"><path d="M3 16l-3-10 7.104 4 4.896-8 4.896 8 7.104-4-3 10h-18zm0 2v4h18v-4h-18z"/></svg>&nbsp; '+user_data[num].grade+'</span>';
                
            var active = user_data[num].active;
            if(active=='Y'){
                html +='<button type="button" onclick="modUser()">수정</button>'+
                '<button type="button" class="red_color" onclick="userActive('+num+')">탈퇴</button>'+
                '</td>';
            }else{
                html += '<button type="button" class="blue_color" onclick="userActive('+num+')">활성화</button>'+
                '</td>';
            }
           
            $('#addTr').append(html);
}

function modUser(){
    var result = confirm("수정하시겠습니까?");
    if(result){
            var queryString = $("form[name=modUserForm]").serialize() ;
            var formData = new FormData($("form[name=modUserForm]")[0]);
            console.log(queryString +' '+ $('form[name=modUserForm]'))
            $.ajax({
                type : 'post',
                url : '/adminModUser.do',
                enctype: 'multipart/form-data',
                data : formData,
                dataType : 'json',
                processData: false,
	            contentType: false,
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
                clickNO(globalCurrentPage);

                },
            error :function(){
                alert("request error!");
                }
        });
    }
}

function userActive(num){
    var id = user_data[num].id;
    var active = user_data[num].active;

    if(active=='Y'){
        var result = confirm("정말 탈퇴처리 하시겠습니까?");
    }else{
        var result = confirm("회원 활성화처리 하시겠습니까?");
    }
    
    if(result){
            console.log(id)
            $.ajax({
                type : 'post',
                url : '/adminActiveUser.do',
                data : {"id":id, "active":active},
                dataType : 'json',
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
                clickNO(globalCurrentPage);

                },
            error :function(){
                alert("request error!");
                }
            });
    }
}

const autoHyphen2 = (target) => {
    target.value = target.value
      .replace(/[^0-9]/g, '')
     .replace(/^(\d{0,3})(\d{3,4})(\d{4,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
   }

function getContextPath() {
    contextPath = $('#contextPath').val();
    console.log($('#contextPath').val());
    console.log(contextPath);
}

//프로필 이미지 미리보기+확장자체크
function readURL(input) {
    //파일이 있으면 실행
    if (input.files && input.files[0]) {
        //파일경로를 (input[type=file]의 값) fileName에 저장
        var fileName = $("#profil_img_name").val();
        var reader = new FileReader();

        //경로를 뺀 파일이름이 저장
        var realfileName = fileName.split('\\').pop().toLowerCase();
        
        //checkFileName 실행 후 값이 true이면 실행
        if(checkFileName(realfileName)){
            reader.onload = function (e) { 
                $('#preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }else{
            //checkFileName false면 받아온 파일 값 지우기
            $("#profil_img_name").val("");
        }
        
    }
} 

//이미 등록된 프로필 삭제
function removeImg(){
    $("#old_img_name").val('');
    $("#preview").attr('src','');
}

function checkFileName(str){
 
    //확장자 체크
    var ext =  str.split('.').pop().toLowerCase();
    if($.inArray(ext, ['bmp', 'jpg', 'png', 'jpeg', 'gif']) == -1) {
        alert(ext+'파일은 업로드 하실 수 없습니다.');
        return false;
    }
 
    //파일명 길이 체크
    if(str.length>=70){
        alert('파일명이 너무 길어 업로드 하실 수 없습니다.');
        return false;
    }
    return true;

}