<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
	</head>
	<body>
		<div id="requestInfoBox">
			<div class="RI_1">
				<div class="RI_1Title">예약자 정보</div>
				<div class="RI_1Cont">
					<div>예약자</div><div>${requestInfo.senderName}</div>
				</div>
				<div class="RI_1Cont">
					<div>연락처</div><div>${HP}</div>
				</div>
				<div class="RI_1Cont">
					<div>이메일</div><div>${requestInfo.senderEmail}</div>
				</div>
			</div>
			<div class="RI_1">
				<div class="RI_1Title">예약 내용</div>
				<div class="RI_1Cont">
					<div>픽업<c:if test="${requestInfo.pickup eq '1'}"><span>O</span></c:if><c:if test="${requestInfo.pickup eq '0'}"><span>X</span></c:if></div>
					<div>음식<c:if test="${requestInfo.food eq '1'}"><span>O</span></c:if><c:if test="${requestInfo.food eq '0'}"><span>X</span></c:if></div>
				</div>
				
				<div class="RI_1Cont">
					<div>보관물품</div><div>${requestInfo.storList}</div>
				</div>
				<div class="RI_1Cont">
					<div>요청사항</div><div>${requestInfo.request}</div>
				</div>
			</div>
			<div class="RI_1">
				<div class="RI_1Title">결제 내용</div>
				<div class="RI_1Cont">
					<div>날짜</div><div>${requestInfo.reserveDate}</div>
				</div>
				<div class="RI_1Cont">
					<div>박스</div><div>${requestInfo.boxType}</div>
				</div>
				<div class="RI_1Cont">
					<div>가격</div><div><fmt:formatNumber value="${requestInfo.reservePrice}" pattern="#,###" />원</div>
				</div>
			</div>
		</div>
		<%-- <table id="requestInfoBox">
			<tr><th>픽업 여부</th><td><div>
			<c:if test="${requestInfo.pickup eq '0'}">없음</c:if>
			<c:if test="${requestInfo.pickup eq '1'}">있음</c:if>
			</div></td></tr>
			<tr><th>음식 여부</th><td><div>
			<c:if test="${requestInfo.pickup eq '0'}">없음</c:if>
			<c:if test="${requestInfo.pickup eq '1'}">있음</c:if>
			</div></td></tr>
			<tr><th>예약자</th><td><div>${requestInfo.senderName}</div></td></tr>
			<tr><th>예약자 연락처</th><td><div>${requestInfo.senderPhone}</div></td></tr>
			<tr><th>예약자 이메일</th><td><div>${requestInfo.senderEmail}</div></td></tr>
			<tr><th>보관물품</th><td><div>${requestInfo.storList}</div></td></tr>
			<tr><th>요청사항</th><td><div>${requestInfo.request}</div></td></tr>
			<tr><th>날짜</th><td><div>${requestInfo.reserveDate}</div></td></tr>
			<tr><th>박스 종류</th><td><div>${requestInfo.boxType}</div></td></tr>
			<tr><th>가격</th><td><div>${requestInfo.reservePrice}</div></td></tr>
		</table> --%>
		<div style="border-bottom : solid 0.5px #a2a2a2;"></div>
	</body>
</html>