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
            <div id="modal_call" class="modal-overlay">
                <div class="modal-window" style="height:230px;">
                    <div class="title">
                        <h2>전화번호</h2>
                    </div>
                    <div class="close-area">X</div>
                    <div class="content">
                        <p >010-1234-1234</p>
                        <p> 여기로 전화주시면 신속하게 처리 해드리겠습니다</p>
                        <button class="confirm_btn">확인</button>

                    </div>

                </div>
            </div>
            <div id="modal_QA" class="modal-overlay">
                <div class="modal-window" style="height: 370px;">
                    <div class="title">
                        <h2>질문 작성하기</h2>
                    </div>
                    <div class="close-area">X</div>
                    <div class="content" >
                        <input type="text" style="margin-left:5px; width:95%;height:200px;">
                        <button class="confirm_btn">확인</button>

                    </div>






                </div>
            </div>


            <div id="header">
                <c:import url="/WEB-INF/views/layout/header.jsp"/>
            </div>

            <div id="container">
                <div class="c_header">

                    <div class="title">
                        ${pi.pWriteTitle}
                    </div>
                    <div style="color:gray;">
                        ${pi.pWriteSub}
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
                            <div class="t_text" style="color:gray;">

                                ${pi.pPlaceInfo}
                            </div>



                            <div class="t_title">
                                <span id="box">박스안내</span>
                            </div>

                            <div class="t_text" style="color:gray;">
                                    ${pi.pBoxInfo}
                            </div>
                            <div class="t_title">
                                <span id="caution">예약시 주의 사항</span>
                            </div>
                            <div class="t_text" style="color:gray;">
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
                                    center: new naver.maps.LatLng(37.518236, 127.059297),
                                    zoom: 10
                                };

                                var map = new naver.maps.Map('map', mapOptions);
                                var marker = new naver.maps.Marker({
                                    position: new naver.maps.LatLng(37.518236, 127.059297),
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
                                        <ul class="call_ul" style="border:0px;">
                                            <li class="call_li" id="call"><a href="#target">전화걸기</a></li>
                                            <li class="call_li"><a href="#target">길찾기</a></li>


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
                                <c:forEach var="qL" items="${qaList}">
                                <tr>
                                    <td style="width:100px; height:100%;padding:0px; border-collapse : collapse; vertical-align : top;">
                                        <div style="width:100px;heght:100px; ">
                                        <img src="/image/profile2.png" style="width:100%;height: 100%;">
                                        </div>
                                    </td >
                                    <td style="display:inline-block; width:100%;height:100%;">
                                        <div style=" width:100%; font-weight: bold;">
                                            ${qL.userNickName}
                                        </div>
                                        <div style="width: 100%;height:60%;margin-top:30px;">
                                            ${qL.qaContent}
                                        </div>
                                     <div style="  width:100%; color:gray; margin: 30px 0 40px 0; font-weight: lighter">
                                         ${qL.qaDate}
                                     </div>
                                    </td>
                                </tr> </c:forEach>
                            </table>
                            <div class="t_title" id="review">

                                <ul style="margin:0; padding:0; display:flex; ">
                                    <li style="list-style:none; margin-right: 25px;"><span >이용후기</span><span style="color:#00DBAF;"> 2개</span></li>
                                    <li style="color:#D7FFF1;"><span style="color:black;">평균 평점</span><span style="color:#00DBAF;"> 5.0</span></li>
                                </ul>


                            </div>
                                <table class="Q_R_table" style="border:solid 0px gold;" >

                                    <c:forEach var="rL" items="${reviewList}">
                                        <tr >
                                            <td style="width:100px; height:100%;padding:0px; border-collapse : collapse; vertical-align : top;">
                                                <div style="width:100px;heght:100px; ">
                                                    <img src="/image/profile2.png" style="width:100%;height: 100%;">
                                                </div>
                                            </td >
                                            <td style="display:inline-block; width:100%;height:100%;">
                                                <div style=" width:100%; font-weight: bold;">
                                                    <div style=" display: inline-block; width:82%;">
                                                        ${rL.userNickName}
                                                    </div>
                                                    <div class="score_wrap" style="display: inline-block; width:16%; text-align: right; font-size:20px;">
                                                        <div class="score" style="position:relative; display: inline-flex;" >
                                                            <div class="foreground" style="color:#00DBAF; overflow:hidden;">★★★★★</div>
                                                            <div class="background" style="color:white; position: absolute;">☆☆☆☆☆</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="width: 100%;height:60%;margin-top:30px;">
                                                        ${rL.reviewContent}
                                                </div>
                                                <div style="  width:100%; color:gray; margin: 30px 0 40px 0; font-weight: lighter">
                                                        ${rL.reviewDate}
                                                </div>
                                            </td>
                                        </tr> </c:forEach>

                                </table>



                        </div>
                    </div>

                    <div class="ct_right">
                        <div class="option" style="border-top: solid 1px #00DBAF;">
                            <div class="o_title">
                                박스타입 선택
                            </div>
                            <table >
                                <tr><th colspan="2">호스트 승인후 예약확정
                                <br><span style="font-weight: normal; color:#00DBAF;font-size: 14px;">확실한 예약을 위해 전화주세요</span>  </th></tr>
                                <tr class="op_box"><th><button class="after_btn"></button><button class="click_btn"></button>박스1호</th><td class="o_price"><span>￦1000</span>/시간</td></tr>

                                <tr class="op_box"><th><button class="after_btn"></button><button class="click_btn"></button>박스2호</th><td class="o_price"><span>￦2000</span>/시간</td></tr>
                                <tr class="op_box"><th><button class="after_btn"></button><button class="click_btn"></button>박스3호</th><td class="o_price"><span>￦3000</span>/시간</td></tr>

                            </table>

                            <table id="calendar" align="center">
                                <tr >
                                    <td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
                                    <td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
                                    <td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
                                </tr>
                                <tr>
                                    <td align="center"><font color ="#F79DC2">일</td>
                                    <td align="center">월</td>
                                    <td align="center">화</td>
                                    <td align="center">수</td>
                                    <td align="center">목</td>
                                    <td align="center">금</td>
                                    <td align="center"><font color ="skyblue">토</td>
                                </tr>

                            </table>


                            <ul class="call_ul" style="border:0px;">
                                <li class="call_li"  style="width:10px; margin-right:1px; background-color: #00DBAF;"><a href="#target" style="color:white; border:0px;">전화</a></li>
                                <li class="reserve_li"  style="background-color: #00DBAF;"><a href="<c:url value='/rental/payment/${pNo}'/>" style="color:white;">예약신청하기</a></li>
                            </ul>

                        </div>
                    </div>



                </div>

                <div id="footer" style="width: 100%;height: 1px;">
                    <c:import url="/WEB-INF/views/layout/footer.jsp"/>

                </div>

            </div>



        </div>
    </body>
</html>
