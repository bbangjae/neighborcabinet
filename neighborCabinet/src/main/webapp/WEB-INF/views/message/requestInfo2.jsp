<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div style="width : 100%; border-top : solid .5px #ebebeb;" class="mesCutLine"></div>
			<div style="display : none;" class="paymentMInfo">
				<table border="1" style="margin : auto;">
					<tr><td>픽업 여부</td><td><div>${requestInfo.pickup}</div></td></tr>
					<tr><td>음식 여부</td><td><div>${requestInfo.food}</div></td></tr>
					<tr><td>예약자</td><td><div>${requestInfo.sender}</div></td></tr>
					<tr><td>예약자 연락처</td><td><div>${requestInfo.senderPhone}</div></td></tr>
					<tr><td>예약자 이메일</td><td><div>${requestInfo.senderEmail}</div></td></tr>
					<tr><td>보관물품</td><td><div>${requestInfo.storList}</div></td></tr>
					<tr><td>요청사항</td><td><div>${requestInfo.request}</div></td></tr>
				</table>
			</div>
		
	</body>
</html>