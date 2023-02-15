<%--
  Created by IntelliJ IDEA.
  User: se
  Date: 2023-01-18
  Time: 오전 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
<%--
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
--%>


<html>
<head>
    <title>대여등록</title>
    <script src="<c:url value='/js/jquery-3.6.1.min.js'/>"></script>
    <script src="<c:url value='/js/searchZip3.js' />"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>



    <style>
        hr{
            width: 100%;
            height: 5px;
            background: #285943;
            border: 0;
        }
        h3{
            font-weight: bold;
        }

    </style>
    <style>
        #att_zone {
            min-height: 150px;
            padding: 10px;
            border: 1px solid #888888;
        }

        #att_zone:empty:before {
            content: attr(data-placeholder);
            color: #999;
            font-size: .9em;
        }
        option[value=""][disabled] {
            display:none
        }
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>

</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<c:import url="/WEB-INF/views/member/chat.jsp"/>

<div class="container" style="width: 70%;">
    <div class ="heading mt-5">
        <h3> 공간 정보를 입력해주세요</h3>
        <hr>
    </div>

    <form class = "rentalregform  g-3 mt-3" id="rentalform"  method="post" action="<c:url value='/rental/reg'/>" enctype="multipart/form-data">
        <div class="col-md-12 ml-50 mr-50">
            <div class = "title ">
                <label for = "pWriteTitle">
                    <span><h4>글 제목</h4></span>
                </label>
                <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 대표 제목을 적어주세요!">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                </a>
                <input type="text" class = "form-control " id = "pWriteTitle" name="pWriteTitle" style="border-radius: 0px;" placeholder="글 대표 제목을 적어주세요!" >
            </div>
        </div>

        <div class="col-md-12 mt-3">
            <div class = "title ">
                <label for = "pPlaceTitle">
                    <span><h4>공간명</h4></span>
                </label>
                <a  class="d-inline-block" data-toggle="tooltip" title="
                            • 다른 공간과 구별될 수 있는 공간의 고유 업체 명을 입력해주세요!">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                </a>
                <input type="text" class = "form-control " id = "pPlaceTitle" name="pPlaceTitle" style="border-radius: 0px;" placeholder="공간의 고유 업체 명을 입력해주세요!" >
            </div>
        </div>

        <div class="col-md-12 mt-3">
            <div class = "title ">
                <label for = "pWriteSub">
                    <span><h4>공간 한줄 소개</h4></span>
                </label>
                <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 한 줄 소개를 매력적으로 작성해보세요 (예시) 강남역 5분거리 픽업가능 ...">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                </a>
                <input type="text" class = "form-control " id = "pWriteSub" name="pWriteSub" style="border-radius: 0px;" placeholder="공간의 특장점을 한 문장으로 작성해주세요." >
            </div>
        </div>

        <div class="col-md-12 mt-3">
            <div class = "pType">
                <label for = "pType">
                    <span><h4>공간 유형</h4></span>
                </label>
                <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 짐을 실제 보관하실 장소를 선택해 주세요!">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                </a>
                <select class="form-select " id="pType" name="pType" style="border-radius: 0px;" required aria-p>
                    <option value="" disabled selected>공간 유형을 선택해주세요</option>
                    <option value="집">거주지(집)</option>
                    <option value="창고">창고</option>
                    <option value="업소">업소</option>
                    <option value="자동차">자동차</option>
                    <option value="기타">기타</option>
                </select>
            </div>
        </div>

        <div class="div1 col-md-12 mt-3">
            <div class="pType_d">
                <label for="pType_d">
                    <span><h4>상세 공간 유형</h4></span>
                </label>
                <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 짐을 보관하실 장소를 상세하게 적어주세요 ex)집 안, 업장(편의점,식당), 자동차 트렁크 ...!">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                </a>
                <input type="text" class = " form-control " id = "pType_d" name="pType_d" style="border-radius: 0px;"placeholder="공간 유형을 상세하게 적어주세요" >
            </div>
        </div>
        <div class="col-md-4 mt-3">
            <div class="space_d m-3" >
                <div class="form-check">
                    <input class="form-check-input "  type="checkbox" value="0" id="food" name="food" onclick="this.value = (this.checked) ? 0 : 1">
                    <label class="form-check-label" for="food">
                        음식 보관
                    </label>
                    <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 음식 보관이 가능하면 체크">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                        </svg>
                    </a>
                </div>
            </div>

            <div class="space_d m-3">
                <div class="form-check">
                    <input class="form-check-input"  type="checkbox" value="0" id="pickup" name="pickup" onclick="this.value = (this.checked) ? 0 : 1">
                    <label class="form-check-label" for="pickup">
                        픽업 가능
                    </label>
                    <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                           • 픽업이 가능하면 체크">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                        </svg>
                    </a>
                </div>
            </div>

        </div>

        <div class="row">
            <%--
                        <div class="col-md-6">
                            <label for="card" class="mb-3"><sapn><h4>내 보유 박스</h4></sapn></label>
                            <div class="row">
                                <c:forEach items="${boxlist}" var="box">
                                <div class="col-md-6 mb-5 "id = "card_${box.boxType}">
                                    <div class="card shadow ripple hover-overlay shadow-1-strong rounded"  style="width:300px; cursor:pointer;">
                                    <img class="card-img-top" src="<c:url value="/image/A_type.png"/>" alt="Boximage">
                                    <div class="card-img-overlay">
                                        <h3 class="card-title">${box.boxType}</h3>
                                        <p class="card-text">${box.boxQty}</p>
                                    </div>
                                        <div class="mask" style="background-color: hsla(0, 0%, 98%, 0.5)"></div>
                                    </div>
                                </div>
                            </c:forEach>
                            </div>
                        </div>
            --%>
            <div class="col-md-6">
                <label for="accordionExample" class="mb-3"><sapn><h4>내 보유 박스</h4></sapn></label>
                <div class="row">
                    <div class="accordion" id="accordionExample">
                        <c:forEach items="${boxlist}" var="box">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne_${box.boxType}">
                                    <button
                                            class="accordion-button collapsed"
                                            type="button"
                                            data-mdb-toggle="collapse"
                                            data-mdb-target="#collapse_${box.boxType}"
                                            aria-expanded="false"
                                            aria-controls="collapse_${box.boxType}"
                                            id ="accordion_${box.boxType}"
                                    >
                                            ${box.boxType}(${box.boxQty})
                                    </button>
                                </h2>
                                <div id="collapse_${box.boxType}" class="accordion-collapse collapse" aria-labelledby="headingOne_${box.boxType}" data-mdb-parent="#accordionExample" >
                                    <div class="accordion-body">
                                        <input type="text" class = " form-control onlyNumber " id = "Boxp_${box.boxType}"  style="border-radius: 0px;  "placeholder="시간 당 금액을 적어주세요" maxlength='4'>
                                        <input type="hidden" id = "BoxQty_${box.boxType}"  value="<c:out value="${box.boxQty}"/>" >
                                        <div class="number mt-3" style="float: right" >
                                            <button type="button" class="btn" style="background: #00DBAF;" id="increaseQuantity_${box.boxType}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
                                                </svg>
                                            </button>
                                            <input id="numberUpDown_${box.boxType}"  type="number" value="1" style="width :30px;border:none; text-align: center;" >
                                            <button type="button" class="btn" style="background: #00DBAF;" id="decreaseQuantity_${box.boxType}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-dash-lg" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M2 8a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11A.5.5 0 0 1 2 8Z"/>
                                                </svg>
                                            </button>
                                        </div>
                                        <div class="asd mt-3">
                                            <button type="button" class="btn btn-sm text-white" style="background: #00DBAF;" id="add_${box.boxType}">추가</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="col-6">
                <label for="Box1" class="mb-3"><h4>등록 박스 목록</h4></label>
                <%--
                        <form class = "box" method="post" action="<c:url value='/box/reg'/>">
                --%>
                <%--
                            <form class = "rentalregform  g-3 mt-3" id="rentalform"  method="post" action="<c:url value='/rental/reg'/>" enctype="multipart/form-data">
                --%>
                <div id = "Box1" class = "mb-4" style="display: none;">
                    <label for="Boxprice_A01" class="form-label"><h5>A_01</h5></label>
                    <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16" style="float: right; cursor: pointer;" id="Boxp_A01_B">
                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                    <div class ="BoxPrice" style="border: 1px solid black;display: flex; align-items: center; ">
                        <p style="margin-top: 14px; margin-left: 10px;">시간 당</p>
                        <input type="text" class = " form-control " id = "Boxprice_A01" name="A_Price" style="border-radius: 0px; width: 60px;  border:none; text-align: right; "placeholder="금액" value="0" readonly>
                        <p style="margin-top: 14px;">원</p>
                        <input type="text" class = " form-control " id = "BoxQtyp_A01" name="A_Qty" style="border-radius: 0px; width: 60px; border:none;  text-align: right; " value="0" >
                        <p style="margin-top: 14px;">개</p>
                    </div>
                </div>

                <div id = "Box2" class = "mb-4" style="display: none;">
                    <label for="Boxprice_A02" class="form-label"><h5>A_02</h5></label>
                    <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16" style="float: right; cursor: pointer;" id="Boxp_A02_B">
                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                    <div class ="BoxPrice" style="border: 1px solid black;display: flex; align-items: center; ">
                        <p style="margin-top: 14px; margin-left: 10px;">시간 당</p>
                        <input type="text" class = " form-control " id = "Boxprice_A02" name="B_Price" style="border-radius: 0px; width: 60px;  border:none; text-align: right; "placeholder="금액" value="0" readonly>
                        <p style="margin-top: 14px;">원</p>
                        <input type="text" class = " form-control " id = "BoxQtyp_A02" name="B_Qty" style="border-radius: 0px; width: 60px; border:none;  text-align: right; " value="0" >
                        <p style="margin-top: 14px;">개</p>
                    </div>

                </div>
                <div id = "Box3"class = "mb-4" style="display: none;">
                    <label for="Boxprice_A03" class="form-label"><h5>A_03</h5></label>
                    <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16" style="float: right; cursor: pointer;" id="Boxp_A03_B">
                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                    <div class ="BoxPrice" style="border: 1px solid black; display: flex; align-items: center; ">
                        <p style="margin-top: 14px; margin-left: 10px;">시간 당</p>
                        <input type="text" class = " form-control " id = "Boxprice_A03" name="C_Price" style="border-radius: 0px; width: 60px;  border:none; text-align: right; "placeholder="금액" value="0" readonly>
                        <p style="margin-top: 14px;">원</p>
                        <input type="text" class = " form-control " id = "BoxQtyp_A03" name="C_Qty" style="border-radius: 0px; width: 60px; border:none;  text-align: right; " value="0" >
                        <p style="margin-top: 14px;">개</p>
                    </div>
                </div>

                <div id = "Box4"class = "mb-4" style="display: none;">
                    <label for="Boxprice_B01" class="form-label"><h5>B_01</h5></label>
                    <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16" style="float: right; cursor: pointer;" id="Boxp_B01_B">
                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                    <div class ="BoxPrice" style="border: 1px solid black;display: flex; align-items: center; ">
                        <p style="margin-top: 14px; margin-left: 10px;">시간 당</p>
                        <input type="text" class = " form-control " id = "Boxprice_B01" name="D_Price" style="border-radius: 0px; width: 60px;  border:none; text-align: right; "placeholder="금액" value="0" readonly>
                        <p style="margin-top: 14px;">원</p>
                        <input type="text" class = " form-control " id = "BoxQtyp_B01" name="D_Qty" style="border-radius: 0px; width: 60px; border:none;  text-align: right; " value="0" >
                        <p style="margin-top: 14px;">개</p>
                    </div>
                </div>


                <div id = "Box5"class = "mb-4" style="display: none;">
                    <label for="Boxprice_B02" class="form-label"><h5>B_02</h5></label>
                    <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16" style="float: right; cursor: pointer;" id="Boxp_B02_B">
                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                    <div class ="BoxPrice" style="border: 1px solid black;display: flex; align-items: center; ">
                        <p style="margin-top: 14px; margin-left: 10px;">시간 당</p>
                        <input type="text" class = " form-control " id = "Boxprice_B02" name="E_Price" style="border-radius: 0px; width: 60px;  border:none; text-align: right; "placeholder="금액" value="0" readonly>
                        <p style="margin-top: 14px;">원</p>
                        <input type="text" class = " form-control " id = "BoxQtyp_B02" name="E_Qty" style="border-radius: 0px; width: 60px; border:none;  text-align: right; " value="0" >
                        <p style="margin-top: 14px;">개</p>
                    </div>
                </div>

                <div id = "Box6"class = "mb-4" style="display: none;">
                    <label for="Boxprice_B03" class="form-label"><h5>B_03</h5></label>
                    <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16" style="float: right; cursor: pointer;" id="Boxp_B03_B">
                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                    <div class ="BoxPrice" style="border: 1px solid black;display: flex; align-items: center; ">
                        <p style="margin-top: 14px; margin-left: 10px;">시간 당</p>
                        <input type="text" class = " form-control " id = "Boxprice_B03" name="F_Price" style="border-radius: 0px; width: 60px;  border:none; text-align: right; "placeholder="금액" value="0" readonly>
                        <p style="margin-top: 14px;">원</p>
                        <input type="text" class = " form-control " id = "BoxQtyp_B03" name="F_Qty" style="border-radius: 0px; width: 60px; border:none;  text-align: right; " value="0" >
                        <p style="margin-top: 14px;">개</p>
                    </div>
                </div>
            </div>
            <%--
                </form>
            --%>
        </div>


        <div class="col-md-12 mb-5 mt-5">
            <div class="mb-3 mt-3">
                <label for="pPlaceInfo" ><h4>공간 소개</h4></label>
                <textarea class="form-control " id="pPlaceInfo" name ="pPlaceInfo" placeholder="공간소개를 적어주세요"style="border-radius: 0px;" rows="10"></textarea>
            </div>
        </div>
        <div class="col-md-12 mb-5 mt-3">
            <div class="mb-3 mt-3">
                <label for="pCautionInfo" ><h4>예약 시 주의사항</h4></label>
                <textarea class="form-control " id="pCautionInfo" name ="pCautionInfo" placeholder="예약 시 주의사항을 적어주세요."style="border-radius: 0px;" rows="5"></textarea>
            </div>
        </div>
        <div class ="row">
            <div class="col-md-6">
                <div class = "title ">
                    <label for = "pHp">
                        <span><h4> 연락처</h4></span>
                    </label>
                    <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 예약 시 연락이 가능한 연락처를 적어주세요!">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                        </svg>
                    </a>
                    <input type="text" class = "form-control  onlyNumber" id = "pHp" name="pHp" style="border-radius: 0px;" placeholder="연락 가능한 연락처를 적어주세요. (숫자만 작성)" >
                </div>
            </div>

            <div class="col-md-6">
                <div class = "title2">
                    <label for = "pS_Time">
                        <span><h4>연락 가능 시간</h4></span>
                    </label>
                    <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 연락가능 시간을 정해주세요. (예)10시 부터 22시">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                        </svg>
                    </a>
                    <div class = "row">
                        <div class = "col-md-6">
                            <input type="text" class = "form-control " id = "pS_Time" name="pS_Time" style="border-radius: 0px;" placeholder="몇시 부터 ex)09:30" >
                        </div>
                        <div class = "col-md-6">
                            <input type="text" class = "form-control " id = "pE_Time" name="pE_Time" style="border-radius: 0px;" placeholder="몇시 까지 ex)21:30 " >
                        </div>

                    </div>
                </div>
            </div>

        </div>


        <div id='image' class=" mt-5">
            <h4>공간 사진 업로드</h4>
            <input type='file' class="form-control" id='files' name="files" accept=".jpg, .png, .gif" multiple='multiple' />
            <div class = "col-md-12" id='att_zone' data-placeholder='공간사진을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'>
            </div>
        </div>

        <div class = "Address">
            <div class=" col-md-12 mb-3 mt-3">
                <label for="pAddress1">
                    <span><h4>주소</h4></span>
                </label>
                <input type="text" class="form-control" id="pAddress1" name="pAddress1" style="border-radius: 0px;"placeholder="주소 찾기를 눌러주세요" size="70" readonly required>
                <div class="invalid-feedback">
                    주소를 입력해주세요.
                </div>
                <br>
                <input type="button" class="btn  btn-sm  text-white" style="background: #00DBAF" id="searchZipBtn2" name="searchZipBtn2" value="주소 찾기">
            </div>

            <div class=" col-md-12 mb-5">
                <label for="pAddress2">
                    <span><h4>상세 주소</h4></span>
                </label>
                <input type="text" class="form-control" id="pAddress2" name="pAddress2"style="border-radius: 0px;" placeholder="상세주소를 입력해주세요." size="70" >
                <div class="invalid-feedback">
                    상세 주소를 입력해주세요.
                </div>
            </div>

        </div>
        <hr>

        <div class=" d-flex justify-content-center">
            <input type="submit" id="button" class="btn btn-lg text-white m-5 " style="background: #00DBAF" value="공간 등록" >
        </div>
    </form>

