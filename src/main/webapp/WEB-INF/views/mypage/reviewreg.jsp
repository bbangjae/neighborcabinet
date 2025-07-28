<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/reviewreg.css"/>'>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value="/js/reviewReg.js"/>"></script>
	</head>
	<body>
		<div id="wrap">
			<form method="post" id="reviewForm">
				<div id="title">${place.pWriteTitle }</div>
				<div id="writer">${userInfo.userNickname }</div>
				<input type="hidden" name="pNo" id="pNo" value="${place.pNo }">
				<input type="hidden" name="reserveNo" id="reserveNo" value="${reserveNo}">
				<fieldset>
					<input type="radio" name="reviewGrade" value="5" id="rate1"><label for="rate1">★</label>
					<input type="radio" name="reviewGrade" value="4" id="rate2"><label for="rate2">★</label>
					<input type="radio" name="reviewGrade" value="3" id="rate3"><label for="rate3">★</label>
					<input type="radio" name="reviewGrade" value="2" id="rate4"><label for="rate4">★</label>
					<input type="radio" name="reviewGrade" value="1" id="rate5"><label for="rate5">★</label>
				</fieldset>
				<div id="emotionBox">
					<button type="button" id="abcd" >감정 분석</button>
					<div id="qwer"><div></div></div>
					<div id="asdf">
						<div><span style="background : #8b22ff"></span><span>부정</span></div>
						<div><span style="background : #ffc33b"></span><span>중립</span></div>
						<div><span style="background : #21f3d6"></span><span>긍정</span></div>
					</div>
				</div>
				<div>
					<textarea name="reviewContent" id="reviewContent"></textarea>
				</div>
				<div id="button">
					<input type="reset" value="취소"><input type="submit" value="작성">
				</div>
			</form>
		</div>
	</body>
</html>