<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
	</head>
	<body>
		<div>${requestInfo.reserveNo}</div>
		<div>${requestInfo.pickup}</div>
		<div>${requestInfo.food}</div>
		<div>${requestInfo.senderName}</div>
		<div>${requestInfo.senderPhone}</div>
		<div>${requestInfo.senderEmail}</div>
		<div>${requestInfo.storList}</div>
		<div>${requestInfo.request}</div>
	</body>
</html>