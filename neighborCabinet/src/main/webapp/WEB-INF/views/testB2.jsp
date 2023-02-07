<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>test</title>
    <link rel="stylesheet" type="text/css" href='<c:url value="/css/testB2.css"/>'>
    <script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
    <script src="<c:url value="/js/testB2.js"/>"></script>

</head>
<body>
<table id="reservation_time">
    <tr>
        <td class="top" align="left">시간선택</td>
        <td class="top" align="right"><button class="btnTime" type="button" onclick="tableinit()">초기화</button></td>
    </tr>
    <tr>
        <td>
            <table id="calendar">
                <tr>
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
        </td>
        <td>
            <table id = "timeTable">	</table>
        </td>
    </tr>
    <tr>
        <td class="top" align="left" colspan="2">예약일시</td>
    </tr>
    <tr>
        <td class="content" colspan="2" align="left">
            <input id="selectedDate" style="border:none; width:100px"  name="selectedDate" value="" readonly="readonly" ></input>
            <input id="selectedTime" style="border:none"  name="selectedTime" value="" readonly="readonly"></input>
        </td>
    </tr>
    <tr>
        <td class="top" align="left">결제정보</td>
    </tr>
    <tr>
        <td class="content" align="left" colspan="2">
            <input id="totalPrice"  style="border:none; text-align:right; width:100px" name="totalPrice" value="" readonly="readonly">원</input>
        </td>
    </tr>
    <tr>
        <td class="content" align="left" colspan="2">
            <input id="btn_submit" type="button" value="결제하기" onclick="submitRes()"></td>
    <tr>
</table>
</body>
</html>
