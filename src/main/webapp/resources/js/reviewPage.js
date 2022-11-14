
let totalData; //총 데이터 수
let dataPerPage=10; // 한 페이지에 나타날 데이터 수
let pageCount = 10; //페이징에 나타낼 페이지 수
let globalCurrentPage=1; //현재 페이지
let review_data = []; 
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

});
   
function getAllList(){
	console.log($("#user_id").val());
	
    var userId = $("#user_id").val();  
    $.ajax({
        url: "/returnAllRes.do",
        method:'Get',
		data:{
			"userId": userId
		},
		type:'Get',
		async:true,
		dataType:'json',
        success : function(data){
            //총데이터 수 저장
            totalData = data.length;
            //페이지 버튼 출력
            page_num_view(totalData);

            //review_data에 받아온 데이터 저장
            review_data = [totalData];
            for(i=0;i<data.length;i++){
                review_data[i]=data[i];
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
    
    console.log(totalData);

    var html = '<tr class="tb_title">'
                +'<td class="res_num">No</td>'
                +'<td class="res_date">Date</td>'
                +'<td class="pet_name">PetName</td>'
                +'<td class="res_sta">Status</td>'
                +'<td class="re_review">Review</td></tr>'; 
    
    var dataNo;
    if("0" == totalData) {
		html += '<tr>';
		html += '<td colspan=5>'+"예약 내역이 없습니다."+'</td>';

		html += '</tr>';
	}
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
        html += '<td class="res_num">'+(listNO+1)+'</td>';
        
        var joinDate = review_data[listNO].res_st;
        var joinDate_s = joinDate.substring(0, 10);
        var a_tag = '"http://localhost:8090/review/reviewForm.do?res_num=';
        
        html += '<td class="res_date">'+joinDate_s+'</td>';
        html += '<td class="pet_name">'+review_data[listNO].pet_name+'</td>';
        if (review_data[listNO].res_state == 'Y') {
			html += '<td class="res_sta">'+ "이용 완료"  +'</td>';
		} else if (review_data[listNO].res_state == 'N') {
			html += '<td class="res_sta">'+ "예약 완료"  +'</td>';
		} else {
			html += '<td class="res_sta">'+ "예약 취소"  +'</td>';
		}
 	
 		if  (review_data[listNO].res_num === review_data[listNO].re_num)   {
				html += '<td class="re_review">'+'<a href="#" onclick="callFunction();" style="color:#999999">'+'리뷰쓰기' +'</td>';
              } else if (review_data[listNO].res_state === 'Y'){
	   		html += '<td class="re_review">'+'<a href='+ a_tag +review_data[listNO].res_num +'">'+'리뷰쓰기' +'</td>';
	   }else {
			html += ' ';
		}
       
        html += '</tr>';  
    }
    $('.list_tb').append(html);
   console.log(review_data);
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

