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
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hm0bb8lwq6"></script>
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

        //검색한 주소의 정보를 insertAddress 함수로 넘겨준다.
        function searchAddressToCoordinate(address) {
            naver.maps.Service.geocode({
                query: address
            }, function(status, response) {
                if (status === naver.maps.Service.Status.ERROR) {
                    return alert('Something Wrong!');
                }
                if (response.v2.meta.totalCount === 0) {
                    return alert('올바른 주소를 입력해주세요.');
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

                insertAddress(item.roadAddress, item.x, item.y);

            });
        }

        // 주소 검색의 이벤트
        $('#address').on('keydown', function(e) {
            var keyCode = e.which;
            if (keyCode === 13) { // Enter Key
                searchAddressToCoordinate($('#address').val());
            }
        });
        $('#submit').on('click', function(e) {
            e.preventDefault();
            searchAddressToCoordinate($('#address').val());
        });
        naver.maps.Event.once(map, 'init_stylemap', initGeocoder);



        //검색정보를 테이블로 작성해주고, 지도에 마커를 찍어준다.
        function insertAddress(address, latitude, longitude) {
            var mapList = "";
            mapList += "<tr>"
            mapList += "	<td>" + address + "</td>"
            mapList += "	<td>" + latitude + "</td>"
            mapList += "	<td>" + longitude + "</td>"
            mapList += "</tr>"

            $('#mapList').append(mapList);

            var map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(longitude, latitude),
                zoom: 14
            });
            var marker = new naver.maps.Marker({
                map: map,
                position: new naver.maps.LatLng(longitude, latitude),
            });
        }


        // 지도를 이동하게 해주는 함수
        function moveMap(len, lat) {
            var mapOptions = {
                center: new naver.maps.LatLng(len, lat),
                zoom: 15,
                mapTypeControl: true
            };
            var map = new naver.maps.Map('map', mapOptions);
            var marker = new naver.maps.Marker({
                position: new naver.maps.LatLng(len, lat),
                map: map
            });
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
<div class="search">
    <input type="text" id="address" placeholder="검색할 주소">
    <input type="button" id="submit" value="주소 검색">
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
<script>

    var infoWindow = new naver.maps.InfoWindow({
        anchorSkew: true
    });

    map.setCursor('pointer');

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

            infoWindow.setContent([
                '<div style="padding:10px;min-width:200px;line-height:150%;">',
                '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
                htmlAddresses.join('<br />'),
                '</div>'
            ].join('\n'));

            infoWindow.open(map, latlng);
        });
    }

    function searchAddressToCoordinate(address) {
        naver.maps.Service.geocode({
            query: address
        }, function(status, response) {
            if (status === naver.maps.Service.Status.ERROR) {
                return alert('Something Wrong!');
            }

            if (response.v2.meta.totalCount === 0) {
                return alert('totalCount' + response.v2.meta.totalCount);
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

            infoWindow.setContent([
                '<div style="padding:10px;min-width:200px;line-height:150%;">',
                '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
                htmlAddresses.join('<br />'),
                '</div>'
            ].join('\n'));

            map.setCenter(point);
            infoWindow.open(map, point);
        });
    }

    function initGeocoder() {
        map.addListener('click', function(e) {
            searchCoordinateToAddress(e.coord);
        });

        $('#address').on('keydown', function(e) {
            var keyCode = e.which;

            if (keyCode === 13) { // Enter Key
                searchAddressToCoordinate($('#address').val());
            }
        });

        $('#submit').on('click', function(e) {
            e.preventDefault();

            searchAddressToCoordinate($('#address').val());
        });

        searchAddressToCoordinate('정자동 178-1');
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
</script>
</html>
