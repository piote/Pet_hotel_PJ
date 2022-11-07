<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><!-- 리스트함수용 -->

<c:set var="resList"  value="${list}" /><!--가져온 예약 리스트 -->
<c:set var="item_res"  value="${fn:length(list) }" /><!--총 데이터베이스 아이템 수  -->
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
          <td class="res_modBt"><input id="PNum" type="hidden" ></td>
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
         					<li><input type="date" name="res_st" id="res_st"></li>
         					<li class="date_Cal_Text"><span id="dateCalText">2박</span></li>
         					<li><input type="date" name="res_end" id="res_end"></li>
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
						    <th>소</th>
						    <td class="sr">0</td>
						    <td class="sc">0</td>
						    <td class="ss">0</td>
						    <td class="ssp">0</td>
						  </tr>
						  <tr>
						    <th>중</th>
						    <td class="mr">0</td>
						    <td class="mc">0</td>
						    <td class="ms">0</td>
						    <td class="msp">0</td>
						  </tr>
						  <tr>
						    <th>대</th>
						    <td class="lr">0</td>
						    <td class="lc">0</td>
						    <td class="ls">0</td>
						    <td class="lsp">0</td>
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







 <!-- 페이지기능 -->
                
<!-- 페이지당 10개의 예약을 출력한다. -->
               
<!-- 페이지 만큼 나누어떨어지지만 그대로 계산하면 1페이지 더 생성되므로 주의 -->
<c:if test="${item_res % 10 != 0 and item_res > 10}">
	<c:set var="PI" value="${item_res / 10}" scope="request"/>
</c:if>

<!-- 페이지 만큼 나누어떨어지지만 그대로 계산하면 1페이지 더 생성되므로 주의 -->
<c:if test="${item_res % 10 == 0 and item_res > 10}">
	<c:set var="PI" value="${item_res / 10 - 1}" scope="request" />
</c:if>

<!-- 아이템이 적어 페이지를 만들 이유가 없음 -->
<c:if test="${item_res <= 10}">
	<c:set var="PI" value="${0}" scope="request" />
</c:if>

<c:choose>

	<c:when test="${P < 3 && PI > 4}">
	<!-- 현재페이지가 3페이지 이하이지만 마지막페이지가 다음페이지가 필요할 정도로 많다. -->
		<div id="PageAjax" class="PageAjax">
			<c:forEach varStatus="i" begin="0" end="4">
				<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다. -->
				<c:choose>
				 	<c:when test="${i.count-1 == P}">
				 		<li class="pageNO pageNOW" onClick="reslistPage(${i.count-1})">${i.count} - ${PI}</li>
				 	</c:when>
				 	<c:otherwise>
				 		<li class="pageNO" onClick="reslistPage(${i.count-1})">${i.count}</li>
				 	</c:otherwise>
				</c:choose>			
			</c:forEach>
			<li class="pageNO pageUp" onClick="pageUP()">next</li>
		</div>
	</c:when>

	<c:when test="${P >= 3 && PI > P + 3}">
	<!-- 현재페이지가 4이상 이고 마직막페이지 2 이하다. -->
		<div id="PageAjax" class="PageAjax">
			<li class="pageNO pageDown" onClick="pageDown()">pre</li>
			<c:forEach varStatus="i" begin="${P-2}" end="${P+2}">
				<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다. -->
				<c:choose>
				 	<c:when test="${P + i.count - 3 == P}">
				 		<li class="pageNO pageNOW" onClick="reslistPage(${P + i.count - 3})">${P + i.count - 2}</li>
				 	</c:when>
				 	<c:otherwise>
				 		<li class="pageNO" onClick="reslistPage(${P + i.count - 3})">${P + i.count - 2}</li>
				 	</c:otherwise>
				</c:choose>		
			</c:forEach>
			<li class="pageNO pageUp" onClick="pageUP()">next</li>
		</div>
	</c:when>

	<c:when test="${P >= 3 && PI-2 <= P+1 && PI > P}"><!-- 현재페이지가 4이상이고 최대페이지 또는 최대페이지랑 가까울때  -->
		
		<div id="PageAjax" class="PageAjax">
			<li class="pageNO pageDown" onClick="pageDown()">pre</li>
			<c:forEach varStatus="i" begin="${PI-4}" end="${PI}">
				<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다. 현재페이지는 색 표시-->
				<c:choose>
				 	<c:when test="${PI - 5 + i.count == P}">
				 		<li class="pageNO pageNOW" onClick="reslistPage(${PI - 5 + i.count})">${PI - 4 + i.count}-${PI}</li>
				 	</c:when>
				 	<c:otherwise>
				 		<li class="pageNO" onClick="reslistPage(${PI - 5 + i.count}">${PI - 4 + i.count}-${PI}</li>
				 	</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		
	</c:when>
	<c:otherwise>
		<div id="PageAjax" class="PageAjax">
			<li class="pageNO pageDown" onClick="pageDown()">pre</li>
			<c:forEach varStatus="i" begin="0" end="${PI}">
				<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다. -->
				<li class="pageNO" onClick="reslistPage(${i.count-1})">${i.count}${P}</li>
			</c:forEach>
			<li class="pageNO pageUp" onClick="pageUP()">next</li>
		</div>
	</c:otherwise>
	
</c:choose>
<%-- <div id="PageAjax" class="PageAjax">
	<li class="pageNO pageDown" onClick="pageDown()">pre</li>
	<c:forEach varStatus="i" begin="0" end="${PI}">
		<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다. -->
		<li class="pageNO" onClick="reslistPage(${i.count-1})">${i.count}${P}</li>
	</c:forEach>
	<li class="pageNO pageUp" onClick="pageUP()">next</li>
</div> --%>

