<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="resList"  value="${list}" /><!--가져온 예약 리스트 -->

<c:set var="P"  value="${P}" />




<table id="indexListAjax">
	<tr class="tb_title">
          <td class="res_num">예약번호</td>
          <td class="res_name">예약자</td>
          <td class="res_Date">예약일</td>
          <td class="res_petCount">총 마리수</td>
          <td class="res_payTime">주문일</td>
          <td class="res_cost">총 가격</td>
          <td class="resState">예약상태</td>
          <td class="res_modBt"></td>
      </tr>
      <c:forEach var="reservation" items="${resList}" varStatus="status" begin="${P*10}" end="${P*10+9}">
		<tr>
			<td class="res_num">${reservation.res_num}</td>
			<td class="res_name">${reservation.name}</td>
			<td class="res_Date">${reservation.res_st} ~ ${reservation.res_end}</td>
			<td class="res_petCount">${reservation.total_pet}마리</td>
			<td class="res_payTime">${reservation.payTime}</td>
			<td class="res_cost">${reservation.totalCost}</td>
			<td class="resState">${reservation.res_state}</td>
			<td class="res_modBt res_modBt_bt" onclick="">
	 			<img class="res_arrow_bt" alt="button" src="${contextPath}/resources/img/Arrow.png" onclick="closeResContentBox(this)">
			</td>					  
		</tr>      			
	</c:forEach>
	<!--상세보기용  -->
             <tr id="res_content_box" class="res_content_box">
         	<td colspan="3">
         		<ul>
         			<li class="res_Date_Veiw_Box">
         				<ul>
         					<li><span class="check_Date">Check In</span></li>
         					<li class="date_Cal_Text"></li>
         					<li><span class="check_Date">Check Out</span></li>
         				</ul>
         				<ul>
         					<li><input type="date"></li>
         					<li class="date_Cal_Text"><span id="dateCalText">2박</span></li>
         					<li><input type="date"></li>
         				</ul>	
         			<li>
         			<br>
         			<li>
         				<ul class="pet_Cost_Box">
         					<li>
          					<table class="pet_Cost_table">
						  <tr>
						    <th>*</th>
						    <th>R</th>
						    <th>C</th>
						    <th>S</th>
						    <th>SP</th>
						  </tr>
						  <tr>
						    <th>소</td>
						    <td clss="sr">0</td>
						    <td clss="sc">0</td>
						    <td clss="ss">0</td>
						    <td clss="ssp">0</td>
						  </tr>
						  <tr>
						    <th>중</td>
						    <td clss="mr">0</td>
						    <td clss="mc">0</td>
						    <td clss="ms">0</td>
						    <td clss="msp">0</td>
						  </tr>
						  <tr>
						    <th>대</td>
						    <td clss="lr">0</td>
						    <td clss="lc">0</td>
						    <td clss="ls">0</td>
						    <td clss="lsp">0</td>
						  </tr>
						</table>
					</li>
         					<li><img class="membershipImg" src="${contextPath}/resources/img/gold_medal.png"> TotalCost = <span id="res_TotalCost">2,000,000원</span></li>
         				</ul>
         				<br>
         				<ul>
         					<li class="pet_Comment_Box">
         						<textarea id="pet_Comment" name="petcomment" spellcheck="false" maxlength="500" placeholder="요청사항을 적어주세요." onkeyup="petcommentTextLength(this);" rows="3"></textarea>
         						<span id="pet_Comment_Info">0</span>/500
         					</li>
         				</ul>
         			<li>
         		</ul>
         		<ul>
         			<li><li>
         		</ul>
         	</td>
         	<td colspan="5">
         		<ul>
         			<li class="petTB_List_Box">
         				<ul  class="petTB_List">
         						            					
         					<li>
         						<ul class="petTB_Item_Box petTB_Item_Box_Add">
         							<li onclick="pet_Add(this);">
         								<input type="image" id="petTB_Item_Add" class="petAdd_Bt" value="펫 추가" >
         							</li>
         						</ul>
         					</li>
         				</ul>
         			</li>
         			<li class="petTB_Bt_Box">
         				<button>예약 수정</button>
         				<button>예약 취소</button>
         				<button>예약 확인</button>
         			</li>
         		</ul>
         	</td>
         </tr>
</table>