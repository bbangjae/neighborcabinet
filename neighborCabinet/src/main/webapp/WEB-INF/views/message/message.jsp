<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/message_y.css"/>'>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value="/js/message.js"/>"></script>
	</head>
	<body>
		<div id="section1_y">
			알림메시지 <i class="fa-regular fa-bell fa-1x" style="color:#00DBAF"></i>
		</div>
		<div id="mesBox">
			<div id="mesDeleteBox">
				<label for="mesAllSelect"><input type="checkbox" id="mesAllSelect"></label>
				<div class="colorEB">|</div>
				<div><button type="button" style="width:45px;" id="deleteMesBtn">삭제</button></div>
				<div class="colorEB">|</div>
				<div><button type="button" style="width:85px;" id="deleteMesAllBtn">전체 삭제</button></div>
			</div>
			<div class="mes_AllmessageS">
			<c:forEach var="message" items="${message}">
				<div class="mes_mesaage">
					<label for="${message.mesNo}"><input type="checkbox" class="mesSelect" id="${message.mesNo}"></label>
					<label class="mesTitle" for="${message.mesNo}_1">
						<div>${message.receiver}</div>
						<div>${message.message}</div>
						<div>${message.mesDate}</div>
					</label>
				</div>
				<input type="checkbox" id="${message.mesNo}_1" name="mes_messageS" style="display : none;">
				<div class="mesDInfo">
					<%-- <c:if test="${message.OX eq '0'}">
						<div class="mesFirstCheck"><i class="fa-solid fa-circle"></i></div>
					</c:if> --%>
					<div style="width : 100%; border-top : solid .5px #d1d1d1;" class="mesCutLine"></div>
					<div class="paymentMInfo">
						[${message.pWriteTitle}] (${message.reserveDate})
						<c:if test="${message.OX eq '1'}">
							<span style="color:#00DBAF;">예약이 확정</span>되었습니다.<br>
							예약 확인은 <a href="<c:url value='/mypage'/>">마이페이지</a>에서 확인해주세요.
						</c:if>
						<c:if test="${message.OX eq '0'}">
							<span style="color:#f34336;">예약이 거절</span>되었습니다.<br>
							거절된 공간은 <a href="<c:url value='/place/placeDetailView/${message.pNo }'/>">공간대여</a>에서 확인해주세요.
						</c:if>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</body>
</html>