<%@ page import="org.json.JSONArray" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<% JSONArray mapAddress=(JSONArray) request.getAttribute("mA");%>
	<meta charset="UTF-8">
	<script src="<c:url value="/js/jquery-3.6.1.min.js" />"></script>
	<script src="<c:url value="/js/mod.js" />"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href=/css/exMap.css/>
	<c:import url="/WEB-INF/views/layout/header.jsp" />
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="<c:url value='/js/searchZip.js' />"></script>
	<script src="<c:url value='/js/Map.js' />"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=72gbnd4fi6"></script>
	<script type="text/javascript">
		$(function(){

			initMap();

		});

		function initMap(){

			var json=[];
			json=<%=mapAddress%>;
			var map = new naver.maps.Map('map', {
				center: new naver.maps.LatLng(37.552758094502494, 126.98732600494576), //지도 시작 지점
				zoom: 15
			});

			let markers = new Array(); // 마커 정보를 담는 배열
			let infoWindows = new Array(); // 정보창을 담는 배열
			for (var i = 0; i < json.length; i++) {
				// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창을 채워주자 !

				var marker = new naver.maps.Marker({
					map: map,
					title: json[i].roadAddress, // 지역구 이름
					position: new naver.maps.LatLng(json[i].y , json[i].x) // 지역구의 위도 경도 넣기
				});

				/* 정보창 */
				var infoWindow = new naver.maps.InfoWindow({
					content: '<div style="width:200px;text-align:center;padding:10px;"><b>' +  json[i].roadAddress + '</div>'
				}); // 클릭했을 때 띄워줄 정보 HTML 작성

				markers.push(marker); // 생성한 마커를 배열에 담는다.

				infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.

			}
			function getClickHandler(seq) {

				return function(e) {  // 마커를 클릭하는 부분
					var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
							infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다

					if (infoWindow.getMap()) {
						infoWindow.close();
					} else {
						infoWindow.open(map, marker); // 표출
					}
				}
			}

			for (var i=0, ii=markers.length; i<ii; i++) {
				//console.log(markers[i] , getClickHandler(i));
				naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
			}

		}

	</script>

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
					<a href="/rentHistory" class="navListlink" id="dealLink">
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
	<!-- 대여 장소 -->
	<div class="viewMap">
		<h2 class="sub">내 주변 공간 찾기</h2>
			<div class="viewMapLR">
				<!-- 지도 API -->
				<div class="viewMapL" id="map"></div>
				<div class="viewMapR">
					<!-- 장소 정보1 -->
					<c:forEach var="p" items="${listAllMap }">
					<div class="placeInfo" onclick="location.href='<c:url value='/place/placeDetailView/${p.pNo}'/>'">
						<div class="placeimageDiv">
							<img class="placeimage" src="/image/${p.pImage}">
						</div>
						<div class="placeTitleBox">
							<div class="placeTitle">
								<p>${p.pWriteTitle }</p>
							</div>
							<div class="placeDetail">
								<div id="pTime">
									<img src="/image/clock.png">
									<span>${p.pTime }</span>
								</div>
								<div id="pAddress">
									<img src="/image/placeholder.png">
									${p.pAddress1 }
								</div>
							</div>
						</div>
					</div>
				  </c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- 지도 Script -->
	<script>
		var mapOptions = {
			center: new naver.maps.LatLng(37.518236, 127.059297),
			zoom: 10
		};

		var map = new naver.maps.Map('map', mapOptions);
		var marker = new naver.maps.Marker({
			position: new naver.maps.LatLng(37.518236, 127.059297),
			map: map
		});
	</script>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>	
  </body>
</html>