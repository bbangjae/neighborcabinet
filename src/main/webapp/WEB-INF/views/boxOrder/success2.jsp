<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문 완료</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/success.css"/>'>
	</head>
	<body>
		<section>
			
			<div id="orderSBox">
				<div id="spaceBox"></div>
				<div id="orderBox">
					<div id="title">예약완료</div>
					<div class="center">이웃집 캐비닛을 이용해주셔서 감사합니다.</div>
					<div class="center" id="string">예약이 <span>완료</span>되었습니다.</div>
					<div class="center">
						예약이웃 : <br>
						예약일자 : 
					</div>
					<div id="shortcut">
						<button type="button" onclick="location.href='<c:url value='/'/>' ">메인 바로가기</button>
						<button type="button" onclick="location.href='<c:url value='/mypage'/>' ">마이페이지 바로가기</button>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>