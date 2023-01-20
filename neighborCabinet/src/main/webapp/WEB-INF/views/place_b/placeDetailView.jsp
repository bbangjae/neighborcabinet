<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <title>대여 디테일</title>
        <link rel="stylesheet" type="text/css" href='<c:url value="/css/placeDetailView.css"/>'>
        <script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
        <script src="<c:url value="/js/placeDetailView.js"/>"></script>
        <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hm0bb8lwq6"></script>
    </head>
    <body>
        <div id="wrap">

            <div id="header">
                <c:import url="/WEB-INF/views/layout/header.jsp"/>
            </div>

            <div id="container">
                <div class="c_header">

                    <div class="title">
                        ${pi.pWriteTitle}
                    </div>
                    <div>
                        ${pi.pWriteSub}
                    </div>
                    <div>
                        #강남역 (태그)
                    </div>
                </div>
                <div class="c_content">

                    <div class="ct_left">

                        <div class="image">
                            <img src="<c:url value='/image/house.jpeg' />">
                        </div>
                        <div class="ct_title">
                            ${pi.pPlaceTitle}
                        </div>
                        <div class="ct_menu">
                            <ul class="ct_ul">
                                <li class="ct_li" id="li_space"><a href="#target">공간소개</a></li>
                                <li class="ct_li" id="li_box"><a href="#target">박스안내</a></li>
                                <li class="ct_li" id="li_caution"><a href="#target">유의사항</a></li>
                                <li class="ct_li" id="li_map"><a href="#target">위치안내</a></li>
                                <li class="ct_li" id="li_QA"><a href="#target">Q&A</a></li>
                                <li class="ct_li" id="li_review"><a href="#target">이용후기</a></li>

                            </ul>

                        </div>
                        <div class="ct_text">
                            <div class="t_title">
                                <span id="space">공간소개</span>
                            </div>
                            <div class="t_text">

                                ${pi.pPlaceInfo}
                            </div>



                            <div class="t_title">
                                <span id="box">박스안내</span>
                            </div>

                            <div class="t_text">
                                    ${pi.pBoxInfo}
                            </div>
                            <div class="t_title">
                                <span id="caution">예약시 주의 사항</span>
                            </div>
                            <div class="t_text">
                                ${pi.pCautionInfo}
                            </div>
                            <%--<div class="t_title">
                                <span id="refund">환불 규정</span>
                            </div>
                            자세한 환불 관련 사항은 전화로해야합니다!--%>

                            <div class="t_title">
                                <span id="position">위치안내</span>
                            </div>
                            <div id="map" style="width:100%;height:400px;"></div>
                            <script>
                                var mapOptions = {
                                    center: new naver.maps.LatLng(37.3595704, 127.105399),
                                    zoom: 10
                                };

                                var map = new naver.maps.Map('map', mapOptions);
                                var marker = new naver.maps.Marker({
                                    position: new naver.maps.LatLng(37.3595704, 127.105399),
                                    map: map
                                });
                            </script>
                            <div class="info">
                                <div class="i_text">
                                    <div class="i_title">
                                        삼성동힐스테이트2차아파트
                                    </div>
                                    <div class="i_sub">
                                    서울 강남구 삼성로111길 8
                                    </div>
                                    <div class="i_btn">
                                        <ul class="ct_ul">
                                            <li class="ct_li" id="call"><a href="#target">전화걸기</a></li>
                                            <li class="ct_li"><a href="#target">길찾기</a></li>


                                        </ul>


                                    </div>
                                </div>
                            </div>


                            <div class="t_title">
                                <span id="QA">Q&A</span>
                                <span style="color:#00DBAF;"> 2개</span>
                                <button class="QA_btn">질문작성하기</button>
                            </div>
                            <table class="Q_R_table" >
                                <tr>
                                    <td rowspan="3" style="width:100px; height:100%;padding:0px; border-collapse : collapse; vertical-align : top;">
                                        <div style="width:100px;heght:100px; ">
                                        <img src="/image/profile2.png" style="width:100%;height: 100%;">
                                        </div></td>
                                    <td style="font-weight: bold;">변빵재</td>
                                </tr>
                                <tr>
                                    <td>23-01-19에 예약 가능한가요?<img src="/image/profile2.png"></td>
                                </tr>
                                <tr>
                                    <td style="color:gray; font-weight: lighter">2023.01.18.10:23:14<td>
                                </tr>
                            </table>
                            <div class="t_title" id="review">

                                <ul style="margin:0; padding:0; display:flex; ">
                                    <li style="list-style:none; margin-right: 25px;"><span >이용후기</span><span style="color:#00DBAF;"> 2개</span></li>
                                    <li style="color:#D7FFF1;"><span style="color:black;">평균 평점</span><span style="color:#00DBAF;"> 5.0</span></li>
                                </ul>


                            </div>
                                <table class="Q_R_table" style="border:solid 2px gold;" >
                                    <tr>
                                        <td rowspan="3" style="width:100px; height:100%;padding: 0px; border-collapse : collapse; vertical-align : top;">
                                            <div style="width:100px;heght:100px; ">
                                                <img src="/image/profile2.png" style="width:100%;height: 100%;">
                                            </div></td>
                                        <td style="font-weight: bold;">변빵재</td>
                                        <td class="score_wrap" style="text-align: right; font-size:20px; padding-right: 10px;">
                                        <div class="score" style="position:relative; display: inline-flex;" >
                                                <div class="foreground" style="color:#00DBAF; overflow:hidden;">★★★★★</div>
                                                <div class="background" style="color:white; position: absolute;">☆☆☆☆☆</div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"> 내가 이래서 이점수를 줌 ㅡㅡ </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color:gray; font-weight: lighter">2023.01.18.10:23:14<td>
                                    </tr>
                                </table>



                        </div>
                    </div>

                    <div class="ct_right">
                        <div class="option">
                            <div class="o_title">
                                박스타입 선택
                            </div>
                            <table>
                                <tr><th colspan="2">호스트 승인후 예약확정
                                <br><span style="font-weight: normal; color:#00DBAF;font-size: 14px;">확실한 예약을 위해 전화주세요</span>  </th></tr>
                                <tr class="op_box"><th><button class="after_btn"></button><button class="click_btn"></button>박스1호</th><td class="o_price"><span>$0</span>/시간</td></tr>
                                <tr class="op_box"><th><button class="after_btn"></button><button class="click_btn"></button>박스2호</th><td class="o_price"><span>$0</span>/시간</td></tr>
                                <tr class="op_box"><th><button class="after_btn"></button><button class="click_btn"></button>박스2호</th><td class="o_price"><span>$0</span>/시간</td></tr>
                            </table>
                            <ul class="ct_ul">
                                <li class="ct_li" id="call2" style="width:10px; margin-right:1px; background-color: #00DBAF;"><a href="#target" style="color:white;">전화</a></li>
                                <li class="ct_li"  style="background-color: #00DBAF;"><a href="#target" style="color:white;">예약신청하기</a></li>
                            </ul>
                        </div>
                    </div>



                </div>

                <div id="footer" style="width: 100%;height: 400px; border:solid 1px black;">


                </div>
            </div>


        </div>
    </body>
</html>
