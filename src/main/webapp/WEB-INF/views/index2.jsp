<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이웃 캐비닛</title>
    <link rel="stylesheet" type="text/css" href='<c:url value="/css/index2.css"/>'>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="<c:url value='/js/index.js'/>"></script>
</head>
<body>
<div id="wrap">
    <div id="header">
        <c:import url="/WEB-INF/views/layout/header.jsp"/>
    </div>
    <div id="nv_bar">
    </div>
    <div id="container">
        <div id="mainview">
            <div class="section" id="section1">

                <div class="section_inner">
                    <div class="section_text">
                        <p class="text_title">
                            모두를 위한
                            <br>
                            손 쉬운 캐비닛
                        </p>
                        <p class="text_sub">
                            근처 어디에서나
                            <br>
                            크기에 상관없이
                            짐을 맡기세요.
                        </p>
                    </div>
                    <div class="section_image">
                        <img src="image/그림11.png" style="width:400px; height:500px;">
                    </div>

                </div>
            </div>
            <div class="section" id="section2">
                <div class="test2"></div>
                <div class="section_inner" style="z-index: 1000000;">

                    <div class="section_text" style="text-align:right;" >
                        <p class="text_title">
                            누구나
                            <br>
                            수익창출
                        </p>
                        <p class="text_sub">
                            짐을 맡을 공간만 있다면
                            <br>
                            제공자가 될수있어요.
                        </p>

                    </div>
                </div>
            </div>
            <div class="section" id="section3">
                <div class="section_inner" style="z-index: 1000000; border: solid 10px">
                    <div class="section_text">
                        <p class="text_title" >
                            음식도
                            <br>
                            안전하게!!
                        </p>
                        <p class="text_sub" >
                            녹시 쉬운
                            <br>
                            까다로운 음식도 맡기세요.
                        </p>

                    </div>
                </div>
            </div>
            <div class="section" id="section4">
                <div class="section_inner">
                    <div class="section_text" style="text-align:right;">
                        <p class="text_title">
                            내가
                            <br>
                            가지않아도

                        </p>
                        <p class="text_sub" style="color:black;">
                            클릭 한번에
                            <br>
                            언제 어디서나
                            <br>받아 볼 수 있어요.
                        </p>

                    </div>
                </div>
            </div>
            <div class="section" id="section5">

                <div class="section_head"></div>
                <div class="section5_ts">
                    <p class="s5_title">대여시작dsadsa</p>
                </div>
                <div class="section5_ts">
                    <p class="s5_sub">지금 바로 대여를 시작 해보세요.</p>
                    <p style="text-align:right;">자세히 보기</p>
                </div>
                <div class="section5_content">
                    <div>

                    </div>
                    <div>

                    </div>

                </div>
                <div class="footer">

                </div>
                <div>

                </div>

            </div>

        </div>
    </div>


</div>
</body>
</html>