<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value="/js/message.js"/>"></script>
	</head>
	<body>
		<c:forEach var="resInfo" items="${resInfo}">
			<div>
				<button type="button" class="requestInfo" id="${resInfo.reserveNo}">정보 보기</button>
				<a href="<c:url value='/message/requestInfo/${resInfo.reserveNo}'/>">정보 보기</a>
				<a href="<c:url value='/message/requestO/${resInfo.reserveNo}/${resInfo.sender}'/>">수락</a>
				<a href="<c:url value='/message/requestX/${resInfo.reserveNo}/${resInfo.sender}'/>">거절</a>
			</div>
		</c:forEach>
		<c:forEach var="message" items="${message}">
			<div>
				<div>${message.userId}</div>
				<div>${message.message}</div>
				<div>${message.mesDate}</div>
				<div>${message.reserveNo}</div>
				<div>${message.OX}</div>
			</div>
			<hr>
		</c:forEach>
		
		<div id="infoResult"></div>
	</body>
</html>