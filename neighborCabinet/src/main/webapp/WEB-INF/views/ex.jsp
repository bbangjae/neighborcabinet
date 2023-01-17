<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="<c:url value="/js/jquery-3.6.1.min.js" />"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href=/css/ex.css/> 
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<title>개인정보</title>
	</head>
	<body>
		<div class="wrap">
			<div class="navBlock">
				<nav class="infoNav">
					<ul class="allNav">
					<li class="navList">
							<a href="/" class="navListlink" id="mypageLink">
								<div class="figureBox">
									<figure class="figureBox">
										<img class="modifyInfo" src="/image/mypage.png">
									</figure>
								</div>
								<div class="listObject">마이페이지</div>
							</a>
						</li>
						<li class="navList">
							<a href="/" class="navListlink" id="myinfoLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/profile2.png">
									</figure>
								</div>
								<div class="listObject">개인정보</div>
							</a>
						</li>
						<li class="navList">
							<a href="/" class="navListlink" id="payLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/pay.png">
									</figure>
								</div>
								<div class="listObject">결제</div>
							</a>
						</li>
						<li class="navList">
							<a href="/" class="navListlink" id="reviewLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/review2.png">
									</figure>
								</div>
								<div class="listObject">리뷰관리</div>
							</a>
						</li>
						<li class="navList">
							<a href="/" class="navListlink" id="boxLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/box2.png">
									</figure>
								</div>
								<div class="listObject">박스</div>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>