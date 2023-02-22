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
	<link rel="stylesheet" type="text/css" href=/css/Map.css/>
	<c:import url="/WEB-INF/views/layout/header.jsp" />
	<%--	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>--%>
	<script src="<c:url value='/js/searchZip.js' />"></script>
	<script src="<c:url value='/js/Map.js' />"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hm0bb8lwq6&submodules=geocoder"></script>
	<script type="text/javascript">
		$(function(){
			initMap();
			searchTitleToCoordinate(${kw});
		});

		function initMap(){


			markers = new Array(); // 마커 정보를 담는 배열
			infoWindows = new Array(); // 정보창을 담는 배열
			var bounds = map.getBounds(),
					southWest = bounds.getSW(),
					northEast = bounds.getNE(),
					lngSpan = northEast.lng() - southWest.lng(),
					latSpan = northEast.lat() - southWest.lat();

			for (var i = 0; i < jsonP.length; i++) {
				// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창 !

				if(jsonP[i]===undefined){

					var marker = new naver.maps.Marker({
						map: map,
						position: new naver.maps.LatLng(jsonP[1].y , jsonP[1].x),
						visible: false
					});
					/* 정보창 */
					var infoWindow = new naver.maps.InfoWindow({
						content: '<div style="text-decoration: none; text-align:center;padding:10px;border-radius:21px 21px 21px 21px;"   >' +
								'<a  style="text-decoration:none; color:#00DBAF;  font-weight:bold" href="<c:url value="/place/placeDetailView/'+jsonP[1].pNo+'"/>" >' +  jsonP[1].wT + '</div>',
						anchorSkew: false,
						borderColor:"#00DBAF",
						maxWidth:150

					});
					markers.push(marker);
					infoWindows.push(infoWindow);
					continue;
				}
				if(jsonP[i].bI==="1") {
					var marker = new naver.maps.Marker({

						map: map,
						title: jsonP[i].roadAddress, // 지역구 이름
						position: new naver.maps.LatLng(jsonP[i].y, jsonP[i].x),// 지역구의 위도 경도 넣기
						icon: {
							content: '<i class="fa-solid fa-location-dot" style="font-size: 30px; color: #0080ff"></i>',
							size: new naver.maps.Size(38, 58),
							anchor: new naver.maps.Point(10,10),
						},
						draggable: false,
					});
					var infoWindow = new naver.maps.InfoWindow({
						content: '<div style="text-decoration: none; text-align:center; padding:10px; border-radius:21px 21px 21px 21px;"   >' +
								'<a  style="text-decoration:none; color:#0080ff;  font-weight:bold" href="<c:url value="/place/placeDetailView/'+jsonP[i].pNo+'"/>" >' +  jsonP[i].wT + '</div>',
						anchorSkew: false,
						borderColor:"#0080ff",
						maxWidth:150

					});
				}
				if(jsonP[i].bI==="2") {
					var marker = new naver.maps.Marker({

						map: map,
						title: jsonP[i].roadAddress, // 지역구 이름
						position: new naver.maps.LatLng(jsonP[i].y, jsonP[i].x),// 지역구의 위도 경도 넣기
						icon: {
							content: '<i class="fa-solid fa-location-dot" style="font-size: 30px; color: #DB4455 "></i>',
							size: new naver.maps.Size(38, 58),
							anchor: new naver.maps.Point(10,10),
						},
						draggable: false,
					});
					var infoWindow = new naver.maps.InfoWindow({
						content: '<div style="text-decoration: none; text-align:center;padding:10px; border-radius:21px 21px 21px 21px;"   >' +
								'<a  style="text-decoration:none; color:#DB4455;  font-weight:bold" href="<c:url value="/place/placeDetailView/'+jsonP[i].pNo+'"/>" >' +  jsonP[i].wT + '</div>',
						anchorSkew: false,
						borderColor:"#DB4455",
						maxWidth:150

					});
				}
				if(jsonP[i].bI==="3") {
					var marker = new naver.maps.Marker({

						map: map,
						title: jsonP[i].roadAddress, // 지역구 이름
						position: new naver.maps.LatLng(jsonP[i].y, jsonP[i].x),// 지역구의 위도 경도 넣기
						icon: {
							// content: '<div style="text-decoration: none;width:75px; height: 23px; background-color: #d7fff1; text-align:left; font-size:10px;padding:0px;border-radius:21px 21px 21px 21px;"   ><input type="radio" style="background: white !important; height:100%;margin:0 0 0 5px; text-align: left; " disabled>123</input></div>',
							content: '<i class="fa-solid fa-location-dot" style="font-size: 30px; color: #00DBAF "></i>',

							size: new naver.maps.Size(38, 58),
							anchor: new naver.maps.Point(10,10),
						},
						draggable: false,
					});
					var infoWindow = new naver.maps.InfoWindow({
						content: '<div style="text-decoration: none; text-align:center;padding:10px;border-radius:21px 21px 21px 21px;"   >' +
								'<a  style="text-decoration:none; color:#00DBAF;  font-weight:bold" href="<c:url value="/place/placeDetailView/'+jsonP[i].pNo+'"/>" >' +  jsonP[i].wT + '</div>',
						anchorSkew: false,
						borderColor:"#00DBAF",
						maxWidth:150

					});
				}

				/* 정보창 */
				// 클릭했을 때 띄워줄 정보 HTML 작성
				markers.push(marker); // 생성한 마커를 배열에 담는다.
				infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.



			}
			//클릭시 정보 보이는 칸
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
				naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러

			}
			$('.placeInfo').on('click',function(){

				var marker = markers[$(this).attr("value")*1],
						infoWindow=infoWindows[$(this).attr("value")*1];
				infoWindow.close();
				infoWindow.open(map,marker);

			});
			$('#total_box').on('click',function(){
				for(i=0;i<jsonP.length;i++){
					if(jsonP[i]===undefined) continue;
					infoWindows[i].close();
					markers[i].setVisible(true);

				}

			})
			$('#normal_box').on('click',function(){
				for(i=0;i<jsonP.length;i++){
					if(jsonP[i]===undefined) continue;
					markers[i].setVisible(true);
					if(!(jsonP[i].bI==="1"||jsonP[i].bI==="3")){
					infoWindows[i].close();
						markers[i].setVisible(false);
					}
				}

			})
			$('#premium_box').on('click',function(){
				for(i=0;i<jsonP.length;i++){
					if(jsonP[i]===undefined) continue;
					markers[i].setVisible(true);
					if(!(jsonP[i].bI==="2"||jsonP[i].bI==="3")){
					infoWindows[i].close();
						markers[i].setVisible(false);
					}
				}

			})


			// 지도 보이는부분 마커 표시 + 리스트 보이기

			naver.maps.Event.addListener(map, 'idle', function() {
				updateMarkers(map, markers);
			});
			function updateMarkers(map, markers) {

				var mapBounds = map.getBounds();
				var marker, position;

				for (var i = 0; i < markers.length; i++) {

					marker = markers[i]
					position = marker.getPosition();

					if (mapBounds.hasLatLng(position)) {
						showMarker(map, marker,i);


					} else {
						hideMarker(map, marker,i);
					}
				}
			}
			function showMarker(map, marker,index) {

				if (marker.getMap()) return;
				marker.setMap(map);
				$("#list"+index).show();
			}

			function hideMarker(map, marker,index) {

				if (!marker.getMap()) return;
				marker.setMap(null);
				$("#list"+index).hide();
			}
			updateMarkers(map, markers);


		}

		// 주소검색 클릭시
		function searchAddressToCoordinate(address) {

			naver.maps.Service.geocode({
				query: address
			}, function(status, response) {
				if (status === naver.maps.Service.Status.ERROR) {
					return alert('Something Wrong!');
				}

				if (response.v2.meta.totalCount === 0) {
					return alert('주소를 확인해주세요.');
				}

				var htmlAddresses = [],
						item = response.v2.addresses[0],
						point = new naver.maps.Point(item.x, item.y);

				if (item.roadAddress) {
					htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
				}

				if (item.jibunAddress) {
					htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
				}

				if (item.englishAddress) {
					htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
				}


				map.setCenter(point);

			});
		}

		function searchTitleToCoordinate(pNo) {
			var location = new naver.maps.LatLng(jsonP[pNo].y, jsonP[pNo].x);
			map.setCenter(location);
			map.setZoom(15); // 지도의 줌 레벨을 변경합니다.
			var marker = markers[pNo],
					infoWindow=infoWindows[pNo];
			infoWindow.close();
			infoWindow.open(map,marker);

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
					<div  class="navListlink" id="total_box" style="background-color: #D7FFF1;">
						<div class="figureBox">
							<figure>
								<img class="modifyInfo" src="/image/searching.png">
							</figure>
						</div>
						<div class="listObject"  >전체</div>
					</div>
				</li>

				<li class="navList">
					<a class="navListlink" id="normal_box">
						<div class="figureBox">
							<figure>
								<img class="modifyInfo" src="/image/normal.png">
							</figure>
						</div>
						<div class="listObject" >일반</div>
					</a>
				</li>

				<li class="navList">
					<a  class="navListlink" id="premium_box">
						<div class="figureBox">
							<figure id="premiumBox">
								<img class="modifyInfo" src="/image/premium.png">
							</figure>
						</div>
						<div class="listObject" >프리미엄</div>
					</a>
				</li>

				<li class="navList">
					<a href="/rentHistory" class="navListlink" id="dealLink">
						<div class="figureBox">
							<figure>
								<img class="modifyInfo" src="/image/customer.png">
							</figure>
						</div>
						<div class="listObject">거래/대여</div>
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
					<%--					<div class="placeInfo" id="list${p.pNo}" onclick="location.href='<c:url value='/place/placeDetailView/${p.pNo}'/>'">--%>
					<div class="placeInfo" id="list${p.pNo}" value="${p.pNo}" >
						<div class="placeimageDiv">
							<img style=" width:100%; height:100%;" src="<c:url value='/images/${p.pImage}' />" >
						</div>
						<div class="placeTitleBox">
							<div class="placeTitle">
								<p>${p.pWriteTitle }</p>
							</div>
							<div class="placeDetail">
								<div id="pTime">
									<img src="/image/clock.png">
									<span>${p.pS_Time}:00~${p.pE_Time}:00</span>
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
	var json=[];
	var jsonP=[];
	json=<%=mapAddress%>;
	for(i=0;i<json.length;i++){
		let pno=json[i].pNo*1
		let index =json.findIndex(i=>i.pNo===pno)

		jsonP[pno]=json[index];
		console.log(pno);
	}

	var map = new naver.maps.Map("map", {
		center: new naver.maps.LatLng(jsonP[${kw}].y, jsonP[${kw}].x),
		zoom: 15,
		mapTypeControl: true
	});

	var infoWindow = new naver.maps.InfoWindow({
		anchorSkew: true
	});

	map.setCursor('pointer');

	//마커x 클릭했을때
	function searchCoordinateToAddress(latlng) {

		infoWindow.close();

		naver.maps.Service.reverseGeocode({
			coords: latlng,
			orders: [
				naver.maps.Service.OrderType.ADDR,
				naver.maps.Service.OrderType.ROAD_ADDR
			].join(',')
		}, function(status, response) {
			if (status === naver.maps.Service.Status.ERROR) {
				return alert('Something Wrong!');
			}

			var items = response.v2.results,
					address = '',
					htmlAddresses = [];

			for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
				item = items[i];
				address = makeAddress(item) || '';
				addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

				htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
			}

		});
	}


	function initGeocoder() {
		map.addListener('click', function(e) {
			searchCoordinateToAddress(e.coord);
		});

	}

	function makeAddress(item) {
		if (!item) {
			return;
		}

		var name = item.name,
				region = item.region,
				land = item.land,
				isRoadAddress = name === 'roadaddr';

		var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

		if (hasArea(region.area1)) {
			sido = region.area1.name;
		}

		if (hasArea(region.area2)) {
			sigugun = region.area2.name;
		}

		if (hasArea(region.area3)) {
			dongmyun = region.area3.name;
		}

		if (hasArea(region.area4)) {
			ri = region.area4.name;
		}

		if (land) {
			if (hasData(land.number1)) {
				if (hasData(land.type) && land.type === '2') {
					rest += '산';
				}

				rest += land.number1;

				if (hasData(land.number2)) {
					rest += ('-' + land.number2);
				}
			}

			if (isRoadAddress === true) {
				if (checkLastString(dongmyun, '면')) {
					ri = land.name;
				} else {
					dongmyun = land.name;
					ri = '';
				}

				if (hasAddition(land.addition0)) {
					rest += ' ' + land.addition0.value;
				}
			}
		}

		return [sido, sigugun, dongmyun, ri, rest].join(' ');
	}

	function hasArea(area) {
		return !!(area && area.name && area.name !== '');
	}

	function hasData(data) {
		return !!(data && data !== '');
	}

	function checkLastString (word, lastString) {
		return new RegExp(lastString + '$').test(word);
	}

	function hasAddition (addition) {
		return !!(addition && addition.value);
	}

	naver.maps.onJSContentLoaded = initGeocoder;
	function onSuccessGeolocation(position) {
		var location = new naver.maps.LatLng(position.coords.latitude,
				position.coords.longitude);

		map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
		map.setZoom(15); // 지도의 줌 레벨을 변경합니다.

	}

	function onErrorGeolocation() {
		var center = map.getCenter();
	}

</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>