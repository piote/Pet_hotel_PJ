

//예약시 임시 펫 번호.
var petTableNum = 0;
//존재하는 테이블 갯수
var totalTableNum = 0;
    		
//칼럼 값
var petmap = new Map();
//계산용 값
var servicemap = new Map();

function handleOnChange(e) {
    const value = e.value;
}

//테이블 초기화
function resetRow(){
	petTableNum = 0;
	totalTableNum = 0
	petmap.clear();
	servicemap.clear();
}

function addRow() {

    // table element 찾기
    var table = document.getElementById('ch_pet_table');

    // 새 행(Row) 추가 (테이블 중간에)
    var newRow = table.insertRow();

    //row에 id 추가
    newRow.id = 'tbnum' + petTableNum;
    newRow.className = 'tbnum';

    // 새 행(Row)에 Cell 추가
    var Cell1 = newRow.insertCell();
    var Cell2 = newRow.insertCell();
    var Cell3 = newRow.insertCell();
    var Cell4 = newRow.insertCell();
    var Cell5 = newRow.insertCell();
    var Cell6 = newRow.insertCell();

    // Cell에 텍스트 추가

    Cell1.innerHTML = '<input name="petname" class="pet_status" id="Pet_Name' + petTableNum + '" type="textbox" style="text-align:center; width:80%;">';
    Cell2.innerHTML = '<select name="petsex" class="pet_status" id="Pet_Sex' + petTableNum + '" onchange="handleOnChange(this)"><option>male</option><option>female</option></select>';
    Cell3.innerHTML = '<select name="petroom" class="pet_status" id="Pet_Room' + petTableNum + '" onchange="handleOnChange(this)"><option value="Deluxe">Deluxe(소형견)</option><option value="Sweet">Suite(중형견)</option><option value="Superior">Superior(대형견)</option></select>';
    Cell4.innerHTML = '<select name="beauty" class="pet_status" id="pet_Beauty' + petTableNum + '" onchange="handleOnChange(this)"><option value="N">이용안함</option><option value="Clipping">Clipping</option><option value="Scissoring">Scissoring</option></select>';
    Cell5.innerHTML = '<input name="spa" class="pet_status" id="pet_Spa' + petTableNum + '" type="checkbox" value="Y">';
    Cell5.innerHTML += '<input type="hidden" name="spa"  id="pet_Spa' + petTableNum + '_hidden" value="N"/>';
    //Cell6.innerHTML = '<input type="button" id="' + petTableNum + '" class="petUsed" value="X" >';
    Cell6.innerHTML = '<input type="image" id="' + petTableNum + '" class="petUsed" value="예약취소">';

    //테이블 이벤트 생성 이름, 성별 방 미용 스파 삭제 이벤트
    pet_table_event(petTableNum);

    //삭제처리
    $("#" + petTableNum).on("click", this, function () {
        //맵에서 테이블 값 제거
        petmap.delete('Pet_Name' + $(this).attr('id'));
        petmap.delete('Pet_Sex' + $(this).attr('id'));
        petmap.delete('Pet_Room' + $(this).attr('id'));
        petmap.delete('pet_Beauty' + $(this).attr('id'));
        petmap.delete('pet_Spa' + $(this).attr('id'));
        
        console.log('service' + $(this).attr('id'));
        servicemap.delete('service' + $(this).attr('id'));
        costTB(servicemap, false);//삭제한 결과 출력

        //html에서 제거
        $(this).parent().parent().remove();
        totalTableNum--;
        //콘솔 테스트
        console.log(petmap);
        console.log('총 테이블' + totalTableNum);
    });

    petTableNum++;
    totalTableNum++;
    console.log('총 테이블' + totalTableNum);

}

