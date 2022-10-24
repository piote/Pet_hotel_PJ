
let totalData; //총 데이터 수
let dataPerPage=10; // 한 페이지에 나타날 데이터 수
let pageCount = 10; //페이징에 나타낼 페이지 수
let globalCurrentPage=1; //현재 페이지
let user_data = []; 

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
        getAllList();
        searchOption();
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
                +'<td class="user_resState">예약여부</td></tr>'; 
    
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
        html += '<tr>';
        html += '<td class="user_id">'+ user_data[listNO].id +'</td>';
        html += '<td class="user_name">'+user_data[listNO].name+'</td>';
        html += '<td class="user_grade">'+user_data[listNO].grade+'</td>';
        
        var joinDate = user_data[listNO].joinDate;
        var joinDate_s = joinDate.substring(0, 10);
        
        html += '<td class="user_joinDate">'+joinDate_s+'</td>';
        html += '<td class="user_email">'+user_data[listNO].email+'</td>';
        html += '<td class="user_tel">'+user_data[listNO].tel+'</td>';
        html += '<td class="user_resState">'+user_data[listNO].resState+'</td>';
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
    //input 안 정보 가지고 오기
    var search_op = $('#search_op').val();
    var keyword = $('#keyword').val();
    console.log(search_op+' '+keyword);


    $.ajax({
        url: "/adminSearchUser.do?search_op="+search_op+"&keyword="+keyword,
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

            },
        error :function(){
            alert("request error!");
            }
    });
}

function searchOption(){
    var option_data=[];
    var count=0;

    var bronzeCk= false;
    var silverCk= false;
    var goldCk= false;

    var res_OCk= false;
    var res_XCk= false;

    $('.grade_option input[type=checkbox]').each(function (index) {
        if($('#Bronze').is(":checked")==true){bronzeCk= true;}
        else{bronzeCk= false;}
        if($('#Silver').is(":checked")==true){silverCk= true;}
        else{silverCk= false;}
        if($('#Gold').is(":checked")==true){goldCk= true;}
        else{goldCk= false;}
        console.log('each')
    });

    $('.res_option input[type=checkbox]').each(function (index) {
        if($('#res_O').is(":checked")==true){res_OCk= true;}
        else{res_OCk= false;}
        if($('#res_X').is(":checked")==true){res_XCk= true;}
        else{res_XCk= false;}
    });

    console.log("bronzeCk : "+bronzeCk);
    console.log("silverCk : "+silverCk);
    console.log("goldCk : "+goldCk);


    //멤버쉽 등급
    if((bronzeCk && silverCk && goldCk) || (!bronzeCk && !silverCk && !goldCk)){
        getAllList();
        console.log('all');
    }else if(bronzeCk && silverCk && !goldCk){
        for(i=0;i<user_data.length;i++){
            if((user_data[i].grade=='Bronze') || (user_data[i].grade=='Silver')){
                option_data[count]=user_data[i];
                count++;console.log('bs');
            }
        }
        
    }else if(silverCk && goldCk && !bronzeCk){
        for(i=0;i<user_data.length;i++){
            if(user_data[i].grade=='Silver' || user_data[i].grade=='Gold'){
                option_data[count]=user_data[i];
                count++;console.log('sg');
            }
        }
        
    }else if(bronzeCk && goldCk && !silverCk){
        for(i=0;i<user_data.length;i++){
            if(user_data[i].grade=='Bronze' || user_data[i].grade=='Gold'){
                option_data[count]=user_data[i];
                count++;console.log('bg');
            }
        }
        
    }else if(bronzeCk && !silverCk && !goldCk){
        for(i=0;i<user_data.length;i++){
            if(user_data[i].grade=='Bronze'){
                option_data[count]=user_data[i];
                count++;
            }
        }
        console.log('b');
    }else if(silverCk && !bronzeCk && !goldCk){
        for(i=0;i<user_data.length;i++){
            if(user_data[i].grade=='Silver'){
                option_data[count]=user_data[i];
                count++;
            }
        }
        console.log('s');
    }else if(goldCk && !bronzeCk && !silverCk){
        for(i=0;i<user_data.length;i++){
            if(user_data[i].grade=='Gold'){
                option_data[count]=user_data[i];
                count++;
            }
        }
        console.log('g');
    }else{
        getAllList();
    }

    // for(i=0;i<user_data.length;i++){
    //     if(user_data[i].grade=='Bronze'){
    //         option_data[count]=user_data[i];
    //         count++;
    //     }
    // }


    user_data=[];
    for(i=0;i<option_data.length;i++){
        user_data[i]=option_data[i];
    }
    
    totalData=count;
    clickNO(globalCurrentPage);
    page_num_view(totalData);
}