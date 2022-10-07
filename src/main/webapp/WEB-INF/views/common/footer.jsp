<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%
  request.setCharacterEncoding("UTF-8");
%>   
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
  <footer>
    <div class="footer_wrap">
        <a class="foot_logo" href="#">Anitel</a>
        <div class="info">
            <p class="min_title">주소</p>
            부산진구 서전로 10번길 28
        </div>
        <div class="info">
            <p class="min_title">연락처</p>
            대표전화 010-0000-0000
        </div>
        <div class="info">
            <p class="min_title">영업시간</p>
            연중 무휴 오전 09시 ~ 오후 6시
        </div>
        <div class="foot_menu_wrap">
            <ul>
                <li class="min_title">서비스</li>
                <li><a href="#">호텔 예약</a></li>
                <li><a href="#">예약 조회</a></li>
                <li><a href="#">고객 리뷰</a></li>
            </ul>
            <div class="h_hr"></div>
            <ul>
                <li class="min_title">소개</li>
                <li><a href="#">호텔 소개</a></li>
                <li><a href="#">호텔 시설</a></li>
                <li><a href="#">멤버쉽 소개</a></li>
            </ul>
            <div class="h_hr"></div>
            <ul>
                <li class="min_title">지원</li>
                <li><a href="#">고객 센터</a></li>
                <li><a href="#">전화 상담</a></li>
                <li><a href="#">카카오톡 상담</a></li>
            </ul>
        </div>
        <div class="hr"></div>
        <p class="copy">
            ㈜ Anitel | 대표이사 : 000 | 부산진구 서전로 10번길 28 <br>
            사업자 등록 번호 : 000-00-00000 | 통신판매 신고번호 : 2000-부산진구-0000 <br>
            COPYRIGHT © 2022 회사명<br>
            이미지 출처 <a href="https://kr.freepik.com/">Freepik</a>
        </p>
    </div>
  </footer>

</body>
</html>
