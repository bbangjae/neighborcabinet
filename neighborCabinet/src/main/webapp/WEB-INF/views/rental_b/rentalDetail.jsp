<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <title>대여 디테일</title>
        <link rel="stylesheet" type="text/css" href='<c:url value="/css/rentalDetail.css"/>'>
        <script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
        <script src="<c:url value="/js/rentalDetail.js"/>"></script>
    </head>
    <body>
        <div id="wrap">

            <div id="header">
                <c:import url="/WEB-INF/views/layout/header.jsp"/>
            </div>

            <div id="container">
                <div class="c_header">

                    <div class="title">
                        글 제목
                    </div>
                    <div>
                        부가설명
                    </div>
                    <div>
                        #태그
                    </div>
                </div>
                <div class="c_content">
                    <div class="ct_left">

                        <div class="image">
                            이미지 칸입니다
                        </div>
                        <div class="ct_title">
                            강남역 1번출구 근처 (장소제목)
                        </div>
                        <div class="ct_menu">
                            <ul>
                                <li><a href="#">공간소개</a></li>
                                <li><a href="#">박스안내</a></li>
                                <li><a href="#">유의사항</a></li>
                                <li><a href="#">Q&A</a></li>
                                <li><a href="#">이용후기</a></li>

                            </ul>

                        </div>
                        <div class="ct_text">
                            <br>
                            <span style="font-size:15px; font-weight: bold">공간소개</span>
                            <br><br>
                            우리의 공간은요 엄청 넓고요 안전해요
                            <br><br>
                            <span style="font-size:15px; font-weight: bold">박스안내</span>
                            <br><br>
                            우리의 공간은요 엄청 넓고요 안전해요
                            <br><br>
                        </div>
                    </div>

                    <div class="ct_right">
                        박스선택페이지
                    </div>



                </div>


            </div>


        </div>
    </body>
</html>
