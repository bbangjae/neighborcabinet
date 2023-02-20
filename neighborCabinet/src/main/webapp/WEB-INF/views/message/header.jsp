<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test</title>
		<script src="https://kit.fontawesome.com/487e3fe7a5.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/header2.css"/>'>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value='/js/header2.js' />"></script>
	</head>
	<body>
		<label for="messageModal"><i class="fa-regular fa-bell fa-1x" style="color:#00DBAF"></i></label>
		<input type="checkbox" style="display:none;" id="messageModal">
		<div id="messageBox">
			<label for="messageModal"></label>
			<div id="mesContentBox">
				<div id="mesCtg">
					<input type="radio" name="mesCtg" id="mesCtg1" value="1" checked>
					<label for="mesCtg1">알림</label>
					<input type="radio" name="mesCtg" id="mesCtg2" value="2">
					<label for="mesCtg2">요청</label>
				</div>
				<div id="mesInfoBox">
					<label for="messageModal"><i class="fa-regular fa-circle-xmark"></i></label>
					<div id="applyDiv"></div>
				</div>
			</div>
		</div>
	</body>
</html>