</div>
<a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 연락가능 시간을 정해주세요. (예)10시 부터 22시">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
    </svg>
</a>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>

<script>
    $(document).ready(function() {
        $('#pType').change(function() {
            var result = $('#pType option:selected').val();
            if (result == '자동차') {
                $("input#pType_d").attr("placeholder", "차량번호와 상세 공간을 적어주세요.");
                $('.Address').hide();
                $('#pAddress1').val('자동차');
                $('#pAddress2').val($("input#pType_d").val());
            } else {
                $("input#pType_d").attr("placeholder", "공간 유형을 상세하게 적어주세요.");
                $('.Address').show();
            }
        });
    });
    $(".onlyNumber").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9\s]/gi,''));
        }
    });

</script>
<script>
    $(document).ready(function() {
        $("#add_A01").click(function(){
            var price = $('#Boxp_A01').val();
            var Qty = $('#numberUpDown_A01').val();
            if(!price) {
                alert("금액을 입력 해 주세요!");
            }else{
                $("#Box1").show();
                $('#Boxprice_A01').val(price);
                $('#BoxQtyp_A01').val(Qty);
                document.querySelectorAll('.accordion-collapse').forEach(collapse => {
                    collapse.classList.remove('show');
                });
            }
        });
        $("#Boxp_A01_B").click(function(){
            $("#Box1").hide();
            $("#Boxprice_A01").val(0);
            $("#BoxQtyp_A01").val(0);
        });

        $("#add_A02").click(function(){
            var price = $('#Boxp_A02').val();
            var Qty = $('#numberUpDown_A02').val();
            if(!price) {
                alert("금액을 입력 해 주세요!");
            }else{
                $("#Box2").show();
                $('#Boxprice_A02').val(price);
                $('#BoxQtyp_A02').val(Qty);

                document.querySelectorAll('.accordion-collapse').forEach(collapse => {
                    collapse.classList.remove('show');
                });
            }
        });
        $("#Boxp_A02_B").click(function(){
            $("#Box2").hide();
            $("#Boxprice_A02").val(0);
            $("#BoxQtyp_A02").val(0);
        });
        $("#add_A03").click(function(){
            var price = $('#Boxp_A03').val();
            var Qty = $('#numberUpDown_A03').val();
            if(!price) {
                alert("금액을 입력 해 주세요!");
            }else{
                $("#Box3").show();
                $('#Boxprice_A03').val(price);
                $('#BoxQtyp_A03').val(Qty);

                document.querySelectorAll('.accordion-collapse').forEach(collapse => {
                    collapse.classList.remove('show');
                });
            }
        });
        $("#Boxp_A03_B").click(function(){
            $("#Box3").hide();
            $("#Boxprice_A03").val(0);
            $("#BoxQtyp_A03").val(0);

        });
        $("#add_B01").click(function(){
            var price = $('#Boxp_B01').val();
            var Qty = $('#numberUpDown_B01').val();
            if(!price) {
                alert("금액을 입력 해 주세요!");
            }else{
                $("#Box4").show();
                $('#Boxprice_B01').val(price);
                $('#BoxQtyp_B01').val(Qty);

                document.querySelectorAll('.accordion-collapse').forEach(collapse => {
                    collapse.classList.remove('show');
                });
            }
        });
        $("#Boxp_B01_B").click(function(){
            $("#Box4").hide();
            $("#Boxprice_B01").val(0);
            $("#BoxQtyp_B01").val(0);
        });
        $("#add_B02").click(function(){
            var price = $('#Boxp_B02').val();
            var Qty = $('#numberUpDown_B02').val();
            if(!price) {
                alert("금액을 입력 해 주세요!");
            }else{
                $("#Box5").show();
                $('#Boxprice_B02').val(price);
                $('#BoxQtyp_B02').val(Qty);

                document.querySelectorAll('.accordion-collapse').forEach(collapse => {
                    collapse.classList.remove('show');
                });
            }
        });
        $("#Boxp_B02_B").click(function(){
            $("#Box5").hide();
            $("#Boxprice_B02").val(0);
            $("#BoxQtyp_B02").val(0);

        });
        $("#add_B03").click(function(){
            var price = $('#Boxp_B03').val();
            var Qty = $('#numberUpDown_B03').val();
            if(!price) {
                alert("금액을 입력 해 주세요!");
            }else{
                $("#Box6").show();
                $('#Boxprice_B03').val(price);
                $('#BoxQtyp_B03').val(Qty);

                document.querySelectorAll('.accordion-collapse').forEach(collapse => {
                    collapse.classList.remove('show');
                });
            }
        });
        $("#Boxp_B03_B").click(function(){
            $("#Box6").hide();
            $("#Boxprice_B03").val(0);
            $("#BoxQtyp_B03").val(0);
        });

        var updateQuantity = function(productId, operation) {
            var stat = $('#numberUpDown_' + productId).val();
            var num = parseInt(stat, 10);
            if (operation === 'decrease') {
                num--;
                if (num <= 0) {
                    alert('보유박스 최소 수량 입니다.');
                    num = 1;
                }
            } else {
                num++;
                var BOXQty = $('#BoxQty_' + productId).val();
                if (num > BOXQty) {
                    alert('보유박스 최대 수량입니다.');
                    num = BOXQty;
                }
            }
            $('#numberUpDown_' + productId).val(num);
        };

        $('[id^=decreaseQuantity_]').click(function(e) {
            e.preventDefault();
            var productId = $(this).attr('id').split('_')[1];
            updateQuantity(productId, 'decrease');
        });

        $('[id^=increaseQuantity_]').click(function(e) {
            e.preventDefault();
            var productId = $(this).attr('id').split('_')[1];
            updateQuantity(productId, 'increase');
        });

    });


    $(function(){
    });

