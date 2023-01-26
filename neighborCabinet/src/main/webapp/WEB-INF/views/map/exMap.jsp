<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<script src="<c:url value="/js/jquery-3.6.1.min.js" />"></script>
		<script src="<c:url value="/js/mod.js" />"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href=/css/exMap.css/> 
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js' />"></script>
<title>지도페이지 예시</title>
</head>
<body>
	<div class="mapWrap">
	<!-- 왼쪽 상단 네비 -->
	<div class="navBlock">
		<nav class="infoNav">
			<ul class="allNav">
				<li class="navList">
					<a href="/" class="navListlink" id="homeLink">
						<div class="figureBox">
							<figure>
								<img class="modifyInfo" src="/image/homeImg.png">
							</figure>
						</div>
						<div class="listObject">홈</div>
					</a>
				</li>
					
				<li class="navList">
					<a href="/mypage/exMap" class="navListlink" id="placeCheckLink">
						<div class="figureBox">
							<figure>
								<img class="modifyInfo" src="/image/searching.png">
							</figure>
						</div>
						<div class="listObject" id="placeChecklisk">전체</div>
					</a>
				</li>
					
				<li class="navList">
					<a href="/" class="navListlink" id="dealLink">
						<div class="figureBox">
							<figure>
								<img class="modifyInfo" src="/image/normal.png">
							</figure>
						</div>
						<div class="listObject">일반</div>
					</a>
				</li>
				
				<li class="navList">
					<a href="/" class="navListlink" id="dealLink">
						<div class="figureBox">
							<figure id="premiumBox">
								<img class="modifyInfo" src="/image/premium.png">
							</figure>
						</div>
						<div class="listObject">프리미엄</div>
					</a>
				</li>
					
				<li class="navList">
					<a href="/" class="navListlink" id="dealLink">
						<div class="figureBox">
							<figure>
								<img class="modifyInfo" src="/image/deal.png">
							</figure>
						</div>
						<div class="listObject">거래현황</div>
					</a>
				</li>
				
			</ul>
		</nav>
	</div>	
	<!-- 대여 장소 확인 -->
	<div class="viewMap">
		<h2 class="sub">대여 장소 확인</h2>
			<div class="viewMapLR">
				<!-- 지도 API -->
				<div class="viewMapL">
					<img class="placeimage" src="/image/cancel.png">
				</div>
				
				<div class="viewMapR">
					<!-- 장소 정보1 -->
					<div class="placeInfo">
						<div class="placeimageDiv">
							<img class="placeimage" src="/image/cancel.png">
						</div>
						<div class="placeTitleBox">
							<div class="placeTitle">
								<p>짐 맡긴 장소</p>
							</div>
							<div class="placeDetail">
								<div>
									<img src="/image/clock.png">
									<p>한 시간 전</p>
								</div>
								<div>
									<img src="/image/placeholder.png">
									<p>상세주소</p>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 장소 정보2 -->
					<div class="placeInfo">
						<div class="placeimageDiv">
							<img class="placeimage" src="/image/cancel.png">
						</div>
						<div class="placeTitleBox">
							<div class="placeTitle">
								<p>짐 맡긴 장소</p>
							</div>
							<div class="placeDetail">
								<div>
									<img src="/image/clock.png">
									<p>한 시간 전</p>
								</div>
								<div>
									<img src="/image/placeholder.png">
									<p>상세주소</p>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 장소 정보3 -->
					<div class="placeInfo">
						<div class="placeimageDiv">
							<img class="placeimage" src="/image/cancel.png">
						</div>
						<div class="placeTitleBox">
							<div class="placeTitle">
								<p>짐 맡긴 장소</p>
							</div>
							<div class="placeDetail">
								<div>
									<img src="/image/clock.png">
									<p>한 시간 전</p>
								</div>
								<div>
									<img src="/image/placeholder.png">
									<p>상세주소</p>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 장소 정보4 -->
					<div class="placeInfo">
						<div class="placeimageDiv">
							<img class="placeimage" src="/image/cancel.png">
						</div>
						<div class="placeTitleBox">
							<div class="placeTitle">
								<p>짐 맡긴 장소</p>
							</div>
							<div class="placeDetail">
								<div>
									<img src="/image/clock.png">
									<p>한 시간 전</p>
								</div>
								<div>
									<img src="/image/placeholder.png">
									<p>상세주소</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
</div>
</body>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>	
</html>