<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery-3.6.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage2.css' />">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<c:import url="/WEB-INF/views/layout/header.jsp" />
		<title>마이페이지</title>
	</head>
	<body>
		<main>
		<section>
			<h1 class="myPageH1">마이페이지</h1>
			<div> 님 환영합니다</div>
		</section>
		<hr color="#00DBAF" width="60%"size="1px"> 
					
			<div class="wrap">
				<div class="ObjectBox">
					<div class="OjectS">
						<div class="pageObject" id="Object1">
							<a href="modifyInfo" class="ObjectLink">
							</a>
							<span>개인 정보</span>
						</div>
						<div class="pageObject" id="Object2">
							<a href="#" class="ObjectLink">
							</a>
							<span>결제</span>
						</div>
						<div class="pageObject" id="Object3">
							<a href="#" class="ObjectLink">
							</a>
							<span>리뷰 관리</span>
						</div>
						<div class="pageObject" id="Object4">
							<a href="#" class="ObjectLink">
							</a>
							<span>박스</span>
						</div>
					</div>
				</div>
			</div>
		</main>
	</body>
</html>