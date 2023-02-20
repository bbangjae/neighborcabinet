<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">--%>

<head>

    <meta charset="UTF-8">
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
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
                <p >${pi.pHp}</p>
                <p> 여기로 전화주시면 신속하게 처리 해드리겠습니다</p>
                <button class="confirm_btn">확인</button>

            </div>

        </div>
    </div>

    <div id="modal_QA" class="modal-overlay">
        <div class="modal-window" style="height: 300px;">
            <div class="title">
                <h2>질문 작성하기</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content"  >
                <div style="display:block;">
                    <textarea  id="qa_text" name="qa_text" style="margin-left:5px; width:95%;height:150px; margin-top:-20px;resize:none;" placeholder="내용을 입력해 주세요."></textarea>
                </div>
                <button  id="QA_confirm" name="QA_confirm" value=${pi.pNo}>확인</button>

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
                <div class="imageSlide">
                    <div id="pNButtonBox">
                        <img id="nButton" src="<c:url value='/image/right2.png' />">
                        <img id="pButton" src="<c:url value='/image/left2.png' />">
                    </div>
                    <div id="imagePanel" style="width:${fC*750}px; " value="${fC}">
<%--                        <c:forEach var="file"  items="${fileList}">--%>
<%--                            <img style=" width:750px; height: 400px;" src="/files/${file.fileNo}/download" >--%>
<%--                        </c:forEach>--%>

                    </div>
                </div>

                <div class="ct_title">
                    ${pi.pPlaceTitle}

                </div>

                <div class="ct_menu">
                    <ul class="ct_ul" >
                        <li class="ct_li"  id="li_space"><a href="#target">공간소개</a></li>
                        <li class="ct_li" id="li_box"><a href="#target">박스안내</a></li>
                        <li class="ct_li" id="li_caution"><a href="#target">유의사항</a></li>
                        <li class="ct_li" id="li_map"><a href="#target">위치안내</a></li>
                        <li class="ct_li" id="li_QA"><a href="#target">Q&A</a></li>
                        <li class="ct_li" style="margin:0;" id="li_review"><a href="#target">이용후기</a></li>

                    </ul>

                </div>

                <div class="ct_text">
                    <div class="t_title">
                        <span id="space">공간소개</span>
                    </div>
                    <div class="t_text" style="color:gray; margin-bottom: 40px;">

                        ${pi.pPlaceInfo}

                    </div>
                    <div>
                        <span id="starttime" style="font-size:18px; font-weight: bold; color:black;">영업시간 </span><span id="endtime" style="font-size:17px; font-weight: normal; color:#00DBAF;">
                                ${pi.pS_Time}:00~${pi.pE_Time}:00</span>
                    </div>

                    <div class="fp_available" style=" display:inline-block; margin:20px 30px 0 0; height: 100%; ">
                        <div style="width:100px; height:110px;  text-align: center;">

                            <img src="<c:url value='/image/food2.png' />" style="border:solid 1px lightgrey; border-radius:5px 5px 5px 5px; width:80px;height: 80px;">

                            <c:if test="${pi.food.equals('0')}">
                                <span>음식 가능</span>
                            </c:if>
                            <c:if test="${pi.food.equals('1')}">
                                <span>음식 불가능</span>
                            </c:if>
                        </div>
                    </div>



                    <div class="fp_available" style=" display:inline-block; margin:20px 50px 0 0; height: 100%; ">
                        <div style="width:100px; height:100px; border:solid 0px pink; text-align: center;">

                            <img src="<c:url value='/image/pickup.png' />"  style="border:solid 1px lightgrey; border-radius:5px 5px 5px 5px; width:80px;height: 80px;">
                            <c:if test="${pi.pickup.equals('0')}">
                                <span>픽업 가능</span>
                            </c:if>
                            <c:if test="${pi.pickup.equals('1')}">
                                <span>픽업 불가능</span>
                            </c:if>
                        </div>
                    </div>


                    <div class="t_title" style="margin-top: 50px;">
                        <span id="box">박스안내</span>
                    </div>

                    <div class="t_text" style="color:gray;">
                        <c:forEach var="im" items="${im}" varStatus="vs">
                            <c:if test="${ql[vs.index]>0}" >
                                <li class="box_info">박스 ${im.key} 보유</li>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="t_title">
                        <span id="caution">예약시 주의 사항</span>
                    </div>
                    <div class="t_text" style="color:gray;">
                        ${pi.pCautionInfo}
                    </div>

                    <div class="t_title">
                        <span id="position">위치안내</span>
                    </div>
                    <div id="map" style="width:100%;height:400px;"></div>
                    <script>
                        var mapOptions = {
                            center: new naver.maps.LatLng(${aY},${aX}), //지도 시작지점
                            zoom: 17, //확대정도
                            zoomControl: true,
                            zoomControlOptions: {
                                style: naver.maps.ZoomControlStyle.SMALL,
                                position: naver.maps.Position.TOP_RIGHT
                            }
                        };

                        var map = new naver.maps.Map('map', mapOptions);
                        var marker = new naver.maps.Marker({
                            position: new naver.maps.LatLng(${aY}, ${aX}),
                            map: map
                        });
                    </script>
                    <div class="info">
                        <div class="i_text">
                            <div class="i_title">
                                ${pi.pAddress1}
                            </div>
                            <div class="i_sub">
                                ${aM.get("roadAddress")}
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
                        <span style="color:#00DBAF;"> ${qaList.size()}개</span>
                        <c:if test="${not empty sessionScope.sid}">
                            <button class="QA_btn">질문작성하기</button>
                        </c:if>
                        <c:if test="${empty sessionScope.sid}">
                            <button id="QA_not" onclick="location.href='<c:url value='/member/loginform'/>'">질문작성하기</button>
                        </c:if>
                    </div>
                    <table class="Q_R_table" >
                        <c:forEach var="qL" items="${qaList}" varStatus="q_vs">
                            <tr>
                                <td style="width:100px; height:100%;padding:0px; border-collapse : collapse; vertical-align : top;">
                                    <div style="width:100px;heght:100px; ">
                                        <img src="/image/profile2.png" style="width:100%;height: 100%;">
                                    </div>
                                </td >
                                <td style="display:inline-block; width:100%;height:100%;">
                                    <div class="qa_div" style=" display:flex; width:100%; font-weight: bold;" qaNo="${qL.qaNo}">
                                        <div style="width:80%">
                                            ${qL.userNickName}
                                        </div>
                                        <c:if test="${qL.userId==sessionScope.sid}">
                                            <div class="qa_btn" style="width:20%; display:flex;">
                                                <input class="qa_update" type="submit" style="margin-left:30px;" value="수정" vs="${q_vs.index}">
                                                <input class="qa_delete" type="submit" style="margin-left:10px;" value="삭제">
                                            </div>
                                        </c:if>
                                    </div>
                                    <div style="width:98%;height:auto; padding:0;display: block; ">
                                        <textarea class="qa_text"  style="margin-top:10px;border:0px; height:100% !important;width: 100%;  resize:none; overflow:hidden; background-color: #F9FAFB;" onkeydown="resize(this)" onkeyup="resize(this)" readonly>${qL.qaContent}</textarea>

                                    </div>
                                    <div style="  width:100%; color:gray; margin: 10px 0 40px 0; font-weight: lighter">
                                        <fmt:formatDate value="${qL.qaDate}" pattern="YY-MM-dd"/>
                                    </div>                                </td>
                            </tr> </c:forEach>
                    </table>
                    <script>

                        function resize(obj) {
                            obj.style.height = '1px';
                            obj.style.height = (obj.scrollHeight) + 'px';
                        }
                    </script>
                    <div class="t_title" id="review">

                        <ul style="margin:0; padding:0; display:flex; ">
                            <li style="list-style:none; margin-right: 25px;"><span >이용후기</span><span style="color:#00DBAF;"> ${r_cnt}개</span></li>
                            <li style="color:#D7FFF1;"><span style="color:black;">평균 평점</span><span style="color:#00DBAF;"> ${r_mean}</span></li>
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
                                        <div class="score_wrap" style="display: inline-block; width:16%; text-align: right; font-size:20px; background-color:#F9FAFB;">
                                            <div class="score" style="position:relative; display: inline-flex;" >
                                                <div class="foreground" style="color:#00DBAF; overflow:hidden; width:${rL.reviewGrade};">★★★★★</div>
                                                <div class="background" style="color:#00DBAF;  position: absolute;">☆☆☆☆☆</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="width: 100%;height:60%;margin-top:30px;">
                                            ${rL.reviewContent}
                                    </div>
                                    <div style="  width:100%; color:gray; margin: 30px 0 40px 0; font-weight: lighter">
                                        <fmt:formatDate value="${rL.reviewDate}" pattern="YY-MM-dd"/>

                                    </div>
                                </td>
                            </tr> </c:forEach>

                    </table>



                </div>
            </div>

            <div class="ct_right">
                <div class="option" style="border-top: solid 0px #00DBAF;">
                    <div class="o_title">
                        박스타입 선택
                    </div>
                    <table >
                        <tr><th colspan="2">호스트 승인후 예약확정
                            <br><span style="font-weight: normal; color:#00DBAF;font-size: 14px;">확실한 예약을 위해 전화주세요</span>  </th></tr>
                    </table>

                    <c:forEach var="im" items="${im}" varStatus="vs">
                        <c:if test="${ql[vs.index]>0}">

                            <div class="op_box">
                                <div class="box_title" style="">
                                    <button class="after_btn"></button>
                                    <button class="click_btn" style="margin:0px;"></button>
                                    <span class="o_type" style="display: inline-block;width:43%;">${im.key}</span>
                                    <div style="display: inline-block; width:45%; font-weight:lighter; text-align: right;">

                                        <span class="o_price" style="margin-right:-5px; text-align: right;" value="${pl[vs.index]}">￦${pl[vs.index]}</span>
                                        /시간
                                    </div>
                                </div>
                                <div class="box_container" >

                                    <c:forEach var="i" begin="1" end="${ql[vs.index]}">

                                        <div class="box_detail" value="${im.value[i]}" >${im.value[i]}</div>

                                    </c:forEach>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                    <%--                            <div class="op_box">--%>
                    <%--                                <div class="box_title" style="">--%>
                    <%--                                    <button class="after_btn"></button>--%>
                    <%--                                    <button class="click_btn" style="margin:0px;"></button>--%>
                    <%--                                    <span class="o_type" style="display: inline-block;width:43%;">박스3호</span>--%>
                    <%--                                    <div style="display: inline-block; width:45%; font-weight:lighter; text-align: right;">--%>

                    <%--                                        <span class="o_price" style="margin-right:-5px; text-align: right;">￦3000</span>--%>
                    <%--                                        /시간--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>
                    <%--                                <div class="box_container" >--%>
                    <%--                                    <div class="box_detail" >A01</div>--%>
                    <%--                                    <div class="box_detail" >A01</div>--%>
                    <%--                                    <div class="box_detail" >A01</div>--%>
                    <%--                                    <div class="box_detail">A01</div>--%>
                    <%--                                    <div class="box_detail" >A01</div>--%>
                    <%--                                    <div class="box_detail" >A01</div>--%>
                    <%--                                    <div class="box_detail" >A01</div>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="op_box">--%>
                    <%--                                <div class="box_title" style="">--%>
                    <%--                                    <button class="after_btn"></button>--%>
                    <%--                                    <button class="click_btn" style="margin:0px;"></button>--%>
                    <%--                                    <span class="o_type" style="display: inline-block;width:43%;">박스3호</span>--%>
                    <%--                                    <div style="display: inline-block; width:45%; font-weight:lighter; text-align: right;">--%>

                    <%--                                        <span class="o_price" style="margin-right:-5px; text-align: right;">￦3000</span>--%>
                    <%--                                        /시간--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>
                    <%--                                <div class="box_container" >--%>
                    <%--                                    <div class="box_detail" >A01</div>--%>
                    <%--                                    <div class="box_detail" >A01</div>--%>
                    <%--                                    <div class="box_detail" >A01</div>--%>
                    <%--                                    <div class="box_detail">A01</div>--%>
                    <%--                                    <div class="box_detail" >A01</div>--%>
                    <%--                                    <div class="box_detail" >A01</div>--%>
                    <%--                                    <div class="box_detail" >A01</div>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>



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
                    <table id="timeTable" style="border:0px;">

                    </table>

                    <div id="available">
                        <div id="av_disable">예약 불가능</div>
                        <div id="av_able">예약 가능</div>
                        <div id="av_select">현재 선택</div>
                    </div>
                    <div id="timeInfo">
                        <div style="width:100%; font-weight: bold; margin-bottom: 10px;">예약일</div>

                        <input id="selectedTime" style="border:none; width:100%; background-color: #F9FAFB;"  name="selectedTime" value="" readonly="readonly" ></input>
                    </div>
                    <div id="sumPrice">
                        <div style="width:100%; font-weight: bold; margin-bottom: 10px;">이용료</div>
                        <input id="totalPrice"  style="border:none; background-color: #F9FAFB; width:100%" name="totalPrice" value="" readonly="readonly"></input>
                    </div>


                    <ul class="call_ul" style="border:0px;">
                        <li class="call_li"  style="width:10px; margin-right:1px; background-color: #00DBAF;"><a href="#target" style="color:white; border:0px;">전화</a></li>
                        <c:if test="${empty sessionScope.sid}">
                            <li class="reserve_li"  style="background-color: #00DBAF;"><a href='<c:url value='/member/loginform'/>' style="color:white;">예약신청하기</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope.sid}">
                            <li class="reserve_li" id="reserve_btn" style="background-color: #00DBAF;"><a href="#taget" style="color:white;" >예약신청하기</a></li>
                        </c:if>
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
