<%--
  Created by IntelliJ IDEA.
  User: se
  Date: 2023-01-18
  Time: 오전 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="<c:url value='/js/jquery-3.6.1.min.js'/>"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hm0bb8lwq6"></script>

<html>
<head>
    <title>대여등록</title>
    <style>
        hr{
            width: 100%;
            height: 5px;
            background: #285943;
            border: 0;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<div class="container" >
    <div class ="heading">
        <h3> 공간 정보를 입력해주세요</h3>
        <hr>
    </div>
    <form class = "rentalregform" id = "rentalform" method="post">
        <div class="row">
            <div class="col-sm-3">
                <label> 공간 사진(업로드)</label>
                <img src="" width="300" height="250" />
            </div>
            <div class="col-sm-9">
                <div class="row">
                    <div class="col-8 col-sm-6">
                        <div class = "title">
                            <label for = "spaceName">
                                <span> 공간명</span>
                            </label>
                            <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 다른 공간과 구별될 수 있는 공간의 고유 업체명(브랜드명)을 입력해주세요!">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                                </svg>
                            </a>
                            <input type="text" class = "form-control" id = "spaceName" placeholder="공간 이름을 적어주세요" >
                        </div>
                        <div class="spaceintro_d">
                            <label for="spaceintro_d">
                                <span>음식 보관 여부</span>
                            </label>
                        </div>
                    </div>
                    <div class="col-4 col-sm-6">
                        <div class = "spaceintro">
                            <label for = "spaceintro">
                                <span> 공간 유형</span>
                            </label>
                            <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 짐을 실제 보관하실 장소를 선택해 주세요!">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                                </svg>
                            </a>
                            <select class="form-select" id="spaceintro" aria-p>
                                <option selected>공간 유형을 선택해주세요</option>
                                <option value="집">거주지(집)</option>
                                <option value="창고">창고</option>
                                <option value="업소">업소</option>
                                <option value="자동차">자동차</option>
                                <option value="5">자동차</option>
                            </select>
                        </div>

                        <div class="spaceintro_d">
                            <label for="spaceintro_d">
                                <span>상세 공간 유형</span>
                            </label>
                            <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 짐을 보관하실 장소를 상세하게 적어주세요 ex)집 안, 업장(편의점,식당), 자동차 트렁크 ...!">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                                </svg>
                            </a>
                            <input type="text" class = "form-control" id = "spaceintro_d" placeholder="상세 공간 유형을 적어주세요" >
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <div class=" map">
        <input type="button" class="btn  btn-sm btn-block text-white" style="background: #00DBAF" id="mapbtn" name="mapbtn" value="지도">
        <div id="map" style="width: 100%;height: 75vh;margin:auto; display: none"> </div>
    </div>

</div>

<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

<script>
    $(function (){
        $("#mapbtn").click(function (){
            $("#map").toggle();
        });
    });
    var mapOptions = {
        zoom: 8,
        center: new naver.maps.LatLng(37.3614483, 127.1114883)
    };

    var map = new naver.maps.Map('map', mapOptions);

    var markerOptions = {
        position: map.getCenter(),
        map: map,
        title: 'Click to zoom'
    };

    var marker = new naver.maps.Marker(markerOptions);

    var mapElement = map.getElement();

    var listener = naver.maps.Event.addDOMListener(mapElement, 'click', function() {
        map.setZoom(15);

        map.setCenter(marker.getPosition());

        naver.maps.Event.removeDOMListener(listener);
    });
</script>

</body>
</html>
