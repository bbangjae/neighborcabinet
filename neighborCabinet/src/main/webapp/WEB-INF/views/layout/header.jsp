<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/header.css'/>">
		<script src="https://kit.fontawesome.com/487e3fe7a5.js" crossorigin="anonymous"></script>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value="/js/header.js"/>"></script>
	</head>
	<body>
		<div id="outside_sidebar"></div>
		<div id="header_sidebar">
						<div id="sidebar_close">
							<button type="button" id="sidebar_closeBtn"><i class="fa-solid fa-xmark fa-3x"></i></button>
						</div>
						<div id="sidebar_top"></div>
						<div id=sidebar_listBox>
							<ul>
								<c:if test="${empty sessionScope.sid}">
								<li><a href="<c:url value='/member/loginform'/>">로그인</a></li>
								<li><a href="<c:url value='/member/joinform'/>">회원가입</a></li>
								</c:if>
								
								<!-- 로그인 성공 후 보여줄 메뉴 항목 -->
								<c:if test="${not empty sessionScope.sid}">
									<li><a href="<c:url value='/member/logout'/>">로그아웃</a></li>
									<hr>
									<li><a href="<c:url value='/map'/>">지도</a></li>
									<li><a href="<c:url value='/mypage'/>">마이페이지</a></li>
									<li><a href="<c:url value='/'/>">공간등록</a></li>
									<li><a href="<c:url value='/boxList'/>">박스구매</a></li>
								</c:if>
							</ul>
						</div>
				</div>
		<div id="header_wrap">
			<header>
				<div id="headerBox">
					<div>
						<a href="<c:url value='/'/>">
							<img id="header_logoImg" src="<c:url value='/image/nclogo.png'/>">
						</a>
						<a href="<c:url value='/'/>">
							<img id="header_logoSimpleImg" src="<c:url value='/image/ncLogosimple.png'/>">
						</a>
					</div>
					<form id="header_form">
						<div id="header_searchInputBox">
							<input type="text" id="header_searchInput" placeholder="주소를 입력하라">
						</div>
						<div id="header_searchBtnBox">
							<button type="submit" id="header_searchBtn"><i class="fa-solid fa-magnifying-glass fa-2x" style="color:#00DBAF"></i></button>
						</div>
					</form>
					<div>
						<button type="button" id="user_button">
							<i class="fa-solid fa-bars fa-1x" style="color:#00DBAF"></i>
						</button>
					</div>
				</div>
			</header>
		</div>
		<div id="header_space"></div>
	</body>
</html>






