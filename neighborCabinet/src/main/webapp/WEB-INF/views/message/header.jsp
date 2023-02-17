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
			<div>
				<label for="messageModal"><i class="fa-regular fa-circle-xmark"></i></label>
				<div id="section1">
					알림메시지 <i class="fa-regular fa-bell fa-1x" style="color:#00DBAF"></i>
				</div>
				<div id="section2">
					<div id="section2_1">
						<input type="radio" name="message_category" id="mescag1">
						<div>
							<label for="mescag1">
							</label>
						</div>
						<input type="radio" name="message_category" id="mescag2">
						<div>
							<label for="mescag2">
							</label>
						</div>
					</div>
					<div id="section2_2">
						<div>
							<div>예약 정보 ~~~ </div>
							<div></div>
							<div>수락 및 거절</div>
							<div>예약 정보 ~~~ </div>
							<div></div>
							<div>수락 및 거절</div>
							<div>예약 정보 ~~~ </div>
							<div></div>
							<div>수락 및 거절</div>
							<div>예약 정보 ~~~ </div>
							<div></div>
							<div>수락 및 거절</div>
							
						</div>
					</div>
				</div>
				
				
			</div>
			
		</div>
	</body>
</html>