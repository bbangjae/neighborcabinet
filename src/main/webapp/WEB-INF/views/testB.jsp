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
    <link rel="stylesheet" type="text/css" href='<c:url value="/css/testB.css"/>'>
    <script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
    <script src="<c:url value="/js/testB.js"/>"></script>

</head>
<body>
<div class="sec_cal">
    <div class="cal_nav">
        <a href="javascript:;" class="nav-btn go-prev">prev</a>
        <div class="year-month"></div>
        <a href="javascript:;" class="nav-btn go-next">next</a>
    </div>
    <div class="cal_wrap">
        <div class="days">
            <div class="day">MON</div>
            <div class="day">TUE</div>
            <div class="day">WED</div>
            <div class="day">THU</div>
            <div class="day">FRI</div>
            <div class="day">SAT</div>
            <div class="day">SUN</div>
        </div>
        <div class="dates"></div>
    </div>
</div>
</body>
</html>