function pet_table_event(petTableNum) {
    //이름 이벤트
    $('#Pet_Name' + petTableNum).change(this, function () {

        petmap.set($(this).attr('id'), $(this).val());

        if (tablecheck(this)) {
            console.log(costresult(this));
            costTB(costresult(this),true);
        }
    });
    //성별 이벤트
    $('#Pet_Sex' + petTableNum).change(this, function () {

        petmap.set($(this).attr('id'), $(this).val());

        if (tablecheck(this)) {
            console.log(costresult(this));
            costTB(costresult(this),true);
        }
    });
    //방 이벤트
    $('#Pet_Room' + petTableNum).change(this, function () {


        petmap.set($(this).attr('id'), $(this).val());

        if (tablecheck(this)) {
            console.log(costresult(this));
            costTB(costresult(this),true);
        }
    });
    //미용 이벤트
    $('#pet_Beauty' + petTableNum).change(this, function () {

        petmap.set($(this).attr('id'), $(this).val());

        if (tablecheck(this)) {
            console.log(costresult(this));
            costTB(costresult(this),true);
        }
    });
    //스파 이벤트
    $('#pet_Spa' + petTableNum).change(this, function () {

        petmap.set($(this).attr('id'), $(this).prop("checked"));
        
        if($(this).prop("checked")){
			$("#"+$(this).attr('id')+'_hidden').attr("disabled", true);
		}else{
			$("#"+$(this).attr('id')+'_hidden').attr("disabled", false);
		}
		
		//결과창
        if (tablecheck(this)) {
            console.log(costresult(this));
            costTB(costresult(this),true);
        }
    });

}
//테이블 확인 이름이 입력되었는가.
function tablecheck(petTableElement) {
    var tbnum = $(petTableElement).parent().parent().attr('id').substr(5);
    console.log('Pet_Name-' + tbnum + petmap.get('Pet_Name' + tbnum) + 'Pet_Sex-' + tbnum + petmap.get('Pet_Sex' + tbnum))

    //기본 값 세팅
    if (petmap.get('Pet_Sex' + tbnum) == null) {
        petmap.set('Pet_Sex' + tbnum, 'male');
    }
    if (petmap.get('Pet_Room' + tbnum) == null) {
        petmap.set('Pet_Room' + tbnum, 'Deluxe');    // 12:20 수정
    }

    if (petmap.get('Pet_Name' + tbnum) != null && petmap.get('Pet_Sex' + tbnum) != null) {
        console.log("table_OK")
        return 1;
    } else {
        alert("이름을 입력해 주세요.");
        return 0;
    }
}

//이름 확인 거르고 map 을 제공. 제공된 것으로 결과 계산
// 이름, 성별, 사이즈, 미용, 스파. 순으로 인덱스
function costresult(petTableElement) {

    var tbnum = $(petTableElement).parent().parent().attr('id').substr(5);

    var petservice = [petmap.get('Pet_Name' + tbnum), petmap.get('Pet_Sex' + tbnum), petmap.get('Pet_Room' + tbnum), petmap.get('pet_Beauty' + tbnum), petmap.get('pet_Spa' + tbnum), tbnum];
    console.log(petservice);
    servicemap.set('service' + tbnum, petservice);
    console.log(servicemap);

    return servicemap;
}

