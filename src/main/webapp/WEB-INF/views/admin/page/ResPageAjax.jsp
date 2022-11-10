<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><!-- 리스트함수용 -->

<c:set var="resList"  value="${list}" /><!--가져온 예약 리스트 -->
<c:set var="item_res"  value="${fn:length(list)}" /><!--총 데이터베이스 아이템 수 list 의 갯수를 구함 -->
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
                   <!--상세보기용  -->
                    <tr id="res_content_box" class="res_content_box">
				            	<td colspan="3">
				            		<ul>
				            			<li class="res_Date_Veiw_Box">
				            				<input type="hidden" id="view_Res_Num" name="view_Res_Num">
				            				<input type="hidden" id="view_User_Id" name="view_User_Id">
				            				<input type="hidden" id="view_Res_State">
				            				<ul>
				            					<li><span class="check_Date">Check In</span></li>
				            					<li class="date_Cal_Text"></li>
				            					<li><span class="check_Date">Check Out</span></li>
				            				</ul>
				            				<ul>
				            					<li><input type="date" name="res_st" id="res_st" onchange="change_form()"></li>
				            					<li class="date_Cal_Text"><span id="dateCalText">0박</span></li>
				            					<li><input type="date" name="res_end" id="res_end" onchange="change_form()"></li>
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
				            					<li><img class="membershipImg" src="${contextPath}/resources/img/gold_medal.png"> TotalCost = <span id="res_TotalCost">0원</span><input type="hidden" name="view_TotalCost" id="view_TotalCost"></li>
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
				            				<button onclick="resMod(${P})">예약 수정</button>
				            				<button onclick="resCheck2(${P})">예약 취소</button>
				            				<button onclick="resCheck(${P})">예약 확인</button>
				            			</li>
				            		</ul>
				            	</td>
				            </tr>
</table>


 <!-- 페이지기능 -->
                
<!-- 페이지당 10개의 예약을 출력한다. -->
<!-- 이동페이지는 5개만 보여준다 -->
<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다. PI = 총페이지, P = 현재페이지-1 -->
<!-- 주의! jstl 나누기는 소수점까지 나누어버림 -->

<!-- 페이지수 구하기 -->
<c:if test="${item_res % 10 != 0 and item_res > 10}"><!-- 나머지가 있을경우 1페이지가 더 필요하다. ex)68, 62 개 아이템은 7페이지 -->

	<c:set var="Float" value="${item_res / 10}"/> <!-- 페이지수 구하기. 소수점으로 나누기 때문에 정수로 바꿔야함 -->
	<fmt:parseNumber var="PI" value="${Float+(1-(Float%1))%1}" integerOnly="true" scope="request"/> <!-- 소수점올림 -->
	
</c:if>

<!-- 10으로 나누어떨어짐 70개 = 7페이지-->
<c:if test="${item_res % 10 == 0 and item_res > 10}">
	<fmt:parseNumber var="PI" value="${item_res/10}" integerOnly="true" scope="request"/>
</c:if>

<!-- 아이템이 적어 페이지를 만들 이유가 없음 -->
<c:if test="${item_res <= 10}">
	<c:set var="PI" value="${0}" scope="request" />
</c:if>


<!-- 페이징 버튼 표시 -->
<c:choose>

	<c:when test="${P < 3 && PI > 5}">
	<!-- 현재페이지가 3페이지 이하이지만 마지막페이지가 다음페이지가 필요할 정도로 많다. 6이상이다 -->
		<div id="PageAjax" class="PageAjax"><!-- 페이지를 전송할때 찾기위한 요소 -->
			<c:forEach varStatus="i" begin="1" end="5">
				<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다. -->
				<c:choose>
				 	<c:when test="${i.count-1 == P}">
				 		<li class="pageNO pageNOW  pageNumberF" onClick="reslistPage(${i.count-1})">${i.count}</li>
				 	</c:when>
				 	<c:otherwise>
				 		<li class="pageNO  pageNumberF" onClick="reslistPage(${i.count-1})">${i.count}</li>
				 	</c:otherwise>
				</c:choose>			
			</c:forEach>
			<li class="pageNO pageUp" onClick="pageUP(${PI},${P})">next</li>
		</div>
	</c:when>

	<c:when test="${P >= 3 && PI > P + 3}">
	<!-- 현재페이지가 4이상 이고 마직막페이지 2 이하다. -->
		<div id="PageAjax" class="PageAjax">
			<li class="pageNO pageDown" onClick="pageDown(${P})">pre</li>
			<c:forEach varStatus="i" begin="${1}" end="${5}"><!-- 페이지는 5가지만 표시한다. 수에 맞춰 이동-->			
				
				<c:choose>
				 	<c:when test="${P + i.count - 3 == P}">
				 		<li class="pageNO pageNOW  pageNumberF" onClick="reslistPage(${P + i.count - 3})">${P + i.count - 2}</li>
				 	</c:when>
				 	<c:otherwise>
				 		<li class="pageNO  pageNumberF" onClick="reslistPage(${P + i.count - 3})">${P + i.count - 2}</li>
				 	</c:otherwise>
				</c:choose>		
			</c:forEach>
			<li class="pageNO pageUp" onClick="pageUP(${PI},${P})">next</li>
		</div>
	</c:when>

	<c:when test="${P >= 3 && PI-3 <= P && PI > P && PI>5}"><!-- 현재페이지가 4이상이고 최대페이지 또는 최대페이지랑 가까울때 페이지 수가6이상일때 -->
		
		<div id="PageAjax" class="PageAjax">
			<li class="pageNO pageDown" onClick="pageDown(${P})">pre</li>
			<c:forEach varStatus="i" begin="${1}" end="${5}">
				<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다.-->
				<c:choose>
				 	<c:when test="${PI - 6 + i.count == P}">
				 		<!-- 현재페이지 색표시 총페이지 7이고 현재 5페이지 일때 PI=6 -->
				 		<li class="pageNO pageNOW  pageNumberF" onClick="reslistPage(${PI - 6 + i.count})">${PI - 5 + i.count}</li>
				 	</c:when>
				 	<c:otherwise>
				 		<li class="pageNO  pageNumberF" onClick="reslistPage(${PI - 6 + i.count})">${PI - 5 + i.count}</li>
				 	</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		
	</c:when>
	<c:otherwise><!-- 페이징 버튼은 5개까지 표시한다. 총페이지가 5 이하일경우 앞뒤 버튼 없음-->
		<div id="PageAjax" class="PageAjax">
			<c:forEach varStatus="i" begin="1" end="${PI}">
				<!-- 값을 보낼때 페이지 정보를 보내서 다시 불러오면 몇페이지인지 확인한다. -->
				<c:choose>
				 	<c:when test="${P == i.count-1}">
				 		<!-- 현재페이지 색표시 총페이지 -->
				 		<li class="pageNO pageNOW  pageNumberF" onClick="reslistPage(${i.count-1})">${i.count}</li>
				 	</c:when>
				 	<c:otherwise>
				 		<li class="pageNO  pageNumberF" onClick="reslistPage(${i.count-1})">${i.count}</li>
				 	</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</c:otherwise>
	
</c:choose>