</script>

<script>
    ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
        imageView = function imageView(att_zone, btn){

            var attZone = document.getElementById(att_zone);
            var files = document.getElementById(btn)
            var sel_files = [];

            // 이미지와 체크 박스를 감싸고 있는 div 속성
            var div_style = 'display:inline-block;position:relative;'
                + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
            // 미리보기 이미지 속성
            var img_style = 'width:100%;height:100%;z-index:none';
            // 이미지안에 표시되는 체크박스의 속성
            var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';

            files.onchange = function(e){
                var files = e.target.files;
                var fileArr = Array.prototype.slice.call(files)
                for(f of fileArr){
                    imageLoader(f);
                }
            }


            // 탐색기에서 드래그앤 드롭 사용
            attZone.addEventListener('dragenter', function(e){
                e.preventDefault();
                e.stopPropagation();
            }, false)

            attZone.addEventListener('dragover', function(e){
                e.preventDefault();
                e.stopPropagation();

            }, false)

            attZone.addEventListener('drop', function(e){
                var files = {};
                e.preventDefault();
                e.stopPropagation();
                var dt = e.dataTransfer;
                files = dt.files;
                for(f of files){
                    imageLoader(f);
                }

            }, false)



            /*첨부된 이미리즐을 배열에 넣고 미리보기 */
            imageLoader = function(file){
                sel_files.push(file);
                var reader = new FileReader();
                reader.onload = function(ee){
                    let img = document.createElement('img')
                    img.setAttribute('style', img_style)
                    img.src = ee.target.result;
                    attZone.appendChild(makeDiv(img, file));
                }

                reader.readAsDataURL(file);
            }

            /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
            makeDiv = function(img, file){
                var div = document.createElement('div')
                div.setAttribute('style', div_style)

                var btn = document.createElement('input')
                btn.setAttribute('type', 'button')
                btn.setAttribute('value', 'x')
                btn.setAttribute('delFile', file.name);
                btn.setAttribute('style', chk_style);
                btn.onclick = function(ev){
                    var ele = ev.srcElement;
                    var delFile = ele.getAttribute('delFile');
                    for(var i=0 ;i<sel_files.length; i++){
                        if(delFile== sel_files[i].name){
                            sel_files.splice(i, 1);
                        }
                    }

                    dt = new DataTransfer();
                    for(f in sel_files) {
                        var file = sel_files[f];
                        dt.items.add(file);
                    }
                    files.files = dt.files;
                    var p = ele.parentNode;
                    attZone.removeChild(p)
                }
                div.appendChild(img)
                div.appendChild(btn)
                return div
            }
        }
    )('att_zone', 'files')

</script>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>
</body>
</html>