function costTB(petserviceMap, datecheck) {
    // s소형 m중형 l대형,   
    //r방
    var sr = 0;
    var mr = 0;
    var lr = 0;
    //b미용
    var sbc = 0;
    var mbc = 0;
    var lbc = 0;
    var sbs = 0;
    var mbs = 0;
    var lbs = 0;
    // s스파.
    var ss = 0;
    var ms = 0;
    var ls = 0;

    for (let petlist of petserviceMap.values()) {
        var list = petlist;
        //2index는 room
        if (list[2] == 'Deluxe') {//소형일경우
            sr++;
            if (list[3] == null) {//미용

            } else if (list[3] == 'Clipping') {   
                sbc++;
            } else if (list[3] == 'Scissoring') {    
                sbs++;
            }

            if (list[4] == true) {//스파     
                ss++;
            }

        } else if (list[2] == 'Sweet') {//중형 
            mr++;

            if (list[3] == null) {//미용       
 
            } else if (list[3] == 'Clipping') {  
                mbc++;
            } else if (list[3] == 'Scissoring') { 
                mbs++;
            }

            if (list[4] == true) {//스파    
                ms++;
            }
        } else if (list[2] == 'Superior') {//대형 
            lr++;

            if (list[3] == null) {//미용

            } else if (list[3] == 'Clipping') { 
                lbc++;
            } else if (list[3] == 'Scissoring') {
                lbs++;
            }

            if (list[4] == true) {//스파
                ls++;
            }
        }

    }

    var dayCal = $("#dateResult").val();
    
        if(dayCal == null || dayCal == ''){
            if(datecheck == true){
                alert("날짜를 선택해 주세요.");
            }
            // s소형 m중형 l대형,   
            //r방
            var sr = 0;
            var mr = 0;
            var lr = 0;
            //b미용
            var sbc = 0;
            var mbc = 0;
            var lbc = 0;
            var sbs = 0;
            var mbs = 0;
            var lbs = 0;
            // s스파.
            var ss = 0;
            var ms = 0;
            var ls = 0;
        }
    
        //room
        $("#S_R").text((dayCal * sr * 35000).toLocaleString() + ' 원');
        $("#M_R").text((dayCal * mr * 45000).toLocaleString() + ' 원');
        $("#L_R").text((dayCal * lr * 55000).toLocaleString() + ' 원');
        //Clipping
        $("#S_BC").text((sbc * 35000).toLocaleString() + ' 원');
        $("#M_BC").text((mbc * 45000).toLocaleString() + ' 원');
        $("#L_BC").text((lbc * 60000).toLocaleString() + ' 원');
        //Scissoring
        $("#S_BS").text((sbs * 70000).toLocaleString() + ' 원');
        $("#M_BS").text((mbs * 80000).toLocaleString() + ' 원');
        $("#L_BS").text((lbs * 100000).toLocaleString() + ' 원');
        //스파
        $("#S_S").text((ss * 50000).toLocaleString() + ' 원');
        $("#M_S").text((ms * 80000).toLocaleString() + ' 원');
        $("#L_S").text((ls * 120000).toLocaleString() + ' 원');
        //총합계
        var total = sr * 35000 + mr * 45000 + lr * 55000 ;
        total *= dayCal;
        total += sbc * 35000 + mbc * 45000 + lbc * 60000 + sbs * 70000 + mbs * 80000 + lbs * 100000;
        total += ss * 50000 + ms * 80000 + ls * 120000;
        $(".totalcost").text(total.toLocaleString()  + ' 원');
        
        //맴버쉽 없는 초기상태 계산
		if($("#membership").val()==""|| $("#membership").val()==null){
       		var disTotal = $("#totalcost").val();
       	 	dis = (total-disTotal)/(total/100)//할인율 자릿수 높아서 대강 계산해도 ok
        	console.log(dis);
        
        	if(dis == 2){
				$("#membership").val("Bronze");
				console.log($("#bronzeimg").attr('src', '/resources/img/bronze_medal.png'));
				$(".membership").text("Bronze Membership : Discount 2%");
				
			}else if(dis == 5){
				$("#membership").val("Silver");
				console.log($("#bronzeimg").attr('src', '/resources/img/silver_medal.png'));
				$(".membership").text("Silver Membership : Discount 5%");
			}else if(dis == 10){
				$("#membership").val("Gold");
				console.log($("#bronzeimg").attr('src', '/resources/img/gold_medal.png'));
				$(".membership").text("Gold Membership : Discount 10%");
			}else{
				$("#membership").val("");
				console.log($("#bronzeimg").attr('src', '/resources/img/none.png'));
				$(".membership").text("");
			}
			
		}
              
        if($("#membership").val()=='Gold' && total != 0){
			var disTotal = total * (1 - 10 / 100);//10퍼 할인
			$(".totalcost").text(total.toLocaleString()  + ' 원'+'=>'+disTotal.toLocaleString()  + ' 원');
			$("#totalcost").val(disTotal);
		
        }else if($("#membership").val()=='Silver' && total != 0){
			var disTotal = total * (1 - 5 / 100);//5퍼 할인
			$(".totalcost").text(total.toLocaleString()  + ' 원'+'=>'+disTotal.toLocaleString()  + ' 원');
			$("#totalcost").val(disTotal);
		
		}else if($("#membership").val()=='Bronze' && total != 0){
			var disTotal = total * (1 - 2 / 100);//2퍼 할인
			$(".totalcost").text(total.toLocaleString()  + ' 원'+'=>'+disTotal.toLocaleString()  + ' 원');
			$("#totalcost").val(disTotal);
		}else{
			//0원일시
			$(".totalcost").text(total.toLocaleString()  + ' 원');
			$("#totalcost").val(total);
		}

}

function addtext() {
    $(".petcomment").toggleClass('click');
}

function addcost() {
    $(".paymentinfo2").toggleClass('click');
}
