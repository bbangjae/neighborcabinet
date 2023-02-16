<%@ page import="org.json.JSONArray" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%--    <% JSONArray mapAddress=(JSONArray) request.getAttribute("mA");%>--%>
    <meta charset="UTF-8">
    <script src="<c:url value="/js/jquery-3.6.1.min.js" />"></script>
    <script src="<c:url value="/js/mod.js" />"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href=/css/exMap.css/>
    <c:import url="/WEB-INF/views/layout/header.jsp" />
<%--    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>--%>
    <script src="<c:url value='/js/searchZip.js' />"></script>
    <script src="<c:url value='/js/Map.js' />"></script>

    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hm0bb8lwq6&submodules=geocoder"></script>
    <script type="text/javascript">

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

    var map = new naver.maps.Map("map", {
        center: new naver.maps.LatLng(37.3595316, 127.1052133),
        zoom: 15,
        mapTypeControl: true
    });

    var infoWindow = new naver.maps.InfoWindow({

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
<div class="search">
    <input type="text" id="address" placeholder="검색할 주소">
    <input type="button" id="submit" value="주소 검색">
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>
