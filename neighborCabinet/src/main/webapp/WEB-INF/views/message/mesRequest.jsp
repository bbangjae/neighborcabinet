<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/mesRequest.css"/>'>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value="/js/mesRequest.js"/>"></script>
	</head>
	<body>
		<div id="section1">
			요청메시지 <i class="fa-regular fa-bell fa-1x" style="color:#00DBAF"></i>
		</div>
		<div id="mesBox">
			<div class="R_resInfoTBox">
				<div class="R_TBox">
					<div>예약자</div>
					<div>공간명</div>
				</div>
				<div>
				수락 및 거절
				</div>
			</div>
			<div id="re_resInfoBox">
			<c:forEach var="resInfo" items="${resInfo}">
				<div class="R_resInfoBox">
					<div class="R_Box" id="${resInfo.reserveNo}">
						<div>${resInfo.sender}</div>
						<div>${resInfo.pWriteTitle}</div>
					</div>
					<div>
						<button type="button" class="MResO"
						data-reserveNo="${resInfo.reserveNo}" data-sender="${resInfo.sender}">수락</button>
						<button type="button" class="MResX"
						data-reserveNo="${resInfo.reserveNo}" data-sender="${resInfo.sender}">거절</button>
					</div>
				</div>
				<div class="infoResult"></div>
			</c:forEach>
			</div>
		</div>
	</body>
</html>